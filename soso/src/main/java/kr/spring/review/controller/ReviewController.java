package kr.spring.review.controller;

import java.util.Collections;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.member.vo.MemberVO;
import kr.spring.review.service.ReviewService;
import kr.spring.review.vo.ReviewFavVO;
import kr.spring.review.vo.ReviewReplyVO;
import kr.spring.review.vo.ReviewVO;
import kr.spring.study.vo.StudyVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

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
			logger.debug("<<리뷰 목록>> : " + reviewList);
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
	public String reviewWriteForm(HttpSession session, Model model) {
		// 로그인 한 회원정보 셋팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user!=null) {
			// 회원번호 셋팅
			user.getMem_num();
			// 스터디명 정보 출력
			List<StudyVO> studyList = null;
			studyList = reviewService.selectReviewMemberStudyList(user.getMem_num());

			model.addAttribute("studyList", studyList);
		}

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
			return "redirect:/community/reviewWrite.do";
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
	/* 원래
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
	 */
	/* 수정
	// 등록 폼 호출
	@GetMapping("/community/reviewWrite.do")
	public ModelAndView reviewWriteForm(@RequestParam int review_num) {
		// 스터디명 정보 출력
		List<ReviewVO> studyList = null;
		studyList = reviewService.selectReviewMemberStudyList(review_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewWrite");
		mav.addObject("studyList", studyList);

		logger.debug("<<studyList 정보>> : " + studyList);

		return mav; // 타일스 설정값
	}
	// 등록 폼에서 전송된 데이터 처리
	@PostMapping("/community/reviewWrite.do")
	public String reviewSubmit(@Valid ReviewVO reviewVO, BindingResult result, HttpServletRequest request, 
			RedirectAttributes redirect, HttpSession session, ModelAndView mav) {
		logger.debug("<<게시판 글쓰기>> : " + reviewVO);
		logger.debug("<<업로드 파일 용량>> : " + reviewVO.getReview_uploadfile().length);

		// 업로드 파일 용량 체크
		if(reviewVO.getReview_uploadfile().length>=52428800) { // 5MB
			result.reject("limitUploadSize");
		}


		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			return "redirect:/community/reviewWrite.do";
			//return reviewWriteForm(); // 리다이렉트로 변경
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
	 */
	// ========== 후기 글상세 ==========
	@RequestMapping("/community/reviewDetail.do")
	public ModelAndView process(@RequestParam int review_num) {
		logger.debug("<<review_num>> : " + review_num);

		// 해당 글의 조회수 증가
		reviewService.updateReviewHit(review_num);

		ReviewVO review = reviewService.selectReview(review_num);

		// 제목에 태그를 허용하지 않음
		logger.debug("<<review>> : " + review);
		review.setReview_title(StringUtil.useNoHtml(review.getReview_title()));
		// 내용에 태그를 허용하지 않음 : ckeditor 사용 시, 주석처리
		//board.setContent(StringUtil.useBrNoHtml(board.getContent()));

		return new ModelAndView("reviewDetail", "review", review); // (뷰이름, 속성명, 속성값) // board폴더에 뷰 존재
	}

	// ========== 이미지 출력 ==========
	@RequestMapping("/community/imageReviewView.do")
	public ModelAndView viewReviewImage(@RequestParam int review_num, @RequestParam int review_type) {
		ReviewVO review = reviewService.selectReview(review_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView"); // 뷰 출력

		if(review_type==1) { // 프로필 사진
			mav.addObject("imageFile", review.getMem_photo());
			mav.addObject("filename", review.getMem_photo_name());
		}else if(review_type==2) { // 업로드된 이미지
			mav.addObject("imageFile", review.getReview_uploadfile());
			mav.addObject("filename", review.getReview_filename());
		}
		return mav;
	}

	// ========== 파일 다운로드 ==========
	@RequestMapping("/community/fileReview.do")
	public ModelAndView download(@RequestParam int review_num) {
		ReviewVO review = reviewService.selectReview(review_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", review.getReview_uploadfile());
		mav.addObject("filename", review.getReview_filename());

		return mav;
	}

	// ========== 리뷰 글수정 ==========
	// 수정 폼 호출
	@GetMapping("/community/reviewUpdate.do")
	public String reviewFormUpdate(@RequestParam int review_num, Model model, HttpSession session) {
		ReviewVO reviewVO = reviewService.selectReview(review_num);

		model.addAttribute("reviewVO", reviewVO);

		// 로그인 한 회원정보 셋팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user!=null) {
			// 회원번호 셋팅
			user.getMem_num();
			// 스터디명 정보 출력
			List<StudyVO> studyList = null;
			studyList = reviewService.selectReviewMemberStudyList(user.getMem_num());

			model.addAttribute("studyList", studyList);
		}

		return "reviewUpdate";
	}
	// ========== 파일 삭제 ==========
	@RequestMapping("/community/reviewFile.do")
	@ResponseBody
	public Map<String, String> reviewFile(int review_num, HttpSession session){
		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			reviewService.deleteReviewFile(review_num);

			mapJson.put("result", "success");
		}
		return mapJson;
	}
	// 수정 폼에서 전송된 데이터 처리
	@PostMapping("/community/reviewUpdate.do")
	public String reviewUpdate(@Valid ReviewVO reviewVO, BindingResult result, HttpServletRequest request, Model model) {
		logger.debug("<<글수정>> : " + reviewVO);
		logger.debug("<<업로드 파일 용량>> : " + reviewVO.getReview_uploadfile().length);

		// 업로드 파일 용량 체크
		if(reviewVO.getReview_uploadfile().length>=52428800) { // 5MB
			result.reject("limitUploadSize");
		}

		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			ReviewVO vo = reviewService.selectReview(reviewVO.getReview_num());
			reviewVO.setReview_filename(vo.getReview_filename());
			return "reviewUpate";
		}

		// ip 셋팅
		reviewVO.setReview_ip(request.getRemoteAddr());

		// 글수정
		reviewService.updateReview(reviewVO);

		// View에 표시할 메시지 : 자바스크립트 이용
		model.addAttribute("message", "글수정 완료");
		model.addAttribute("url", request.getContextPath()+"/community/reviewDetail.do?review_num="+reviewVO.getReview_num());

		return "common/resultView";
	}

	// ========== 리뷰 글 삭제 ==========
	@RequestMapping("/community/reviewDelete.do")
	public String reviewSubmitDelete(@RequestParam int review_num, Model model, HttpServletRequest request) {
		logger.debug("<<게시판 글삭제>> : " + review_num);

		reviewService.deleteReview(review_num);

		return "redirect:/community/reviewList.do";
	}

	// ========== 부모글 좋아요 ==========
	// 좋아요 읽기
	@RequestMapping("/community/getReviewFav.do")
	@ResponseBody
	public Map<String, Object> getReviewFav(ReviewFavVO fav, HttpSession session){
		logger.debug("<<게시판 좋아요>> : " + fav);

		Map<String, Object> mapJson = new HashMap<String, Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");

		logger.debug("<<로그인 되어있는지 체크 준비 완료 - 읽기>>");

		if(user==null) {
			logger.debug("<<로그아웃 상태>>");
			mapJson.put("status", "noFav");
		}else {
			logger.debug("<<로그인 상태>>");
			// 로그인된 아이디 셋팅
			fav.setMem_num(user.getMem_num());

			ReviewFavVO reviewFav = reviewService.selectReviewFav(fav);
			if(reviewFav!=null) {
				mapJson.put("status", "yesFav");
			}else {
				mapJson.put("status", "noFav");
			}
		}
		mapJson.put("count", reviewService.selectReviewFavCount(fav.getReview_num())); // nofav든 yesfav든 항상 보내야 한다.

		return mapJson;
	}

	// 좋아요 등록
	@RequestMapping("/community/writeReviewFav.do")
	@ResponseBody
	public Map<String, Object> writeReviewFav(ReviewFavVO fav, HttpSession session){
		logger.debug("<<부모글 좋아요 등록>> : " + fav);

		Map<String, Object> mapJson = new HashMap<String, Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");

		logger.debug("<<로그인 되어있는지 체크 준비 완료 - 등록>>");

		if(user==null) { // 로그아웃 상태
			mapJson.put("result", "logout");
		}else {
			// 로그인된 회원번호 셋팅
			fav.setMem_num(user.getMem_num());

			logger.debug("<<부모글 좋아요 등록>> : " + fav);

			ReviewFavVO reviewFav = reviewService.selectReviewFav(fav);
			if(reviewFav!=null) { // 좋아요가 이미 등록되어 있으면 삭제
				reviewService.deleteReviewFav(reviewFav.getV_fav_num());
				mapJson.put("result", "success");
				mapJson.put("status", "noFav");
			}else { // 좋아요 미등록이면 등록
				reviewService.insertReviewFav(fav);

				mapJson.put("result", "success");
				mapJson.put("status", "yesFav");
			}
			mapJson.put("count", reviewService.selectReviewFavCount(fav.getReview_num()));
		}
		return mapJson;
	}


	// ========== 댓글 등록 ==========
	@RequestMapping("/community/writeReviewReply.do")
	@ResponseBody
	public Map<String, String> writeReviewReply(ReviewReplyVO vo, HttpSession session, HttpServletRequest request){
		logger.debug("<<댓글 등록>> : " + vo);

		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) { // 로그아웃 상태
			mapJson.put("result", "logout");
		}else { // 로그인 상태
			// 회원번호 등록 : session에서 뽑아서 회원번호를 등록한다.
			vo.setMem_num(user.getMem_num());
			// ip등록
			vo.setVre_ip(request.getRemoteAddr());
			// 댓글 등록
			reviewService.insertReviewReply(vo);
			mapJson.put("result", "success");
		}
		return mapJson;
	}

	// ========== 댓글 목록 ==========
	@RequestMapping("/community/listReviewReply.do")
	@ResponseBody
	public Map<String, Object> getReviewList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, 
			@RequestParam int review_num, HttpSession session){
		logger.debug("<<currentPage>> : " + currentPage);
		logger.debug("<<review_num>> : " + review_num);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("review_num", review_num);

		// 총 글의 개수
		int count = reviewService.selectReviewRowCountReply(map);

		// 페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 5, 1, null); // 뒤에 두개(1,null)은 내부적 연산으로 해서 명시적으로 초기값 표기만 했다.
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());

		// 목록 데이터 읽기
		List<ReviewReplyVO> reviewList = null;
		if(count>0) {
			reviewList = reviewService.selectReviewListReply(map);
		}else {
			reviewList = Collections.emptyList();
		}

		Map<String, Object> mapJson = new HashMap<String, Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", 5);
		mapJson.put("reviewList", reviewList);

		// 로그인 한 회원정보 셋팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user!=null) {
			mapJson.put("user_num", user.getMem_num());
		}
		return mapJson;
	}


	// ========== 댓글 수정 ==========
	@RequestMapping("/community/updateReviewReply.do")
	@ResponseBody
	public Map<String,String> modifyReviewReply(ReviewReplyVO reviewReplyVO, HttpSession session, HttpServletRequest request){

		logger.debug("<<댓글수정>> : " + reviewReplyVO);
		Map<String,String> mapJson = new HashMap<String,String>();

		// 세션에서 정보 읽어오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 한건의 데이터 읽어오기
		ReviewReplyVO db_reply = reviewService.selectReviewReply(reviewReplyVO.getVre_num());

		if(user==null) {
			// 로그인이 안 되어 있는 경우
			mapJson.put("result", "logout");
		}else if(user!=null && user.getMem_num()==db_reply.getMem_num()) {
			// 로그인 회원번호와 작성자 회원번호 일치
			// ip등록
			reviewReplyVO.setVre_ip(request.getRemoteAddr());
			mapJson.put("result", "success");
		}else {
			// 로그인 회원번호와 작성자 회원번호 불일치
			mapJson.put("result", "wrongAccess");
		}
		return mapJson;
	}

	// ========== 댓글 삭제 ==========
	@RequestMapping("/community/deleteReviewReply.do")
	@ResponseBody
	public Map<String, String> deleteReviewReply(@RequestParam int vre_num, HttpSession session){
		logger.debug("<<댓글 삭제>> : " + vre_num);

		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		ReviewReplyVO db_reply = reviewService.selectReviewReply(vre_num);
		if(user==null) {
			// 로그인이 되어 있지 않은 경우
			mapJson.put("resutl", "logout");
		}else if(user!=null && user.getMem_num()==db_reply.getMem_num()) {
			// 로그인한 회원번호와 작성자 회원번호가 일치하는 경우
			reviewService.deleteReviewReply(vre_num);
			mapJson.put("result", "success");
		}else {
			// 로그인한 회원번호와 작성자 회원번호가 불일치하는 경우
			mapJson.put("result", "wrongAccess");
		}
		return mapJson;
	}

}