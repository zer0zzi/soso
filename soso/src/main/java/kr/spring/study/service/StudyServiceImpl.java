package kr.spring.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.study.vo.StudyFavVO;

@Service
@Transactional
public class StudyServiceImpl implements StudyService{

	@Override
	public StudyFavVO selectFav(StudyFavVO fav) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectFavCount(Integer stc_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertFav(StudyFavVO fav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFav(Integer fav_num) {
		// TODO Auto-generated method stub
		
	}


}




