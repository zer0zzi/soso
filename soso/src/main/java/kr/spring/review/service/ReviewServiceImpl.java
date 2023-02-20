package kr.spring.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.review.dao.ReviewMapper;
import kr.spring.review.vo.ReviewVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> selectReviewList(Map<String, Object> map) {
		return reviewMapper.selectReviewList(map);
	}

	@Override
	public int selectReviewRowCount(Map<String, Object> map) {
		return reviewMapper.selectReviewRowCount(map);
	}

	@Override
	public void insertReview(ReviewVO review) {
		reviewMapper.insertReview(review);
	}

	@Override
	public ReviewVO selectReview(Integer review_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReviewHit(Integer review_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReview(ReviewVO review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReview(Integer review_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReviewFile(Integer review_num) {
		// TODO Auto-generated method stub
		
	}

}