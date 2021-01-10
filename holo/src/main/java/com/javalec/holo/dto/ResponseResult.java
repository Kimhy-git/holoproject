package com.javalec.holo.dto;

public class ResponseResult {
	
	private String message;
	private boolean isSuccess;
	public String getMessage() {
		return message;
	}
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	
	

}
