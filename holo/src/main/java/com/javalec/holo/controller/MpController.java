package com.javalec.holo.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_login;
import com.javalec.holo.service.MemberService;

@Controller
public class MpController {
	
	@Inject
    private MemberService service;
	
	@RequestMapping(value = "/mypage", method = {RequestMethod.POST,RequestMethod.GET})
    public String mypage(HttpServletRequest req, Model model) throws Exception {
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		
		String user_user_id=req.getParameter("user_user_id");
		List<Dto_freeboard> mylist = service.mylist(user_user_id);
		List<Dto_free_reply> myreply = service.myreply(user_user_id);
		model.addAttribute("mylist",mylist);
		model.addAttribute("myreply",myreply);
       return "mypage";
    }
	
    @RequestMapping(value = "/edit_mp", method = RequestMethod.GET)
    public String edit_mp(HttpServletRequest req) {
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	
       return "edit_mp";
    }
    
    @RequestMapping(value = "/apply_you", method = RequestMethod.GET)
    public String apply_you(HttpServletRequest req) {
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	
    	
       return "apply_you";
    }
    
    @RequestMapping(value = "/apply_me", method = RequestMethod.GET)
    public String apply_me(HttpServletRequest req) {
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	
    	
       return "apply_me";
    }
	
}
