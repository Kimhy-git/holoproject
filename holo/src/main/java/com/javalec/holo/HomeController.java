package com.javalec.holo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.service.MemberService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Inject
    private MemberService service;
    
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model){
 
        logger.info("home");
 
        return "home";
    }
   
   
      @RequestMapping(value = "/main", method = RequestMethod.GET)
      public String main(Model model) throws Exception{
         
//     	  List<Dto> memberList = service.selectMember();      
//          model.addAttribute("memberList", memberList);
    	  
          return "main";
      }

      @RequestMapping(value = "/address", method = RequestMethod.GET)
      public String address() {
         
         return "address";
      }

      @RequestMapping(value = "/join", method = RequestMethod.GET)
      public String join(Dto_user dto) throws Exception {
         
         return "join";
      }
      @RequestMapping(value = "/find_id", method = RequestMethod.GET)
      public String find_id() {
         
         return "find_id";
      }
      
      @RequestMapping(value = "/find_id_go", method = RequestMethod.POST)
      public String find_id_go(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
    	  md.addAttribute("id", service.find_id(response, email));
  		
         return "find_id_complete";
      }
      
      // 아이디 중복 검사(AJAX)
      @RequestMapping(value = "/check_id_go", method = RequestMethod.POST)
		public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		service.check_id(id, response);
	  }
      
	   // 이메일 중복 검사(AJAX)
	  @RequestMapping(value = "/check_email_go", method = RequestMethod.POST)
	  	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
	  	service.check_email(email, response);
	  }
  	
      
      @RequestMapping(value = "/find_pw", method = RequestMethod.GET)
      public String find_pw() {
         
         return "find_pw";
      }
      @RequestMapping(value = "/mypage", method = RequestMethod.GET)
      public String mypage() {
         
         return "mypage";
      }
      @RequestMapping(value = "/edit_mp", method = RequestMethod.GET)
      public String edit_mp() {
         
         return "edit_mp";
      }
//      @RequestMapping(value = "/help_me", method = RequestMethod.GET)
//      public String help_me() {
//         
//         return "help_me";
//      }
//      @RequestMapping(value = "/helpme_write", method = RequestMethod.GET)
//      public String helpme_write() {
//         
//         return "helpme_write";
//      }
//      @RequestMapping(value = "/helpme_write_view", method = RequestMethod.GET)
//      public String helpme_write_view() {
//         
//         return "helpme_write_view";
//      }
      @RequestMapping(value = "/admin", method = RequestMethod.GET)
      public String admin() {
         
         return "admin";
      }
      @RequestMapping(value = "/apply_you", method = RequestMethod.GET)
      public String apply_you() {
         
         return "apply_you";
      }
      @RequestMapping(value = "/apply_me", method = RequestMethod.GET)
      public String apply_me() {
         
         return "apply_me";
      }
      @RequestMapping(value = "/apply", method = RequestMethod.GET)
      public String apply() {
         
         return "apply";
      }
   
}