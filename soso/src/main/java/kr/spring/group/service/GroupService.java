package kr.spring.group.service;

import java.util.List;

import kr.spring.group.vo.GroupCalendarVO;
import kr.spring.group.vo.GroupNoticeVO;
import kr.spring.member.vo.MemberVO;


public interface GroupService {
	
	/*------------메인페이지-----------*/
	//그룹 규칙 조회
	public GroupNoticeVO selectRule(int stc_num);
	//오늘 일정 조회
	public List<GroupCalendarVO> selectTodayList(int stc_num);
	//그룹 멤버 조회
	public int selectCountMember(int stc_num);
	//그룹 멤버 조회
	public List<MemberVO> selectMemberList(int stc_num);
}
