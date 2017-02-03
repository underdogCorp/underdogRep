package com.underdog.domain;

import java.sql.Date;

public class BasketVO {

	private int ba_idx;
	private String ba_me_email;
	private int ba_pr_idx;
	private String ba_termsort;
	private int ba_termnum;
	private int ba_price;
	private int ba_sum;
	private Date ba_regdate;
	
	public int getBa_idx() {
		return ba_idx;
	}
	public void setBa_idx(int ba_idx) {
		this.ba_idx = ba_idx;
	}
	public String getBa_me_email() {
		return ba_me_email;
	}
	public void setBa_me_email(String ba_me_email) {
		this.ba_me_email = ba_me_email;
	}
	public int getBa_pr_idx() {
		return ba_pr_idx;
	}
	public void setBa_pr_idx(int ba_pr_idx) {
		this.ba_pr_idx = ba_pr_idx;
	}
	public String getBa_termsort() {
		return ba_termsort;
	}
	public void setBa_termsort(String ba_termsort) {
		this.ba_termsort = ba_termsort;
	}
	public int getBa_termnum() {
		return ba_termnum;
	}
	public void setBa_termnum(int ba_termnum) {
		this.ba_termnum = ba_termnum;
	}
	public int getBa_price() {
		return ba_price;
	}
	public void setBa_price(int ba_price) {
		this.ba_price = ba_price;
	}
	public int getBa_sum() {
		return ba_sum;
	}
	public void setBa_sum(int ba_sum) {
		this.ba_sum = ba_sum;
	}
	public Date getBa_regdate() {
		return ba_regdate;
	}
	public void setBa_regdate(Date ba_regdate) {
		this.ba_regdate = ba_regdate;
	}
	
	
	
}
