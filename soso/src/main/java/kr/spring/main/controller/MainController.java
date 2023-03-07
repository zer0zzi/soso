package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.stc.controller.StcController;
import kr.spring.stc.service.StcService;
import kr.spring.study.vo.StudyVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PagingUtil;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(StcController.class);
	
	@Autowired
	private StcService stcService;
	
	@Autowired
	private MemberService memberService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StudyVO initCommand() {
		return new StudyVO();
	}
	
	@RequestMapping("/")
	public String main() {
		return "redirect:/main/main.do";
	}
	
	@RequestMapping("/main/main.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword, String filter) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("filter", filter);
		
		//stc_state -> 모집중 / 모집완료 

		//상품 총개수 또는 검색된 상품의 개수
		int count = stcService.studyCount(map);

		logger.debug("<<스터디 목록>> : " + count);

		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"main.do",filter);

		List<StudyVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			list = stcService.studyList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());

		return mav;
	}
	
	//이미지 출력
	@RequestMapping("/main/stcView.do")
	public ModelAndView viewImage(@RequestParam int stc_num) {
		StudyVO study = stcService.selectStudy(stc_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", study.getStc_uploadfile());
		mav.addObject("filename", study.getStc_filename());
		
		return mav;
	}
	
	//===== 프로필 사진 출력 =====//
	@RequestMapping("/member/photoView.do")
	public String getProfile(HttpSession session, HttpServletRequest request, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user"); // 세션에 저장돼 있는 자바빈 호출

		logger.debug("<<photoView>> : " + user);

		if (user == null) { // 시간이 만료돼서 로그아웃이 된 상태일 때 이미지가 깨지면 적용될 코드
			byte[] readbyte = FileUtil.getBytes(request.getServletContext().getRealPath("/image_bundle/face.png"));
			// 이미지 뷰에서 읽을 수 있게 (속성명, 속성값) 셋팅
			model.addAttribute("imageFile", readbyte);
			model.addAttribute("filename", "face.png");
		} else {
			MemberVO memberVO = memberService.selectMember(user.getMem_num()); // selectMember : 한 건의 레코드를 읽어온다.
			viewProfile(memberVO, request, model); // 뷰 프로필에서 정보 처리
		}

		return "imageView"; // 바이트 배열형태로 출력된 이미지를 화면에 표시
	}

	// 프로필 사진 출력(회원번호 지정)
	@RequestMapping("/member/viewProfile.do")
	public String getProfileByMem_num(@RequestParam int mem_num, HttpSession session, HttpServletRequest request,
			Model model) {
		MemberVO memberVO = memberService.selectMember(mem_num);
		viewProfile(memberVO, request, model);

		return "imageView";
	}

	// 프로필 사진 처리를 위한 공통 코드 : 모든 곳에서의 이미지 처리
	public void viewProfile(MemberVO memberVO, HttpServletRequest request, Model model) {
		if (memberVO == null || memberVO.getMem_photo_name() == null) { // 프로필 사진을 변경하지 않았다. = 프로필 사진을 업로드하지 않았을 경우 = 기본
																		// 이미지를 보여준다.
			byte[] readbyte = FileUtil.getBytes(request.getServletContext().getRealPath("/image_bundle/face.png"));
			// 이미지 뷰에서 읽을 수 있게 (속성명, 속성값) 셋팅
			model.addAttribute("imageFile", readbyte);
			model.addAttribute("filename", "face.png");
		} else { // 프로필 사진을 변경했다. = 프로필 사진을 업로드 했을 경우
			model.addAttribute("imageFile", memberVO.getMem_photo());
			model.addAttribute("filename", memberVO.getMem_photo_name());
		}
	}
}