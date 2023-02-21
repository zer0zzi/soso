package kr.spring.stc.service;

import java.util.List;
import java.util.Map;

import kr.spring.study.vo.StudyVO;

public interface StcService {
	//스터디 리스트(메인)
	public List<StudyVO> studyList(Map<String,Object> map);

	//스터디 모집 글 생성
	public void studyCreate(StudyVO study);
}
