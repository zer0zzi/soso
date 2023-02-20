package kr.spring.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.review.dao.ReviewMapper;
import kr.spring.review.vo.ReviewFavVO;
import kr.spring.review.vo.ReviewReplyVO;
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
		return reviewMapper.selectReview(review_num);
	}

	@Override
	public void updateReviewHit(Integer review_num) {
		reviewMapper.updateReviewHit(review_num);
	}

	@Override
	public void updateReview(ReviewVO review) {
		reviewMapper.updateReview(review);
	}

	@Override
	public void deleteReview(Integer review_num) {
		// 좋아요 삭제
		reviewMapper.deleteReviewFavByReviewNum(review_num);
		// 댓글 삭제
		reviewMapper.deleteReviewReplyByReviewNum(review_num);
		// 부모글 삭제
		reviewMapper.deleteReview(review_num);
	}

	@Override
	public void deleteReviewFile(Integer review_num) {
		reviewMapper.deleteReviewFile(review_num);
	}

	@Override
	public ReviewFavVO selectReviewFav(ReviewFavVO fav) {
		return reviewMapper.selectReviewFav(fav);
	}

	@Override
	public int selectReviewFavCount(Integer review_num) {
		return reviewMapper.selectReviewFavCount(review_num);
	}

	@Override
	public void insertReviewFav(ReviewFavVO fav) {
		reviewMapper.insertReviewFav(fav);
	}

	@Override
	public void deleteReviewFav(Integer v_fav_num) {
		reviewMapper.deleteReviewFav(v_fav_num);
	}

	@Override
	public List<ReviewReplyVO> selectReviewListReply(Map<String, Object> map) {
		return reviewMapper.selectReviewListReply(map);
	}

	@Override
	public int selectReviewRowCountReply(Map<String, Object> map) {
		return reviewMapper.selectReviewRowCountReply(map);
	}

	@Override
	public ReviewReplyVO selectReviewReply(Integer vre_num) {
		return reviewMapper.selectReviewReply(vre_num);
	}

	@Override
	public void insertReviewReply(ReviewReplyVO reviewReply) {
		reviewMapper.insertReviewReply(reviewReply);
	}

	@Override
	public void updateReviewReply(ReviewReplyVO reviewReply) {
		reviewMapper.updateReviewReply(reviewReply);
	}

	@Override
	public void deleteReviewReply(Integer vre_num) {
		reviewMapper.deleteReviewReply(vre_num);
	}

}