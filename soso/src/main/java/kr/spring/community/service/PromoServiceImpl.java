package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.community.dao.PromoMapper;
import kr.spring.community.vo.PromoVO;

public class PromoServiceImpl implements PromoService{

	@Autowired
	private PromoMapper promoMapper;

	@Override
	public List<PromoVO> selectPromoList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectPromoRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertPromo(PromoVO promo) {
		// TODO Auto-generated method stub

	}

	@Override
	public PromoVO selectPromo(Integer promo_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePromoHit(Integer promo_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePromo(PromoVO promo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePromo(Integer promo_num) {
		// 좋아요 삭제

		// 댓글 삭제

		// 부모글삭제
	}

	@Override
	public void deletePromoFile(Integer promo_num) {
		// TODO Auto-generated method stub

	}

}