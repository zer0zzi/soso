package kr.spring.group.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.group.service.GroupService;
import kr.spring.group.vo.GroupCalendarVO;
import kr.spring.group.vo.GroupNoticeVO;
import kr.spring.member.vo.MemberVO;

@Controller
public class GroupController {
	private static final Logger logger =
	           LoggerFactory.getLogger(GroupController.class);
	
	@Autowired private GroupService groupService;
	
	
	//================== 메인페이지 =================//
	//========= 그룹 멤버 출력 ========//
	/*처음 스터디그룹 메인 페이지 호출 시*/
	@RequestMapping("/group/groupMain.do")
	public ModelAndView groupMain(@RequestParam int stc_num) {
		// 규칙 사항 출력
		GroupNoticeVO rule = null;
		rule = groupService.selectRule(1);
		
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
	public String noticeMain(@RequestParam int stc_num) {
		
		return "noticeMain";
	}
	
	//========= 공지사항 글쓰기 ========//
	@GetMapping("/group/groupNoticeWrite.do")
	public String form() {
		return "noticeWrite";
	}
	
	
	
	
	//================== 캘린더 페이지 =================//
}
