package kr.spring.study.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.study.vo.StudyFavVO;
import kr.spring.study.vo.StudyVO;

@Mapper
public interface StudyMapper {
	//부모글
	public List<StudyVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertStudy(StudyVO study);
	@Select("SELECT * FROM study_create b JOIN member m USING(mem_num) JOIN member_detail d USING(mem_num) WHERE b.stc_num=#{stc_num}")
	public StudyVO selectStudy(Integer stc_num);
	public void updateHit(Integer stc_num);
	public void updateStudy(StudyVO study);
	public void deleteStudy(Integer stc_num);
	public void deleteFile(Integer stc_num);
	
	//좋아요
	@Select("SELECT * FROM study_fav WHERE "
		  + "stc_num=#{stc_num} AND mem_num=#{mem_num}")
	public StudyFavVO selectFav(StudyFavVO fav);
	@Select("SELECT COUNT(*) FROM study_fav "
		  + "WHERE stc_num=#{stc_num}")
	public int selectFavCount(Integer stc_num);
	@Insert("INSERT INTO study_fav (fav_num,"
		  + "stc_num,mem_num) VALUES (study_fav_seq.nextval,"
		  + "#{stc_num},#{mem_num})")
	public void insertFav(StudyFavVO fav);
	@Delete("DELETE FROM study_fav WHERE fav_num=#{fav_num}")
	public void deleteFav(Integer fav_num);
	@Delete("DELETE FROM study_fav WHERE stc_num=#{stc_num}")
	public void deleteFavByStcNum(Integer stc_num);
	

}





