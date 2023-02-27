package kr.spring.stc.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.member.vo.MemberVO;
import kr.spring.stc.service.StcService;
import kr.spring.study.vo.StudyVO;
import kr.spring.util.PagingUtil;

@Controller
public class StcController {
	private static final Logger logger = LoggerFactory.getLogger(StcController.class);
	
	@Autowired
	private StcService stcService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StudyVO initCommand() {
		return new StudyVO();
	}
	
	//=======글쓰기=========//
	//등록 폼 호출
	@GetMapping("/main/studyCreate.do")
	public String form() {
		return "studyCreate";
	}
	
	//등록 폼에서 전송된 데이터 처리
	@PostMapping("/main/studyCreate.do")
	public String submit(@Valid StudyVO studyVO, BindingResult result, HttpServletRequest request,
						 RedirectAttributes redirect, HttpSession session) {
		logger.debug("<<스터디 모집하기>> : " + studyVO);
		
		//유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//회원번호 셋팅
		studyVO.setMem_num(((MemberVO)session.getAttribute("user")).getMem_num());
		
		//글쓰기
		stcService.studyCreate(studyVO);

		//RedirectAttributes 객체는 리다이렉트 시점에 한 번만 사용되는 데이터를 전송.
		//브라우저에 데이터를 전송하지만 URL상에 보이지 않는 숨겨진 데이터의 형태로 전달
		redirect.addFlashAttribute("result","success");
		
		return "redirect:/main/main.do";
	}
	
	//======스터디 목록========//
	@RequestMapping("/main/studyList.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//stc_state -> 모집중 / 모집완료 

		//상품 총개수 또는 검색된 상품의 개수
		int count = stcService.studyCount(map);

		logger.debug("<<스터디 목록>> : " + count);

		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"studyList.do");

		List<StudyVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			list = stcService.studyList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("studyList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());

		return mav;
	}
}
