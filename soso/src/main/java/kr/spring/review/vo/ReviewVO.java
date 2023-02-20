package kr.spring.review.vo;

import java.io.IOException;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

// 테이블 review_board 시퀀스 review_board_seq
// 테이블 study_create 시퀀스 stc_seq
public class ReviewVO {
	private int review_num;
	private int review_fixed;
	@NotEmpty
	private String review_title;
	private int review_rating;
	@NotEmpty
	private String review_content;
	private int review_hit;
	private String review_regdate;
	private String review_modifydate;
	private byte[] review_uploadfile; // 리뷰를 작성하는 데 필요한 첨부파일
	private String review_filename; // 리뷰를 작성하는 데 필요한 첨부파일명
	private String review_ip;
	private int mem_num;

	private String mem_id;
	private String mem_nick;
	private byte[] mem_photo;
	private String mem_photo_name; // 프로필 이미지
	
	private int stc_num; // 스터디그룹 식별 번호
	private String stc_title; // 스터디 모집 제목
	private String stc_filter; // 스터디 모집 구분 위한 필터
	
	private int p_replyCnt;
	private int p_favCnt;

	// 파일 업로드 처리 : 파일을 업로드 하려면 필수로 setUpload가 있어야 한다.
	public void setUpload(MultipartFile upload) throws IOException{
		// MultipartFile → byte[] 변환
		setReview_uploadfile(upload.getBytes());
		// 파일명 구하기
		setReview_filename(upload.getOriginalFilename());
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getReview_fixed() {
		return review_fixed;
	}

	public void setReview_fixed(int review_fixed) {
		this.review_fixed = review_fixed;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public int getReview_rating() {
		return review_rating;
	}

	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_hit() {
		return review_hit;
	}

	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}

	public String getReview_regdate() {
		return review_regdate;
	}

	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}

	public String getReview_modifydate() {
		return review_modifydate;
	}

	public void setReview_modifydate(String review_modifydate) {
		this.review_modifydate = review_modifydate;
	}

	public byte[] getReview_uploadfile() {
		return review_uploadfile;
	}

	public void setReview_uploadfile(byte[] review_uploadfile) {
		this.review_uploadfile = review_uploadfile;
	}

	public String getReview_filename() {
		return review_filename;
	}

	public void setReview_filename(String review_filename) {
		this.review_filename = review_filename;
	}

	public String getReview_ip() {
		return review_ip;
	}

	public void setReview_ip(String review_ip) {
		this.review_ip = review_ip;
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

	public int getP_replyCnt() {
		return p_replyCnt;
	}

	public void setP_replyCnt(int p_replyCnt) {
		this.p_replyCnt = p_replyCnt;
	}

	public int getP_favCnt() {
		return p_favCnt;
	}

	public void setP_favCnt(int p_favCnt) {
		this.p_favCnt = p_favCnt;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_num=" + review_num + ", review_fixed=" + review_fixed + ", review_title="
				+ review_title + ", review_rating=" + review_rating + ", review_content=" + review_content
				+ ", review_hit=" + review_hit + ", review_regdate=" + review_regdate + ", review_modifydate="
				+ review_modifydate + ", review_filename=" + review_filename + ", review_ip=" + review_ip + ", mem_num="
				+ mem_num + ", mem_id=" + mem_id + ", mem_nick=" + mem_nick + ", mem_photo_name=" + mem_photo_name
				+ ", stc_num=" + stc_num + ", stc_title=" + stc_title + ", stc_filter=" + stc_filter + ", p_replyCnt="
				+ p_replyCnt + ", p_favCnt=" + p_favCnt + "]";
	}
	
	
}