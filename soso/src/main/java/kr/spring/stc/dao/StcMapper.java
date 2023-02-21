package kr.spring.stc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import kr.spring.study.vo.StudyVO;

@Mapper
public interface StcMapper {
	//스터디 리스트(메인)
	public List<StudyVO> studyList(Map<String,Object> map);
	
	//스터디 모집 글 생성
	@Insert("INSERT INTO study_create (stc_num, stc_title, stc_content, stc_state, stc_period,"
			+ "stc_per, stc_way, stc_filter, mem_num, stc_uploadfile, stc_filename)"
			+ "VALUES (stc_seq.nextval, #{stc_title}, #{stc_content}, #{stc_state}, #{stc_period},"
			+ "#{stc_per}, #{stc_way}, #{stc_filter}, #{mem_num}, #{stc_uploadfile}, #{stc_filename})")
	public void studyCreate(StudyVO study);
}
