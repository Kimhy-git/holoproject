package com.javalec.holo.dto;

public class BoardSearch {
	
	private String area;
	private String tagJob;
	private int board;
	private String search_option;
	private String keyword;
	private Pagination pagination;
	private Pagination_help pagination_help;
	
	
	
	
	
	public Pagination_help getPagination_help() {
		return pagination_help;
	}
	public void setPagination_help(Pagination_help pagination_help) {
		this.pagination_help = pagination_help;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getSearch_option() {
		return search_option;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getBoard() {
		return board;
	}
	public void setBoard(int board) {
		this.board = board;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	public String getTagJob() {
		return tagJob;
	}
	public void setTagJob(String tagJob) {
		this.tagJob = tagJob;
	}
	
}
