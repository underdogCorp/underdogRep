package com.underdog.domain;

import java.sql.Date;

public class AdVO {
	
	private int AD_IDX;
	private String AD_URL;
	private String AD_COMPANY;
	private Date AD_REGDATE;
	private int AD_STATUS;
	private String AD_IMGPATH;
	private String AD_IMGNAME;
	
	public int getAD_IDX() {
		return AD_IDX;
	}
	public void setAD_IDX(int aD_IDX) {
		AD_IDX = aD_IDX;
	}
	public String getAD_URL() {
		return AD_URL;
	}
	public void setAD_URL(String aD_URL) {
		AD_URL = aD_URL;
	}
	public String getAD_COMPANY() {
		return AD_COMPANY;
	}
	public void setAD_COMPANY(String aD_COMPANY) {
		AD_COMPANY = aD_COMPANY;
	}
	public Date getAD_REGDATE() {
		return AD_REGDATE;
	}
	public void setAD_REGDATE(Date aD_REGDATE) {
		AD_REGDATE = aD_REGDATE;
	}
	public int getAD_STATUS() {
		return AD_STATUS;
	}
	public void setAD_STATUS(int aD_STATUS) {
		AD_STATUS = aD_STATUS;
	}
	public String getAD_IMGPATH() {
		return AD_IMGPATH;
	}
	public void setAD_IMGPATH(String aD_IMGPATH) {
		AD_IMGPATH = aD_IMGPATH;
	}
	public String getAD_IMGNAME() {
		return AD_IMGNAME;
	}
	public void setAD_IMGNAME(String aD_IMGNAME) {
		AD_IMGNAME = aD_IMGNAME;
	}

	
}
