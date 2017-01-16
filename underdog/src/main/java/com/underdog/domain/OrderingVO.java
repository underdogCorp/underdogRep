package com.underdog.domain;

import java.sql.Date;

public class OrderingVO {

	private int or_idx;
	private String or_me_email;
	private int or_pr_idx;
	private String or_termsort;
	private int or_termnum;
	private int or_price;
	private int or_sum;
	private Date or_paydate;
	private int or_paysort;
	private int or_status;
	
	public int getOr_idx() {
		return or_idx;
	}
	public void setOr_idx(int or_idx) {
		this.or_idx = or_idx;
	}
	public String getOr_me_email() {
		return or_me_email;
	}
	public void setOr_me_email(String or_me_email) {
		this.or_me_email = or_me_email;
	}
	public int getOr_pr_idx() {
		return or_pr_idx;
	}
	public void setOr_pr_idx(int or_pr_idx) {
		this.or_pr_idx = or_pr_idx;
	}
	public String getOr_termsort() {
		return or_termsort;
	}
	public void setOr_termsort(String or_termsort) {
		this.or_termsort = or_termsort;
	}
	public int getOr_termnum() {
		return or_termnum;
	}
	public void setOr_termnum(int or_termnum) {
		this.or_termnum = or_termnum;
	}
	public int getOr_price() {
		return or_price;
	}
	public void setOr_price(int or_price) {
		this.or_price = or_price;
	}
	public int getOr_sum() {
		return or_sum;
	}
	public void setOr_sum(int or_sum) {
		this.or_sum = or_sum;
	}
	public Date getOr_paydate() {
		return or_paydate;
	}
	public void setOr_paydate(Date or_paydate) {
		this.or_paydate = or_paydate;
	}
	public int getOr_paysort() {
		return or_paysort;
	}
	public void setOr_paysort(int or_paysort) {
		this.or_paysort = or_paysort;
	}
	public int getOr_status() {
		return or_status;
	}
	public void setOr_status(int or_status) {
		this.or_status = or_status;
	}

	
}
