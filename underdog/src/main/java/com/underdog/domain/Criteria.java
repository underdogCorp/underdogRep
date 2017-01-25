package com.underdog.domain;

public class Criteria {

	private int page;
	private int perPageNum;
	private String bo_bbsid;
	private int bo_idx;
	private String state;

	
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getBo_idx() {
		return bo_idx;
	}

	public void setBo_idx(int bo_idx) {
		this.bo_idx = bo_idx;
	}

	public String getBo_bbsid() {
		return bo_bbsid;
	}

	public void setBo_bbsid(String bo_bbsid) {
		this.bo_bbsid = bo_bbsid;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) {

		if (page <= 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}

		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	// method for MyBatis SQL Mapper -
	public int getPageStart() {

		return (this.page - 1) * perPageNum;
	}

	// method for MyBatis SQL Mapper
	public int getPerPageNum() {

		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", " + "perPageNum=" + perPageNum + "]";
	}
}
