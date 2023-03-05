package kr.spring.group.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.group.service.GroupService;
import kr.spring.group.vo.GroupCalendarVO;

@Controller
public class GroupCalendarController {
	private static final Logger logger =
	           LoggerFactory.getLogger(GroupController.class);
	
	@Autowired private GroupService groupService;
	
	//자바빈 (vo) 초기화 --> 유효성검사 필요한 테이블만 초기화
	@ModelAttribute
	public GroupCalendarVO initCommand() {
		return new GroupCalendarVO();
	}

	//================== 캘린더 페이지 =================//
	@GetMapping("/group/groupCalendarWrite.do")
	public ModelAndView calendarForm(@RequestParam int stc_num) {
			
		return new ModelAndView("calenderWrite","stc_num",stc_num);
	}
	@PostMapping("/group/groupCalendarWrite.do")
	public ModelAndView submit(@Valid GroupCalendarVO groupCalendarVO,
							   BindingResult result,
							   HttpServletRequest request,
							   RedirectAttributes redirect,
							   HttpSession session) {
		
		logger.debug("<<캘린더 현재 stc_num 출력 >> : " + groupCalendarVO);
		logger.debug("<<캘린더 일정 추가>> : " + groupCalendarVO);
		logger.debug("<<캘린더 날짜 출력>> : " + groupCalendarVO.getCal_date());
		
		// 유효성 체크 결과 오류 발생했으면 폼 호출
		if(result.hasErrors()) {
			return calendarForm(groupCalendarVO.getStc_num());
		}
		
		// 선택한 날짜가 오늘보다 이전 날짜인지 비교하기
		// 오늘날짜 가져오기
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String today = simpleDateFormat.format(new Date());
		logger.debug("<< 오늘날짜 출력 >> : " + today); // 제대로 출력됨
		
		// 삽입 sql 실행
		groupService.insertCalendar(groupCalendarVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/group/calendarSuccess");
		mav.addObject("stc_num",groupCalendarVO.getStc_num());
		return mav;
	}
		
		
		
		
		
		
		
		
}
