package kr.spring.promo.service;

import java.util.List;
import java.util.Map;

import kr.spring.promo.vo.PromoFavVO;
import kr.spring.promo.vo.PromoReplyVO;
import kr.spring.promo.vo.PromoVO;

public interface PromoService {
	// 부모글
	public List<PromoVO> selectPromoList(Map<String, Object> map);
	public int selectPromoRowCount(Map<String, Object> map);
	public void insertPromo(PromoVO promo);
	public PromoVO selectPromo(Integer promo_num);
	public void deletePromoFile(Integer promo_num);
	public void updatePromoHit(Integer promo_num);
	public void updatePromo(PromoVO promo);
	public void deletePromo(Integer promo_num);
	
	// 좋아요
	public PromoFavVO selectPromoFav(PromoFavVO fav);
	public void insertPromoFav(PromoFavVO fav);
	public void deletePromoFav(Integer p_fav_num);
	public int selectPromoFavCount(Integer promo_num);
	
	// 댓글
	public void insertPromoReply(PromoReplyVO promoReply);
	public List<PromoReplyVO> selectPromoListReply(Map<String, Object> map);
	public int selectPromoRowCountReply(Map<String, Object> map);
	public void updatePromoReply(PromoReplyVO promoReply);
	public PromoReplyVO selectPromoReply(Integer pre_num);
	public void deletePromoReply(Integer pre_num);
}