package kr.spring.study.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.study.vo.StudyVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.study.controller.StudyController;
import kr.spring.study.service.StudyService;
import kr.spring.study.vo.StudyFavVO;
import kr.spring.study.vo.StudySignupVO;
import kr.spring.study.vo.StudyVO;
import kr.spring.util.StringUtil;

@Controller
public class StudyController {
	private static final Logger logger = 
            LoggerFactory.getLogger(StudyController.class);
	private int rowCount = 20;
	
	@Autowired
	private StudyService studyService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StudyVO initCommand() {
		return new StudyVO();
	}
	
	//========게시판 글상세=======//
	@RequestMapping("/study/studyView.do")
	public ModelAndView process(@RequestParam int stc_num) {
		logger.debug("<<stc_num>> : " + stc_num);

		//해당 글의 조회수 증가
		studyService.updateHit(stc_num);

		StudyVO study = studyService.selectStudy(stc_num);
		//제목에 태그를 허용하지 않음
		study.setStc_title(StringUtil.useNoHtml(study.getStc_title()));
		//내용에 태그를 허용하지 않음
		//CKEditor 사용시 주석 처리
		study.setStc_content(StringUtil.useBrNoHtml(study.getStc_content()));
		//뷰이름      속성명   속성값
		return new ModelAndView("studyView","study",study);
	}
	
	//======게시글 관심등록=======//
	//관심등록 읽기
	@RequestMapping("/study/getFav.do")
	@ResponseBody
	public Map<String,Object> getFav(
									StudyFavVO fav,
									HttpSession session){
		logger.debug("<<게시판 관심등록>> : " + fav);

		Map<String,Object> mapJson = new HashMap<String,Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("status", "noFav");
		}else {
			//로그인된 아이디 셋팅
			fav.setMem_num(user.getMem_num());

			StudyFavVO studyFav = studyService.selectFav(fav);
			if(studyFav!=null) {
				mapJson.put("status", "yesFav");
			}else {
				mapJson.put("status", "noFav");
			}
		}
		mapJson.put("count", studyService.selectFavCount(fav.getStc_num()));

		return mapJson;
	}

	//관심 등록
	@RequestMapping("/study/writeFav.do")
	@ResponseBody
	public Map<String,Object> writeFav(StudyFavVO fav,
									   HttpSession session){
		logger.debug("<<부모글 좋아요 등록>> : " + fav);

		Map<String,Object> mapJson = new HashMap<String,Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 셋팅
			fav.setMem_num(user.getMem_num());

			logger.debug("<<부모글 좋아요 등록>> : " + fav);

			StudyFavVO studyFav = studyService.selectFav(fav);
			if(studyFav!=null) {
				//이미 등록되어있으면 삭제
				studyService.deleteFav(studyFav.getFav_num());

				mapJson.put("result", "success");
				mapJson.put("status", "noFav");
			}else {
				//미등록이면 등록
				studyService.insertFav(fav);

				mapJson.put("result", "success");
				mapJson.put("status", "yesFav");
			}

			mapJson.put("count", studyService.selectFavCount(fav.getStc_num()));
		}
		return mapJson;
	}
	//======게시글 신청등록=======//
	//신청하기 읽기
	@RequestMapping("/study/getSign.do")
	@ResponseBody
	public Map<String,Object> getSign(StudySignupVO signupVO,
									  HttpSession session){
		logger.debug("<<게시판 관심등록>> : " + signupVO);

		Map<String,Object> mapJson = new HashMap<String,Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("status", "noSign");
		}else {
			//로그인된 아이디 셋팅
			signupVO.setMem_num(user.getMem_num());

			StudySignupVO studySignup = studyService.selectSignup(signupVO);
			if(studySignup!=null) {
				mapJson.put("status", "yesSign");
			}else {
				mapJson.put("status", "noSign");
			}
		}
		mapJson.put("count", studyService.selectSignupCount(signupVO.getStc_num()));

		return mapJson;
	}
		
	//신청하기 로그인 및 재신청 체크
	@RequestMapping("/study/signLogin.do")
	@ResponseBody
	public Map<String,Object> signLogin(StudySignupVO signupVO,
										HttpSession session){
		logger.debug("<<신청하기>> : " + signupVO);

		Map<String,Object> mapJson = new HashMap<String,Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 셋팅
			signupVO.setMem_num(user.getMem_num());

			logger.debug("<<신청하기0>> : " + signupVO);

			StudySignupVO studySignup = studyService.selectSignup(signupVO);
			if(studySignup!=null) {
				//이미 신청했으면 거부
				mapJson.put("result", "aleadySigned");
			}else {
				//미등록이면 등록
				mapJson.put("result", "first");
			}
		}
		return mapJson;
	}
	
	
	//신청하기
	@RequestMapping("/study/signup.do")
	@ResponseBody
	public Map<String,Object> signup(StudySignupVO signupVO,
									 HttpSession session){
		logger.debug("<<신청하기>> : " + signupVO);

		Map<String,Object> mapJson = new HashMap<String,Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 셋팅
			signupVO.setMem_num(user.getMem_num());

			logger.debug("<<신청하기0>> : " + signupVO);
			
			StudySignupVO studySignup = studyService.selectSignup(signupVO);
			if(studySignup!=null) {
				//이미 신청했으면 거부
				mapJson.put("result", "aleadySigned");
			}else {
			//로그인된 회원번호 셋팅
			signupVO.setMem_num(user.getMem_num());
			
			logger.debug("<<신청하기1>> : " + signupVO);
			
			studyService.insertSignup(signupVO);
			mapJson.put("result", "success");
			}
		}
		return mapJson;
	}
	
	//=====이미지 출력=====//
	@RequestMapping("/study/imageView.do")
	public ModelAndView viewImage(
			@RequestParam int stc_num,
			@RequestParam int stc_type) {

		StudyVO study = 
				studyService.selectStudy(stc_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");

		if(stc_type==1) {//프로필 사진
			mav.addObject("imageFile",study.getMem_photo());
			mav.addObject("filename", study.getMem_photo_name());
		}else if(stc_type==2) {//업로드된 이미지
			mav.addObject("imageFile", study.getStc_uploadfile());
			mav.addObject("filename", study.getStc_filename());
		}
		return mav;
	}
	//=====파일 삭제=======//
	@RequestMapping("/study/deleteFile.do")
	@ResponseBody
	public Map<String,String> processFile(
			int stc_num,
			HttpSession session){
		Map<String,String> mapJson = 
				new HashMap<String,String>();

		MemberVO user = 
				(MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			studyService.deleteFile(stc_num);

			mapJson.put("result", "success");
		}

		return mapJson;
	}
	//=====파일 다운로드====//
	@RequestMapping("/study/file.do")
	public ModelAndView download(
			@RequestParam int stc_num) {
		StudyVO study = 
				studyService.selectStudy(stc_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", 
				study.getStc_uploadfile());
		mav.addObject("filename", study.getStc_filename());

		return mav;
	}
	
	//=====게시판 글삭제=======//
	@RequestMapping("/study/delete.do")
	public String submitDelete(
								@RequestParam int stc_num,
								Model model,
								HttpServletRequest request) {
		
		logger.debug("<<게시판 글삭제>> : " + stc_num);
		
		//글삭제
		studyService.deleteStudy(stc_num);
		
		return "redirect:/main/main.do";
	}
		
}
