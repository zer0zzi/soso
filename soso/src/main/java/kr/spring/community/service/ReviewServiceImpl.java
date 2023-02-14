package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.community.dao.ReviewMapper;
import kr.spring.community.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> selectReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectReviewRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertReview(ReviewVO review) {
		// TODO Auto-generated method stub

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
		// 좋아요 삭제

		// 댓글 삭제

		// 부모글삭제
	}

	@Override
	public void deleteReviewFile(Integer review_num) {
		// TODO Auto-generated method stub

	}

}