package kr.spring.group.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
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
	@Select("select * from group_calendar where stc_num=#{stc_num} and cal_date in (select to_char(sysdate,'YYYY-MM-DD') from dual) order by cal_num asc")
	public List<GroupCalendarVO> selectTodayList(int stc_num);
	
	// 그룹 멤버 수 조회
	@Select("select count(*) from member_detail m left outer join study_signup s on m.mem_num=s.mem_num where s.stc_num=#{stc_num} and s.signup_status=1")
	public int selectCountMember(int stc_num);
	
	// 그룹 멤버 조회
	// mem_num으로 join 한 후 stc_num이 동일하고 status=1인 사람들의 정보 출력하기
	@Select("select m.*,r.mem_id"
			+ "    from member_detail m"
			+ "    left outer join study_signup s"
			+ "        on m.mem_num=s.mem_num"
			+ "    inner join member r"
			+ "        on m.mem_num=r.mem_num"
			+ "    where s.stc_num=#{stc_num} and s.signup_status=1")
	public List<MemberVO> selectMemberList(int stc_num);
	
	// 그룹에 접속한 회원의 정보가 있는지 체크
	@Select("select m.mem_num"
			+ "    from member_detail m"
			+ "    left outer join study_signup s"
			+ "        on m.mem_num=s.mem_num"
			+ "    where s.stc_num=#{stc_num} and s.signup_status=1 and m.mem_num=#{mem_num}")
	public int selectMemberCheck(Map<String,Object> map);
	
	//___________________게시판_________________
	//공지사항 글 불러오기
	public List<GroupNoticeVO> selectNoticeList(Map<String,Object> map);
	
	// 공지사항 글 갯수 세기
	public int selectCountNotice(Map<String,Object> map);
	
	// 공지사항 조회수 증가
	@Update("update group_notice set grp_hit=grp_hit+1 where grp_num=#{grp_num}")
	public void updateNoticeHit(int grp_num);
	
	// 공지사항 내용 불러오기
	@Select("select * from group_notice where grp_num=#{grp_num}")
	public GroupNoticeVO selectNoticeDetail(int grp_num);
	
	// 공지사항 추가
	@Insert("insert into group_notice(grp_num,grp_title,grp_content,stc_num,grp_filename,grp_uploadfile) "
			+ "values(GROUP_NOTICE_SEQ.nextval, #{grp_title},#{grp_content},#{stc_num},#{grp_filename},#{grp_uploadfile})")
	public void insertNotice(GroupNoticeVO notice);
	
	// 공지사항 파일 삭제
	@Update("update group_notice set grp_uploadfile='',grp_filename='' where grp_num=#{grp_num}")
	public void deleteFile(int grp_num);
	
	// 공지사항 글 수정
	public void updateNotice(GroupNoticeVO notice);
	
	// 공지사항 글 삭제
	@Delete("delete from group_notice where grp_num=#{grp_num}")
	public void deleteNotice(int grp_num);
	
	//___________________캘린더_________________
	//캘린더 일정 추가
	@Insert("insert into group_calendar(cal_num,cal_date,cal_content,stc_num) values(GROUP_CALENDAR_SEQ.nextval,TO_CHAR(#{cal_date}),#{cal_content},#{stc_num})")
	public void insertCalendar(GroupCalendarVO calendar);
	//캘린더 전체 일정 조회(오늘 이전의 날짜들은 출력되면 안됨.)
	@Select("select * from group_calendar where stc_num=#{stc_num} and cal_date >=any(select to_char(sysdate,'YYYY-MM-DD')from dual) order by cal_date asc, cal_num asc")
	public List<GroupCalendarVO> selectCalendarList(int stc_num);
	
	
	
}
