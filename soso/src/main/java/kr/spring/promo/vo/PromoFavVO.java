package kr.spring.promo.vo;

public class PromoFavVO {
	private int p_fav_num;
	private int promo_num;
	private int mem_num;
	
	public int getP_fav_num() {
		return p_fav_num;
	}
	public void setP_fav_num(int p_fav_num) {
		this.p_fav_num = p_fav_num;
	}
	public int getPromo_num() {
		return promo_num;
	}
	public void setPromo_num(int promo_num) {
		this.promo_num = promo_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	@Override
	public String toString() {
		return "PromoFavVO [p_fav_num=" + p_fav_num + ", promo_num=" + promo_num + ", mem_num=" + mem_num + "]";
	}
}