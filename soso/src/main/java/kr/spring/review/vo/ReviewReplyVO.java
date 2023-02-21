package kr.spring.review.vo;

public class ReviewReplyVO {
	private int vre_num;
	private int vre_pnum;
	private String vre_content;
	private String vre_regdate;
	private String vre_modifydate;
	private String vre_ip;
	private int review_num;
	private int mem_num;
	
	private String mem_id;
	private String mem_nick;
	
	public int getVre_num() {
		return vre_num;
	}
	public void setVre_num(int vre_num) {
		this.vre_num = vre_num;
	}
	public int getVre_pnum() {
		return vre_pnum;
	}
	public void setVre_pnum(int vre_pnum) {
		this.vre_pnum = vre_pnum;
	}
	public String getVre_content() {
		return vre_content;
	}
	public void setVre_content(String vre_content) {
		this.vre_content = vre_content;
	}
	public String getVre_regdate() {
		return vre_regdate;
	}
	public void setVre_regdate(String vre_regdate) {
		this.vre_regdate = vre_regdate;
	}
	public String getVre_modifydate() {
		return vre_modifydate;
	}
	public void setVre_modifydate(String vre_modifydate) {
		this.vre_modifydate = vre_modifydate;
	}
	public String getVre_ip() {
		return vre_ip;
	}
	public void setVre_ip(String vre_ip) {
		this.vre_ip = vre_ip;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
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
		return "ReviewReplyVO [vre_num=" + vre_num + ", vre_pnum=" + vre_pnum + ", vre_content=" + vre_content
				+ ", vre_regdate=" + vre_regdate + ", vre_modifydate=" + vre_modifydate + ", vre_ip=" + vre_ip
				+ ", review_num=" + review_num + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_nick="
				+ mem_nick + "]";
	}
}