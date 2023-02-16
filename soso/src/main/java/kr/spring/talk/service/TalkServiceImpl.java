package kr.spring.talk.service;

import java.util.List;
import java.util.Map;

import kr.spring.talk.vo.TalkRoomVO;
import kr.spring.talk.vo.TalkVO;

public class TalkServiceImpl implements TalkService{

	@Override
	public List<TalkRoomVO> selectTalkRoomList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TalkRoomVO selectTalkRoom(Integer talkroom_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertTalkRoom(TalkRoomVO talkRoomVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertTalk(TalkVO talkVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<TalkVO> selectTalkDetail(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TalkVO> selectTalkMember(Integer talkroom_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteTalkRoomMember(TalkVO talkVO) {
		// TODO Auto-generated method stub
		
	}

}
