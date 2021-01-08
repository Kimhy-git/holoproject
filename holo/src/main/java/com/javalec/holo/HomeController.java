package com.javalec.holo;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.holo.dto.Dto;
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

      @RequestMapping(value = "/join", method = RequestMethod.GET)
      public String join() {
         
         return "join";
      }
      @RequestMapping(value = "/find_id", method = RequestMethod.GET)
      public String find_id() {
         
         return "find_id";
      }
      @RequestMapping(value = "/try_find_pw", method = RequestMethod.GET)
      public String find_pw(HttpServletRequest req, Model model)throws Exception  {

			String user_id=req.getParameter("user_id");
			String passwd_q=req.getParameter("passwd_q");
	    	String passwd_a=req.getParameter("passwd_a");

			service.find_pw(user_id, passwd_q, passwd_a);
			
			

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