package com.javalec.holo.dto;

import java.sql.Timestamp;

public class Dto_help_post {	
	private int help_post_id;
	private String tag_area;
	private int board;
	private String title;
	private String operator;
	private String nick;
	private String tag_job;
	private String content;
	private String img;
	private String gender;
	private int min_price;
	private String payment;
	private int complete;
	private String user_user_id;
	private int hit;
	private int likes;
	private String replyCnt;
	private String birth;
	private String tag;
	private String cv;
	
	public Dto_help_post() {}
	
	public Dto_help_post(String title, String content, String tag_area, String tag_job, String gender, String payment,
			int min_price,String img, String user_user_id) {
		super();
		this.tag_area = tag_area;
		this.title = title;
		this.tag_job = tag_job;
		this.content = content;
		this.gender = gender;
		this.min_price = min_price;
		this.payment = payment;
		this.img=img;
		this.user_user_id=user_user_id;
	}
	
	
	public Dto_help_post(int help_post_id, String tag_area, String title, String tag_job, String content, String img,
			String gender, int min_price, String payment, String user_user_id) {
		super();
		this.help_post_id = help_post_id;
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

/*	public Dto_help_post(String tag_area,String title,String tag_job,String content,String img,String gender,int min_price,String payment,String user_user_id) {
		this.tag_area = tag_area;
		this.title = title;
		this.tag_job = tag_job;
		this.content = content;
		this.gender = gender;
		this.min_price = min_price;
		this.payment = payment;
		this.user_user_id = user_user_id;
	}*/

	public Dto_help_post(int help_post_id, String tag_area, int board, String title, String operator, String nick,
			String tag_job, String content, String img, String gender, int min_price, String payment, int complete,
			String user_user_id,int hit,int likes,String replyCnt, String birth, String tag, String cv) {
		super();
		this.help_post_id = help_post_id;
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
		this.hit=hit;
		this.likes=likes;
		this.replyCnt = replyCnt;
		this.birth = birth;
		this.tag = tag;
		this.cv = cv;
	}


	public Dto_help_post(String title, String content, String gender, String tag_area, String tag_job, String payment,
			int min_price, int help_post_id, String img) {
		this.tag_area = tag_area;
		this.title = title;
		this.tag_job = tag_job;
		this.content = content;
		this.gender = gender;
		this.min_price = min_price;
		this.payment = payment;
		this.help_post_id = help_post_id;
		this.img=img;
	}
	
	public void Dto_helpyou_list(String tag_area,String title,String tag_job,String content,String img,String gender,int min_price,String payment,String user_user_id) {
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
	
	public String getBirth() {
		return birth;
	}

	public String getTag() {
		return tag;
	}

	public String getCv() {
		return cv;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setCv(String cv) {
		this.cv = cv;
	}

	public String getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(String replyCnt) {
		this.replyCnt = replyCnt;
	}

	public int getHelp_post_id() {
		return help_post_id;
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
	public int getHit() {
		return hit;
	}
	
	public int getlikes() {
		return likes;
	}

	public void setHelp_post_id(int help_post_id) {
		this.help_post_id = help_post_id;
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
	
	public void setHit(int hit) {
		this.hit=hit;
	}
	
	public void setlikes(int likes) {
		this.likes=likes;
	}
	
	
}