package kr.spring.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import kr.spring.review.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	// 부모글
	public List<ReviewVO> selectReviewList(Map<String, Object> map);
	public int selectReviewRowCount(Map<String, Object> map);
	@Insert("INSERT INTO review_board (review_num,review_title,review_rating,review_content,review_uploadfile,review_filename,review_ip,mem_num) "
			+ "VALUES (review_board_seq.nextval,#{review_title},#{review_rating},#{review_content},#{review_uploadfile},#{review_filename},#{review_ip},#{mem_num})")
	public void insertReview(ReviewVO review);
	public ReviewVO selectReview(Integer review_num);
	public void updateReviewHit(Integer review_num);
	public void updateReview(ReviewVO review);
	public void deleteReview(Integer review_num);
	public void deleteReviewFile(Integer review_num);
	
	// 좋아요
	
	// 댓글
	
	
	/*
	 // 부모글
	public List<BoardVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Insert("INSERT INTO spboard (board_num,title,content,uploadfile,filename,ip,mem_num) "
			+ "VALUES (spboard_seq.nextval,#{title},#{content},#{uploadfile},#{filename},#{ip},#{mem_num})")
	public void insertBoard(BoardVO board);
	@Select("SELECT * FROM spboard b JOIN spmember m USING(mem_num) JOIN spmember_detail d USING(mem_num) "
			+ "WHERE b.board_num=#{b.board_num}")
	public BoardVO selectBoard(Integer board_num);
	@Update("UPDATE spboard SET hit=hit+1 WHERE board_num=#{board_num}")
	public void updateHit(Integer board_num);
	public void updateBoard(BoardVO board); // 동적 SQL을 사용해야 하기 때문에 .xml에 명시
	@Delete("DELETE FROM spboard WHERE board_num=#{board_num}")
	public void deleteBoard(Integer board_num);
	@Update("UPDATE spboard SET uploadfile='',filename='' WHERE board_num=#{board_num}")
	public void deleteFile(Integer board_num); // 게시글을 수정할 때 파일 삭제에 필요
	
	// 좋아요
	@Select("SELECT * FROM spboard_fav WHERE board_num=#{board_num} AND mem_num=#{mem_num}")
	public BoardFavVO selectFav(BoardFavVO fav);
	@Select("SELECT COUNT(*) FROM spboard_fav WHERE board_num=#{board_num}")
	public int selectFavCount(Integer board_num);
	@Insert("INSERT INTO spboard_fav (fav_num,board_num,mem_num) "
			+ "VALUES (spfav_seq.nextval,#{board_num},#{mem_num})")
	public void insertFav(BoardFavVO fav);
	@Delete("DELETE FROM spboard_fav WHERE fav_num=#{fav_num}")
	public void deleteFav(Integer fav_num);
	@Delete("DELETE FROM spboard_fav WHERE board_num=#{board_num}")
	public void deleteFavByBoardNum(Integer board_num);
	
	// 댓글
	public List<BoardReplyVO> selectListReply(Map<String, Object> map);
	@Select("SELECT COUNT(*) FROM spboard_reply JOIN spmember USING (mem_num) "
			+ "WHERE board_num=#{board_num}")
	public int selectRowCountReply(Map<String, Object> map);
	@Select("SELECT * FROM spboard_reply WHERE re_num=#{re_num}")
	public BoardReplyVO selectReply(Integer re_num);
	@Insert("INSERT INTO spboard_reply (re_num,re_content,re_ip,board_num,mem_num) "
			+ "VALUES (spreply_seq.nextval,#{re_content},#{re_ip},#{board_num},#{mem_num})")
	public void insertReply(BoardReplyVO boardReply);
	@Update("UPDATE spboard_reply SET re_content=#{re_content},re_ip=#{re_ip},re_mdate=SYSDATE WHERE re_num=#{re_num}")
	public void updateReply(BoardReplyVO boardReply);
	@Delete("DELETE FROM spboard_reply WHERE re_num=#{re_num}")
	public void deleteReply(Integer re_num);
	@Delete("DELETE FROM spboard_reply WHERE board_num=#{board_num}")
	public void deleteReplyByBoardNum(Integer board_num);
	 */
}