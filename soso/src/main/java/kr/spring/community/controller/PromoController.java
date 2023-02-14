package kr.spring.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.community.service.PromoService;
import kr.spring.community.vo.PromoVO;

public class PromoController {
	private static final Logger logger = LoggerFactory.getLogger(PromoController.class);
	private int rowCount = 10;
	@Autowired // 의존 관계 주입
	private PromoService promoService;
	// 자바빈 초기화
	@ModelAttribute
	public PromoVO initCommand() {
		return new PromoVO();
	}
	
	// ========== 홍보 글 목록 ==========
}