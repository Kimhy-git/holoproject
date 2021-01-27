package com.javalec.holo;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.holo.dto.BoardSearch;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.dto.Pagination;
import com.javalec.holo.dto.Pagination_help;
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
	     
	// 	  List<Dto> memberList = service.selectMember();      
	//      model.addAttribute("memberList", memberList);
		  
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
	  
	   // 닉네임 중복 검사(AJAX)
	  @RequestMapping(value = "/check_nick_go", method = RequestMethod.POST)
	  	public void check_nick(@RequestParam("nick") String nick, HttpServletResponse response) throws Exception{
	  	System.out.println("닉넴이 뭔데ㅐ요? : "+nick);
		  service.check_nick(nick, response);
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
      
      
      @RequestMapping(value = "/admin", method = RequestMethod.GET)
      public String admin(HttpServletRequest req, Model model,
    		  				@RequestParam(required = false, defaultValue = "1") int page, 
    		  				@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
    	 //전체 게시글 수
  	 	 int listCnt = service.admin_user_list_count();
  	 	 System.out.println("listCnt: "+listCnt);
  		 //Pagination 객제 생성
  		 Pagination pagination = new Pagination();
  		 pagination.pageInfo(page, range, listCnt);
         List<Dto_user> user_list=service.admin_user_list(pagination);
         model.addAttribute("pagination", pagination);
         model.addAttribute("user_list", user_list);
         return "admin";
      }
      
      @RequestMapping(value = "/admin_search", method = RequestMethod.POST)
      public ModelAndView admin_search(HttpServletRequest req, Model model,
    		  				@RequestParam(defaultValue="1") int curPage,
    		  				@RequestParam(defaultValue="all") String search_option,
    		  				@RequestParam(required = false, defaultValue = "1") int page, 
    		  				@RequestParam(required = false, defaultValue = "1") int range,
    		  				@RequestParam(defaultValue="") String keyword ) throws Exception {
    	 
    	 //전체 로우 수
         int count = 1000;
         BoardSearch search = new BoardSearch();
         search.setSearch_option(search_option);
         search.setKeyword(keyword);
         int listCnt = service.admin_search_count(search);
    	  //전체 게시글 수
  	 	 //int listCnt = service.admin_user_list_count();
  	 	 System.out.println("애드민 써치 listCnt: "+listCnt);
  		 //Pagination 객제 생성
  		 Pagination pagination = new Pagination();
  		 pagination.pageInfo(page, range, listCnt);
  		 
  		 search.setPagination(pagination);
  		 
         List<Dto_user> user_list=service.admin_search(search);
         ModelAndView mav = new ModelAndView();
         Map<String,Object> map = new HashMap<String, Object>();    
         
         map.put("count", count);
         map.put("keyword", keyword);
         map.put("search_option", search_option);
         mav.addObject("map", map);
         mav.addObject("pagination", pagination); 
         mav.addObject("user_list", user_list);  
         System.out.println("애드민 map : "+map);
         mav.setViewName("admin_search");
         
         //model.addAttribute("pagination", pagination);
         model.addAttribute("user_list", user_list);
         return mav;
      }
      
      
      @RequestMapping(value = "/apply", method = RequestMethod.GET)
      public String apply() {
         
         return "apply";
      }
      @RequestMapping(value="/jusoPopup", method = {RequestMethod.POST,RequestMethod.GET})
      public String jusoPopup() {
    	  System.out.println("juso호출");
    	  return "jusoPopup";
      }

   
}