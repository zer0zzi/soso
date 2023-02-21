package kr.spring.group.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.group.vo.GroupCalendarVO;
import kr.spring.group.vo.GroupNoticeVO;
import kr.spring.member.vo.MemberVO;

@Mapper
public interface GroupMapper {
	
	/*----------메인페이지---------*/
	// 그룹 규칙 조회
	@Select("select * from group_notice where stc_num=#{stc_num} and grp_vital='T'")
	public GroupNoticeVO selectRule(int stc_num);
	// 오늘 일정 조회
	@Select("select * from group_calendar where stc_num=#{stc_num} and cal_date in (select to_char(sysdate,'YYYY-MM-DD') from dual)")
	public List<GroupCalendarVO> selectTodayList(int stc_num);
	
	// 그룹 멤버 수 조회
	@Select("select count(*) from member_detail m left outer join study_signup s on m.mem_num=s.mem_num where s.stc_num=#{stc_num} and s.signup_status=1")
	public int selectCountMember(int stc_num);
	
	// 그룹 멤버 조회
	// mem_num으로 join 한 후 stc_num이 동일하고 status=1인 사람들의 정보 출력하기
	@Select("select m.* from member_detail m left outer join study_signup s on m.mem_num=s.mem_num where s.stc_num=#{stc_num} and s.signup_status=1")
	public List<MemberVO> selectMemberList(int stc_num);
	

}
