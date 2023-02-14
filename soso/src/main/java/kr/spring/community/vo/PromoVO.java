package kr.spring.community.vo;

import javax.validation.constraints.NotEmpty;

// 테이블 promo_board 시퀀스 promo_board_seq
// 테이블 study_create 시퀀스 stc_seq
public class PromoVO {
	private int promo_num;
	private int promo_fixed; // default(2)
	@NotEmpty
	private String promo_title;
	@NotEmpty
	private String promo_content;
	private int promo_hit;
	private String promo_regdate;
	private String promo_modifydate;
	private byte[] promo_uploadfile; // 홍보하는 데 필요한 첨부파일
	private String promo_filename; // 홍보하는 데 필요한 첨부파일명
	private String promo_ip;
	private int mem_num;

	private String mem_id;
	private String mem_nick;
	private byte[] mem_photo;
	private String mem_photo_name; // 프로필 이미지
	
	private int stc_num; // 스터디그룹 식별 번호
	private String stc_title; // 스터디 모집 제목
	private String stc_filter; // 스터디 모집 구분 위한 필터
	private String stc_way; // 스터디 진행방식(온라인/오프라인)
	private String stc_state; // 모집상태(모집중, 모집완료)
	
	public int getPromo_num() {
		return promo_num;
	}
	public void setPromo_num(int promo_num) {
		this.promo_num = promo_num;
	}
	public int getPromo_fixed() {
		return promo_fixed;
	}
	public void setPromo_fixed(int promo_fixed) {
		this.promo_fixed = promo_fixed;
	}
	public String getPromo_title() {
		return promo_title;
	}
	public void setPromo_title(String promo_title) {
		this.promo_title = promo_title;
	}
	public String getPromo_content() {
		return promo_content;
	}
	public void setPromo_content(String promo_content) {
		this.promo_content = promo_content;
	}
	public int getPromo_hit() {
		return promo_hit;
	}
	public void setPromo_hit(int promo_hit) {
		this.promo_hit = promo_hit;
	}
	public String getPromo_regdate() {
		return promo_regdate;
	}
	public void setPromo_regdate(String promo_regdate) {
		this.promo_regdate = promo_regdate;
	}
	public String getPromo_modifydate() {
		return promo_modifydate;
	}
	public void setPromo_modifydate(String promo_modifydate) {
		this.promo_modifydate = promo_modifydate;
	}
	public String getPromo_filename() {
		return promo_filename;
	}
	public void setPromo_filename(String promo_filename) {
		this.promo_filename = promo_filename;
	}
	public String getPromo_ip() {
		return promo_ip;
	}
	public void setPromo_ip(String promo_ip) {
		this.promo_ip = promo_ip;
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
	public String getMem_photo_name() {
		return mem_photo_name;
	}
	public void setMem_photo_name(String mem_photo_name) {
		this.mem_photo_name = mem_photo_name;
	}
	public int getStc_num() {
		return stc_num;
	}
	public void setStc_num(int stc_num) {
		this.stc_num = stc_num;
	}
	public String getStc_title() {
		return stc_title;
	}
	public void setStc_title(String stc_title) {
		this.stc_title = stc_title;
	}
	public String getStc_filter() {
		return stc_filter;
	}
	public void setStc_filter(String stc_filter) {
		this.stc_filter = stc_filter;
	}
	public String getStc_way() {
		return stc_way;
	}
	public void setStc_way(String stc_way) {
		this.stc_way = stc_way;
	}
	public String getStc_state() {
		return stc_state;
	}
	public void setStc_state(String stc_state) {
		this.stc_state = stc_state;
	}
	
	@Override
	public String toString() {
		return "PromoVO [promo_num=" + promo_num + ", promo_fixed=" + promo_fixed + ", promo_title=" + promo_title
				+ ", promo_content=" + promo_content + ", promo_hit=" + promo_hit + ", promo_regdate=" + promo_regdate
				+ ", promo_modifydate=" + promo_modifydate + ", promo_filename=" + promo_filename + ", promo_ip="
				+ promo_ip + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_nick=" + mem_nick
				+ ", mem_photo_name=" + mem_photo_name + ", stc_num=" + stc_num + ", stc_title=" + stc_title
				+ ", stc_filter=" + stc_filter + ", stc_way=" + stc_way + ", stc_state=" + stc_state + "]";
	}
}