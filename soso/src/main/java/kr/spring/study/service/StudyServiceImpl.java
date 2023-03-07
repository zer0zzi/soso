package kr.spring.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.stc.dao.StcMapper;
import kr.spring.study.dao.StudyMapper;
import kr.spring.study.vo.StudyFavVO;
import kr.spring.study.vo.StudySignupVO;
import kr.spring.study.vo.StudyVO;

@Service
@Transactional
public class StudyServiceImpl implements StudyService{

	@Autowired
	private StudyMapper studyMapper; 
	@Autowired
	private StcMapper stcMapper; 
	
	@Override
	public List<StudyVO> selectList(Map<String, Object> map) {
		return stcMapper.studyList(map);
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
		studyMapper.updateHit(stc_num);
	}
	@Override
	public void updateStudy(StudyVO study) {
		studyMapper.updateStudy(study);
	}
	@Override
	public void deleteStudy(Integer stc_num) {
		//관심등록 삭제
		studyMapper.deleteFavByStcNum(stc_num);
		//부모글 삭제
		studyMapper.deleteStudy(stc_num);
	}
	@Override
	public void deleteFile(Integer stc_num) {
		studyMapper.deleteFile(stc_num);
	}

	
	//관심등록
	@Override
	public StudyFavVO selectFav(StudyFavVO fav) {
		return studyMapper.selectFav(fav);
	}
	@Override
	public int selectFavCount(Integer stc_num) {
		return studyMapper.selectFavCount(stc_num);
	}
	@Override
	public void insertFav(StudyFavVO fav) {
		studyMapper.insertFav(fav);
	}
	@Override
	public void deleteFav(Integer fav_num) {
		studyMapper.deleteFav(fav_num);
	}
	
	//신청
	@Override
	public StudySignupVO selectSignup(StudySignupVO signup) {
		return studyMapper.selectSignup(signup);
	}
	@Override
	public void insertSignup(StudySignupVO signup) {
		studyMapper.insertSignup(signup);
	}
	@Override
	public int selectSignupCount(Integer stc_num) {
		return studyMapper.selectSignupCount(stc_num);
	}
}




