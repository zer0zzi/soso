package kr.spring.group.vo;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class GroupNoticeVO {

	
	private int grp_num;
	@NotEmpty
	private String grp_title;
	@NotEmpty
	private String grp_content;
	private Date grp_date;
	private Date grp_mdate;
	private int grp_hit;
	private int stc_num;
	private byte[] grp_uploadfile;
	private String grp_filename;
	
	private int mem_num;

	
	//파일 업로드 처리
	//(주의)폼에서 파일업로드 파라미터네임은 반드시 upload로 지정해야 함
	public void setUpload(MultipartFile upload)
	                            throws IOException{
		//MultipartFile -> byte[] 변환
		setGrp_uploadfile(upload.getBytes());
		//파일명 구하기
		setGrp_filename(upload.getOriginalFilename());
	}
	
	
	
	public int getGrp_num() {
		return grp_num;
	}

	public void setGrp_num(int grp_num) {
		this.grp_num = grp_num;
	}

	public String getGrp_title() {
		return grp_title;
	}

	public void setGrp_title(String grp_title) {
		this.grp_title = grp_title;
	}

	public String getGrp_content() {
		return grp_content;
	}

	public void setGrp_content(String grp_content) {
		this.grp_content = grp_content;
	}

	public Date getGrp_date() {
		return grp_date;
	}

	public void setGrp_date(Date grp_date) {
		this.grp_date = grp_date;
	}

	public int getGrp_hit() {
		return grp_hit;
	}

	public void setGrp_hit(int grp_hit) {
		this.grp_hit = grp_hit;
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



	public Date getGrp_mdate() {
		return grp_mdate;
	}



	public void setGrp_mdate(Date grp_mdate) {
		this.grp_mdate = grp_mdate;
	}



	public byte[] getGrp_uploadfile() {
		return grp_uploadfile;
	}



	public void setGrp_uploadfile(byte[] grp_uploadfile) {
		this.grp_uploadfile = grp_uploadfile;
	}



	public String getGrp_filename() {
		return grp_filename;
	}



	public void setGrp_filename(String grp_filename) {
		this.grp_filename = grp_filename;
	}



	@Override
	public String toString() {
		return "GroupNoticeVO [grp_num=" + grp_num + ", grp_title=" + grp_title + ", grp_content=" + grp_content
				+ ", grp_date=" + grp_date + ", grp_mdate=" + grp_mdate + ", grp_hit="
				+ grp_hit + ", stc_num=" + stc_num + ", grp_uploadfile=" + Arrays.toString(grp_uploadfile)
				+ ", grp_filename=" + grp_filename + ", mem_num=" + mem_num + "]";
	}
	
	
	
}
