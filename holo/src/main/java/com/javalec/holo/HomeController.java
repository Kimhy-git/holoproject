package com.javalec.holo;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

      @RequestMapping(value = "/join", method = RequestMethod.GET)
      public String join() {
         
         return "join";
      }
      @RequestMapping(value = "/find_id", method = RequestMethod.GET)
      public String find_id() {
         
         return "find_id";
      }
      @RequestMapping(value = "find_pw", method = RequestMethod.GET)
      public String find_pw(HttpServletRequest req, Model model)throws Exception  {

			//service.checkQueestionPw(user_id, passwd_q, passwd_a);
	
         return "find_pw";
      }
      @RequestMapping(value = "/find_pw", method = RequestMethod.POST)
      @ResponseBody
      public String find_pw2(HttpServletRequest req, Model model, Dto_user user)throws Exception  {
    	  
    	  String user_id=req.getParameter("user_id");
    	  String passwd_q=req.getParameter("passwd_q");
    	  String passwd_a=req.getParameter("passwd_a");
    	  String responseResult = null;
    	 // service.checkQueestionPw(user_id, passwd_q, passwd_a);
    	int checkedUserResult =  service.checkQueestionPw2(user);
    	
    	if(0 < checkedUserResult) {
    		responseResult = "";
    		Dto_user resUser = service.getUserByUserId(user.getUser_id());
    		responseResult  = "Your password is ("+resUser.getUser_pw()+") .";    		
    	}else {
    		responseResult = "Fail to find password. please try again";
    	}  	  
    	  return responseResult;
      } //비밀번호 찾기 작동
      
      
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