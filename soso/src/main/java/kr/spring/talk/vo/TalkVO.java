package kr.spring.talk.vo;

public class TalkVO {
	private int talk_num;
	private int talkroom_num;//수신그룹
	private int mem_num;//발신자
	private String message;
	private String chat_date;
	
	
	private int read_count;
	private String mem_id;
	
	
	//
	private int room_cnt;
	private String talkroom_name;
	private TalkVO talkVO;
	private String talkroom_date;
	private int[] members;
	
	public String getTalkroom_name() {
		return talkroom_name;
	}
	public void setTalkroom_name(String talkroom_name) {
		this.talkroom_name = talkroom_name;
	}
	public int getRoom_cnt() {
		return room_cnt;
	}
	public void setRoom_cnt(int room_cnt) {
		this.room_cnt = room_cnt;
	}
	public TalkVO getTalkVO() {
		return talkVO;
	}
	public void setTalkVO(TalkVO talkVO) {
		this.talkVO = talkVO;
	}
	public String getTalkroom_date() {
		return talkroom_date;
	}
	public void setTalkroom_date(String talkroom_date) {
		this.talkroom_date = talkroom_date;
	}
	public int[] getMembers() {
		return members;
	}
	public void setMembers(int[] members) {
		this.members = members;
	}
	//
	public int getTalk_num() {
		return talk_num;
	}
	public void setTalk_num(int talk_num) {
		this.talk_num = talk_num;
	}
	public int getTalkroom_num() {
		return talkroom_num;
	}
	public void setTalkroom_num(int talkroom_num) {
		this.talkroom_num = talkroom_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getChat_date() {
		return chat_date;
	}
	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	
	
}
