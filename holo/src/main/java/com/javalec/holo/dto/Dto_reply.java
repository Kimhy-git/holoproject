package com.javalec.holo.dto;

public class Dto_reply {
	private String reply_id;
	private String board;
	private String operator;
	private String re_index;
	private String re_comment;
	private String re_class;
	private String order;
	private String groupNum;
	private String post_post_id;
	private String user_user_id;
	
	public Dto_reply() {}
	public Dto_reply(String reply_id, String board, String operator, String re_index, String re_comment,
			String re_class, String order, String groupNum, String post_post_id, String user_user_id) {
		super();
		this.reply_id = reply_id;
		this.board = board;
		this.operator = operator;
		this.re_index = re_index;
		this.re_comment = re_comment;
		this.re_class = re_class;
		this.order = order;
		this.groupNum = groupNum;
		this.post_post_id = post_post_id;
		this.user_user_id = user_user_id;
	}
	public String getUser_user_id() {
		return user_user_id;
	}
	public void setUser_user_id(String user_user_id) {
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
	public String getRe_index() {
		return re_index;
	}
	public String getRe_comment() {
		return re_comment;
	}
	public String getRe_class() {
		return re_class;
	}
	public String getOrder() {
		return order;
	}
	public String getGroupNum() {
		return groupNum;
	}
	public String getPost_post_id() {
		return post_post_id;
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
	public void setRe_index(String re_index) {
		this.re_index = re_index;
	}
	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}
	public void setRe_class(String re_class) {
		this.re_class = re_class;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public void setGroupNum(String groupNum) {
		this.groupNum = groupNum;
	}
	public void setPost_post_id(String post_post_id) {
		this.post_post_id = post_post_id;
	}
}
