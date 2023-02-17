package kr.spring.talk.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.talk.dao.TalkMapper;
import kr.spring.talk.vo.TalkRoomVO;
import kr.spring.talk.vo.TalkVO;

@Service
@Transactional
public class TalkServiceImpl implements TalkService{

	@Autowired
	private TalkMapper talkMapper;
	
	@Override
	public List<TalkRoomVO> selectTalkRoomList(Map<String, Object> map) {
		return talkMapper.selectTalkRoomList(map);
	}

	@Override
	public TalkRoomVO selectTalkRoom(Integer talkroom_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertTalkRoom(TalkRoomVO talkRoomVO) {
		//채팅방번호 생성
		talkRoomVO.setTalkroom_num(talkMapper.selectTalkRoomNum());
		//채팅방 생성
		talkMapper.insertTalkRoom(talkRoomVO);
		//채팅방 멤버 생성
		for(Integer mem_num : talkRoomVO.getMembers()) {
			talkMapper.insertTalkRoomMember(talkRoomVO.getTalkroom_num(), mem_num);
		}		
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
		return talkMapper.selectTalkMember(talkroom_num);
	}

	@Override
	public void deleteTalkRoomMember(TalkVO talkVO) {
		// TODO Auto-generated method stub

	}

}
