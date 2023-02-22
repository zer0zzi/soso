package kr.spring.review.service;

import java.util.List;import java.util.Map;

import kr.spring.review.vo.ReviewFavVO;
import kr.spring.review.vo.ReviewReplyVO;
import kr.spring.review.vo.ReviewVO;
import kr.spring.study.vo.StudyVO;

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

	public List<StudyVO> selectReviewMemberStudyList(int mem_num);
	
	// 좋아요
	public ReviewFavVO selectReviewFav(ReviewFavVO fav);
	public int selectReviewFavCount(Integer review_num);
	public void insertReviewFav(ReviewFavVO fav);
	public void deleteReviewFav(Integer v_fav_num);

	// 댓글
	public List<ReviewReplyVO> selectReviewListReply(Map<String, Object> map);
	public int selectReviewRowCountReply(Map<String, Object> map);
	public ReviewReplyVO selectReviewReply(Integer vre_num);
	public void insertReviewReply(ReviewReplyVO reviewReply);
	public void updateReviewReply(ReviewReplyVO reviewReply);
	public void deleteReviewReply(Integer vre_num);
}