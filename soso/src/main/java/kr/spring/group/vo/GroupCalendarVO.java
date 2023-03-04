package kr.spring.group.vo;

import javax.validation.constraints.NotEmpty;
import java.io.IOException;

public class GroupCalendarVO {

	private int cal_num;
	@NotEmpty
	private String cal_date;
	@NotEmpty
	private String cal_content;
	private int stc_num;
	
	private int mem_num;

	
	
	
	
	public int getCal_num() {
		return cal_num;
	}

	public void setCal_num(int cal_num) {
		this.cal_num = cal_num;
	}

	public String getCal_date() {
		return cal_date;
	}

	public void setCal_date(String cal_date) {
		this.cal_date = cal_date;
	}

	public String getCal_content() {
		return cal_content;
	}

	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
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
		return "GroupCalendarVO [cal_num=" + cal_num + ", cal_date=" + cal_date + ", cal_content=" + cal_content
				+ ", stc_num=" + stc_num + ", mem_num=" + mem_num + "]";
	}
	
}
