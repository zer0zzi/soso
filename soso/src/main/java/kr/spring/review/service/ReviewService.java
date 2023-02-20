package kr.spring.review.service;

import java.util.List;
import java.util.Map;

import kr.spring.review.vo.ReviewVO;

public interface ReviewService {
	// 부모글
	public List<ReviewVO> selectReviewList(Map<String, Object> map);
	public int selectReviewRowCount(Map<String, Object> map);
	public void insertReview(ReviewVO review);
	public ReviewVO selectReview(Integer review_num);
	public void updateReviewHit(Integer review_num);
	public void updateReview(ReviewVO review);
	public void deleteReview(Integer review_num);
	public void deleteReviewFile(Integer review_num);
}