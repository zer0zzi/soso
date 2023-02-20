package kr.spring.promo.vo;

public class PromoReplyVO {
	private int pre_num;
	private int pre_pnum;
	private String pre_content;
	private String pre_regdate;
	private String pre_modifydate;
	private String pre_ip;
	private int promo_num;
	private int mem_num;
	
	private String mem_id;
	private String mem_nick;
	
	public int getPre_num() {
		return pre_num;
	}
	public void setPre_num(int pre_num) {
		this.pre_num = pre_num;
	}
	public int getPre_pnum() {
		return pre_pnum;
	}
	public void setPre_pnum(int pre_pnum) {
		this.pre_pnum = pre_pnum;
	}
	public String getPre_content() {
		return pre_content;
	}
	public void setPre_content(String pre_content) {
		this.pre_content = pre_content;
	}
	public String getPre_regdate() {
		return pre_regdate;
	}
	public void setPre_regdate(String pre_regdate) {
		this.pre_regdate = pre_regdate;
	}
	public String getPre_modifydate() {
		return pre_modifydate;
	}
	public void setPre_modifydate(String pre_modifydate) {
		this.pre_modifydate = pre_modifydate;
	}
	public String getPre_ip() {
		return pre_ip;
	}
	public void setPre_ip(String pre_ip) {
		this.pre_ip = pre_ip;
	}
	public int getPromo_num() {
		return promo_num;
	}
	public void setPromo_num(int promo_num) {
		this.promo_num = promo_num;
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
		return "PromoReplyVO [pre_num=" + pre_num + ", pre_pnum=" + pre_pnum + ", pre_content=" + pre_content
				+ ", pre_regdate=" + pre_regdate + ", pre_modifydate=" + pre_modifydate + ", pre_ip=" + pre_ip
				+ ", promo_num=" + promo_num + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_nick=" + mem_nick
				+ "]";
	}
}