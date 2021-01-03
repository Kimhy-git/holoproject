package com.javalec.holo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Help_postDto;
import com.javalec.holo.service.MemberService;
import com.javalec.holo.servlet.FileuploadServlet;

@Controller
public class BoardController {
	
	@Inject
    private MemberService service;
	
	//helpme
	@RequestMapping(value="/helpme_write_go", method = RequestMethod.POST)
    public String helpme_write_go(HttpServletRequest req, Model model)throws Exception {
	    	  
			System.out.println("helpme_write_go작동");

	  String title=req.getParameter("title");
		  String content=req.getParameter("content"); 
		  String tag_area=req.getParameter("tag_area");
		  String tag_job=req.getParameter("tag_job"); 
		  String gender=req.getParameter("gender"); 
		  int min_price=Integer.parseInt(req.getParameter("min_price"));
		  String payment=req.getParameter("payment");

		  System.out.println(title+","+content+","+tag_area+","+tag_job+","
													+gender+","+min_price+","+payment);
  	service.write(title,content,tag_area,gender,tag_job,payment, min_price);

  	  return "redirect:help_me";
    }
    

    
    @RequestMapping(value = "/helpme_write_view", method = RequestMethod.GET)
    public String helpme_write_view(HttpServletRequest req, Model model) throws Exception {
	  System.out.println("helpme_write_view작동");

	  int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
	  System.out.println("help_post_id:"+help_post_id);
	  Dto_help_post read = service.read(help_post_id);      
    model.addAttribute("read", read);

       return "helpme_write_view";
    }
    


