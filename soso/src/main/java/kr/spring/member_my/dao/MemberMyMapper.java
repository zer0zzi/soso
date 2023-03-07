package kr.spring.member_my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.vo.StudyVO;

@Mapper
public interface MemberMyMapper {

	//회원관리 - 일반회원
	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	@Select("SELECT m.mem_num,m.mem_id,m.mem_auth,m.mem_au_id,d.mem_pw,m.mem_nick,d.mem_email FROM member m LEFT OUTER JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_id=#{mem_id}")
	public MemberVO selectCheckMember(String mem_id);
	@Select("SELECT * FROM member m JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember(Integer mem_num);
	@Update("UPDATE member SET mem_nick=#{mem_nick} WHERE mem_num=#{mem_num}")
	public void updateMember(MemberVO member);
	@Update("UPDATE member_detail SET mem_name=#{mem_name},mem_phone=#{mem_phone},mem_email=#{mem_email},mem_zipcode=#{mem_zipcode},mem_address1=#{mem_address1},mem_address2=#{mem_address2},mem_modify=SYSDATE WHERE mem_num=#{mem_num}")
	public void updateMember_detail(MemberVO member);
	@Update("UPDATE member_detail SET mem_pw=#{mem_pw} WHERE mem_num=#{mem_num}")
	public void updatePassword(MemberVO member);
	@Update("UPDATE member SET mem_auth=0 WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);
	@Delete("DELETE FROM member_detail WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(Integer mem_num);
	
	//자동 로그인
	@Update("UPDATE member SET mem_au_id=#{mem_au_id} WHERE mem_id=#{mem_id}")
	public void updateAu_id(@Param("mem_au_id") String mem_au_id, @Param("mem_id") String mem_id);
	@Select("SELECT m.mem_num, m.mem_id, m.mem_auth, m.mem_au_id, d.mem_pw, m.mem_nick, d.mem_email FROM member m JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_au_id=#{mem_au_id}")
	public MemberVO selectAu_id(String mem_au_id);
	@Update("UPDATE member SET mem_au_id='' WHERE mem_num=#{mem_num}")
	public void deleteAu_id(int mem_num);
	
	
	//프로필 이미지 업데이트
	@Update("UPDATE member_detail SET mem_photo=#{mem_photo},mem_photo_name=#{mem_photo_name} WHERE mem_num=#{mem_num}")
	public void updateProfile(MemberVO member);
	
	//내 스터디 그룹
	@Select("SELECT rownum, c.stc_num, stc_title, stc_uploadfile, stc_content, s.mem_num, m.mem_name, m.mem_score FROM study_create c, study_signup s, member_detail m "
			+ "WHERE c.stc_num=(SELECT distinct stc_num FROM study_signup WHERE mem_num=#{mem_num} AND signup_status=1) AND c.stc_num=s.stc_num AND s.mem_num=m.mem_num AND signup_status=1")
	public List<StudyVO> selectStudy(Map<String, Object> map);
	//public StudyVO selectStudy(Integer mem_num);
}
