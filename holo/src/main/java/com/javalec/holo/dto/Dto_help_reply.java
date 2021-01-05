package com.javalec.holo.dto;

import java.sql.Timestamp;

public class Dto_help_reply {
	private int help_reply_id;
	private Timestamp operator;
	private int board;
	private int re_index;
	private String re_comment;
	private int re_class;
	private int re_order;
	private int groupNum;
	private int help_post_post_id;
	private String user_user_id;
	
	public Dto_help_reply() {
	
}



	public Dto_help_reply(int help_reply_id, Timestamp operator, int board, int re_index, String re_comment, int re_class,
			int re_order, int groupNum, int help_post_post_id, String user_user_id) {
		super();
		this.help_reply_id = help_reply_id;
		this.operator = operator;
		this.board = board;
		this.re_index = re_index;
		this.re_comment = re_comment;
		this.re_class = re_class;
		this.re_order = re_order;
		this.groupNum = groupNum;
		this.help_post_post_id = help_post_post_id;
		this.user_user_id = user_user_id;
	}



	public Dto_help_reply(String re_comment, int help_post_post_id, String user_user_id) {
		super();
		this.re_comment = re_comment;
		this.help_post_post_id = help_post_post_id;
		this.user_user_id = user_user_id;
	}



	public Dto_help_reply(String re_comment, int help_post_post_id) {
		// TODO Auto-generated constructor stub
		this.re_comment=re_comment;
		this.help_post_post_id=help_post_post_id;
	}



	public int getHelp_reply_id() {
		return help_reply_id;
	}



	public Timestamp getOperator() {
		return operator;
	}



	public int getBoard() {
		return board;
	}



	public int getRe_index() {
		return re_index;
	}



	public String getRe_comment() {
		return re_comment;
	}



	public int getRe_class() {
		return re_class;
	}



	public int getRe_order() {
		return re_order;
	}



	public int getGroupNum() {
		return groupNum;
	}



	public int getHelp_post_post_id() {
		return help_post_post_id;
	}



	public String getUser_user_id() {
		return user_user_id;
	}



	public void setHelp_reply_id(int help_reply_id) {
		this.help_reply_id = help_reply_id;
	}



	public void setOperator(Timestamp operator) {
		this.operator = operator;
	}



	public void setBoard(int board) {
		this.board = board;
	}



	public void setRe_index(int re_index) {
		this.re_index = re_index;
	}



	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}



	public void setRe_class(int re_class) {
		this.re_class = re_class;
	}



	public void setRe_order(int re_order) {
		this.re_order = re_order;
	}



	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}



	public void setHelp_post_post_id(int help_post_post_id) {
		this.help_post_post_id = help_post_post_id;
	}



	public void setUser_user_id(String user_user_id) {
		this.user_user_id = user_user_id;
	}
	
	
}