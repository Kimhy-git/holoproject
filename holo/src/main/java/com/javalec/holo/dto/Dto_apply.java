package com.javalec.holo.dto;

public class Dto_apply {
	private String apply_id;
	private String helpme_id;
	private String helpyou_id;
	private String tag;
	private String cv;
	private String operator;
	private String help_post_help_post_id;
	private String board;
	private String gender;
	private String applier;
	private String price;
	private String nick;
	private String title;
	private int likes;
	private int complete;
	private int choose;


	
	public int getChoose() {
		return choose;
	}
	public void setChoose(int choose) {
		this.choose = choose;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getNick() {
		return nick;
	}
	public String getTitle() {
		return title;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getApply_id() {
		return apply_id;
	}
	public String getHelpme_id() {
		return helpme_id;
	}
	public String getHelpyou_id() {
		return helpyou_id;
	}
	public String getTag() {
		return tag;
	}
	public String getCv() {
		return cv;
	}
	public String getOperator() {
		return operator;
	}
	public String getHelp_post_help_post_id() {
		return help_post_help_post_id;
	}
	public String getBoard() {
		return board;
	}
	public String getPrice() {
		return price;
	}

	public void setApply_id(String apply_id) {
		this.apply_id = apply_id;
	}
	public void setHelpme_id(String helpme_id) {
		this.helpme_id = helpme_id;
	}
	public void setHelpyou_id(String helpyou_id) {
		this.helpyou_id = helpyou_id;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public void setCv(String cv) {
		this.cv = cv;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public void setHelp_post_help_post_id(String help_post_help_post_id) {
		this.help_post_help_post_id = help_post_help_post_id;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Dto_apply() {}
	
	public Dto_apply(String apply_id, String helpme_id, String helpyou_id, String tag, 
			String cv, String operator, String help_post_help_post_id, String board, 
			String price, String gender, String applier, String nick, String title) {
		super();
		this.apply_id = apply_id;
		this.helpme_id = helpme_id;
		this.helpyou_id = helpyou_id;
		this.tag = tag;
		this.cv = cv;
		this.operator = operator;
		this.help_post_help_post_id = help_post_help_post_id;
		this.board = board;
		this.price = price;
		this.gender = gender;
		this.applier = applier;
		this.nick = nick;
		this.title = title;
	}
	public Dto_apply(String helpme_id, String tag, String cv, String help_post_help_post_id,
			String gender, String applier, String price, String nick, String title) {
		super();
		this.helpme_id = helpme_id;
		this.tag = tag;
		this.cv = cv;
		this.help_post_help_post_id = help_post_help_post_id;
		this.gender = gender;
		this.applier = applier;
		this.price = price;
		this.nick = nick;
		this.title = title;
	}

	public Dto_apply(String helpyou_id, String tag, String cv, String help_post_help_post_id, String board,
			String gender, String applier, String price, String nick, String title) {
		super();
		this.helpyou_id = helpyou_id;
		this.tag = tag;
		this.cv = cv;
		this.help_post_help_post_id = help_post_help_post_id;
		this.board = board;
		this.gender = gender;
		this.applier = applier;
		this.price = price;
		this.nick = nick;
		this.title = title;
	}
	public String getApplier() {
		return applier;
	}
	public void setApplier(String applier) {
		this.applier = applier;
	}
	
	
	//helpyou에서는 board 받아오기!
}
