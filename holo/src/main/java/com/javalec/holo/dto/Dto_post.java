package com.javalec.holo.dto;

public class Dto_post {
	private int post_id;
	private String board;
	private String title;
	private String operator;
	private String content;
	private String img;
	private String user_user_id;
	private String nick;
	private String hit;
	private String replyCnt;
	
	public Dto_post() {}
	
	public Dto_post(String hit) {
		super();
		this.hit = hit;
	}

	public Dto_post(String title, String content, String img) {
		super();
		this.title = title;
		this.content = content;
		this.img = img;
	}


	public Dto_post(int post_id, String board, String title, String content, String img) {
		super();
		this.post_id = post_id;
		this.board = board;
		this.title = title;
		this.content = content;
		this.img = img;
	}
	
	public Dto_post(int post_id, String board, String title, String operator, String content, String img,
			String user_user_id, String nick, String hit, String replyCnt) {
		super();
		this.post_id = post_id;
		this.board = board;
		this.title = title;
		this.operator = operator;
		this.content = content;
		this.img = img;
		this.user_user_id = user_user_id;
		this.nick = nick;
		this.hit = hit;
		this.replyCnt = replyCnt;
	}

	public String getreplyCnt() {
		return replyCnt;
	}

	public void setreplyCnt(String replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getPost_id() {
		return post_id;
	}

	public String getBoard() {
		return board;
	}

	public String getTitle() {
		return title;
	}

	public String getoperator() {
		return operator;
	}

	public String getContent() {
		return content;
	}

	public String getImg() {
		return img;
	}

	public String getUser_user_id() {
		return user_user_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setoperator(String operator) {
		this.operator = operator;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setUser_user_id(String user_user_id) {
		this.user_user_id = user_user_id;
	}
	
	
}