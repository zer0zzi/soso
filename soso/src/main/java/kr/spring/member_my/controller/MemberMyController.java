package kr.spring.member_my.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.member_my.service.MemberMyService;
import kr.spring.study.service.StudyService;
import kr.spring.study.vo.StudyVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.FileUtil;
import kr.spring.util.StringUtil;


@Controller
public class MemberMyController {

	private static final Logger logger = LoggerFactory.getLogger(MemberMyController.class);
			
	@Autowired
	private MemberMyService memberMyService;
	private MemberService memberService;
	
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	//=====회원상세정보======//
	@RequestMapping("/mymember/myPage.do")
	public String process(HttpSession session, Model model) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO member = memberMyService.selectMember(user.getMem_num());
		
		logger.debug("<<회원상세정보>> : " + member);
		
		model.addAttribute("member", member);
		
		return "myPage";
	}
	
	//=====프로필 사진 업로드======//
	@RequestMapping("/mymember/updateMyPhoto.do")
	@ResponseBody
	public Map<String,String> processProfile(MemberVO memberVO, HttpSession session){
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {
			mapAjax.put("result", "logout");
		}else {
			memberVO.setMem_num(user.getMem_num());
			memberMyService.updateProfile(memberVO);
			
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
	}
	
	//=====회원정보수정======//
	//수정 폼 호출
	@RequestMapping("/mymember/update.do")
	public String formUpdate(HttpSession session, Model model) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO memberVO = memberMyService.selectMember(user.getMem_num());
		
		model.addAttribute("memberVO", memberVO);
		
		return "memberModify";
	}
	
	//수정 폼에서 전송된 데이터 호출
	@PostMapping("/mymember/update.do")
	public String submitUpdate(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
		
		logger.debug("<<회원정보수정 처리>> : " + memberVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "memberModify";
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//회원번호가 전송되지 않아서 세션에 저장된 회원번호 사용
		memberVO.setMem_num(user.getMem_num());
		
		//회원정보수정
		memberMyService.updateMember(memberVO);
		
		return "redirect:/mymember/myPage.do";
	}
	
	//=====비밀번호 변경=====//
	//비밀번호 변경 폼 호출
	@GetMapping("/mymember/changePassword.do")
	public String formChangePassword() {
		return "memberChangePassword";
	}
	
	//비밀번호 변경 폼에서 전송된 데이터 처리
	@PostMapping("/mymember/changePassword.do")
	public String submitChangePassword(@Valid MemberVO memberVO, BindingResult result, HttpSession session, Model model, HttpServletRequest request) {
		
		logger.debug("<<비밀번호변경 처리>> : " + memberVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasFieldErrors("now_passwd") || result.hasFieldErrors("passwd")) {
			return formChangePassword();
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		memberVO.setMem_num(user.getMem_num());
		MemberVO db_member = memberMyService.selectMember(memberVO.getMem_num());
		
		//폼에서 전송한 현재 비밀번호와 DB에서 받아온 비밀번호
		//일치 여부 체크
		if(!db_member.getMem_pw().equals(memberVO.getNow_passwd())) {
			result.rejectValue("now_passwd", "invalidPassword");
			return formChangePassword();
		}
		
		//비밀번호변경
		memberMyService.updatePassword(memberVO);
		
		//설정되어 있는 자동로그인 기능 해제(모든 브라우저에 설정된
		//자동로그인 해제)
		memberMyService.deleteAu_id(memberVO.getMem_num());
		
		//View에 표시할 메시지
		model.addAttribute("message", "비밀번호변경 완료(*재접속시 설정되어 있는 자동로그인 기능 해제*)");
		model.addAttribute("url", request.getContextPath()+"/mymember/myPage.do");
		
		return "common/resultView";
	}
	
	//=====회원정보삭제(회원탈퇴)====//
	//회원삭제 폼 호출
	@GetMapping("/mymember/delete.do")
	public String formDelete() {
		return "memberDelete";
	}
	
	//회원삭제 폼에서 전송된 데이터 처리
	@PostMapping("/mymember/delete.do")
	public String submitDelete(@Valid MemberVO memberVO, BindingResult result, HttpSession session, Model model) {
		logger.debug("<<회원탈퇴>> : " + memberVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		//id, passwd 필드의 에러만 체크
		if(result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
			return formDelete();
		}
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO db_member = memberMyService.selectMember(user.getMem_num());
		
		boolean check = false;
		//비밀번호 일치 여부 체크
		try {
			if(db_member!=null && db_member.getMem_id().equals(memberVO.getMem_id())) {
				//비밀번호 일치 여부 체크
				check = db_member.isCheckedPassword(memberVO.getMem_pw());
			}
			
			if(check) {
				//인증 성공, 회원정보삭제
				memberMyService.deleteMember(user.getMem_num());
				//로그아웃
				session.invalidate();
				
				model.addAttribute("accessMsg", "회원탈퇴를 완료했습니다.");
				
				return "common/notice";
			}
			//인증 실패
			throw new AuthCheckException();
		}catch(AuthCheckException e) {
			result.reject("invalidIdOrPassword");
			return formDelete();
		}
	}
	
	//=====프로필 사진 출력(로그인 전용)====//
	@RequestMapping("/mymember/photoView.do")
	public String getProfile(HttpSession session, HttpServletRequest request, Model model) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		logger.debug("<<photoView>> : " + user);
		
		if(user==null) {
			byte[] readbyte = FileUtil.getBytes(request.getServletContext().getRealPath("/image_bundle/face.png"));
														
			model.addAttribute("imageFile", readbyte);
			model.addAttribute("filename", "face.png");
		}else {
			MemberVO memberVO = memberMyService.selectMember(user.getMem_num());
			logger.debug("<<memberVO>> : " + memberVO);
			viewProfile(memberVO,request,model);
		}
		
		return "imageView";
	}
	
	//프로필 사진 출력(회원번호 지정)
	@RequestMapping("/mymember/viewProfile.do")
	public String getProfileByMem_num(@RequestParam int mem_num, HttpSession session, HttpServletRequest request, Model model) {
		
		MemberVO memberVO = memberMyService.selectMember(mem_num);
		viewProfile(memberVO,request,model);
		
		return "imageView";
	}
	
	//프로필 사진 처리를 위한 공통 코드
	public void viewProfile(MemberVO memberVO, HttpServletRequest request, Model model) {
		if(memberVO==null || memberVO.getMem_photo_name()==null) {
			byte[] readbyte = FileUtil.getBytes(request.getServletContext().getRealPath("/image_bundle/face.png"));
					
			model.addAttribute("imageFile", readbyte);
			model.addAttribute("filename", "face.png");
		}else {
			model.addAttribute("imageFile", memberVO.getMem_photo());
			model.addAttribute("filename", memberVO.getMem_photo_name());
		}
	}
	
	
	//=====내 스터디 그룹======//
	@RequestMapping("/mymember/myStudy.do")
	public String viewmystudy(HttpSession session, Model model){
		Map<String,Object> map = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		map.put("mem_num", user.getMem_num());
		
		List<StudyVO> myStudyList = memberMyService.selectStudy(map);
		
		model.addAttribute("myStudyList", myStudyList);
	
		logger.debug("<<mem_num>> : " + user.getMem_num());
		logger.debug("<<myStudyList>> : " + myStudyList);
		
		return "myStudy";
	}
	
	@RequestMapping("/mymember/myStudyMade.do")
	public String viewmystudymade(HttpSession session, Model model){
		Map<String,Object> map = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		map.put("mem_num", user.getMem_num());
		
		List<StudyVO> myStudyList = memberMyService.selectMadeStudy(map);
		
		model.addAttribute("myStudyList", myStudyList);
	
		logger.debug("<<mem_num>> : " + user.getMem_num());
		logger.debug("<<myStudyList>> : " + myStudyList);
		
		return "myStudyMade";
	}
}
