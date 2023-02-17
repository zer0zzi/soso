package kr.spring.study.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.study.controller.StudyController;
import kr.spring.study.service.StudyService;
import kr.spring.study.vo.StudyVO;
import kr.spring.util.StringUtil;

@Controller
public class StudyController {
	private static final Logger logger = 
            LoggerFactory.getLogger(StudyController.class);
	private int rowCount = 20;
	
	@Autowired
	private StudyService studyService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StudyVO initCommand() {
		return new StudyVO();
	}
	
	//========게시판 글상세=======//
	@RequestMapping("/study/studyView.do")
	public ModelAndView process(@RequestParam int stc_num) {
		logger.debug("<<stc_num>> : " + stc_num);

		//해당 글의 조회수 증가
		studyService.updateHit(stc_num);

		StudyVO study = 
				studyService.selectStudy(stc_num);

		//제목에 태그를 허용하지 않음
		study.setStc_title(StringUtil.useNoHtml(study.getStc_title()));
		//내용에 태그를 허용하지 않음
		//CKEditor 사용시 주석 처리
		//study.setContent(StringUtil.useBrNoHtml(study.getContent()));
		//뷰이름      속성명   속성값
		return new ModelAndView("studyView","study",study);
	}
}
