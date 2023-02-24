package kr.spring.study.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import kr.spring.study.vo.StudyFavVO;
import kr.spring.study.vo.StudySignupVO;
import kr.spring.study.vo.StudyVO;

public interface StudyService {
	//부모글
	public List<StudyVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertStudy(StudyVO study);
	public StudyVO selectStudy(Integer stc_num);
	public void updateHit(Integer stc_num);
	public void updateStudy(StudyVO study);
	public void deleteStudy(Integer stc_num);
	public void deleteFile(Integer stc_num);
	//관심등록
	public StudyFavVO selectFav(StudyFavVO fav);
	public int selectFavCount(Integer stc_num);
	public void insertFav(StudyFavVO fav);
	public void deleteFav(Integer fav_num);
	//스터디 신청	
	public StudySignupVO selectSignup(StudySignupVO signup);
	public void insertSignup(StudySignupVO signup);
}