    @RequestMapping(value="/helpme_del", method=RequestMethod.GET)
    public String helpme_del(HttpServletRequest req, Model model)throws Exception {
  	  System.out.println("helpme_del작동");
  	  
  	  int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
  	  System.out.println("del id="+help_post_id);
  	  service.delete(help_post_id);
  	  
  	  return "redirect:help_me";
    }
	
	
	// helpyou
    @RequestMapping(value = "/help_you")
    public String help_you(Model model) {
       return "help_you";
    }
	@RequestMapping(value = "/helpyou_done", method = RequestMethod.POST)
    public String helpyou_done(HttpServletRequest req, @RequestParam("file_up") MultipartFile file,
    					Model model){
		System.out.println("start helpyou_done");
		String area=req.getParameter("area");
		String title=req.getParameter("title");
		String job=req.getParameter("job");
		String txtarea=req.getParameter("txtarea");
		String file_up=FileuploadServlet.restore(file);
		String gender=req.getParameter("gender");
		int price=Integer.parseInt(req.getParameter("price"));
		String payment=req.getParameter("payment");
		String user_id="a";
		
		System.out.println(area+", "+title+", "+job+", "+txtarea+", "+file_up+", "+gender+", "+price+", "+payment+", "+user_id);
		
		service.helpyou_submit(area,title,job,txtarea,file_up,gender,price,payment,user_id);
		
		System.out.println("end helpyou_done");
        return "redirect:help_you";
    }
	@RequestMapping(value="/helpyou_list", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public @ResponseBody String helpyou_list() {
    	System.out.println("start help_you");
		List<Help_postDto> dto=service.helpyou_list();
		System.out.println(dto);
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		System.out.println(json);
		System.out.println("end help_you");
		return json;
	}
	
	
	//notice
		@RequestMapping(value = "notice", method = RequestMethod.GET)
	    public String notice(HttpServletRequest req, Model model) throws Exception{
	        
			List<Dto_post> notice = service.select_post();  //활용하기
	        model.addAttribute("notice", notice);

	        return "notice";
	    }
		
		//notice_write
	    @RequestMapping(value = "notice_write", method = RequestMethod.GET)
	    public String notice_write(HttpServletRequest req, Model model) {
	       
	       return "notice_write";
	    }
	    
	    //notice_write_add
	    @RequestMapping(value = "notice_write_add", method = RequestMethod.GET)
	    public String notice_write_add(HttpServletRequest req, Model model) throws Exception {
	        System.out.println("Start : notice_write_add");
//	    	if(req.getParameter("title").equals("")) {
//				return "redirect:notice_write";
//			}
//	    	if(req.getParameter("txtarea").equals("")) {
//				return "redirect:notice_write";
//			}
	    	
	    	String post_id="10";
	    	String board="0";
	    	String operator=null;
	    	String nick="B";
	    	System.out.println("test1");
	    	String title=req.getParameter("title");
	    	System.out.println(title);
	    	String content=req.getParameter("content");
	    	System.out.println(content);
			String img=null;
			String user_user_id="a";
			
			service.add_post(post_id,board,operator,nick,title,content,img,user_user_id);
			System.out.println("End : notice_write_add");
	       return "redirect:notice";
	    }
	    
	    //notice_write_view + comments
	    @RequestMapping(value = "notice_write_view", method = RequestMethod.GET)
	    public String notice_write_view(HttpServletRequest req, Model model) throws Exception {
	       
	    	if(req.getParameter("post_id").equals("")) {
				return "redirect:notice";
			}
	    
	    	int post_id=Integer.parseInt(req.getParameter("post_id"));
	    	System.out.println("this is post_id : " +post_id);
	    	
	    	List<Dto_reply> reply = service.select_post_reply(post_id);
	    	List<Dto_post> notice = service.select_post_view(post_id);  
	    	
	        model.addAttribute("notice", notice);
	        model.addAttribute("reply", reply);
	    	
	       return "notice_write_view";
	    }

	    //delete posts
	    @RequestMapping(value = "notice_write_delete", method = RequestMethod.GET)
	    public String notice_write_delete(HttpServletRequest req, Model model) throws Exception{
	    	
	    	if(req.getParameter("post_id").equals("")) {
				return "notice_write_view";
			}
	    	
	    	int post_id=Integer.parseInt(req.getParameter("post_id"));
	    	service.select_reply_delete(post_id);
	    	service.select_post_delete(post_id);
	    	
	    	System.out.println("this is post_id : " +post_id);
	    	
	    	return "redirect:notice";
	    }
	    
	    //update posts
	    
	    
	    @RequestMapping(value="freeboard", method = RequestMethod.GET)
		public String freeboard(HttpServletRequest req, Model model) throws Exception{
			
			List<Dto_freeboard> freeboard = service.select_freeboard();
			model.addAttribute("freeboard",freeboard);
			return "freeboard";
		} // 자유게시판 리스트 보여주기
		
		@RequestMapping(value="/freeboard_write_view", method =  {RequestMethod.GET, RequestMethod.POST})
		public String freeboard_write_view(HttpServletRequest req, Model model) throws Exception{
			
			if(req.getParameter("post_id").equals("")) {
				return "redirect:freeboard";
			}
			int post_id=Integer.parseInt(req.getParameter("post_id"));
			List<Dto_reply> reply = service.select_freeboard_reply(post_id);
			List<Dto_freeboard> freeboard = service.select_freeboard_view(post_id);
			
			System.out.println("test :"+ freeboard);
			
			model.addAttribute("freeboard",freeboard);
			model.addAttribute("reply", reply);
			return "freeboard_write_view";
		} //게시글 보기
		
		  @RequestMapping(value = "/freeboard_write_delete", method =  {RequestMethod.GET, RequestMethod.POST})
		    public String freeboard_write_delete(HttpServletRequest req, Model model) throws Exception{

		    	if(req.getParameter("post_id").equals("")) {
					return "freeboard_write_view";
				}

		    	int post_id=Integer.parseInt(req.getParameter("post_id"));
		    	service.select_freeboard_reply_delete(post_id);
		    	service.select_freeboard_delete(post_id);

		    	return "redirect:freeboard";
		    }

		@RequestMapping(value="/freeboard_write", method =  {RequestMethod.GET, RequestMethod.POST})
		public String freeboard_write(HttpServletRequest req, Model model) throws Exception {
			 int post_id=Integer.parseInt(req.getParameter("post_id"));
			 System.out.println("1");
			 int board=Integer.parseInt(req.getParameter("board"));
			 System.out.println("2");
			 String title=req.getParameter("title");
			 System.out.println("3");
			 String operator=req.getParameter("operator");
			 System.out.println("4");
			 String nick=req.getParameter("nick");
			 System.out.println("5");
			 String content=req.getParameter("content");
			 System.out.println("6");
			 String img=req.getParameter("img");
			 System.out.println("7");
			 String user_user_id=req.getParameter("user_user_id");
			 System.out.println("8");
			 service.freeboard_submit(post_id,board,title,operator,nick,content,img,user_user_id);
			
			return "redirect:freeboard";
		} //게시글 작성
	
}
