package kr.spring.community.vo;

public class FreeReplyVO {
	private int fre_num;
	private int fre_pnum;
	private String fre_content;
	private String fre_regdate; // 하루 전, 한 시간 전 등 표시 
	private String fre_modifydate;
	private String fre_ip;
	private int free_num;
	private int mem_num;
	
	private String mem_id;
	private String mem_nick;
	
	public int getFre_num() {
		return fre_num;
	}
	public void setFre_num(int fre_num) {
		this.fre_num = fre_num;
	}
	public int getFre_pnum() {
		return fre_pnum;
	}
	public void setFre_pnum(int fre_pnum) {
		this.fre_pnum = fre_pnum;
	}
	public String getFre_content() {
		return fre_content;
	}
	public void setFre_content(String fre_content) {
		this.fre_content = fre_content;
	}
	public String getFre_regdate() {
		return fre_regdate;
	}
	public void setFre_regdate(String fre_regdate) {
		this.fre_regdate = fre_regdate;
	}
	public String getFre_modifydate() {
		return fre_modifydate;
	}
	public void setFre_modifydate(String fre_modifydate) {
		this.fre_modifydate = fre_modifydate;
	}
	public String getFre_ip() {
		return fre_ip;
	}
	public void setFre_ip(String fre_ip) {
		this.fre_ip = fre_ip;
	}
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	
	@Override
	public String toString() {
		return "FreeReplyVO [fre_num=" + fre_num + ", fre_pnum=" + fre_pnum + ", fre_content=" + fre_content
				+ ", fre_regdate=" + fre_regdate + ", fre_modifydate=" + fre_modifydate + ", fre_ip=" + fre_ip
				+ ", free_num=" + free_num + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_nick=" + mem_nick
				+ "]";
	}
}