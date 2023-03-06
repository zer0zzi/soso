package kr.spring.study.vo;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class StudyVO {
	private int stc_num;
	private String stc_title;
	private String stc_content;
	private String stc_state;
	private String stc_period;
	private int stc_per;
	private String stc_way;
	private String stc_filter;
	private String stc_filename;
	private byte[] stc_uploadfile;
	private Date stc_date;
	private Date stc_modify_date;
	private int hit;
	private int mem_num;
	
	private String mem_id;
	private String mem_email;
	private String mem_nick;
	private byte[] mem_photo;
	private String mem_photo_name;
	
	//파일 업로드 처리
	public void setUpload(MultipartFile upload) throws IOException{
		//MultipartFile -> byte[] 변환
		setStc_uploadfile(upload.getBytes());
		//파일명 구하기
		setStc_filename(upload.getOriginalFilename());
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
	public String getStc_content() {
		return stc_content;
	}
	public void setStc_content(String stc_content) {
		this.stc_content = stc_content;
	}
	public String getStc_state() {
		return stc_state;
	}
	public void setStc_state(String stc_state) {
		this.stc_state = stc_state;
	}
	public String getStc_period() {
		return stc_period;
	}
	public void setStc_period(String stc_period) {
		this.stc_period = stc_period;
	}
	public int getStc_per() {
		return stc_per;
	}
	public void setStc_per(int stc_per) {
		this.stc_per = stc_per;
	}
	public String getStc_way() {
		return stc_way;
	}
	public void setStc_way(String stc_way) {
		this.stc_way = stc_way;
	}
	public String getStc_filter() {
		return stc_filter;
	}
	public void setStc_filter(String stc_filter) {
		this.stc_filter = stc_filter;
	}
	public String getStc_filename() {
		return stc_filename;
	}
	public void setStc_filename(String stc_filename) {
		this.stc_filename = stc_filename;
	}
	public byte[] getStc_uploadfile() {
		return stc_uploadfile;
	}
	public void setStc_uploadfile(byte[] stc_uploadfile) {
		this.stc_uploadfile = stc_uploadfile;
	}
	public Date getStc_date() {
		return stc_date;
	}
	public void setStc_date(Date stc_date) {
		this.stc_date = stc_date;
	}
	public Date getStc_modify_date() {
		return stc_modify_date;
	}
	public void setStc_modify_date(Date stc_modify_date) {
		this.stc_modify_date = stc_modify_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public byte[] getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(byte[] mem_photo) {
		this.mem_photo = mem_photo;
	}
	public String getMem_photo_name() {
		return mem_photo_name;
	}
	public void setMem_photo_name(String mem_photo_name) {
		this.mem_photo_name = mem_photo_name;
	}
	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	@Override
	public String toString() {
		return "StudyVO [stc_num=" + stc_num + ", stc_title=" + stc_title + ", stc_content=" + stc_content
				+ ", stc_state=" + stc_state + ", stc_period=" + stc_period + ", stc_per=" + stc_per + ", stc_way="
				+ stc_way + ", stc_filter=" + stc_filter + ", stc_filename=" + stc_filename + ", stc_uploadfile="
				+ Arrays.toString(stc_uploadfile) + ", stc_date=" + stc_date + ", stc_modify_date=" + stc_modify_date
				+ ", hit=" + hit + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_email=" + mem_email
				+ ", mem_nick=" + mem_nick + ", mem_photo=" + Arrays.toString(mem_photo) + ", mem_photo_name="
				+ mem_photo_name + "]";
	}
}
