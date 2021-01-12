package com.javalec.holo.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javalec.holo.dto.Dto_login;
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.service.MemberService;

@Controller
public class LoginController {

	@Inject //@Autowired??
    private MemberService service;
	
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
       
       return "login";
    }
    
    @RequestMapping(value = "/do_login", method = RequestMethod.POST)
    public String do_login(HttpServletRequest request,
    		HttpSession session, RedirectAttributes attr) throws Exception {

    	Dto_login dto=new Dto_login();
    	
        dto = service.login(request);
        
        if(dto.getNick()==null || dto.getUser_id()==null) {
        	session.setAttribute("login",null);
        	attr.addFlashAttribute("msg","없는 아이디거나 잘못된 비밀번호 입니다");
        	return "redirect:login";
        } else {
        	session.setAttribute("login", dto);
        	return "redirect:main";
        }
    }
	
    @RequestMapping(value="logout", method={RequestMethod.POST,RequestMethod.GET})
    public ModelAndView logout(HttpSession session) throws Exception{
    	service.logout(session);
    	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("msg","logout");
		
    	return mav;
    }
    
    
    
    // Join
    @RequestMapping(value="join_submit", method = {RequestMethod.POST,RequestMethod.GET})
    public String join_submit(HttpServletRequest req,Model model) {
    	String user_id=req.getParameter("user_id");
    	String user_pw=req.getParameter("passcode");
    	String gender=req.getParameter("gender");
    	String nick=req.getParameter("nick");
    	String passwd_q=req.getParameter("passwd_q");
    	String passwd_a=req.getParameter("passwd_a");
    	String email=req.getParameter("email");
    	String mobile=req.getParameter("mobile");
    	String birth=req.getParameter("birth");
    	String[] ptag=req.getParameterValues("ptag");
		String tag=String.join(",", ptag);
		String cv=req.getParameter("cv");
		String address=req.getParameter("address01")+" "+req.getParameter("address02");
		System.out.println(address);
		System.out.println(user_id+", "+gender+", "+nick+", "+user_pw+", "+passwd_q+", "+passwd_a+", "+email+", birth: "+birth+", "+tag+", "+cv);
    	service.join_submit(user_id, user_pw, gender, nick, passwd_q, passwd_a, email, mobile, birth, address, tag, cv);
		return "login";
    }
    
    
    
}