package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.stc.controller.StcController;
import kr.spring.stc.service.StcService;
import kr.spring.study.vo.StudyVO;
import kr.spring.util.PagingUtil;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(StcController.class);
	
	@Autowired
	private StcService stcService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StudyVO initCommand() {
		return new StudyVO();
	}
	
	@RequestMapping("/")
	public String main() {
		return "redirect:/main/main.do";
	}
	
	@RequestMapping("/main/main.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//stc_state -> 모집중 / 모집완료 

		//상품 총개수 또는 검색된 상품의 개수
		int count = stcService.studyCount(map);

		logger.debug("<<스터디 목록>> : " + count);

		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"studyList.do");

		List<StudyVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());

			list = stcService.studyList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("studyList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());

		return mav;
	}
	
	//이미지 출력
	@RequestMapping("/main/imageView.do")
	public ModelAndView viewImage(@RequestParam int stc_num, @RequestParam int stc_type) {
		
		StudyVO study = stcService.selectStudy(stc_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		
		if(stc_type==1) {//프로필 사진
			mav.addObject("imageFile",study.getMem_photo());
			mav.addObject("filename", study.getMem_photo_name());
		}else if(stc_type==2) {//업로드된 이미지
			mav.addObject("imageFile", study.getStc_uploadfile());
			mav.addObject("filename", study.getStc_filename());
		}
		return mav;
	}
	
}





