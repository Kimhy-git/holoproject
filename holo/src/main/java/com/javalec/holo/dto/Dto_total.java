package com.javalec.holo.dto;

public class Dto_total {
	private String user_id;
	private int post_id;
	private String title;
	private int board;
	private String operator;
	private int hit;
	
	public Dto_total() {};
	
	public Dto_total(String user_id, int post_id, String title, int board, String operator, int hit) {
		super();
		this.user_id = user_id;
		this.post_id = post_id;
		this.title = title;
		this.board = board;
		this.operator = operator;
		this.hit = hit;
	}

	public String getUser_id() {
		return user_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public String getTitle() {
		return title;
	}

	public int getBoard() {
		return board;
	}

	public String getOperator() {
		return operator;
	}

	public int getHit() {
		return hit;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setBoard(int board) {
		this.board = board;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
