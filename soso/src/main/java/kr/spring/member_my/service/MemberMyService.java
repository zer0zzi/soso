package kr.spring.member_my.service;


import java.util.List;
import java.util.Map;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.vo.StudyVO;

public interface MemberMyService {
	public MemberVO selectCheckMember(String mem_id);
	public MemberVO selectMember(Integer mem_num);
	public void updateMember(MemberVO member);
	public void updatePassword(MemberVO member);
	public void deleteMember(Integer mem_num);

	//자동 로그인
	public void updateAu_id(String mem_au_id, String mem_id);
	public MemberVO selectAu_id(String mem_au_id);
	public void deleteAu_id(int mem_num);
	
	//프로필 이미지 업데이트
	public void updateProfile(MemberVO member);
	
	//내 스터디 그룹
	public List<StudyVO> selectStudy(Map<String, Object> map);
	public List<StudyVO> selectMadeStudy(Map<String, Object> map);
	public void updateStudy(StudyVO studyVO);
	public List<StudyVO> selectLikeStudy(Map<String, Object> map);
	public List<StudyVO> selectSignStudy(Map<String, Object> map);
}
