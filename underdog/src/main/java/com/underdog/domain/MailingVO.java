package com.underdog.domain;

import java.sql.Date;

public class MailingVO {

	private int ma_idx;
	private int ma_pr_idx;
	private String ma_me_email;
	private Date ma_senddate;
	private String ma_content;
	private int ma_status;
	
	public int getMa_idx() {
		return ma_idx;
	}
	public void setMa_idx(int ma_idx) {
		this.ma_idx = ma_idx;
	}
	public int getMa_pr_idx() {
		return ma_pr_idx;
	}
	public void setMa_pr_idx(int ma_pr_idx) {
		this.ma_pr_idx = ma_pr_idx;
	}
	public String getMa_me_email() {
		return ma_me_email;
	}
	public void setMa_me_email(String ma_me_email) {
		this.ma_me_email = ma_me_email;
	}
	public Date getMa_senddate() {
		return ma_senddate;
	}
	public void setMa_senddate(Date ma_senddate) {
		this.ma_senddate = ma_senddate;
	}
	public String getMa_content() {
		return ma_content;
	}
	public void setMa_content(String ma_content) {
		this.ma_content = ma_content;
	}
	public int getMa_status() {
		return ma_status;
	}
	public void setMa_status(int ma_status) {
		this.ma_status = ma_status;
	}



	
}
