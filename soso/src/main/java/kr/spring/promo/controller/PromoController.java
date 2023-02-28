package kr.spring.promo.controller;

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
import kr.spring.promo.service.PromoService;
import kr.spring.promo.vo.PromoFavVO;
import kr.spring.promo.vo.PromoReplyVO;
import kr.spring.promo.vo.PromoVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class PromoController {
	private static final Logger logger = LoggerFactory.getLogger(PromoController.class);
	private int rowCount = 10;
	@Autowired // 의존 관계 주입
	private PromoService promoService;
	// 자바빈 초기화
	@ModelAttribute
	public PromoVO initCommand() {
		return new PromoVO();
	}

	// ========== 홍보 글 목록 ==========
	@RequestMapping("/community/promoList.do")
	public ModelAndView promoList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword, String sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("sort", sort);

		// 글의 총 개수 또는 검색된 글의 개수 반환
		int count = promoService.selectPromoRowCount(map);

		// 로그 - 콘솔창
		logger.debug("<<count>> : " + count);

		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount, 10, "promoList.do", sort);
		List<PromoVO> promoList = null;
		if(count>0){
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			promoList = promoService.selectPromoList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("promoList");
		mav.addObject("count", count);
		mav.addObject("promoList", promoList);
		mav.addObject("page", page.getPage());

		return mav;
	}

	// ========== 홍보 글 작성 ==========
	// 등록 폼 호출
	@GetMapping("/community/promoWrite.do")
	public String promoWriteForm() {
		return "promoWrite"; // 타일스 설정값
	}
	// 등록 폼에서 전송된 데이터 처리
	@PostMapping("/community/promoWrite.do")
	public String promoSubmit(@Valid PromoVO promoVO, BindingResult result, HttpServletRequest request, 
			RedirectAttributes redirect, HttpSession session) {
		logger.debug("<<게시판 글쓰기>> : " + promoVO);
		logger.debug("<<업로드 파일 용량>> : " + promoVO.getPromo_uploadfile().length);

		// 업로드 파일 용량 체크
		if(promoVO.getPromo_uploadfile().length>=52428800) { // 5MB
			result.reject("limitUploadSize");
		}

		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			return promoWriteForm();
		}
		// 에러가 없으면 회원번호 셋팅
		promoVO.setMem_num(((MemberVO)session.getAttribute("user")).getMem_num());
		// ip셋팅
		promoVO.setPromo_ip(request.getRemoteAddr());
		// 글쓰기
		promoService.insertPromo(promoVO);

		redirect.addFlashAttribute("result", "success");

		return "redirect:/community/promoList.do";
	}

	// ========== 홍보 글상세 ==========
	@RequestMapping("/community/promoDetail.do")
	public ModelAndView promoDetail(@RequestParam int promo_num) {
		logger.debug("<<promo_num>> : " + promo_num);

		// 해당 글의 조회수 증가
		promoService.updatePromoHit(promo_num);

		PromoVO promo = promoService.selectPromo(promo_num);

		// 제목에 태그를 허용하지 않음
		promo.setPromo_title(StringUtil.useNoHtml(promo.getPromo_title()));
		// 내용에 태그를 허용하지 않음
		promo.setPromo_content(StringUtil.useBrNoHtml(promo.getPromo_content()));

		return new ModelAndView("promoDetail", "promo", promo);
	}

	// ========== 이미지 출력 ==========
	@RequestMapping("/community/imagePromoView.do")
	public ModelAndView viewPromoImage(@RequestParam int promo_num, @RequestParam int promo_type) {
		PromoVO promo = promoService.selectPromo(promo_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView"); // 뷰 출력

		if(promo_type==1) { // 프로필 사진
			mav.addObject("imageFile", promo.getMem_photo());
			mav.addObject("filename", promo.getMem_photo_name());
		}else if(promo_type==2) { // 업로드된 이미지
			mav.addObject("imageFile", promo.getPromo_uploadfile());
			mav.addObject("filename", promo.getPromo_filename());
		}

		return mav;
	}

	// ========== 파일 다운로드 ==========
	@RequestMapping("/community/file.do")
	public ModelAndView download(@RequestParam int promo_num) {
		PromoVO promo = promoService.selectPromo(promo_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", promo.getPromo_uploadfile());
		mav.addObject("filename", promo.getPromo_filename());

		return mav;
	}

	// ========== 홍보 글수정 ==========
	// 수정 폼 호출
	@GetMapping("/community/promoUpdate.do")
	public String promoFormUpdate(@RequestParam int promo_num, Model model) {
		PromoVO promoVO = promoService.selectPromo(promo_num);

		model.addAttribute("promoVO", promoVO);

		return "promoUpdate";
	}
	// ========== 파일 삭제 ==========
	@RequestMapping("/community/promoFile.do")
	@ResponseBody
	public Map<String, String> promoFile(int promo_num, HttpSession session){
		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			promoService.deletePromoFile(promo_num);

			mapJson.put("result", "success");
		}
		return mapJson;
	}
	// 수정 폼에서 전송된 데이터 처리
	@PostMapping("/community/promoUpdate.do")
	public String promoUpdate(@Valid PromoVO promoVO, BindingResult result, HttpServletRequest request, Model model) {
		logger.debug("<<글수정>> : " + promoVO);
		logger.debug("<<업로드 파일 용량>> : " + promoVO.getPromo_uploadfile().length);

		// 업로드 파일 용량 체크
		if(promoVO.getPromo_uploadfile().length>=52428800) { // 5MB
			result.reject("limitUploadSize");
		}

		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			PromoVO vo = promoService.selectPromo(promoVO.getPromo_num());
			promoVO.setPromo_filename(vo.getPromo_filename());
			return "promoUpate";
		}

		// ip 셋팅
		promoVO.setPromo_ip(request.getRemoteAddr());

		// 글수정
		promoService.updatePromo(promoVO);

		// View에 표시할 메시지 : 자바스크립트 이용
		model.addAttribute("message", "글수정 완료");
		model.addAttribute("url", request.getContextPath()+"/community/promoDetail.do?promo_num="+promoVO.getPromo_num());

		return "common/resultView";
	}

	// ========== 홍보 글 삭제 ==========
	@RequestMapping("/community/promoDelete.do")
	public String promoSubmitDelete(@RequestParam int promo_num, Model model, HttpServletRequest request) {
		logger.debug("<<게시판 글삭제>> : " + promo_num);

		promoService.deletePromo(promo_num);

		return "redirect:/community/promoList.do";
	}

	// ========== 부모글 좋아요 ==========
	// 좋아요 읽기
	@RequestMapping("/community/getPromoFav.do")
	@ResponseBody
	public Map<String, Object> getPromoFav(PromoFavVO fav, HttpSession session){
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

			PromoFavVO promoFav = promoService.selectPromoFav(fav);
			if(promoFav!=null) {
				mapJson.put("status", "yesFav");
			}else {
				mapJson.put("status", "noFav");
			}
		}
		mapJson.put("count", promoService.selectPromoFavCount(fav.getPromo_num()));

		return mapJson;
	}
	// 좋아요 등록
	@RequestMapping("/community/writePromoFav.do")
	@ResponseBody
	public Map<String, Object> writePromoFav(PromoFavVO fav, HttpSession session){
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

			PromoFavVO promoFav = promoService.selectPromoFav(fav);
			if(promoFav!=null) {
				promoService.deletePromoFav(promoFav.getP_fav_num());
				mapJson.put("result", "success");
				mapJson.put("status", "noFav");
			}else {
				promoService.insertPromoFav(fav);

				mapJson.put("result", "success");
				mapJson.put("status", "yesFav");
			}
			mapJson.put("count", promoService.selectPromoFavCount(fav.getPromo_num()));
		}
		return mapJson;
	}

	// ========== 댓글 등록 ==========
	@RequestMapping("/community/writePromoReply.do")
	@ResponseBody
	public Map<String, String> writePromoReply(PromoReplyVO vo, HttpSession session, HttpServletRequest request){
		logger.debug("<<댓글 등록>> : " +vo);

		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) { // 로그아웃 상태
			mapJson.put("result", "logout");
		}else { // 로그인 상태
			// 회원번호 등록 : session에서 뽑아서 회원번호를 등록한다.
			vo.setMem_num(user.getMem_num());
			// ip등록
			vo.setPre_ip(request.getRemoteAddr());
			// 댓글 등록
			promoService.insertPromoReply(vo);
			mapJson.put("result", "success");
		}
		return mapJson;
	}

	// ========== 댓글 목록 ==========
	@RequestMapping("/community/listPromoReply.do")
	@ResponseBody
	public Map<String, Object> getPromoList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, 
			@RequestParam int promo_num, HttpSession session){
		logger.debug("<<currentPage>> : " + currentPage);
		logger.debug("<<promo_num>> : " + promo_num);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("promo_num", promo_num);

		// 총 글의 개수
		int count = promoService.selectPromoRowCountReply(map);

		// 페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 5, 1, null); // 뒤에 두개(1,null)은 내부적 연산으로 해서 명시적으로 초기값 표기만 했다.
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());

		// 목록 데이터 읽기
		List<PromoReplyVO> promoList = null;
		if(count>0) {
			promoList = promoService.selectPromoListReply(map);
		}else {
			promoList = Collections.emptyList();
		}

		Map<String, Object> mapJson = new HashMap<String, Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", 5);
		mapJson.put("promoList", promoList);

		// 로그인 한 회원정보 셋팅
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user!=null) {
			mapJson.put("user_num", user.getMem_num());
		}
		return mapJson;
	}

	// ========== 댓글 수정 ==========
	@RequestMapping("/community/updatePromoReply.do")
	@ResponseBody
	public Map<String,String> modifyPromoReply(PromoReplyVO promoReplyVO, HttpSession session, HttpServletRequest request){

		logger.debug("<<댓글수정>> : " + promoReplyVO);
		Map<String,String> mapJson = new HashMap<String,String>();

		// 세션에서 정보 읽어오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 한건의 데이터 읽어오기
		PromoReplyVO db_reply = promoService.selectPromoReply(promoReplyVO.getPre_num());

		if(user==null) {
			// 로그인이 안 되어 있는 경우
			mapJson.put("result", "logout");
		}else if(user!=null && user.getMem_num()==db_reply.getMem_num()) {
			// 로그인 회원번호와 작성자 회원번호 일치
			// ip등록
			promoReplyVO.setPre_ip(request.getRemoteAddr());
			mapJson.put("result", "success");
		}else {
			// 로그인 회원번호와 작성자 회원번호 불일치
			mapJson.put("result", "wrongAccess");
		}
		return mapJson;
	}

	// ========== 댓글 삭제 ==========
	@RequestMapping("/community/deletePromoReply.do")
	@ResponseBody
	public Map<String, String> deletePromoReply(@RequestParam int pre_num, HttpSession session){
		logger.debug("<<댓글 삭제>> : " + pre_num);

		Map<String, String> mapJson = new HashMap<String, String>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		PromoReplyVO db_reply = promoService.selectPromoReply(pre_num);
		if(user==null) {
			// 로그인이 되어 있지 않은 경우
			mapJson.put("resutl", "logout");
		}else if(user!=null && user.getMem_num()==db_reply.getMem_num()) {
			// 로그인한 회원번호와 작성자 회원번호가 일치하는 경우
			promoService.deletePromoReply(pre_num);
			mapJson.put("result", "success");
		}else {
			// 로그인한 회원번호와 작성자 회원번호가 불일치하는 경우
			mapJson.put("result", "wrongAccess");
		}
		return mapJson;
	}
}