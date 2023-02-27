package kr.spring.group.service;

import java.util.List;
import java.util.Map;

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
	
	/*------------메인 페이지-------------*/
	@Override
	public List<GroupNoticeVO> selectRule(int stc_num) {
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
	
	/*------------공지사항 페이지-----------*/
	//공지사항 글 리스트 조회
	@Override
	public List<GroupNoticeVO> selectNoticeList(Map<String,Object> map){
		return groupMapper.selectNoticeList(map);
	}
	//공지사항 글 갯수 세기
	@Override
	public int selectCountNotice(Map<String,Object> map){
		return groupMapper.selectCountNotice(map);
	}
	// 공지사항 조회수 증가
	@Override
	public void updateNoticeHit(int grp_num) {
		groupMapper.updateNoticeHit(grp_num);
	}
	// 공지사항 글 디테일 조회
	@Override
	public GroupNoticeVO selectNoticeDetail(int grp_num) {
		return groupMapper.selectNoticeDetail(grp_num);
	}
	
	
	/*------------캘린더 페이지-----------*/

}
