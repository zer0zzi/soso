package kr.spring.study.service;

import java.util.List;
import java.util.Map;

import kr.spring.study.vo.StudyFavVO;
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
	//좋아요
	public StudyFavVO selectFav(StudyFavVO fav);
	public int selectFavCount(Integer stc_num);
	public void insertFav(StudyFavVO fav);
	public void deleteFav(Integer fav_num);
}

