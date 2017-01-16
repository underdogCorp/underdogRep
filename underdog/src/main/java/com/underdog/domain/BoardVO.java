package com.underdog.domain;

import java.sql.Date;

public class BoardVO {

	private int BO_IDX;
	private String BO_ME_EMAIL;
	private int BO_BBSID;
	private String BO_ME_NICK;
	private String BO_TITLE;
	private String BO_CONTENT;
	private int BO_HIT;
	private Date BO_REGDATE;
	private String BO_REGIP;
	private int BO_STATUS;
	private Date BO_DELDATE;
	
	public int getBO_IDX() {
		return BO_IDX;
	}
	public void setBO_IDX(int bO_IDX) {
		BO_IDX = bO_IDX;
	}
	public String getBO_ME_EMAIL() {
		return BO_ME_EMAIL;
	}
	public void setBO_ME_EMAIL(String bO_ME_EMAIL) {
		BO_ME_EMAIL = bO_ME_EMAIL;
	}
	public int getBO_BBSID() {
		return BO_BBSID;
	}
	public void setBO_BBSID(int bO_BBSID) {
		BO_BBSID = bO_BBSID;
	}
	public String getBO_ME_NICK() {
		return BO_ME_NICK;
	}
	public void setBO_ME_NICK(String bO_ME_NICK) {
		BO_ME_NICK = bO_ME_NICK;
	}
	public String getBO_TITLE() {
		return BO_TITLE;
	}
	public void setBO_TITLE(String bO_TITLE) {
		BO_TITLE = bO_TITLE;
	}
	public String getBO_CONTENT() {
		return BO_CONTENT;
	}
	public void setBO_CONTENT(String bO_CONTENT) {
		BO_CONTENT = bO_CONTENT;
	}
	public int getBO_HIT() {
		return BO_HIT;
	}
	public void setBO_HIT(int bO_HIT) {
		BO_HIT = bO_HIT;
	}
	public Date getBO_REGDATE() {
		return BO_REGDATE;
	}
	public void setBO_REGDATE(Date bO_REGDATE) {
		BO_REGDATE = bO_REGDATE;
	}
	public String getBO_REGIP() {
		return BO_REGIP;
	}
	public void setBO_REGIP(String bO_REGIP) {
		BO_REGIP = bO_REGIP;
	}
	public int getBO_STATUS() {
		return BO_STATUS;
	}
	public void setBO_STATUS(int bO_STATUS) {
		BO_STATUS = bO_STATUS;
	}
	public Date getBO_DELDATE() {
		return BO_DELDATE;
	}
	public void setBO_DELDATE(Date bO_DELDATE) {
		BO_DELDATE = bO_DELDATE;
	}

	
}
