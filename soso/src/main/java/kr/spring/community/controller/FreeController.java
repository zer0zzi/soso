package kr.spring.community.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.community.service.FreeService;
import kr.spring.community.vo.FreeVO;

public class FreeController {
	private static final Logger logger = LoggerFactory.getLogger(FreeController.class);
	private int rowCount = 10;
	@Autowired // 의존 관계 주입
	private FreeService freeService;
	// 자바빈 초기화
	@ModelAttribute
	public FreeVO initCommand() {
		return new FreeVO();
	}
	
	// ========== 자유 글 목록 ==========
	@RequestMapping("/community/freeList.do")
	public ModelAndView freeList(@RequestParam(value="pageNum", defaultValue="1") int currentPage, String keyfield, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		// 글의 총 개수 또는 검색된 글의 개수 반환
		int count = freeService.selectFreeRowCount(map);
		
		// 로그
		logger.debug("<<count>> : " + count);
		
		/*
		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount, 10, "freeList.do");
		List<FreeVO> list = null;
		if(count>0){
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = boardService.selectList(map);
		}
		*/
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeList");
		mav.addObject("count", count);
//		mav.addObject("list", list);
//		mav.addObject("page", page.getPage());
		
		return mav;
	}
}