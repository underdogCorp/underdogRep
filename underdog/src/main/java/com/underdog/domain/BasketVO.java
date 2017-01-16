package com.underdog.domain;

import java.sql.Date;

public class BasketVO {

	private int BA_IDX;
	private String BA_ME_EMAIL;
	private int BA_PR_IDX;
	private String BA_TERMSORT;
	private int BA_TERMNUM;
	private int BA_PRICE;
	private int BA_SUM;
	private Date BA_REGDATE;
	
	public int getBA_IDX() {
		return BA_IDX;
	}
	public void setBA_IDX(int bA_IDX) {
		BA_IDX = bA_IDX;
	}
	public String getBA_ME_EMAIL() {
		return BA_ME_EMAIL;
	}
	public void setBA_ME_EMAIL(String bA_ME_EMAIL) {
		BA_ME_EMAIL = bA_ME_EMAIL;
	}
	public int getBA_PR_IDX() {
		return BA_PR_IDX;
	}
	public void setBA_PR_IDX(int bA_PR_IDX) {
		BA_PR_IDX = bA_PR_IDX;
	}
	public String getBA_TERMSORT() {
		return BA_TERMSORT;
	}
	public void setBA_TERMSORT(String bA_TERMSORT) {
		BA_TERMSORT = bA_TERMSORT;
	}
	public int getBA_TERMNUM() {
		return BA_TERMNUM;
	}
	public void setBA_TERMNUM(int bA_TERMNUM) {
		BA_TERMNUM = bA_TERMNUM;
	}
	public int getBA_PRICE() {
		return BA_PRICE;
	}
	public void setBA_PRICE(int bA_PRICE) {
		BA_PRICE = bA_PRICE;
	}
	public int getBA_SUM() {
		return BA_SUM;
	}
	public void setBA_SUM(int bA_SUM) {
		BA_SUM = bA_SUM;
	}
	public Date getBA_REGDATE() {
		return BA_REGDATE;
	}
	public void setBA_REGDATE(Date bA_REGDATE) {
		BA_REGDATE = bA_REGDATE;
	}

	
}
