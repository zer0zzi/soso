package kr.spring.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.group.dao.GroupMapper;
import kr.spring.group.vo.GroupCalendarVO;
import kr.spring.group.vo.GroupNoticeVO;
import kr.spring.member.vo.MemberVO;


@Service
@Transactional
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	private GroupMapper groupMapper;
	
	@Override
	public GroupNoticeVO selectRule(int stc_num) {
		return groupMapper.selectRule(stc_num);
	}
	@Override
	public List<GroupCalendarVO> selectTodayList(int stc_num){
		return groupMapper.selectTodayList(stc_num);
	}
	@Override
	public int selectCountMember(int stc_num) {
		return groupMapper.selectCountMember(stc_num);
	} 
	
	@Override
	public List<MemberVO> selectMemberList(int stc_num) {
		return groupMapper.selectMemberList(stc_num);
	} 
	
	

}
