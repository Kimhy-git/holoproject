package com.javalec.holo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
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
    public ModelAndView do_login(@ModelAttribute Dto_user dto, HttpSession session) throws Exception {
       
    	boolean result = service.login(dto,session);
    	ModelAndView mav = new ModelAndView();

    	if(result==true) {
    		mav.setViewName("main");
    		mav.addObject("msg","success");
    	} else {
    		mav.setViewName("login");
    		mav.addObject("msg","fail");
    	}
    	
       return mav;
    }
	
    @RequestMapping(value="logout", method=RequestMethod.POST)
    public ModelAndView logout(HttpSession session) throws Exception{
    	service.logout(session);
    	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("msg","logout");
		
    	return mav;
    }
    
}