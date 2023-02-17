package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.spring.member.vo.MemberVO;

public interface MemberService {
	//회원관리 - 일반회원 
	public void insertMember(MemberVO member);
	public MemberVO selectCheckMember(String mem_id);
	public MemberVO selectMember(Integer mem_num);
	
	//자동 로그인
	public void updateAu_id(String mem_au_id, String mem_id);
	public MemberVO selectAu_id(String mem_au_id);
	public void deleteAu_id(int mem_num);
	
	//회원관리 - 관리자
	public List<MemberVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void updateByAdmin(MemberVO memberVO);
	
	//채팅 회원이름 검색
	public List<MemberVO> selectSearchMember(String mem_id);
}
