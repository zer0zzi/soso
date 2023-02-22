package kr.spring.free.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.free.dao.FreeMapper;
import kr.spring.free.vo.FreeFavVO;
import kr.spring.free.vo.FreeReplyVO;
import kr.spring.free.vo.FreeVO;

@Service
@Transactional
public class FreeServiceImpl implements FreeService{

	@Autowired
	private FreeMapper freeMapper;

	@Override
	public List<FreeVO> selectFreeList(Map<String, Object> map) {
		return freeMapper.selectFreeList(map);
	}

	@Override
	public int selectFreeRowCount(Map<String, Object> map) {
		return freeMapper.selectFreeRowCount(map);
	}

	@Override
	public void insertFree(FreeVO free) {
		freeMapper.insertFree(free);
	}

	@Override
	public FreeVO selectFree(Integer free_num) {
		return freeMapper.selectFree(free_num);
	}

	@Override
	public void updateFreeHit(Integer free_num) {
		freeMapper.updateFreeHit(free_num);
	}

	@Override
	public void updateFree(FreeVO free) {
		freeMapper.updateFree(free);
	}

	@Override
	public void deleteFree(Integer free_num) {
		// 좋아요 삭제
		freeMapper.deleteFreeFavByFreeNum(free_num);
		// 댓글 삭제
		freeMapper.deleteFreeReplyByFreeNum(free_num);
		// 부모글 삭제
		freeMapper.deleteFree(free_num);
	}

	@Override
	public void deleteFreeFile(Integer free_num) {
		freeMapper.deleteFreeFile(free_num);
	}

	@Override
	public FreeFavVO selectFreeFav(FreeFavVO fav) {
		return freeMapper.selectFreeFav(fav);
	}

	@Override
	public int selectFreeFavCount(Integer free_num) {
		return freeMapper.selectFreeFavCount(free_num);
	}

	@Override
	public void insertFreeFav(FreeFavVO fav) {
		freeMapper.insertFreeFav(fav);
	}

	@Override
	public void deleteFreeFav(Integer fav_num) {
		freeMapper.deleteFreeFav(fav_num);
	}

	@Override
	public List<FreeReplyVO> selectFreeListReply(Map<String, Object> map) {
		return freeMapper.selectFreeListReply(map);
	}

	@Override
	public int selectFreeRowCountReply(Map<String, Object> map) {
		return freeMapper.selectFreeRowCountReply(map);
	}

	@Override
	public FreeReplyVO selectFreeReply(Integer fre_num) {
		return freeMapper.selectFreeReply(fre_num);
	}

	@Override
	public void insertFreeReply(FreeReplyVO freeReply) {
		freeMapper.insertFreeReply(freeReply);
	}

	@Override
	public void updateFreeReply(FreeReplyVO freeReply) {
		freeMapper.updateFreeReply(freeReply);
	}

	@Override
	public void deleteFreeReply(Integer fre_num) {
		freeMapper.deleteFreeReply(fre_num);
	}

	@Override
	public List<FreeVO> selectFullList(Map<String, Object> map) {
		return freeMapper.selectFullList(map);
	}

	@Override
	public int selectFullRowCount(Map<String, Object> map) {
		return freeMapper.selectFullRowCount(map);
	}

}