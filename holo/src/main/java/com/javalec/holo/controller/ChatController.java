package com.javalec.holo.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.javalec.holo.dto.Dto_chat;
import com.javalec.holo.dto.Dto_login;
import com.javalec.holo.service.MemberService;

@Controller
public class ChatController {
	
	@Inject
    private MemberService service;
	
    @RequestMapping(value = "chat_pop", method = {RequestMethod.POST,RequestMethod.GET})
    public String chat_pop(HttpServletRequest req, Model model) throws Exception {
    	
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	
    	String applier=req.getParameter("applier");
   	  	model.addAttribute("applier", applier);
    	return "chat_pop";
    }
    
    @RequestMapping(value = "chat_send", method = {RequestMethod.POST,RequestMethod.GET})
    public @ResponseBody String user_user_id(@RequestParam("message_sender") String message_sender,
    							@RequestParam("message_receiver") String message_receiver,
    							@RequestParam("message_content") String message_content,
    							Model model) throws Exception {
    	System.out.println("chat_send start");
    	service.chat_send(message_sender, message_receiver, message_content);
    	System.out.println("chat_send end");
    	return "success";
    }
    
    @RequestMapping(value = "chat_read", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
    public @ResponseBody String chat_read(@RequestParam("message_sender") String message_sender,
    							@RequestParam("message_receiver") String message_receiver,
    							@RequestParam("last_id") int last_id,
    							Model model) throws Exception {
    	System.out.println("chat_read start");
    	List<Dto_chat> chat_list=service.chat_read(message_sender, message_receiver, last_id);
    	System.out.println("chat_read 01");
    	Gson gson = new Gson();
		String json = gson.toJson(chat_list);
    	System.out.println("chat_read end");
    	return json;
    }
    
}
