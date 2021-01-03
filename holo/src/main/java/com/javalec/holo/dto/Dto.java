package com.javalec.holo.dto;

public class Dto {
	private String user_id;
	private String user_pw;
	private String gender;
	private String nick;
	private String passwd_q;
	private String passwd_a;
	private String email;
	private String mobile;
	private int birth;
	private String address;
	private int likes;
	private String tag;
	private String cv;
	
	public Dto() {}

	public Dto(String user_id, String user_pw, String gender, String nick, String passwd_q, String passwd_a,
			String email, String mobile, int birth, String address, int likes, String tag, String cv) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.gender = gender;
		this.nick = nick;
		this.passwd_q = passwd_q;
		this.passwd_a = passwd_a;
		this.email = email;
		this.mobile = mobile;
		this.birth = birth;
		this.address = address;
		this.likes = likes;
		this.tag = tag;
		this.cv = cv;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public String getGender() {
		return gender;
	}

	public String getNick() {
		return nick;
	}

	public String getPasswd_q() {
		return passwd_q;
	}

	public String getPasswd_a() {
		return passwd_a;
	}

	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}

	public int getBirth() {
		return birth;
	}

	public String getAddress() {
		return address;
	}

	public int getLikes() {
		return likes;
	}

	public String getTag() {
		return tag;
	}

	public String getCv() {
		return cv;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public void setPasswd_q(String passwd_q) {
		this.passwd_q = passwd_q;
	}

	public void setPasswd_a(String passwd_a) {
		this.passwd_a = passwd_a;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setCv(String cv) {
		this.cv = cv;
	}
	
	
	
	
}
