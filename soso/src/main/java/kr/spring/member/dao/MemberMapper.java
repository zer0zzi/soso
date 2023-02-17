package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	//회원관리 - 일반회원 
	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	@Insert("INSERT INTO member (mem_num,mem_id,mem_nick) VALUES (#{mem_num},#{mem_id},#{mem_nick})")
	public void insertMember(MemberVO member);
	@Insert("INSERT INTO member_detail (mem_num,mem_name,mem_pw,mem_phone,mem_email,mem_zipcode,mem_address1,mem_address2) VALUES (#{mem_num},#{mem_name},#{mem_pw},#{mem_phone},#{mem_email},#{mem_zipcode},#{mem_address1},#{mem_address2})")
	public void insertMember_detail(MemberVO member);
	@Select("SELECT m.mem_num,m.mem_id,m.mem_auth,m.mem_au_id,d.mem_pw,m.mem_nick,d.mem_email FROM member m LEFT OUTER JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_id=#{mem_id}")
	public MemberVO selectCheckMember(String mem_id);
	@Select("SELECT * FROM member m JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember(Integer mem_num);
	
	//자동 로그인
	@Update("UPDATE member SET mem_au_id=#{mem_au_id} WHERE mem_id=#{mem_id}")
	public void updateAu_id(@Param("mem_au_id") String mem_au_id, @Param("mem_id") String mem_id);
	@Select("SELECT m.mem_num, m.mem_id, m.mem_auth, m.mem_au_id, d.mem_pw, m.mem_nick, d.mem_email FROM member m JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_au_id=#{mem_au_id}")
	public MemberVO selectAu_id(String mem_au_id);
	@Update("UPDATE member SET mem_au_id='' WHERE mem_num=#{mem_num}")
	public void deleteAu_id(int mem_num);
	
	//회원관리 - 관리자
	public List<MemberVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Update("UPDATE member SET mem_auth=#{mem_auth} WHERE mem_num=#{mem_num}")
	public void updateByAdmin(MemberVO memberVO);
	
	//채팅 회원이름 검색
	@Select("SELECT mem_num,id,nick_name FROM member WHERE auth >= 2 AND id LIKE '%' || #{id} || '%'")
	public List<MemberVO> selectSearchMember(String id);

}









