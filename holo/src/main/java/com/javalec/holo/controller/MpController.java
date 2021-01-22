package com.javalec.holo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.holo.dto.Dto_apply;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_login;
import com.javalec.holo.dto.Dto_total;
import com.javalec.holo.dto.Dto_total_reply;
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.dto.Pagination;
import com.javalec.holo.dto.Pagination_help;
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
		Dto_user mp_user = service.mp_user(dto.getUser_id());
		model.addAttribute("user", mp_user);
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
	
	@RequestMapping(value = "/mypage_myposts", method = {RequestMethod.POST,RequestMethod.GET})
    public String mypage_mypage_myposts(@RequestParam(required = false, defaultValue = "1") int page, 
										@RequestParam(required = false, defaultValue = "1") int range,
										HttpServletRequest req, Model model) throws Exception {
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		String user_user_id=dto.getUser_id();
		//전체 게시글 수
		int listCnt = service.mypage_total_list_count(user_user_id);
		System.out.println("mypage_myposts listCnt: "+listCnt);
		//Pagination 객제 생성
		Pagination pagination = new Pagination();
		pagination.pageInfo_mypage(page, range, listCnt, user_user_id);
		
		System.out.println("controller user_id: "+user_user_id);
		List<Dto_total> total_list=service.mypage_total_list(pagination);
		System.out.println("controller startPage: "+pagination.getStartPage());
		System.out.println("controller EndPage: "+pagination.getEndPage());
		model.addAttribute("pagination",pagination);
		model.addAttribute("mylist",total_list);
       return "mypage_myposts";
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
    
    @RequestMapping(value = "/apply_you", method = {RequestMethod.POST,RequestMethod.GET})
    public String apply_you(HttpServletRequest req,Model model) {
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		int post_id=Integer.parseInt(req.getParameter("post_id"));
    	List<Dto_apply> list=service.mypage_applyme_list(post_id);
    	model.addAttribute("list",list);
       return "apply_you";
    }
    
    @RequestMapping(value = "/apply_me", method = {RequestMethod.POST,RequestMethod.GET})
    public String apply_me(HttpServletRequest req,Model model) {
    	Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	int post_id=Integer.parseInt(req.getParameter("post_id"));
    	List<Dto_apply> list=service.mypage_applyyou_list(post_id);
    	model.addAttribute("list",list);
       return "apply_me";
    }
	
    @RequestMapping(value = "/request_popup", method = {RequestMethod.POST,RequestMethod.GET})
    public String request_popup(HttpServletRequest req, Model model) {
      	
    		String nick=req.getParameter("nick");
        	String help_post_help_post_id=req.getParameter("post_id");
        	String helpyou_id=req.getParameter("user_id");
        	String title=req.getParameter("title");
        	String price=req.getParameter("price");
        	
        	model.addAttribute("nick",nick);
        	model.addAttribute("price",price);
        	System.out.println("price: "+price);
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
      	String nick=req.getParameter("nick");
      	String title=req.getParameter("title");
    	
    	System.out.println("gender/tag/price/cv/helpme_id/help_post_help_post_id/applier/nick/title : ");
    	System.out.println(gender+" / "+tag+" / "+price+" / "+cv+" / "+board
    			+" / "+helpyou_id+" / "+help_post_help_post_id+" / "+nick+" / "+title);
    	service.add_apply_you(helpyou_id, tag, cv,board, help_post_help_post_id, gender, applier, price,nick,title);
    	 
    	return "done";
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
  	 
      return "done";
   }
   
   @RequestMapping(value = "/leave", method = RequestMethod.POST)
   public String leave(HttpServletRequest req) throws Exception {
   	
   	  String user_id=req.getParameter("user_id");
	 	  System.out.println("리브 유저 id="+user_id);
	 	  service.leave(user_id);
	 	  
	    return "redirect:logout";
   }
   
   @RequestMapping(value = "/help_complete", produces="application/json;charset=UTF-8")
   public @ResponseBody String help_complete(@RequestParam("post_id") String post_id,
		   									@RequestParam("apply_id") String apply_id) {
	   System.out.println("help_complete");
	   System.out.println("post_id: "+post_id);
	   int help_post_id=Integer.parseInt(post_id);
	   service.help_complete(help_post_id);
	   System.out.println("apply_id: "+apply_id);
	   int apply=Integer.parseInt(apply_id);
	   service.mypage_applyme_choose(apply);
	   String complete="채택이 완료되었습니다.";
	   return complete;
   }
   
   @RequestMapping(value = "/applier_like", produces="application/json;charset=UTF-8")
   public @ResponseBody String applier_like(@RequestParam("applier") String applier) {
	   System.out.println("applier_like: "+applier);
	   service.mypage_applier_like(applier);
	   String complete="추천이 완료되었습니다.";
	   return complete;
   }
   @RequestMapping(value = "/mp_popup", method = RequestMethod.POST)
   public String mp_popup(HttpServletRequest req, Model model) throws Exception {
 	  Dto_login dto = new Dto_login();
		  HttpSession session = req.getSession();
		  dto=(Dto_login)session.getAttribute("login");
 	  
 	  
 	  String user_id=req.getParameter("user_id");
 	  int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
 	  model.addAttribute("user_id",user_id);
 	  model.addAttribute("post_id",help_post_id);
 	  System.out.println("유저아이디 : "+user_id+" 포스트아이디 : "+help_post_id);
 	  Dto_help_post read = service.read(help_post_id);
 	  Dto_user mp_user = service.mp_user(user_id);
 	  System.out.println("read and mp_user has finished");
 	  
		 
		  List<Dto_total_reply>total_reply = service.total_reply_pop(user_id);
		  model.addAttribute("total_reply",total_reply);  		
		  System.out.println("total_reply has finished");
		  
		  List<Dto_total> total_list=service.mypage_total_list_pop(user_id);
		  System.out.println("controller list: "+total_list);
		  model.addAttribute("mylist",total_list);

 	  model.addAttribute("read", read);
 	  model.addAttribute("mp_user", mp_user);

 	  return "mp_popup";
   }

   @RequestMapping(value = "cancel_apply", method = {RequestMethod.POST,RequestMethod.GET})
   public String cancel_apply(HttpServletRequest req) throws Exception {
   	
   	  	  String apply_id=req.getParameter("apply_id");
	 	  System.out.println("cancel_apply : "+apply_id);
	 	  service.cancel_apply(apply_id);
	 	  
	 	  Dto_login dto = new Dto_login();
	 	  HttpSession session = req.getSession();
	 	  dto=(Dto_login)session.getAttribute("login");
			
	 	  System.out.println("cancel apply has finished");
	 	 return "redirect:mypage_apply";
   }
}
