package com.underdog.domain;

import java.sql.Date;

public class BoardVO {

	private int bo_idx;
	private String bo_me_email;
	private String bo_bbsid;
	private String bo_me_nick;
	private String bo_title;
	private String bo_content;
	private int bo_hit;
	private Date bo_regdate;
	private String bo_regip;
	private int bo_status;
	private Date bo_deldate;

	public int getBo_idx() {
		return bo_idx;
	}
	public void setBo_idx(int bo_idx) {
		this.bo_idx = bo_idx;
	}
	public String getBo_me_email() {
		return bo_me_email;
	}
	public void setBo_me_email(String bo_me_email) {
		this.bo_me_email = bo_me_email;
	}
	public String getBo_bbsid() {
		return bo_bbsid;
	}
	public void setBo_bbsid(String bo_bbsid) {
		this.bo_bbsid = bo_bbsid;
	}
	public String getBo_me_nick() {
		return bo_me_nick;
	}
	public void setBo_me_nick(String bo_me_nick) {
		this.bo_me_nick = bo_me_nick;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public int getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(int bo_hit) {
		this.bo_hit = bo_hit;
	}
	public Date getBo_regdate() {
		return bo_regdate;
	}
	public void setBo_regdate(Date bo_regdate) {
		this.bo_regdate = bo_regdate;
	}
	public String getBo_regip() {
		return bo_regip;
	}
	public void setBo_regip(String bo_regip) {
		this.bo_regip = bo_regip;
	}
	public int getBo_status() {
		return bo_status;
	}
	public void setBo_status(int bo_status) {
		this.bo_status = bo_status;
	}
	public Date getBo_deldate() {
		return bo_deldate;
	}
	public void setBo_deldate(Date bo_deldate) {
		this.bo_deldate = bo_deldate;
	}
	
	
}
