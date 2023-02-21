package kr.spring.free.vo;

public class FreeFavVO {
	private int f_fav_num;
	private int free_num;
	private int mem_num;
	
	public int getF_fav_num() {
		return f_fav_num;
	}
	public void setF_fav_num(int f_fav_num) {
		this.f_fav_num = f_fav_num;
	}
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	@Override
	public String toString() {
		return "FreeFavVO [f_fav_num=" + f_fav_num + ", free_num=" + free_num + ", mem_num=" + mem_num + "]";
	}
}