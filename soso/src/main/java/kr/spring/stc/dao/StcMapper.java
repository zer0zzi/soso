package kr.spring.stc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.study.vo.StudyVO;

@Mapper
public interface StcMapper {
	//스터디 모집 글 생성
	@Insert("INSERT INTO study_create (stc_num, stc_title, stc_content, stc_state, stc_period,"
			+ "stc_per, stc_way, stc_filter, mem_num, stc_uploadfile, stc_filename, stc_pedate)"
			+ "VALUES (stc_seq.nextval, #{stc_title}, #{stc_content}, #{stc_state}, #{stc_period},"
			+ "#{stc_per}, #{stc_way}, #{stc_filter}, #{mem_num}, #{stc_uploadfile}, #{stc_filename}, #{stc_pedate})")
	public void studyCreate(StudyVO study);
	
	//스터디 개수
	public int studyCount(Map<String,Object> map);

	//스터디 리스트(메인)
	public List<StudyVO> studyList(Map<String,Object> map);
	
	@Select("SELECT * FROM study_create s JOIN member m on s.mem_num = m.mem_num JOIN member_detail d on m.mem_num=d.mem_num WHERE stc_num=#{stc_num}")
	public StudyVO selectStudy(Integer stc_num);
}
