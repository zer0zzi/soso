package kr.spring.member.service;

import org.apache.ibatis.annotations.Param;

import kr.spring.member.vo.MemberVO;

public interface MemberService {
	//회원관리 - 일반회원 
	public void insertMember(MemberVO member);
	public MemberVO selectCheckMember(String mem_id);
	
	//자동 로그인
	public void updateAu_id(String mem_au_id, String mem_id);
	public MemberVO selectAu_id(String mem_au_id);
	public void deleteAu_id(int mem_num);
}
