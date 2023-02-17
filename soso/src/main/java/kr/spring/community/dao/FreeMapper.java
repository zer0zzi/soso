package kr.spring.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.community.vo.FreeFavVO;
import kr.spring.community.vo.FreeReplyVO;
import kr.spring.community.vo.FreeVO;

@Mapper
public interface FreeMapper {
	// 부모글
	public List<FreeVO> selectFreeList(Map<String, Object> map); // 자유 게시글 목록 → 동적 SQL을 사용해야 하기 때문에 .xml에 명시
	public int selectFreeRowCount(Map<String, Object> map); // 자유 게시글 한 건의 레코드 가져오기
	@Insert("INSERT INTO free_board (free_num,free_fixed,free_title,free_content,free_uploadfile,free_filename,free_ip,mem_num) "
			+ "VALUES (free_board_seq.nextval,#{free_fixed},#{free_title},#{free_content},#{free_uploadfile},#{free_filename},#{free_ip},#{mem_num})")
	public void insertFree(FreeVO free); // 자유 게시글 작성
	@Select("SELECT * FROM free_board f JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) "
			+ "WHERE f.free_num=#{f.free_num}")
	public FreeVO selectFree(Integer free_num); // 자유 게시글 상세
	@Update("UPDATE free_board SET free_uploadfile='',free_filename='' WHERE free_num=#{free_num}")
	public void deleteFreeFile(Integer free_num); // 자유 게시글 수정할 때 파일 삭제에 필요
	@Update("UPDATE free_board SET free_hit=free_hit+1 WHERE free_num=#{free_num}")
	public void updateFreeHit(Integer free_num); // 자유 게시글 조회수
	public void updateFree(FreeVO free); // 자유 게시글 수정 → xml에 명시
	@Delete("DELETE FROM free_board WHERE free_num=#{free_num}")
	public void deleteFree(Integer free_num); // 자유 게시글 삭제
	
	// 좋아요
	@Select("SELECT * FROM free_fav WHERE free_num=#{free_num} AND mem_num=#{mem_num}")
	public FreeFavVO selectFreeFav(FreeFavVO fav);
	@Insert("INSERT INTO free_fav (f_fav_num,free_num,mem_num) VALUES (free_fav_seq.nextval,#{free_num},#{mem_num})")
	public void insertFreeFav(FreeFavVO fav);
	@Delete("DELETE FROM free_fav WHERE f_fav_num=#{f_fav_num}")
	public void deleteFreeFav(Integer fav_num);
	@Select("SELECT COUNT(*) FROM free_fav WHERE free_num=#{free_num}")
	public int selectFreeFavCount(Integer free_num);
	@Delete("DELETE FROM free_fav WHERE free_num=#{free_num}")
	public void deleteFreeFavByFreeNum(Integer free_num);

	// 댓글
	@Insert("INSERT INTO free_reply (fre_num,fre_content,fre_ip,free_num,mem_num) "
			+ "VALUES (free_reply_seq.nextval,#{fre_content},#{fre_ip},#{free_num},#{mem_num})")
	public void insertFreeReply(FreeReplyVO freeReply); // fre_pnum 추가하기
	public List<FreeReplyVO> selectFreeListReply(Map<String, Object> map);
	@Select("SELECT COUNT(*) FROM free_reply JOIN member USING (mem_num) "
			+ "WHERE free_num=#{free_num}")
	public int selectFreeRowCountReply(Map<String, Object> map);
	@Update("UPDATE free_reply SET fre_content=#{fre_content},fre_ip=#{fre_ip},fre_modifydate=SYSDATE WHERE fre_num=#{fre_num}")
	public void updateFreeReply(FreeReplyVO freeReply);
	@Select("SELECT * FROM free_reply WHERE fre_num=#{fre_num}")
	public FreeReplyVO selectFreeReply(Integer fre_num);
	@Delete("DELETE FROM free_reply WHERE fre_num=#{fre_num}")
	public void deleteFreeReply(Integer fre_num);
	@Delete("DELETE FROM free_reply WHERE free_num=#{free_num}")
	public void deleteFreeReplyByFreeNum(Integer free_num);
	
}