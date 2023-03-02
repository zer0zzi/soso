package kr.spring.promo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.promo.vo.PromoFavVO;
import kr.spring.promo.vo.PromoReplyVO;
import kr.spring.promo.vo.PromoVO;
import kr.spring.study.vo.StudyVO;

@Mapper
public interface PromoMapper {
	// 부모글
	public List<PromoVO> selectPromoList(Map<String, Object> map);
	public int selectPromoRowCount(Map<String, Object> map);
	@Insert("INSERT INTO promo_board (promo_num,promo_fixed,promo_title,promo_status,promo_content,promo_uploadfile,promo_filename,promo_ip,mem_num) "
			+ "VALUES (promo_board_seq.nextval,#{promo_fixed},#{promo_title},#{promo_status},#{promo_content},#{promo_uploadfile},#{promo_filename},#{promo_ip},#{mem_num})")
	public void insertPromo(PromoVO promo);
	@Update("UPDATE promo_board SET promo_hit=promo_hit+1 WHERE promo_num=#{promo_num}")
	public void updatePromoHit(Integer promo_num); // 조회수
	@Select("SELECT * FROM promo_board p JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) "
			+ "WHERE p.promo_num=#{p.promo_num}")
	public PromoVO selectPromo(Integer promo_num); // 상세
	@Update("UPDATE promo_board SET promo_uploadfile='',promo_filename='' WHERE promo_num=#{promo_num}")
	public void deletePromoFile(Integer promo_num); // 수정시 파일삭제
	public void updatePromo(PromoVO promo);
	@Delete("DELETE FROM promo_board WHERE promo_num=#{promo_num}")
	public void deletePromo(Integer promo_num);
	
	@Select("SELECT c.stc_num,c.stc_title,c.stc_state "
			+ "FROM (SELECT s.* FROM study_signup s JOIN member m ON s.mem_num=m.mem_num WHERE signup_status=1)a "
			+ "JOIN study_create c ON a.stc_num=c.stc_num "
			+ "WHERE a.mem_num=#{a.mem_num}")
	public List<StudyVO> selectPromoMemberStudyList(int mem_num);

	// 좋아요
	@Select("SELECT * FROM promo_fav WHERE promo_num=#{promo_num} AND mem_num=#{mem_num}")
	public PromoFavVO selectPromoFav(PromoFavVO fav);
	@Insert("INSERT INTO promo_fav (p_fav_num,promo_num,mem_num) VALUES (promo_fav_seq.nextval,#{promo_num},#{mem_num})")
	public void insertPromoFav(PromoFavVO fav);
	@Delete("DELETE FROM promo_fav WHERE p_fav_num=#{p_fav_num}")
	public void deletePromoFav(Integer p_fav_num);
	@Select("SELECT COUNT(*) FROM promo_fav WHERE promo_num=#{promo_num}")
	public int selectPromoFavCount(Integer promo_num);
	@Delete("DELETE FROM promo_fav WHERE promo_num=#{promo_num}")
	public void deletePromoFavByPromoNum(Integer promo_num);

	// 댓글
	public List<PromoReplyVO> selectPromoListReply(Map<String, Object> map);
	@Select("SELECT COUNT(*) FROM promo_reply JOIN member USING (mem_num) "
			+ "WHERE promo_num=#{promo_num}")
	public int selectPromoRowCountReply(Map<String, Object> map);
	@Select("SELECT * FROM promo_reply WHERE pre_num=#{pre_num}")
	public PromoReplyVO selectPromoReply(Integer pre_num);
	@Insert("INSERT INTO promo_reply (pre_num,pre_content,pre_ip,promo_num,mem_num) "
			+ "VALUES (promo_reply_seq.nextval,#{pre_content},#{pre_ip},#{promo_num},#{mem_num})")
	public void insertPromoReply(PromoReplyVO promoReply);
	@Update("UPDATE promo_reply SET pre_content=#{pre_content},pre_ip=#{pre_ip},pre_mdate=SYSDATE WHERE pre_num=#{pre_num}")
	public void updatePromoReply(PromoReplyVO promoReply);
	@Delete("DELETE FROM promo_reply WHERE pre_num=#{pre_num}")
	public void deletePromoReply(Integer pre_num);
	@Delete("DELETE FROM promo_reply WHERE promo_num=#{promo_num}")
	public void deletePromoReplyByPromoNum(Integer promo_num);
}