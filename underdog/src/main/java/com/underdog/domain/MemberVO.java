package com.underdog.domain;

import java.security.Timestamp;

public class MemberVO {

	private String me_email; /* ȸ���̸��� */
	private String me_pw; /* ��й�ȣ */
	private String me_name; /* �̸� */
	private String me_nick; /* �г��� */
	private String me_birth; /* ������� */
	private Timestamp me_regdate; /* ȸ�������� */
	private int me_status; /* ȸ��Ż������ */
	private Timestamp me_exitdate; /* ȸ��Ż���� */
	private int me_grade; /* ȸ�� ��� */
	private String me_keyword; /* ���� �˻��� */
	private int me_point; /* ����Ʈ */
	private String me_zipcode; /* �����ȣ */
	private String me_add1; /* �ּ�1 */
	private String me_add2; /* �ּ�2 */
	
	public String getMe_email() {
		return me_email;
	}
	public void setMe_email(String me_email) {
		this.me_email = me_email;
	}
	public String getMe_pw() {
		return me_pw;
	}
	public void setMe_pw(String me_pw) {
		this.me_pw = me_pw;
	}
	public String getMe_name() {
		return me_name;
	}
	public void setMe_name(String me_name) {
		this.me_name = me_name;
	}
	public String getMe_nick() {
		return me_nick;
	}
	public void setMe_nick(String me_nick) {
		this.me_nick = me_nick;
	}
	public String getMe_birth() {
		return me_birth;
	}
	public void setMe_birth(String me_birth) {
		this.me_birth = me_birth;
	}
	public Timestamp getMe_regdate() {
		return me_regdate;
	}
	public void setMe_regdate(Timestamp me_regdate) {
		this.me_regdate = me_regdate;
	}
	public int getMe_status() {
		return me_status;
	}
	public void setMe_status(int me_status) {
		this.me_status = me_status;
	}
	public Timestamp getMe_exitdate() {
		return me_exitdate;
	}
	public void setMe_exitdate(Timestamp me_exitdate) {
		this.me_exitdate = me_exitdate;
	}
	public int getMe_grade() {
		return me_grade;
	}
	public void setMe_grade(int me_grade) {
		this.me_grade = me_grade;
	}
	public String getMe_keyword() {
		return me_keyword;
	}
	public void setMe_keyword(String me_keyword) {
		this.me_keyword = me_keyword;
	}
	public int getMe_point() {
		return me_point;
	}
	public void setMe_point(int me_point) {
		this.me_point = me_point;
	}
	public String getMe_zipcode() {
		return me_zipcode;
	}
	public void setMe_zipcode(String me_zipcode) {
		this.me_zipcode = me_zipcode;
	}
	public String getMe_add1() {
		return me_add1;
	}
	public void setMe_add1(String me_add1) {
		this.me_add1 = me_add1;
	}
	public String getMe_add2() {
		return me_add2;
	}
	public void setMe_add2(String me_add2) {
		this.me_add2 = me_add2;
	}
	
}
