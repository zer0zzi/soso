package kr.spring.study.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.study.vo.StudyFavVO;
import kr.spring.study.vo.StudySignupVO;
import kr.spring.study.vo.StudyVO;

@Mapper
public interface StudyMapper {
	//부모글
	public int selectRowCount(Map<String,Object> map);
	//글 상세
	@Select("SELECT * FROM study_create b JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) WHERE b.stc_num=#{stc_num}")
	public StudyVO selectStudy(Integer stc_num);
	//
	@Insert("INSERT INTO study_create stc_num,stc_title,stc_content,stc_state,stc_period,"
		  + "stc_per,stc_way,stc_filter,stc_uploadfile,stc_filename,mem_num) VALUES "
		  + "(spboard_seq.nextval,#{stc_title},#{stc_content},#{stc_state},#{stc_period},"
		  + "#{stc_per},#{stc_way},#{stc_filter},#{stc_uploadfile},#{stc_filename},#{stc_mem_num})")
	public void insertStudy(StudyVO study);
	//조회수
	@Update("UPDATE study_create SET hit=hit+1 WHERE stc_num=#{stc_num}")
	public void updateHit(Integer stc_num);
	public void updateStudy(StudyVO study);
	@Delete("DELETE FROM study_create WHERE stc_num=#{stc_num}")
	public void deleteStudy(Integer stc_num);
	@Update("UPDATE study_create SET stc_uploadfile='',stc_filename='' WHERE stc_num=#{stc_num}")
	public void deleteFile(Integer stc_num);
	
	//관심등록
	@Select("SELECT * FROM study_fav WHERE stc_num=#{stc_num} AND mem_num=#{mem_num}")
	public StudyFavVO selectFav(StudyFavVO fav);
	//관심 등록 카운트
	@Select("SELECT COUNT(*) FROM study_fav "
		  + "WHERE stc_num=#{stc_num}")
	public int selectFavCount(Integer stc_num);
	@Insert("INSERT INTO study_fav (fav_num,"
		  + "stc_num,mem_num) VALUES (study_fav_seq.nextval,"
		  + "#{stc_num},#{mem_num})")
	public void insertFav(StudyFavVO fav);
	//관심등록 해제
	@Delete("DELETE FROM study_fav WHERE fav_num=#{fav_num}")
	public void deleteFav(Integer fav_num);
	//글 삭제와 동시에 관심등록 삭제
	@Delete("DELETE FROM study_fav WHERE stc_num=#{stc_num}")
	public void deleteFavByStcNum(Integer stc_num);
	
	//신청하기
	@Select("SELECT * FROM study_signup WHERE stc_num=#{stc_num} AND mem_num=#{mem_num}")
	public StudySignupVO selectSignup(StudySignupVO signup);
	@Insert("INSERT INTO study_signup (signup_num,stc_num,mem_num,signup_status,signup_detail) "
			+ "VALUES (study_signup_seq.nextval,#{stc_num},#{mem_num},#{signup_status},#{signup_detail})")
	public void insertSignup(StudySignupVO signup);
	
}





