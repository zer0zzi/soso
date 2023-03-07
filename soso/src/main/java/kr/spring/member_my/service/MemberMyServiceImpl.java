package kr.spring.member_my.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member_my.dao.MemberMyMapper;
import kr.spring.study.vo.StudyVO;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MemberMyServiceImpl implements MemberMyService{

	@Autowired
	private MemberMyMapper memberMyMapper;

	@Override
	public MemberVO selectCheckMember(String mem_id) {
		return memberMyMapper.selectCheckMember(mem_id);
	}

	@Override
	public MemberVO selectMember(Integer mem_num) {
		return memberMyMapper.selectMember(mem_num);
	}

	
	@Override
	public void updateMember(MemberVO member) {
		memberMyMapper.updateMember(member);
		memberMyMapper.updateMember_detail(member);
	}

	@Override
	public void updatePassword(MemberVO member) {
		memberMyMapper.updatePassword(member);
	}

	@Override
	public void deleteMember(Integer mem_num) {
		memberMyMapper.deleteMember(mem_num);
		memberMyMapper.deleteMember_detail(mem_num);
	}

	@Override
	public void updateProfile(MemberVO member) {
		memberMyMapper.updateProfile(member);
	}
	
	//자동로그인
	@Override
	public void updateAu_id(String mem_au_id, String mem_id) {
		memberMyMapper.updateAu_id(mem_au_id, mem_id);
	}

	@Override
	public MemberVO selectAu_id(String mem_au_id) {
		return memberMyMapper.selectAu_id(mem_au_id);
	}

	@Override
	public void deleteAu_id(int mem_num) {
		memberMyMapper.deleteAu_id(mem_num);
	}

	//내 스터디 그룹
	@Override
	public List<StudyVO> selectStudy(Map<String, Object> map) {
		return memberMyMapper.selectStudy(map);
	}
	
	@Override
	public List<StudyVO> selectMadeStudy(Map<String, Object> map) {
		return memberMyMapper.selectMadeStudy(map);
	}
}
