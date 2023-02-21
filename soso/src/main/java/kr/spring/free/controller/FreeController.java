package kr.spring.free.controller;

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

import kr.spring.free.service.FreeService;
import kr.spring.free.vo.FreeFavVO;
import kr.spring.free.vo.FreeReplyVO;
import kr.spring.free.vo.FreeVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class FreeController {
	private static final Logger logger = LoggerFactory.getLogger(FreeController.class);
	private int rowCount = 10;
	@Autowired // 의존 관계 주입
	private FreeService freeService;
	// 자바빈 초기화
	@ModelAttribute
	public FreeVO initCommand() {
		return new FreeVO();
	}
	
	/*
	// ========== 전체 글 목록 ===========
	@RequestMapping("/community/fullList.do")
	public ModelAndView fullList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int count = freeService.
		
		return "mav";
	}
	*/
	
	// ========== 자유 글 목록 ==========
	@RequestMapping("/community/freeList.do")
	public ModelAndView freeList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		// 글의 총 개수 또는 검색된 글의 개수 반환
		int count = freeService.selectFreeRowCount(map);

		// 로그 - 콘솔창
		logger.debug("<<count>> : " + count);
		
		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount, 10, "freeList.do");
		List<FreeVO> freeList = null;
		if(count>0){
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			freeList = freeService.selectFreeList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeList");
		mav.addObject("count", count);
		mav.addObject("freeList", freeList);
		mav.addObject("page", page.getPage());

		return mav;
	}

	// ========== 자유 글 등록 ==========
	// 등록 폼 호출
	@GetMapping("/community/freeWrite.do")
	public String freeWriteForm() {
		return "freeWrite";
	}
	// 등록 폼에서 전송된 데이터 처리
	@PostMapping("/community/freeWrite.do")
	public String freeSubmit(@Valid FreeVO freeVO, BindingResult result, HttpServletRequest request, 
			RedirectAttributes redirect, HttpSession session) {
		logger.debug("<<게시판 글쓰기>> : " + freeVO);
		logger.debug("<<업로드 파일 용량>> : " + freeVO.getFree_uploadfile().length);

		// 업로드 파일 용량 체크
		if(freeVO.getFree_uploadfile().length>=52428800) { // 5MB
			result.reject("limitUploadSize");
		}
		
		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			logger.debug("<<글 등록 유효성 체크>> : " + result.getAllErrors());
			return freeWriteForm();
		}
		// 에러가 없으면 회원번호 셋팅
		freeVO.setMem_num(((MemberVO)session.getAttribute("user")).getMem_num());
		// ip셋팅
		freeVO.setFree_ip(request.getRemoteAddr());
		// 글쓰기
		freeService.insertFree(freeVO);

		redirect.addFlashAttribute("result", "success");
		
		return "redirect:/community/freeList.do";
	}

	// ========== 게시판 글상세 ==========
	@RequestMapping("/community/freeDetail.do")
	public ModelAndView freeDetail(@RequestParam int free_num) {
		logger.debug("<<free_num>> : " + free_num);

		// 해당 글의 조회수 증가
		freeService.updateFreeHit(free_num);

		FreeVO free = freeService.selectFree(free_num);

		// 제목에 태그를 허용하지 않음
		free.setFree_title(StringUtil.useNoHtml(free.getFree_title()));
		// 내용에 태그를 허용하지 않음 : ckeditor 사용 시 주석처리
		//free.setFree_content(StringUtil.useBrNoHtml(free.getFree_content()));

		return new ModelAndView("freeDetail", "free", free); // (뷰이름, 속성명, 속성값) // community폴더에 뷰 존재
	}

	// ========== 이미지 출력 ==========
	@RequestMapping("/community/imageFreeView.do")
	public ModelAndView viewFreeImage(@RequestParam int free_num, @RequestParam int free_type) {
		FreeVO free = freeService.selectFree(free_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageFreeView"); // 뷰 출력

		if(free_type==1) { // 프로필 사진
			mav.addObject("imageFreeFile", free.getMem_photo());
			mav.addObject("free_filename", free.getMem_photo_name());
		}else if(free_type==2) { // 업로드된 이미지
			mav.addObject("imageFreeFile", free.getFree_uploadfile());
			mav.addObject("free_filename", free.getFree_filename());
		}
		return mav;
	}

	// ========== 파일 다운로드 ==========
	@RequestMapping("/community/freeFile.do")
	public ModelAndView freeDownload(@RequestParam int free_num) {
		FreeVO free = freeService.selectFree(free_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeDownloadView");
		mav.addObject("freeDownloadFile", free.getFree_uploadfile());
		mav.addObject("free_filename", free.getFree_filename());

		return mav;
	}

	// ========== 게시판 글수정 ==========
	// 수정 폼 호출
	@GetMapping("/community/freeUpdate.do")
	public String freeFormUpdate(@RequestParam int free_num, Model model) {
		FreeVO freeVO = freeService.selectFree(free_num); // 한 건의 레코드를 읽어온다.

		model.addAttribute("freeVO", freeVO);

		return "freeUpdate";
	}
	// 수정 폼에서 전송된 데이터 처리
	@PostMapping("/community/freeUpdate.do")
	public String submitUpdate(@Valid FreeVO freeVO, BindingResult result, HttpServletRequest request, Model model) {
		logger.debug("<<글수정>> : " + freeVO);
		logger.debug("<<업로드 파일 용량>> : " + freeVO.getFree_uploadfile().length);

		// 업로드 파일 용량 체크
		if(freeVO.getFree_uploadfile().length>=52428800) { // 5MB
			result.reject("limitUploadSize");
		}

		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			// title 또는 content가 입력되지 않아서 유효성 체크에 걸리면 파일 정보를 잃어버리기 때문에
			// 폼을 호출할 때 파일 정보를 다시 셋팅해줘야 한다.
			FreeVO vo = freeService.selectFree(freeVO.getFree_num());
			freeVO.setFree_filename(vo.getFree_filename());
			return "freeUpdate";
		}

		// ip 셋팅
		freeVO.setFree_ip(request.getRemoteAddr());

		// 글수정
		freeService.updateFree(freeVO);

		// View에 표시할 메시지 : 자바스크립트 이용
		model.addAttribute("message", "글수정 완료");
		model.addAttribute("url", request.getContextPath()+"/community/freeDetail.do?free_num="+freeVO.getFree_num());

		return "common/resultView";
	}

	// ========== 파일 삭제 ==========
	@RequestMapping("/community/deleteFreeFile.do")
	@ResponseBody
	public Map<String, String> processFreeFile(int free_num, HttpSession session){
		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			freeService.deleteFreeFile(free_num);

			mapJson.put("result", "success");
		}
		return mapJson;
	}

	// ========== 게시판 글삭제 ==========
	@RequestMapping("/community/freeDelete.do")
	public String submitDelete(@RequestParam int free_num, Model model, HttpServletRequest request) {
		logger.debug("<<게시판 글삭제>> : " + free_num);

		// 글삭제
		freeService.deleteFree(free_num);

		return "redirect:/community/freeList.do";
	}

	// ========== 부모글 좋아요 ==========
	// 좋아요 읽기
	@RequestMapping("/community/getFreeFav.do")
	@ResponseBody
	public Map<String, Object> getFreeFav(FreeFavVO fav, HttpSession session){
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

			FreeFavVO freeFav = freeService.selectFreeFav(fav);
			if(freeFav!=null) {
				mapJson.put("status", "yesFav");
			}else {
				mapJson.put("status", "noFav");
			}
		}
		mapJson.put("count", freeService.selectFreeFavCount(fav.getFree_num())); // nofav든 yesfav든 항상 보내야 한다.

		return mapJson;
	}

	// 좋아요 등록
	@RequestMapping("/community/writeFreeFav.do")
	@ResponseBody
	public Map<String, Object> writeFreeFav(FreeFavVO fav, HttpSession session){
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

			FreeFavVO freeFav = freeService.selectFreeFav(fav);
			if(freeFav!=null) { // 좋아요가 이미 등록되어 있으면 삭제
				freeService.deleteFreeFav(freeFav.getF_fav_num());
				mapJson.put("result", "success");
				mapJson.put("status", "noFav");
			}else { // 좋아요 미등록이면 등록
				freeService.insertFreeFav(fav);

				mapJson.put("result", "success");
				mapJson.put("status", "yesFav");
			}
			mapJson.put("count", freeService.selectFreeFavCount(fav.getFree_num()));
		}
		return mapJson;
	}

	// ========== 댓글 등록 ==========
	@RequestMapping("/community/writeFreeReply.do")
	@ResponseBody
	public Map<String, String> writeFreeReply(FreeReplyVO vo, HttpSession session, HttpServletRequest request){
		logger.debug("<<댓글 등록>> : " +vo);

		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) { // 로그아웃 상태
			mapJson.put("result", "logout");
		}else { // 로그인 상태
			// 회원번호 등록 : session에서 뽑아서 회원번호를 등록한다.
			vo.setMem_num(user.getMem_num());
			// ip등록
			vo.setFre_ip(request.getRemoteAddr());
			// 댓글 등록
			freeService.insertFreeReply(vo);
			mapJson.put("result", "success");
		}
		return mapJson;
	}

	// ========== 댓글 목록 ==========
	@RequestMapping("/community/listFreeReply.do")
	@ResponseBody
	public Map<String, Object> getFreeList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, 
			@RequestParam int free_num, HttpSession session){
		logger.debug("<<currentPage>> : " + currentPage);
		logger.debug("<<board_num>> : " + free_num);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("free_num", free_num);

		// 총 글의 개수
		int count = freeService.selectFreeRowCountReply(map);

		// 페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 5, 1, null); // 뒤에 두개(1,null)은 내부적 연산으로 해서 명시적으로 초기값 표기만 했다.
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());

		// 목록 데이터 읽기
		List<FreeReplyVO> freeList = null;
		if(count>0) {
			freeList = freeService.selectFreeListReply(map);
		}else {
			freeList = Collections.emptyList();
		}

		Map<String, Object> mapJson = new HashMap<String, Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", 5);
		mapJson.put("freeList", freeList);

		// 로그인 한 회원정보 셋팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user!=null) {
			mapJson.put("user_num", user.getMem_num());
		}
		return mapJson;
	}

	
	// ========== 댓글 수정 ==========
	@RequestMapping("/community/updateFreeReply.do")
	@ResponseBody
	public Map<String,String> modifyFreeReply(FreeReplyVO freeReplyVO, HttpSession session, HttpServletRequest request){

		logger.debug("<<댓글수정>> : " + freeReplyVO);
		Map<String,String> mapJson = new HashMap<String,String>();

		// 세션에서 정보 읽어오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 한건의 데이터 읽어오기
		FreeReplyVO db_reply = freeService.selectFreeReply(freeReplyVO.getFre_num());

		if(user==null) {
			// 로그인이 안 되어 있는 경우
			mapJson.put("result", "logout");
		}else if(user!=null && user.getMem_num()==db_reply.getMem_num()) {
			// 로그인 회원번호와 작성자 회원번호 일치
			// ip등록
			freeReplyVO.setFre_ip(request.getRemoteAddr());
			mapJson.put("result", "success");
		}else {
			// 로그인 회원번호와 작성자 회원번호 불일치
			mapJson.put("result", "wrongAccess");
		}
		return mapJson;
	}
	
	// ========== 댓글 삭제 ==========
	@RequestMapping("/community/deleteFreeReply.do")
	@ResponseBody
	public Map<String, String> deleteFreeReply(@RequestParam int fre_num, HttpSession session){
		logger.debug("<<댓글 삭제>> : " + fre_num);

		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		FreeReplyVO db_reply = freeService.selectFreeReply(fre_num);
		if(user==null) {
			// 로그인이 되어 있지 않은 경우
			mapJson.put("resutl", "logout");
		}else if(user!=null && user.getMem_num()==db_reply.getMem_num()) {
			// 로그인한 회원번호와 작성자 회원번호가 일치하는 경우
			freeService.deleteFreeReply(fre_num);
			mapJson.put("result", "success");
		}else {
			// 로그인한 회원번호와 작성자 회원번호가 불일치하는 경우
			mapJson.put("result", "wrongAccess");
		}

		return mapJson;
	}
	
}