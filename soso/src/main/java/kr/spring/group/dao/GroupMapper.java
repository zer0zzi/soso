package kr.spring.group.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.group.vo.GroupCalendarVO;
import kr.spring.group.vo.GroupNoticeVO;
import kr.spring.member.vo.MemberVO;

@Mapper
public interface GroupMapper {
	
	/*----------메인페이지---------*/
	// 그룹 공지사항 조회
	@Select("select * from group_notice where stc_num=#{stc_num} order by grp_num desc")
	public List<GroupNoticeVO> selectRule(int stc_num);
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
	
	//___________________게시판_________________
	//게시판 글 불러오기
	public List<GroupNoticeVO> selectNoticeList(Map<String,Object> map);
	
	// 게시판 글 갯수 세기
	public int selectCountNotice(Map<String,Object> map);
	
	// 게시글 조회수 증가
	@Update("update group_notice set grp_hit=grp_hit+1 where grp_num=#{grp_num}")
	public void updateNoticeHit(int grp_num);
	
	// 게시글 내용 불러오기
	@Select("select * from group_notice where grp_num=#{grp_num}")
	public GroupNoticeVO selectNoticeDetail(int grp_num);
	
	
}
