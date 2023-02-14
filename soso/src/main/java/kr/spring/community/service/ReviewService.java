package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import kr.spring.community.vo.ReviewVO;

public interface ReviewService {
	// 부모글
	public List<ReviewVO> selectReviewList(Map<String, Object> map); // 리뷰 게시글 목록
	public int selectReviewRowCount(Map<String, Object> map); // 리뷰 게시글 한 건의 레코드 가져오기
	public void insertReview(ReviewVO review); // 리뷰 게시글 작성
	public ReviewVO selectReview(Integer review_num); // 리뷰 게시글 상세
	public void updateReviewHit(Integer review_num); // 리뷰 게시글 좋아요
	public void updateReview(ReviewVO review); // 리뷰 게시글 수정 → 동적 SQL을 사용해야 하기 때문에 .xml에 명시
	public void deleteReview(Integer review_num); // 리뷰 게시글 삭제
	public void deleteReviewFile(Integer review_num); // 리뷰 게시글 수정할 때 파일 삭제에 필요

	// 좋아요
	

	// 댓글
}