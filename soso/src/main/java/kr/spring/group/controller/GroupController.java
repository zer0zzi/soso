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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.group.service.GroupService;
import kr.spring.group.vo.GroupCalendarVO;
import kr.spring.group.vo.GroupNoticeVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class GroupController {
	private static final Logger logger =
	           LoggerFactory.getLogger(GroupController.class);
	
	@Autowired private GroupService groupService;
	
	//자바빈 (vo) 초기화 --> 유효성검사 필요한 테이블만 초기화
	@ModelAttribute
	public GroupNoticeVO initCommand() {
		return new GroupNoticeVO();
	}
	
	
	//================== 메인페이지 =================//
	//========= 그룹 멤버 출력 ========//
	/*처음 스터디그룹 메인 페이지 호출 시*/
	@RequestMapping("/group/groupMain.do")
	public ModelAndView groupMain(@RequestParam int stc_num) {
		// 규칙 사항 출력
		List<GroupNoticeVO> rule = null;
		rule = groupService.selectRule(stc_num);
		
		// 오늘 일정 출력
		List<GroupCalendarVO> todayList = null;
		todayList = groupService.selectTodayList(stc_num);
		
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
		
		
		
		logger.debug("<<그룹멤버 수 - count>> : " + count);
		logger.debug("<<그룹멤버 정보 - memberList>> : " + memberList);
		
		return mav;
	}
	


	
	
	//========= 캘린더 ========//
	/*캘린더 리스트 호출시*/
	@RequestMapping("/group/calendar_list.do")
	public String calendarMain() {
		return "calendarMain";
	}

	
	
	//================== 공지사항 페이지 =================//
	
	//========= 공지사항 리스트 출력 ========//
	@RequestMapping("/group/notice_list.do")
	public ModelAndView noticeMain(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage, @RequestParam int stc_num) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		//글의 총개수 또는 검색된 글의 개수
		int count = groupService.selectCountNotice(map);
		
		logger.debug("<<notice count>> : " + count);
		logger.debug("<<현재 그룹 번호>> : " + stc_num);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(currentPage,count,20,10,"notice_list.do");
				
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
		
		return mav;
	}
	
	//========= 공지사항 메인 ========//
	@GetMapping("/groupNoticeWrite.do")
	public String form() {
		return "noticeWrite";
	}
	
	@PostMapping("/groupNoticeWrite.do")
	public String submit(@Valid GroupNoticeVO GroupNoticeVO,
						 BindingResult result,
						 HttpServletRequest request,
						 RedirectAttributes redirect,
						 HttpSession session) {
		return "redirect:/group/notice_list.do"; 
	}
	
	//========= 공지사항 글 디테일 ========//
	@RequestMapping("/group/groupNoticeDetail.do")
	public ModelAndView noticeDetail(@RequestParam int grp_num) {
		
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
				                    //뷰이름      속성명    속성값
		return new ModelAndView("noticeDetail","detail",detail);
	}
	
	
	
	//================== 캘린더 페이지 =================//
}
