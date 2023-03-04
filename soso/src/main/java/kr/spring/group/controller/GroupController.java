package kr.spring.group.controller;

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

import kr.spring.group.service.GroupService;
import kr.spring.group.vo.GroupCalendarVO;
import kr.spring.group.vo.GroupNoticeVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.stc.service.StcService;
import kr.spring.study.vo.StudyVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class GroupController {
	private static final Logger logger =
	           LoggerFactory.getLogger(GroupController.class);
	
	@Autowired private GroupService groupService;
	@Autowired private StcService stcService;
	
	//자바빈 (vo) 초기화 --> 유효성검사 필요한 테이블만 초기화
	@ModelAttribute
	public GroupNoticeVO initCommand() {
		return new GroupNoticeVO();
	}
	
	
	//================== 메인페이지 =================//
	//========= 그룹 멤버 출력 ========//
	/*처음 스터디그룹 메인 페이지 호출 시*/
	@RequestMapping("/group/groupMain.do")
	public ModelAndView groupMain(@RequestParam int stc_num,
								  HttpSession session) {
		
		// 규칙 사항 출력
		List<GroupNoticeVO> rule = null;
		rule = groupService.selectRule(stc_num);
			
		// 오늘 일정 출력
		List<GroupCalendarVO> todayList = null;
		todayList = groupService.selectTodayList(stc_num);
		logger.debug("stc_num 테스트출력"+stc_num);
		logger.debug("<<오늘일정 출력>> : " + todayList); //---> null
			
		// 글 총 갯수.
		int count = groupService.selectCountMember(stc_num);
			
		// 그룹멤버 정보 출력
		List<MemberVO> memberList = null;
		memberList = groupService.selectMemberList(stc_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("groupMain"); //뷰이름 설정(tiles)
			
		mav.addObject("rule",rule);
		mav.addObject("todayList",todayList);
		mav.addObject("count",count); 
		mav.addObject("memberList",memberList); //데이터 저장
			
			
		// 지금 들어온 사람이 이 그룹의 방장인지 체크
		// 1. 현재 그룹 페이지 정보 다 가져오기
		StudyVO stcDetail = stcService.selectStudy(stc_num);
		// 2. 가져온 정보에서 mem_num을 추출해 현재 mem_num과 비교하기
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(stcDetail.getMem_num()==user.getMem_num()) {
			// master가 비어있는지 아닌지만 체크할거라 아무 변수 넣어도 됨.
			mav.addObject("master",count);
		}
			
		logger.debug("<<그룹멤버 수 - count>> : " + count);
		logger.debug("<<그룹멤버 정보 - memberList>> : " + memberList);
		
		
		return mav;
	}
	


	
	
	//========= 캘린더 ========//
	/*캘린더 리스트 호출시*/
	@RequestMapping("/group/calendar_list.do")
	public ModelAndView calendarMain(@RequestParam int stc_num, 
									 HttpSession session) {
		
		List<GroupCalendarVO> list = null;
		list=groupService.selectCalendarList(stc_num);
		logger.debug("<<전체 일정 출력(list) >> : " + list);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calendarMain");
		mav.addObject("list", list);
		mav.addObject("stc_num",stc_num);
		
		// 지금 들어온 사람이 이 그룹의 방장인지 체크
		// 1. 현재 그룹 페이지 정보 다 가져오기
		StudyVO stcDetail = stcService.selectStudy(stc_num);
		// 2. 가져온 정보에서 mem_num을 추출해 현재 mem_num과 비교하기
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(stcDetail.getMem_num()==user.getMem_num()) {
			// master가 비어있는지 아닌지만 체크할거라 아무 변수 넣어도 됨.
			mav.addObject("master",stc_num);
		}
		
		return mav;
	}

	
	
	//================== 공지사항 페이지 =================//
	
	//========= 공지사항 메인 ========//
	@RequestMapping("/group/notice_list.do")
	public ModelAndView noticeMain(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage, @RequestParam int stc_num,
			HttpSession session) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		//글의 총개수 또는 검색된 글의 개수
		int count = groupService.selectCountNotice(map);
	
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage,count,20,10,"notice_list.do");
		List<GroupNoticeVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			list = groupService.selectNoticeList(map);
		}
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeMain");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		mav.addObject("stc_num",stc_num);
		
		
		// 지금 들어온 사람이 이 그룹의 방장인지 체크
		// 1. 현재 그룹 페이지 정보 다 가져오기
		StudyVO stcDetail = stcService.selectStudy(stc_num);
		// 2. 가져온 정보에서 mem_num을 추출해 현재 mem_num과 비교하기
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(stcDetail.getMem_num()==user.getMem_num()) {
			// master가 비어있는지 아닌지만 체크할거라 아무 변수 넣어도 됨.
			mav.addObject("master",stc_num);
		}
		
		return mav;
	}
	
	//========= 공지사항 글쓰기 ========//
	@GetMapping("/groupNoticeWrite.do")
	public ModelAndView form(@RequestParam int stc_num) {
		
		return new ModelAndView("noticeWrite","stc_num",stc_num);
	}
	
	@PostMapping("/groupNoticeWrite.do")
	public ModelAndView submit(@Valid GroupNoticeVO groupNoticeVO,
						 BindingResult result,
						 HttpServletRequest request,
						 RedirectAttributes redirect,
						 HttpSession session) {

		//용량체크
		logger.debug("<<게시판 글쓰기>> : " + groupNoticeVO);
		logger.debug("<<업로드 파일 용량>> : "+groupNoticeVO.getGrp_uploadfile().length);		
		if(groupNoticeVO.getGrp_uploadfile().length>=52428800) {
			result.reject("limitUploadSize(5MB)");
		}
		
		// 유효성 체크 결과 오류 발생했으면 폼 호출
		if(result.hasErrors()) {
			return form(groupNoticeVO.getStc_num());
		}
		
		// 나머지 회원정보를 vo에 담아주기(form에서 input으로 담은것들은 vo에 이미 담아져있음.) ---> 현재는 딱히 넣을 데이터가 없음
		
		// 공지사항 삽입 sql실행
		groupService.insertNotice(groupNoticeVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/group/noticeSuccess");
		mav.addObject("stc_num", groupNoticeVO.getStc_num());
		return mav; 
	}
	
	//========= 공지사항 글 디테일 ========//
	@RequestMapping("/group/groupNoticeDetail.do")
	public ModelAndView noticeDetail(@RequestParam int grp_num,
									 @RequestParam int stc_num,
									 HttpSession session) {
		
		logger.debug("<<notice_num>> : " + grp_num);
		// 조회수 증가
		groupService.updateNoticeHit(grp_num);
		
		// 글 내용 가져오기
		GroupNoticeVO detail = groupService.selectNoticeDetail(grp_num);
		
		//제목에 태그를 허용하지 않음
		detail.setGrp_title(StringUtil.useNoHtml( detail.getGrp_title()));
		//내용에 태그를 허용하지 않음
		detail.setGrp_content(StringUtil.useBrNoHtml(detail.getGrp_content()));
		
		logger.debug("<<notice_detail>> : " + detail);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeDetail");
		mav.addObject("detail",detail);
		
		// 지금 들어온 사람이 이 그룹의 방장인지 체크
		// 1. 현재 그룹 페이지 정보 다 가져오기
		StudyVO stcDetail = stcService.selectStudy(stc_num);
		// 2. 가져온 정보에서 mem_num을 추출해 현재 mem_num과 비교하기
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(stcDetail.getMem_num()==user.getMem_num()) {
		// master가 비어있는지 아닌지만 체크할거라 아무 변수 넣어도 됨.
			mav.addObject("master",stc_num);
		}
		
		return mav;
	}
	
	//========= 공지사항 디테일 - 첨부파일 다운로드 ========//
	@RequestMapping("/group/file.do")
	public ModelAndView download(@RequestParam int grp_num) {
		GroupNoticeVO load = groupService.selectNoticeDetail(grp_num);
		
		logger.debug("<<첨부파일 다운로드>> : " + grp_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", load.getGrp_uploadfile());
		mav.addObject("filename", load.getGrp_filename());
		
		return mav;
	}
	
	//========= 공지사항 디테일 - 이미지미리보기 ========//
	@RequestMapping("/group/imageView.do")
	public ModelAndView viewImage(@RequestParam int grp_num) {
		
		GroupNoticeVO image = groupService.selectNoticeDetail(grp_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",image.getGrp_uploadfile());
		mav.addObject("filename", image.getGrp_filename());
		return mav;
	}
	
	//========= 공지사항 글 수정 ========//
	@GetMapping("/group/groupNoticeModify.do")
	public String formUpdate(@RequestParam int grp_num, Model model) {
		
		GroupNoticeVO groupNoticeVO = groupService.selectNoticeDetail(grp_num);
		model.addAttribute("groupNoticeVO",groupNoticeVO);
		return "noticeModify";
	}
	@PostMapping("/group/groupNoticeModify.do")
	public String submitUpdate(@Valid GroupNoticeVO groupNoticeVO,
							   BindingResult result, 
							   HttpServletRequest request,
							   Model model) {
		
		logger.debug("<<글수정>> : " + groupNoticeVO);
		logger.debug("<<업로드 파일 용량>> : " + groupNoticeVO.getGrp_uploadfile().length);

		if(groupNoticeVO.getGrp_uploadfile().length >= 52428800) {//5MB
			result.reject("limitUploadSize");
		}
		
		//유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			//title 또는 content가 입력되지 않아서 유효성
			//체크에 걸리면 파일 정보를 잃어버리기 때문에
			//폼을 호출할 때 파일 정보를 다시 셋팅
			GroupNoticeVO vo = groupService.selectNoticeDetail(
						groupNoticeVO.getGrp_num());
			groupNoticeVO.setGrp_filename(vo.getGrp_filename());
			return "noticeModify";
		}
		
		//글수정 실행
		groupService.updateNotice(groupNoticeVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글수정 완료!");
		model.addAttribute("url", request.getContextPath()
			+"/group/groupNoticeDetail.do?grp_num="+groupNoticeVO.getGrp_num());
		
		return "common/resultView";
	}
	
	//========= 공지사항 파일 삭제 ========//
		@RequestMapping("/group/deleteFile.do")
		@ResponseBody
		public Map<String,String> processFile(int grp_num, HttpSession session){
			
			Map<String,String> mapJson = new HashMap<String,String>();
			MemberVO user = (MemberVO)session.getAttribute("user");
			
			if(user==null) {
				mapJson.put("result", "logout");
			}else {
				groupService.deleteFile(grp_num);
				
				mapJson.put("result", "success");
			}
			
			return mapJson;
		}
		
	//========= 공지사항 글 삭제 ========//
		@RequestMapping("/group/groupNoticeDelete.do")
		public String submitDelete(@RequestParam int grp_num, @RequestParam int stc_num, 
								   Model model, HttpServletRequest request){
			
			logger.debug("<<게시판 글삭제>> : " + grp_num);
			int number = stc_num;
			
			//글삭제
			groupService.deleteNotice(grp_num);
		
			//View에 표시할 메시지
			model.addAttribute("message", "글 삭제 완료!");
			model.addAttribute("url", request.getContextPath()
				+"/group/notice_list.do?stc_num="+number);
			
			return "common/resultView";
		}
		
		
		
		
		
		
}
