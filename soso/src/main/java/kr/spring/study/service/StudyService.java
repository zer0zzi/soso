package kr.spring.study.service;

import java.util.List;
import java.util.Map;

import kr.spring.study.vo.StudyFavVO;


public interface StudyService {
	//좋아요
	public StudyFavVO selectFav(StudyFavVO fav);
	public int selectFavCount(Integer stc_num);
	public void insertFav(StudyFavVO fav);
	public void deleteFav(Integer fav_num);
}

