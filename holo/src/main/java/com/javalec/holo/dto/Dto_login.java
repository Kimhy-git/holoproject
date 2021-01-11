package com.javalec.holo.dto;

public class Dto_login {
	private String user_id;
	private String user_pw;
	private String nick;
	
	
	public Dto_login(String user_id, String user_pw, String nick) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.nick = nick;
	}
	
	
	
	public Dto_login(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}



	public Dto_login() {}

	
	public String getUser_id() {
		return user_id;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public String getNick() {
		return nick;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
}
