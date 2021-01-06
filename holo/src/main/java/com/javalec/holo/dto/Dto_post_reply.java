package com.javalec.holo.dto;

public class Dto_post_reply {

	private String post_id;
	private String board;
	private String title;
	private String operator;
	private String content;
	private String img;
	private String user_user_id;
	private String nick;
	private String hit;
	private String reply_cnt;
	
	private String reply_id;
	private String re_index;
	private String re_comment;
	private String re_class;
	private String re_order;
	private String groupNum;
	private String post_post_id;
	public Dto_post_reply(String post_id, String board, String title, String operator, String content, String img,
			String user_user_id, String nick, String hit, String reply_cnt, String reply_id, String re_index,
			String re_comment, String re_class, String re_order, String groupNum, String post_post_id) {
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
		this.reply_cnt = reply_cnt;
		this.reply_id = reply_id;
		this.re_index = re_index;
		this.re_comment = re_comment;
		this.re_class = re_class;
		this.re_order = re_order;
		this.groupNum = groupNum;
		this.post_post_id = post_post_id;
	}
	public String getPost_id() {
		return post_id;
	}
	public String getBoard() {
		return board;
	}
	public String getTitle() {
		return title;
	}
	public String getOperator() {
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
	public String getNick() {
		return nick;
	}
	public String getHit() {
		return hit;
	}
	public String getReply_cnt() {
		return reply_cnt;
	}
	public String getReply_id() {
		return reply_id;
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
	public String getPost_post_id() {
		return post_post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setOperator(String operator) {
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
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public void setReply_cnt(String reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
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
	public void setPost_post_id(String post_post_id) {
		this.post_post_id = post_post_id;
	}
	
	
}
