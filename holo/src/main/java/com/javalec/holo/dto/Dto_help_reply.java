package com.javalec.holo.dto;

public class Dto_help_reply {
	private String help_reply_id;
	private String operator;
	private String board;
	private String re_index;
	private String re_comment;
	private String re_class;
	private String re_order;
	private String groupNum;
	private String help_post_post_id;
	private String user_user_id;
	
	public Dto_help_reply() {
	
}

	public Dto_help_reply(String help_reply_id, String operator, String board, String re_index, String re_comment,
			String re_class, String re_order, String groupNum, String help_post_post_id, String user_user_id) {
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

	public String getHelp_reply_id() {
		return help_reply_id;
	}

	public String getOperator() {
		return operator;
	}

	public String getBoard() {
		return board;
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

	public String getRe_order() {
		return re_order;
	}

	public String getGroupNum() {
		return groupNum;
	}

	public String getHelp_post_post_id() {
		return help_post_post_id;
	}

	public String getUser_user_id() {
		return user_user_id;
	}

	public void setHelp_reply_id(String help_reply_id) {
		this.help_reply_id = help_reply_id;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public void setBoard(String board) {
		this.board = board;
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

	public void setRe_order(String re_order) {
		this.re_order = re_order;
	}

	public void setGroupNum(String groupNum) {
		this.groupNum = groupNum;
	}

	public void setHelp_post_post_id(String help_post_post_id) {
		this.help_post_post_id = help_post_post_id;
	}

	public void setUser_user_id(String user_user_id) {
		this.user_user_id = user_user_id;
	}

}