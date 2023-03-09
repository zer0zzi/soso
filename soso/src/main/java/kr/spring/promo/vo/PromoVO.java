package kr.spring.promo.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

// 테이블 promo_board 시퀀스 promo_board_seq
// 테이블 study_create 시퀀스 stc_seq
public class PromoVO {
	private int promo_num;
	private int promo_fixed;
	@NotEmpty
	@Pattern(regexp="^[0-9a-zA-Zㄱ-ㅎ가-힣\\\\d`~!@#.,$% ^&*·/()?-_=+]{1,100}$")
	private String promo_title;
	@NotEmpty
	private String promo_content;
	private int promo_hit;
	private Date promo_regdate;
	private Date promo_modifydate;
	private byte[] promo_uploadfile; // 홍보하는 데 필요한 첨부파일
	private String promo_filename; // 홍보하는 데 필요한 첨부파일명
	private String promo_ip;
	private int mem_num;
	private int studyNum;
	
	private String mem_id;
	private String mem_nick;
	private byte[] mem_photo;
	private String mem_photo_name; // 프로필 이미지
	private int stc_num; // 스터디그룹 식별 번호
	private String promo_status;

	private int p_replyCnt;
	private int p_favCnt;
	
	private String tblName;
	
	// 파일 업로드 처리 : 파일을 업로드 하려면 필수로 setUpload가 있어야 한다.
	public void setUpload(MultipartFile upload) throws IOException{
		// MultipartFile → byte[] 변환
		setPromo_uploadfile(upload.getBytes());
		// 파일명 구하기
		setPromo_filename(upload.getOriginalFilename());
	}

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
	public Date getPromo_regdate() {
		return promo_regdate;
	}
	public void setPromo_regdate(Date promo_regdate) {
		this.promo_regdate = promo_regdate;
	}
	public Date getPromo_modifydate() {
		return promo_modifydate;
	}
	public void setPromo_modifydate(Date promo_modifydate) {
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
	public byte[] getPromo_uploadfile() {
		return promo_uploadfile;
	}
	public void setPromo_uploadfile(byte[] promo_uploadfile) {
		this.promo_uploadfile = promo_uploadfile;
	}
	public byte[] getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(byte[] mem_photo) {
		this.mem_photo = mem_photo;
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
	public String getPromo_status() {
		return promo_status;
	}
	public void setPromo_status(String promo_status) {
		this.promo_status = promo_status;
	}

	public int getStc_num() {
		return stc_num;
	}

	public void setStc_num(int stc_num) {
		this.stc_num = stc_num;
	}

	public String getTblName() {
		return tblName;
	}

	public void setTblName(String tblName) {
		this.tblName = tblName;
	}


	public int getStudyNum() {
		return studyNum;
	}

	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}

	@Override
	public String toString() {
		return "PromoVO [promo_num=" + promo_num + ", promo_fixed=" + promo_fixed + ", promo_title=" + promo_title
				+ ", promo_content=" + promo_content + ", promo_hit=" + promo_hit + ", promo_regdate=" + promo_regdate
				+ ", promo_modifydate=" + promo_modifydate + ", promo_filename=" + promo_filename + ", promo_ip="
				+ promo_ip + ", mem_num=" + mem_num + ", studyNum=" + studyNum + ", mem_id=" + mem_id + ", mem_nick="
				+ mem_nick + ", mem_photo_name=" + mem_photo_name + ", stc_num=" + stc_num + ", promo_status="
				+ promo_status + ", p_replyCnt=" + p_replyCnt + ", p_favCnt=" + p_favCnt + ", tblName=" + tblName + "]";
	}

}