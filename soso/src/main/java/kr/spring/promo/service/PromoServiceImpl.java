package kr.spring.promo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.promo.dao.PromoMapper;
import kr.spring.promo.vo.PromoFavVO;
import kr.spring.promo.vo.PromoReplyVO;
import kr.spring.promo.vo.PromoVO;

@Service
@Transactional
public class PromoServiceImpl implements PromoService{

	@Autowired
	private PromoMapper promoMapper;
	
	@Override
	public List<PromoVO> selectPromoList(Map<String, Object> map) {
		return promoMapper.selectPromoList(map);
	}

	@Override
	public int selectPromoRowCount(Map<String, Object> map) {
		return promoMapper.selectPromoRowCount(map);
	}

	@Override
	public void insertPromo(PromoVO promo) {
		promoMapper.insertPromo(promo);
	}

	@Override
	public PromoVO selectPromo(Integer promo_num) {
		return promoMapper.selectPromo(promo_num);
	}

	@Override
	public void deletePromoFile(Integer promo_num) {
		promoMapper.deletePromoFile(promo_num);
	}

	@Override
	public void updatePromoHit(Integer promo_num) {
		promoMapper.updatePromoHit(promo_num);
	}

	@Override
	public void updatePromo(PromoVO promo) {
		promoMapper.updatePromo(promo);
	}

	@Override
	public void deletePromo(Integer promo_num) {
		// 좋아요 삭제
		promoMapper.deletePromoFavByPromoNum(promo_num);
		// 댓글 삭제
		promoMapper.deletePromoReplyByPromoNum(promo_num);
		// 부모글 삭제
		promoMapper.deletePromo(promo_num);
	}

	@Override
	public PromoFavVO selectPromoFav(PromoFavVO fav) {
		return promoMapper.selectPromoFav(fav);
	}

	@Override
	public void insertPromoFav(PromoFavVO fav) {
		promoMapper.insertPromoFav(fav);
	}

	@Override
	public void deletePromoFav(Integer p_fav_num) {
		promoMapper.deletePromoFav(p_fav_num);
	}

	@Override
	public int selectPromoFavCount(Integer promo_num) {
		return promoMapper.selectPromoFavCount(promo_num);
	}

	@Override
	public void insertPromoReply(PromoReplyVO promoReply) {
		promoMapper.insertPromoReply(promoReply);
	}

	@Override
	public List<PromoReplyVO> selectPromoListReply(Map<String, Object> map) {
		return promoMapper.selectPromoListReply(map);
	}

	@Override
	public int selectPromoRowCountReply(Map<String, Object> map) {
		return promoMapper.selectPromoRowCountReply(map);
	}

	@Override
	public void updatePromoReply(PromoReplyVO promoReply) {
		promoMapper.updatePromoReply(promoReply);
	}

	@Override
	public PromoReplyVO selectPromoReply(Integer pre_num) {
		return promoMapper.selectPromoReply(pre_num);
	}

	@Override
	public void deletePromoReply(Integer pre_num) {
		promoMapper.deletePromoReply(pre_num);
	}

}