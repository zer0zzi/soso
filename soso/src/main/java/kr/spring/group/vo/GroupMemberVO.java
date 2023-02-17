package kr.spring.group.vo;


public class GroupMemberVO {
	
	private int signup_num;
	private int stc_num;
	private int mem_num;
	private String signup_status;
	private String signup_detail;
	

	// 방장의 아이디는 어떻게 저장?
	// 1. groupMemberVO에 stc_num과 
	// noticeVO의 stc_num 비교 후 noticeVO를 통해 방장 번호 알아내기?
	
	
	
	
	public int getSignup_num() {
		return signup_num;
	}
	public void setSignup_num(int signup_num) {
		this.signup_num = signup_num;
	}
	public int getStc_num() {
		return stc_num;
	}
	public void setStc_num(int stc_num) {
		this.stc_num = stc_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getSignup_status() {
		return signup_status;
	}
	public void setSignup_status(String signup_status) {
		this.signup_status = signup_status;
	}
	public String getSignup_detail() {
		return signup_detail;
	}
	public void setSignup_detail(String signup_detail) {
		this.signup_detail = signup_detail;
	}
	
	@Override
	public String toString() {
		return "GroupMemberVO [signup_num=" + signup_num + ", stc_num=" + stc_num + ", mem_num=" + mem_num
				+ ", signup_status=" + signup_status + ", signup_detail=" + signup_detail + "]";
	}
	
}
