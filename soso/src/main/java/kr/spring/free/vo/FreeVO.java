package kr.spring.free.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;


// 테이블 free_board 시퀀스 free_board_seq
public class FreeVO {
	private int free_num;
	private int free_fixed; // default(2)
	@NotEmpty
	@Pattern(regexp="^[a-zA-Zㄱ-ㅎ가-힣\\\\d`~!@#.$%^&*()-_=+]{1,100}$")
	private String free_title;
	@NotEmpty
	private String free_content;
	private int free_hit;
	private Date free_regdate;
	private Date free_modifydate;
	private byte[] free_uploadfile; // 자유게시글을 작성하는 데 필요한 첨부파일
	private String free_filename; // 자유게시글을 작성하는 데 필요한 첨부파일명
	private String free_ip;
	private int mem_num;
	
	private String tblName;

	private String mem_id;
	private String mem_nick;
	private byte[] mem_photo;
	private String mem_photo_name; // 프로필 이미지
	private int mem_auth;
	
	private int f_replyCnt;
	private int f_favCnt;

	// 파일 업로드 처리 : 파일을 업로드 하려면 필수로 setUpload가 있어야 한다.
	public void setUpload(MultipartFile upload) throws IOException{
		// MultipartFile → byte[] 변환
		setFree_uploadfile(upload.getBytes());
		// 파일명 구하기
		setFree_filename(upload.getOriginalFilename());
	}

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
	public Date getFree_regdate() {
		return free_regdate;
	}
	public void setFree_regdate(Date free_regdate) {
		this.free_regdate = free_regdate;
	}
	public Date getFree_modifydate() {
		return free_modifydate;
	}
	public void setFree_modifydate(Date free_modifydate) {
		this.free_modifydate = free_modifydate;
	}
	public byte[] getFree_uploadfile() {
		return free_uploadfile;
	}
	public void setFree_uploadfile(byte[] free_uploadfile) {
		this.free_uploadfile = free_uploadfile;
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
	public int getMem_auth() {
		return mem_auth;
	}
	public void setMem_auth(int mem_auth) {
		this.mem_auth = mem_auth;
	}
	public int getF_replyCnt() {
		return f_replyCnt;
	}
	public void setF_replyCnt(int f_replyCnt) {
		this.f_replyCnt = f_replyCnt;
	}
	public int getF_favCnt() {
		return f_favCnt;
	}
	public void setF_favCnt(int f_favCnt) {
		this.f_favCnt = f_favCnt;
	}

	public String getTblName() {
		return tblName;
	}

	public void setTblName(String tblName) {
		this.tblName = tblName;
	}

	@Override
	public String toString() {
		return "FreeVO [free_num=" + free_num + ", free_fixed=" + free_fixed + ", free_title=" + free_title
				+ ", free_content=" + free_content + ", free_hit=" + free_hit + ", free_regdate=" + free_regdate
				+ ", free_modifydate=" + free_modifydate + ", free_filename=" + free_filename + ", free_ip=" + free_ip
				+ ", mem_num=" + mem_num + ", tblName=" + tblName + ", mem_id=" + mem_id
				+ ", mem_nick=" + mem_nick + ", mem_photo_name=" + mem_photo_name + ", mem_auth=" + mem_auth
				+ ", f_replyCnt=" + f_replyCnt + ", f_favCnt=" + f_favCnt + "]";
	}

}