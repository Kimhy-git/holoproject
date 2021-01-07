package com.javalec.holo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.service.MemberService;

@Controller
public class LoginController {

	@Inject
    private MemberService service;
	
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
       
       return "login";
    }
    
    @RequestMapping(value = "/do_login", method = RequestMethod.POST)
    public String do_login(Dto_user dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
       
    	HttpSession session = req.getSession();
    	Dto_user login = service.login(dto);
    	
    	if(login==null) {
    		session.setAttribute("member", null);
    		rttr.addFlashAttribute("msg",false);
    	} else {
    		session.setAttribute("member", login);
    	}
    	
       return "redirect:main";
    }
	
    @RequestMapping(value="logout", method=RequestMethod.POST)
    public String logout(HttpSession session) throws Exception{
    	session.invalidate();
    	return "redirect:main";
    }
    
}