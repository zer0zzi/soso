package kr.spring.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.review.vo.ReviewFavVO;
import kr.spring.review.vo.ReviewReplyVO;
import kr.spring.review.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	// 부모글
	public List<ReviewVO> selectReviewList(Map<String, Object> map);
	public int selectReviewRowCount(Map<String, Object> map);
	@Insert("INSERT INTO review_board (review_num,review_title,review_rating,review_fixed,review_content,review_uploadfile,review_filename,review_ip,mem_num) "
			+ "VALUES (review_board_seq.nextval,#{review_title},#{review_rating},#{review_fixed},#{review_content},#{review_uploadfile},#{review_filename},#{review_ip},#{mem_num})")
	public void insertReview(ReviewVO review);
	@Select("SELECT * FROM review_board v JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) "
			+ "WHERE v.review_num=#{v.review_num}")
	public ReviewVO selectReview(Integer review_num);
	@Update("UPDATE review_board SET review_hit=review_hit+1 WHERE review_num=#{review_num}")
	public void updateReviewHit(Integer review_num);
	public void updateReview(ReviewVO review);
	@Delete("DELETE FROM review_board WHERE review_num=#{review_num}")
	public void deleteReview(Integer review_num);
	@Update("UPDATE review_board SET review_uploadfile='',review_filename='' WHERE review_num=#{review_num}")
	public void deleteReviewFile(Integer review_num);
	
	/*
	 * // 부모글 - 스터디명 조회
	 * @Select("SELECT c.stc_num,c.stc_title,s.mem_num FROM study_create c " +
	 * "JOIN study_signup s ON c.stc_num=s.stc_num WHERE s.signup_status=1 AND s.mem_num=#{mem_num};"
	 * ) public List<StudyVO> getStudyList(Map<String, Object> map);
	 */
	
	// 좋아요
	@Select("SELECT * FROM review_board WHERE review_num=#{review_num} AND mem_num=#{mem_num}")
	public ReviewFavVO selectReviewFav(ReviewFavVO fav);
	@Select("SELECT COUNT(*) FROM review_fav WHERE review_num=#{review_num}")
	public int selectReviewFavCount(Integer review_num);
	@Insert("INSERT INTO review_fav (v_fav_num,review_num,mem_num) "
			+ "VALUES (review_fav_seq.nextval,#{review_num},#{mem_num})")
	public void insertReviewFav(ReviewFavVO fav);
	@Delete("DELETE FROM review_fav WHERE v_fav_num=#{v_fav_num}")
	public void deleteReviewFav(Integer v_fav_num);
	@Delete("DELETE FROM review_fav WHERE review_num=#{review_num}")
	public void deleteReviewFavByReviewNum(Integer review_num);
	
	// 댓글
	public List<ReviewReplyVO> selectReviewListReply(Map<String, Object> map);
	@Select("SELECT COUNT(*) FROM review_reply JOIN member USING (mem_num) "
			+ "WHERE review_num=#{review_num}")
	public int selectReviewRowCountReply(Map<String, Object> map);
	@Select("SELECT * FROM review_reply WHERE vre_num=#{vre_num}")
	public ReviewReplyVO selectReviewReply(Integer vre_num);
	@Insert("INSERT INTO review_reply (vre_num,vre_content,vre_ip,review_num,mem_num) "
			+ "VALUES (review_reply_seq.nextval,#{vre_content},#{vre_ip},#{review_num},#{mem_num})")
	public void insertReviewReply(ReviewReplyVO reviewReply);
	@Update("UPDATE review_reply SET vre_content=#{vre_content},vre_ip=#{vre_ip},vre_mdate=SYSDATE WHERE vre_num=#{vre_num}")
	public void updateReviewReply(ReviewReplyVO reviewReply);
	@Delete("DELETE FROM review_reply WHERE vre_num=#{vre_num}")
	public void deleteReviewReply(Integer vre_num);
	@Delete("DELETE FROM review_reply WHERE review_num=#{review_num}")
	public void deleteReviewReplyByReviewNum(Integer review_num);
}