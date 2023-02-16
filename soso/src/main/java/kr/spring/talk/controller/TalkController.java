package kr.spring.talk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.talk.service.TalkService;
import kr.spring.talk.vo.TalkRoomVO;

public class TalkController {
	private static final Logger logger =LoggerFactory.getLogger(TalkController.class);
	@Autowired
	private MemberService memberService;

	@Autowired
	private TalkService talkService;

	//=====채팅 목록========//
	@RequestMapping("/talk/talkList.do")
	public String chatList(/* String keyword, */HttpSession session,Model model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		Map<String,Object> map = new HashMap<String, Object>();
		//map.put("keyword", keyword);
		map.put("mem_num", user.getMem_num());

		List<TalkRoomVO> list = talkService.selectTalkRoomList(map);
		model.addAttribute("list", list);

		return "talkList";
	}
}











