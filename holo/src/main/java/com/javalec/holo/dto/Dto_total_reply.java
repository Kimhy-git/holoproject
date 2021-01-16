package com.javalec.holo.dto;

public class Dto_total_reply {
	private String reply_id;
	private String board;
	private String operator;
	private String re_comment;
	private String post_post_id;
	private String user_user_id;
	

	public Dto_total_reply() {}
	
	public Dto_total_reply(String reply_id, String board, String operator, String re_comment, String post_post_id,
			String user_user_id) {
		super();
		this.reply_id = reply_id;
		this.board = board;
		this.operator = operator;
		this.re_comment = re_comment;
		this.post_post_id = post_post_id;
		this.user_user_id = user_user_id;
	}


	public String getReply_id() {
		return reply_id;
	}


	public String getBoard() {
		return board;
	}


	public String getOperator() {
		return operator;
	}


	public String getRe_comment() {
		return re_comment;
	}


	public String getPost_post_id() {
		return post_post_id;
	}


	public String getUser_user_id() {
		return user_user_id;
	}


	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}


	public void setBoard(String board) {
		this.board = board;
	}


	public void setOperator(String operator) {
		this.operator = operator;
	}


	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}


	public void setPost_post_id(String post_post_id) {
		this.post_post_id = post_post_id;
	}


	public void setUser_user_id(String user_user_id) {
		this.user_user_id = user_user_id;
	}
	
	
}
