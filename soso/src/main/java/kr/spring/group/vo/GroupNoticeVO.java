package kr.spring.group.vo;

import java.sql.Date;

public class GroupNoticeVO {

	
	private int grp_num;
	private String grp_title;
	private String grp_content;
	private Date grp_date;
	private Date grp_time;
	private String grp_vital;
	private int grp_hit;
	private int stc_num;
	
	private int mem_num;

	
	
	
	
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

	public Date getGrp_time() {
		return grp_time;
	}

	public void setGrp_time(Date grp_time) {
		this.grp_time = grp_time;
	}

	public String getGrp_vital() {
		return grp_vital;
	}

	public void setGrp_vital(String grp_vital) {
		this.grp_vital = grp_vital;
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

	@Override
	public String toString() {
		return "GroupMemberVO [grp_num=" + grp_num + ", grp_title=" + grp_title + ", grp_content=" + grp_content
				+ ", grp_date=" + grp_date + ", grp_time=" + grp_time + ", grp_vital=" + grp_vital + ", grp_hit="
				+ grp_hit + ", stc_num=" + stc_num + ", mem_num=" + mem_num + "]";
	}
	
}
