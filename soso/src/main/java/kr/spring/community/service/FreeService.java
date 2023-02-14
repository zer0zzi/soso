package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import kr.spring.community.vo.FreeVO;

public interface FreeService {
	// 부모글
	public List<FreeVO> selectFreeList(Map<String, Object> map); // 자유 게시글 목록
	public int selectFreeRowCount(Map<String, Object> map); // 자유 게시글 한 건의 레코드 가져오기
	public void insertFree(FreeVO free); // 자유 게시글 작성
	public FreeVO selectFree(Integer free_num); // 자유 게시글 상세
	public void updateFreeHit(Integer free_num); // 자유 게시글 좋아요
	public void updateFree(FreeVO free); // 자유 게시글 수정 → 동적 SQL을 사용해야 하기 때문에 .xml에 명시
	public void deleteFree(Integer free_num); // 자유 게시글 삭제
	public void deleteFreeFile(Integer free_num); // 자유 게시글 수정할 때 파일 삭제에 필요
	
	// 좋아요
	
	
	// 댓글
}