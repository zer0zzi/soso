package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;

	//회원관리 - 일반회원
	@Override
	public void insertMember(MemberVO member) {
		member.setMem_num(memberMapper.selectMem_num());
		memberMapper.insertMember(member);
		memberMapper.insertMember_detail(member);
	}

	@Override
	public MemberVO selectCheckMember(String mem_id) {
		return memberMapper.selectCheckMember(mem_id);
	}
	
	@Override
	public MemberVO selectMember(Integer mem_num) {
		return memberMapper.selectMember(mem_num);
	}
	
	//자동로그인
	@Override
	public void updateAu_id(String mem_au_id, String mem_id) {
		memberMapper.updateAu_id(mem_au_id, mem_id);
	}

	@Override
	public MemberVO selectAu_id(String mem_au_id) {
		return memberMapper.selectAu_id(mem_au_id);
	}

	@Override
	public void deleteAu_id(int mem_num) {
		memberMapper.deleteAu_id(mem_num);
	}

	//회원관리 - 관리자
	@Override
	public List<MemberVO> selectList(Map<String, Object> map) {
		return memberMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return memberMapper.selectRowCount(map);
	}

	@Override
	public void updateByAdmin(MemberVO memberVO) {
		memberMapper.updateByAdmin(memberVO);
	}

	@Override
	public List<MemberVO> selectSearchMember(String id) {
		return memberMapper.selectSearchMember(id);
	}




}
