package kr.spring.review.controller;

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
import kr.spring.review.service.ReviewService;
import kr.spring.review.vo.ReviewVO;
import kr.spring.util.PagingUtil;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	private int rowCount = 10;
	@Autowired // 의존 관계 주입
	private ReviewService reviewService;
	// 자바빈(VO) 초기화
	@ModelAttribute
	public ReviewVO initCommand() {
		return new ReviewVO();
	}

	// ========== 후기 글 목록 ==========
	@RequestMapping("/community/reviewList.do")
	public ModelAndView reviewList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		// 글의 총개수 또는 검색된 글의 개수 반환
		int count = reviewService.selectReviewRowCount(map);
		// 로그
		logger.debug("<<count>> : " + count);
		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount, 10, "reviewList.do");
		
		List<ReviewVO> reviewList = null;
		if(count>0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			reviewList = reviewService.selectReviewList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewList");
		mav.addObject("count", count);
		mav.addObject("reviewList", reviewList);
		mav.addObject("page", page.getPage());

		return mav;
	}

	// ========== 후기 글 작성 ==========
	// 등록 폼 호출
	@GetMapping("/community/reviewWrite.do")
	public String reviewWriteForm() {
		return "reviewWrite"; // 타일스 설정값
	}
	// 등록 폼에서 전송된 데이터 처리
	@PostMapping("/community/reviewWrite.do")
	public String reviewSubmit(@Valid ReviewVO reviewVO, BindingResult result, HttpServletRequest request, 
			RedirectAttributes redirect, HttpSession session) {
		logger.debug("<<게시판 글쓰기>> : " + reviewVO);
		logger.debug("<<업로드 파일 용량>> : " + reviewVO.getReview_uploadfile().length);

		// 업로드 파일 용량 체크
		if(reviewVO.getReview_uploadfile().length>=52428800) { // 5MB
			result.reject("limitUploadSize");
		}

		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			return reviewWriteForm();
		}
		// 에러가 없으면 회원번호 셋팅
		reviewVO.setMem_num(((MemberVO)session.getAttribute("user")).getMem_num());
		// ip셋팅
		reviewVO.setReview_ip(request.getRemoteAddr());
		// 글쓰기
		reviewService.insertReview(reviewVO);

		redirect.addFlashAttribute("result", "success");

		return "redirect:/community/reviewList.do";
	}
}