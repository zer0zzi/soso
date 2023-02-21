package kr.spring.review.vo;

public class ReviewFavVO {
	private int v_fav_num;
	private int review_num;
	private int mem_num;
	
	public int getV_fav_num() {
		return v_fav_num;
	}
	public void setV_fav_num(int v_fav_num) {
		this.v_fav_num = v_fav_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	@Override
	public String toString() {
		return "ReviewFavVO [v_fav_num=" + v_fav_num + ", review_num=" + review_num + ", mem_num=" + mem_num + "]";
	}
}