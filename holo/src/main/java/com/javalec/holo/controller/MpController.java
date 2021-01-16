package com.javalec.holo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.holo.dto.Dto_apply;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_login;
import com.javalec.holo.dto.Dto_total_reply;
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.dto.Pagination;
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
        return "mypage";
    }
	
	@RequestMapping(value = "/mypage_mycomments", method = {RequestMethod.POST,RequestMethod.GET})
    public String mypage_mycomments(HttpServletRequest req, Model model,
    		@RequestParam(required = false, defaultValue = "1") int page, 
    		@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		
  		//전체 댓글 수
  		int listCnt = service.total_reply_count(dto.getUser_id());
  		System.out.println("listCnt: "+listCnt);
  		
  		//Pagination 객제 생성
  		Pagination pagination = new Pagination();
  		pagination.pageInfo(page, range, listCnt);
        model.addAttribute("pagination", pagination);
        System.out.println("range: "+pagination.getRange());
		
		List<Dto_total_reply>total_reply = service.total_reply(dto.getUser_id(),pagination);
		model.addAttribute("total_reply",total_reply);
		List<Dto_apply> apply=service.applier(dto.getUser_id());
		model.addAttribute("apply",apply);
		
       return "mypage_mycomments";
    }
	
	@RequestMapping(value = "/mypage_apply", method = {RequestMethod.POST,RequestMethod.GET})
    public String mypage_apply(HttpServletRequest req, Model model,
    		@RequestParam(required = false, defaultValue = "1") int page, 
    		@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		
  		//전체 지원한 게시글 수
  		int listCnt = service.total_apply_count(dto.getUser_id());
  		
  		//Pagination 객제 생성
  		Pagination pagination = new Pagination();
  		pagination.pageInfo(page, range, listCnt);
        model.addAttribute("pagination", pagination);
        System.out.println("range: "+pagination.getRange());
		
		List<Dto_apply>total_apply = service.total_apply(dto.getUser_id(),pagination);
		model.addAttribute("total_apply",total_apply);

       return "mypage_apply";
    }
	
    @RequestMapping(value = "/edit_mp", method = {RequestMethod.POST,RequestMethod.GET})
    public String edit_mp(HttpServletRequest req, Model model) throws Exception {
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	System.out.println("edit_mp 스타트~!");
  	   String user_id=req.getParameter("user_id");
       System.out.println("유저아이디 : "+user_id);
       Dto_user mp_user = service.mp_user(user_id);
       model.addAttribute("mp_user",mp_user);
       return "edit_mp";
    }
    
    @RequestMapping(value = "/editmp_go", method = {RequestMethod.POST,RequestMethod.GET})
    public String editmp_go(HttpServletRequest req, Model model) throws Exception {
  	System.out.println("editmp_go 작동");
  	String user_pw=req.getParameter("passcode");
    	String nick=req.getParameter("nick");
    	String passwd_q=req.getParameter("passwd_q");
    	String passwd_a=req.getParameter("passwd_a");
    	String mobile=req.getParameter("mobile");
    	String address=req.getParameter("address00")+
		      			req.getParameter("address01")+" "+
		      			req.getParameter("address02");
		
    	System.out.println(address);
    	
    	String[] ptag=req.getParameterValues("ptag");
		String tag=String.join(",", ptag);
		String cv=req.getParameter("cv");
		String user_id=req.getParameter("user_id");
		System.out.println("유저아이디"+user_id);
		System.out.println(nick + ","+user_pw+", "+passwd_q+", "+passwd_a+", "+tag+", "+cv);
    	service.mp_edit(user_pw,nick, passwd_q, passwd_a,mobile,address, tag, cv, user_id);
       
       return "redirect:edit_mp?user_id="+user_id;
    }
    
    @RequestMapping(value = "/apply_you", method = RequestMethod.GET)
    public String apply_you(HttpServletRequest req) {
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	
    	String user_id=dto.getUser_id();
    	
       return "apply_you";
    }
    
    @RequestMapping(value = "/apply_me", method = RequestMethod.GET)
    public String apply_me(HttpServletRequest req) {
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	
    	
       return "apply_me";
    }
	
    @RequestMapping(value = "/request_popup", method = {RequestMethod.POST,RequestMethod.GET})
    public String request_popup(HttpServletRequest req, Model model) {
      	
    		String nick=req.getParameter("nick");
        	String help_post_help_post_id=req.getParameter("post_id");
        	String helpyou_id=req.getParameter("user_id");
        	String title=req.getParameter("title");
        	
        	model.addAttribute("nick",nick);
        	model.addAttribute("help_post_help_post_id",help_post_help_post_id);
        	model.addAttribute("helpyou_id",helpyou_id);
        	model.addAttribute("title",title);
    		
    		Dto_login dto = new Dto_login();
    		HttpSession session = req.getSession();
    		dto=(Dto_login)session.getAttribute("login");
  	  
       return "request_popup";
    }
    @RequestMapping(value = "/request_go", method = {RequestMethod.POST,RequestMethod.GET})
    public String request_go(HttpServletRequest req, Model model) {
       
    	String gender=req.getParameter("gender");
    	String tag=req.getParameter("tag");
    	String price=req.getParameter("price");
    	String cv=req.getParameter("cv");
    	String helpyou_id=req.getParameter("helpyou_id");
    	String help_post_help_post_id=req.getParameter("help_post_help_post_id");
    	String applier=req.getParameter("applier");
    	String board="0";
    	
    	System.out.println("gender/tag/price/cv/helpme_id/help_post_help_post_id/applier : ");
    	System.out.println(gender+" / "+tag+" / "+price+" / "+cv+" / "+board
    			+" / "+helpyou_id+" / "+help_post_help_post_id);
    	service.add_apply_you(helpyou_id, tag, cv,board, help_post_help_post_id, gender, applier, price);
    	 
    	return "main";
    }
 
    
    //apply_popup
   @RequestMapping(value="/apply_popup", method = {RequestMethod.POST,RequestMethod.GET})
		public String apply_popup(HttpServletRequest req, Model model) throws Exception{

    	String nick=req.getParameter("nick");
    	String help_post_help_post_id=req.getParameter("post_id");
    	String helpme_id=req.getParameter("user_id");
    	String title=req.getParameter("title");
    	
    	model.addAttribute("nick",nick);
    	model.addAttribute("help_post_help_post_id",help_post_help_post_id);
    	model.addAttribute("helpme_id",helpme_id);
    	model.addAttribute("title",title);
		
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		
		return "apply_popup";
	}
   
   //apply_go : receive name, price
   @RequestMapping(value = "apply_go", method = RequestMethod.POST)
   public String apply_go(HttpServletRequest req, Model model) {
      
  	 System.out.println("apply_go");

  	String gender=req.getParameter("gender");
  	String tag=req.getParameter("tag");
  	String price=req.getParameter("price");
  	String cv=req.getParameter("cv");
  	String helpme_id=req.getParameter("helpme_id");
  	String help_post_help_post_id=req.getParameter("help_post_help_post_id");
  	String applier=req.getParameter("applier");
  	String nick=req.getParameter("nick");
  	String title=req.getParameter("title");
  	
  	System.out.println("gender/tag/price/cv/helpme_id/help_post_help_post_id/applier/nick/title : ");
  	System.out.println(gender+" / "+tag+" / "+price+" / "+cv
  			+" / "+helpme_id+" / "+help_post_help_post_id+" / "+nick+" / "+title);
  	service.add_apply_me(helpme_id, tag, cv, help_post_help_post_id, gender, applier, price,nick,title);
  	 
      return "main";
   }
   
   @RequestMapping(value = "/leave", method = RequestMethod.POST)
   public String leave(HttpServletRequest req) throws Exception {
   	
   	  String user_id=req.getParameter("user_id");
	 	  System.out.println("리브 유저 id="+user_id);
	 	  service.leave(user_id);
	 	  
      return "redirect:main";
   }
}
