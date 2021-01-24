package com.javalec.holo.dto;

public class Dto_chat {
	private int message_id;
	private String message_sender;
	private String message_receiver;
	private String message_content;
	private String message_sendTime;
	private int last_id;
	
	public Dto_chat() {};
	
	public Dto_chat(String message_sender, String message_receiver, String message_content) {
		super();
		this.message_sender = message_sender;
		this.message_receiver = message_receiver;
		this.message_content = message_content;
	}

	
	

	public Dto_chat(String message_sender, String message_receiver, int last_id) {
		super();
		this.message_sender = message_sender;
		this.message_receiver = message_receiver;
		this.last_id = last_id;
	}




	public int getLast_id() {
		return last_id;
	}




	public void setLast_id(int last_id) {
		this.last_id = last_id;
	}




	public int getMessage_id() {
		return message_id;
	}


	public String getMessage_sender() {
		return message_sender;
	}


	public String getMessage_receiver() {
		return message_receiver;
	}


	public String getMessage_content() {
		return message_content;
	}


	public String getMessage_sendTime() {
		return message_sendTime;
	}


	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}


	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}


	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}


	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}


	public void setMessage_sendTime(String message_sendTime) {
		this.message_sendTime = message_sendTime;
	}
	
	
	
}
