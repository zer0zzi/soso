package kr.spring.community.vo;

import javax.validation.constraints.NotEmpty;

// 테이블 free_board 시퀀스 free_board_seq
public class FreeVO {
	private int free_num;
	private int free_fixed; // default(2)
	@NotEmpty
	private String free_title;
	@NotEmpty
	private String free_content;
	private int free_hit;
	private String free_regdate;
	private String free_modifydate;
	private byte[] free_uploadfile; // 자유게시글을 작성하는 데 필요한 첨부파일
	private String free_filename; // 자유게시글을 작성하는 데 필요한 첨부파일명
	private String free_ip;
	private int mem_num;

	private String mem_id;
	private String mem_nick;
	private byte[] mem_photo;
	private String mem_photo_name; // 프로필 이미지
	
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public int getFree_fixed() {
		return free_fixed;
	}
	public void setFree_fixed(int free_fixed) {
		this.free_fixed = free_fixed;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public int getFree_hit() {
		return free_hit;
	}
	public void setFree_hit(int free_hit) {
		this.free_hit = free_hit;
	}
	public String getFree_regdate() {
		return free_regdate;
	}
	public void setFree_regdate(String free_regdate) {
		this.free_regdate = free_regdate;
	}
	public String getFree_modifydate() {
		return free_modifydate;
	}
	public void setFree_modifydate(String free_modifydate) {
		this.free_modifydate = free_modifydate;
	}
	public String getFree_filename() {
		return free_filename;
	}
	public void setFree_filename(String free_filename) {
		this.free_filename = free_filename;
	}
	public String getFree_ip() {
		return free_ip;
	}
	public void setFree_ip(String free_ip) {
		this.free_ip = free_ip;
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
	
	@Override
	public String toString() {
		return "FreeBoardVO [free_num=" + free_num + ", free_fixed=" + free_fixed + ", free_title=" + free_title
				+ ", free_content=" + free_content + ", free_hit=" + free_hit + ", free_regdate=" + free_regdate
				+ ", free_modifydate=" + free_modifydate + ", free_filename=" + free_filename + ", free_ip=" + free_ip
				+ ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_nick=" + mem_nick + ", mem_photo_name="
				+ mem_photo_name + "]";
	}
}