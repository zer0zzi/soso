package kr.spring.community.dao;

import java.util.List;
import java.util.Map;

import kr.spring.community.vo.PromoVO;

public interface PromoMapper {
	// 부모글
	public List<PromoVO> selectPromoList(Map<String, Object> map); // 홍보 게시글 목록
	public int selectPromoRowCount(Map<String, Object> map); // 홍보 게시글 한 건의 레코드 가져오기
	public void insertPromo(PromoVO promo); // 홍보 게시글 작성
	public PromoVO selectPromo(Integer promo_num); // 홍보 게시글 상세
	public void updatePromoHit(Integer promo_num); // 홍보 게시글 좋아요
	public void updatePromo(PromoVO promo); // 홍보 게시글 수정 → 동적 SQL을 사용해야 하기 때문에 .xml에 명시
	public void deletePromo(Integer promo_num); // 홍보 게시글 삭제
	public void deletePromoFile(Integer promo_num); // 홍보 게시글 수정할 때 파일 삭제에 필요
	
	// 좋아요

	
	// 댓글
}