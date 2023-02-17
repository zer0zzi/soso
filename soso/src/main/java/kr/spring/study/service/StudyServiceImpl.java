package kr.spring.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.study.dao.StudyMapper;
import kr.spring.study.vo.StudyFavVO;
import kr.spring.study.vo.StudyVO;

@Service
@Transactional
public class StudyServiceImpl implements StudyService{

	@Autowired
	private StudyMapper studyMapper; 

	@Override
	public List<StudyVO> selectList(Map<String, Object> map) {
		return studyMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return studyMapper.selectRowCount(map);
	}

	@Override
	public void insertStudy(StudyVO study) {
		studyMapper.insertStudy(study);
	}

	@Override
	public StudyVO selectStudy(Integer stc_num) {
		return studyMapper.selectStudy(stc_num);
	}

	@Override
	public void updateHit(Integer stc_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateStudy(StudyVO study) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStudy(Integer stc_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(Integer stc_num) {
		// TODO Auto-generated method stub
		
	}

	//좋아요
	@Override
	public StudyFavVO selectFav(StudyFavVO fav) {
		return studyMapper.selectFav(fav);
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




