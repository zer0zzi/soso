package kr.spring.study.vo;

public class StudyFavVO {
	private int fav_num;
	private int stc_num;
	private int mem_num;
	
	public int getFav_num() {
		return fav_num;
	}
	public void setFav_num(int fav_num) {
		this.fav_num = fav_num;
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
		return "StudyFavVO [fav_num=" + fav_num + ", stc_num=" + stc_num + ", mem_num=" + mem_num + "]";
	}
}
