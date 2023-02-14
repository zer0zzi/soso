package kr.spring.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.community.service.ReviewService;
import kr.spring.community.vo.ReviewVO;

public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	private int rowCount = 6;
	@Autowired // 의존 관계 주입
	private ReviewService reviewService;
	// 자바빈 초기화
	@ModelAttribute
	public ReviewVO initCommand() {
		return new ReviewVO();
	}
	
	// ========== 리뷰 글 목록 ==========
}