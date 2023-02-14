package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.community.dao.FreeMapper;
import kr.spring.community.vo.FreeVO;

public class FreeServiceImpl implements FreeService{

	@Autowired
	private FreeMapper freeMapper;

	@Override
	public List<FreeVO> selectFreeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectFreeRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertFree(FreeVO free) {
		// TODO Auto-generated method stub

	}

	@Override
	public FreeVO selectFree(Integer free_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateFreeHit(Integer free_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateFree(FreeVO free) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFree(Integer free_num) {
		// 좋아요 삭제
		
		// 댓글 삭제
		
		// 부모글삭제
	}

	@Override
	public void deleteFreeFile(Integer free_num) {
		// TODO Auto-generated method stub

	}

}