package kr.spring.talk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.talk.vo.TalkRoomVO;
import kr.spring.talk.vo.TalkVO;

@Mapper
public interface TalkMapper {
	//채팅방 목록
	public List<TalkRoomVO> selectTalkRoomList(Map<String,Object> map);
	//채팅방 상세
	public TalkRoomVO selectTalkRoom(Integer talkroom_num);
	//채팅방 번호 생성
	@Select("SELECT talkroom_seq.nextval FROM dual")	
	public Integer selectTalkRoomNum();
	//채팅방 생성
	@Insert("INSERT INTO talkroom (talkroom_num,talkroom_name) VALUES (#{talkroom_num},#{talkroom_name})")	
	public void insertTalkRoom(TalkRoomVO talkRoomVO);
	//채팅방 멤버 등록
	@Insert("INSERT INTO talk_member (talkroom_num,mem_num) VALUES (#{talkroom_num},#{mem_num})")	
	public void insertTalkRoomMember(@Param(value="talkroom_num") Integer talkroom_num, @Param(value="mem_num") Integer mem_num);
	//채팅 메시지 번호 생성
	public Integer selectTalkNum();
	//채팅 메시지 등록
	public void insertTalk(TalkVO talkVO);
	//채팅 메시지 읽기
	public List<TalkVO> selectTalkDetail(
			Integer talkroom_num);
	//채팅 멤버 읽기
	@Select("SELECT mem_num, id FROM talk_member JOIN member USING(mem_num) WHERE talkroom_num=#{talkroom_num}")	
	public List<TalkVO> selectTalkMember(Integer talkroom_num);
	//읽지 않은 채팅 기록 저장
	public void insertTalkRead(@Param(value="talkroom_num") int talkroom_num,@Param(value="talk_num") int talk_num,
			                   @Param(value="mem_num") int mem_num);
	//읽은 채팅 기록 삭제
	public void deleteTalkRead(
			Map<String,Integer> map);
	//채팅방 나가기
	public void deleteTalkRoomMember(TalkVO talkVO);
	//채팅 메시지 삭제
	public void deleteTalk(Integer talkroom_num);
	//채팅방 삭제
	public void deleteTalkRoom(Integer talkroom_num);

}
