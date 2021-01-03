package com.javalec.holo.dto;

import java.sql.Blob;

public class Help_postDto {
	String tag_area;
	int board;
	String title;
	String operator;
	String nick;
	String tag_job;
	String content;
	String img;
	String gender;
	int min_price;
	String payment;
	int complete;
	String user_user_id;
	
	public Help_postDto() {}
	
	public Help_postDto(String tag_area, String title, String tag_job, String content, String img, String gender,
			int min_price, String payment, String user_user_id) {
		super();
		this.tag_area = tag_area;
		this.title = title;
		this.tag_job = tag_job;
		this.content = content;
		this.img = img;
		this.gender = gender;
		this.min_price = min_price;
		this.payment = payment;
		this.user_user_id = user_user_id;
	}

	public Help_postDto(String tag_area, int board, String title, String operator, String nick, String tag_job,
			String content, String img, String gender, int min_price, String payment, int complete, String user_user_id) {
		super();
		this.tag_area = tag_area;
		this.board = board;
		this.title = title;
		this.operator = operator;
		this.nick = nick;
		this.tag_job = tag_job;
		this.content = content;
		this.img = img;
		this.gender = gender;
		this.min_price = min_price;
		this.payment = payment;
		this.complete = complete;
		this.user_user_id = user_user_id;
	}
	
	public String getTag_area() {
		return tag_area;
	}
	public int getBoard() {
		return board;
	}
	public String getTitle() {
		return title;
	}
	public String getOperator() {
		return operator;
	}
	public String getNick() {
		return nick;
	}
	public String getTag_job() {
		return tag_job;
	}
	public String getContent() {
		return content;
	}
	public String getImg() {
		return img;
	}
	public String getGender() {
		return gender;
	}
	public int getMin_price() {
		return min_price;
	}
	public String getPayment() {
		return payment;
	}
	public int getComplete() {
		return complete;
	}
	public String getUser_user_id() {
		return user_user_id;
	}
	public void setTag_area(String tag_area) {
		this.tag_area = tag_area;
	}
	public void setBoard(int board) {
		this.board = board;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setTag_job(String tag_job) {
		this.tag_job = tag_job;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setMin_price(int min_price) {
		this.min_price = min_price;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public void setUser_user_id(String user_user_id) {
		this.user_user_id = user_user_id;
	}
	
	
}
