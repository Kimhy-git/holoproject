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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
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
		@RequestMapping(value = "/help_me", method = RequestMethod.GET)
	    public String help_me(HttpServletRequest req,Model model) throws Exception {
			 System.out.println("help_me작동");
			 
//			 String user_id=req.getParameter("user_id");
//			 System.out.println("user_id : "+user_id);
			 //service.list(user_id);
//			 List<Dto_help_post> likes = service.likes();
//			 model.addAttribute("likes", likes);
			 List<Dto_help_post> list = service.list();      
			 model.addAttribute("list", list);
			 //System.out.println(list);
			 System.out.println("help_me 종료");
	      	 return "help_me";
	      	 
	    }
				
		@RequestMapping(value = "/helpme_write", method = RequestMethod.GET)
	    public String helpme_write() {
			 
	   	 return "helpme_write";
	    }
				

		@RequestMapping(value="/helpme_write_go", method = RequestMethod.POST)
        public String helpme_write_go(HttpServletRequest req, Model model)throws Exception {
		    	  
			 System.out.println("helpme_write_go작동");

			  String title=req.getParameter("title");
			  String content=req.getParameter("content"); 
			  String tag_area=req.getParameter("tag_area");
			  String tag_job=req.getParameter("tag_job"); 
			  String gender=req.getParameter("gender"); 
			  int min_price=Integer.parseInt(req.getParameter("min_price"));
			  String[] paymentList =req.getParameterValues("payment");
			  
			  
			  String payment=String.join(", ",paymentList);
			  System.out.println("결제방법은 바로바로"+payment);
			  	gender=null;
			  	
				System.out.println(req.getParameter("female"));
				System.out.println(req.getParameter("male"));
				if(req.getParameter("male")!=null && req.getParameter("female")!=null) {
					gender="a";
				}else if(req.getParameter("female")!=null) {
					gender="f";
				}else if(req.getParameter("male")!=null) {
					gender="m";
				}
				
			  System.out.println(title+","+content+","+tag_area+","+tag_job+","
														+gender+","+min_price+","+payment);
			  service.write(title,content,gender,tag_area,tag_job,payment, min_price);

	   	  return "redirect:help_me";
	     }
	     
			 
	     
	   @RequestMapping(value = "/helpme_write_view", method = RequestMethod.GET)
	   public String helpme_write_view(HttpServletRequest req, Model model) throws Exception {
			  System.out.println("helpme_write_view작동");
			  int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
			  System.out.println("help_post_id:"+help_post_id);
			  Dto_help_post read = service.read(help_post_id);      
			  List<Dto_help_reply> re_list=service.re_list(help_post_id);
			  System.out.println("겟 젠더 : "+read.getGender());
			  model.addAttribute("re_list",re_list);
			  if(read.getGender().equals("a")) {
				  read.setGender("상관없음");
			  }else if(read.getGender().equals("f")) {
				  read.setGender("여성");
			  }else if(read.getGender().equals("m")) {
				  read.setGender("남성");
			  }
			  model.addAttribute("read", read);
			  
			  System.out.println("helpme_write_view종료");
		      return "helpme_write_view";
	   }
	   
	   @RequestMapping(value = "/helpme_write_edit", method = RequestMethod.GET)
	   public String helpme_write_edit(HttpServletRequest req, Model model) throws Exception {
		   System.out.println("helpme_write_eidt 작동");
		   
		   int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
		   System.out.println("help_post_id 모디파이 에서...:"+help_post_id);
		   Dto_help_post read = service.read(help_post_id);
		   model.addAttribute("read", read);
		   
		   return "helpme_write_edit";
	   }


	     @RequestMapping(value="/helpme_del", method=RequestMethod.GET)
	     public String helpme_del(HttpServletRequest req, Model model)throws Exception {
	 	  System.out.println("helpme_del작동");
	 	  
	 	  int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
	 	  System.out.println("del id="+help_post_id);
	 	  service.delete(help_post_id);
	   	  
	 	  return "redirect:help_me";
	     }


		@RequestMapping(value="/help_reply_go", method=RequestMethod.GET)
	    public String help_reply_go(HttpServletRequest req, Model model) throws Exception{
	   	System.out.println("help_reply go 작동");
	    int help_post_id=Integer.parseInt(req.getParameter("help_post_post_id"));
	   	String re_comment=req.getParameter("re_comment");
	   	System.out.println("서비스");
	   	service.re_write(re_comment,help_post_id );   	
	
	   	System.out.println("help_reply 아이디 받아오기"+help_post_id);
	   	return "redirect:helpme_write_view?help_post_id="+help_post_id;
	   }
		
		@RequestMapping(value="/help_reply_del", method=RequestMethod.POST)
		public String help_reply_del(HttpServletRequest req, Model model) throws Exception{
			System.out.println("help_reply_del 실행");
			int help_reply_id=Integer.parseInt(req.getParameter("help_reply_id"));
			System.out.println("help_reply_del 1");
			service.re_delete(help_reply_id);
			System.out.println("help_reply_del 2:"+help_reply_id);
			int help_post_id=Integer.parseInt(req.getParameter("help_post_post_id"));
			System.out.println("help_reply_del 3:"+help_post_id);
			System.out.println("help_reply_del 종료");
			return "redirect:helpme_write_view?help_post_id="+help_post_id;
		}
		
//		@RequestMapping(value="/help_reply_edit_go", method=RequestMethod.POST)
//	    public String help_reply_edit_go(HttpServletRequest req, Model model) throws Exception{
//	   	System.out.println("help_reply_edit_go 작동");
//	   	int help_post_id=Integer.parseInt(req.getParameter("help_post_post_id"));
//	   	int help_reply_id=Integer.parseInt(req.getParameter("help_reply_id"));
//	   	String re_comment=req.getParameter("re_comment");
//	   	service.re_edit(re_comment,help_reply_id );
//	   	System.out.println("help_reply 아이디 받아오기"+help_reply_id);
//	   	return "redirect:helpme_write_view?help_post_id="+help_post_id;
//	   }
		
	// helpyou
    @RequestMapping(value = "/help_you")
    public String help_you(Model model) {
       return "help_you";
    }
    @RequestMapping(value = "/helpyou_write", method = RequestMethod.GET)
    public String helpyou_write() {
		 
   	 return "helpyou_write";
    }
	@RequestMapping(value = "/helpyou_done", method = RequestMethod.POST)
    public String helpyou_done(HttpServletRequest req, @RequestParam("file_up") MultipartFile file,
    					Model model){
		String area=req.getParameter("area");
		String title=req.getParameter("title");
		String job=req.getParameter("job");
		String txtarea=req.getParameter("txtarea");
		System.out.println(file);
		String file_up=null;
		if(!file.isEmpty()) {
			file_up=FileuploadServlet.restore(file);
		}
		String gender=req.getParameter("gender");
		int price=Integer.parseInt(req.getParameter("price"));	
		String payment=req.getParameter("payment");
		String user_id="a";
		service.helpyou_submit(area,title,job,txtarea,file_up,gender,price,payment,user_id);
        return "redirect:help_you";
    }
	@RequestMapping(value="/helpyou_list", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public @ResponseBody String helpyou_list() {
		List<Dto_help_post> dto=service.helpyou_list();
		System.out.println(dto);
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		return json;
	}
	@RequestMapping(value="/helpyou_write_view")
	public String helpyou_write_view(HttpServletRequest req, Model model) {
		int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
		Dto_help_post dto=service.helpyou_write_view(help_post_id);
		System.out.println(dto);
		model.addAttribute("read",dto);
		return "helpyou_write_view";
	}
	@RequestMapping(value="/helpyou_delete", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public String helpyou_delete(HttpServletRequest req) {
    	int help_post_id=Integer.parseInt(req.getParameter("post_id"));
    	service.helpyou_delete(help_post_id);
		return "redirect:help_you";
	}
	@RequestMapping(value="/helpyou_reply_done", method = {RequestMethod.POST,RequestMethod.GET})
	public String helpyou_reply_done(HttpServletRequest req, Model model) {
		int help_post_id=Integer.parseInt(req.getParameter("post_id"));
		String comment=req.getParameter("comment-input");
		String user_id="b";
		service.helpyou_reply_submit(comment, help_post_id, user_id);
		return "redirect:helpyou_write_view?help_post_id="+help_post_id;
	}
	@RequestMapping(value="/helpyou_reply_list", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public @ResponseBody String helpyou_reply_list(@RequestParam("post_id") int post_id) {
    	System.out.println("start helpyou_reply_list");
		List<Dto_help_reply> dto=service.helpyou_reply_list(post_id);
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		System.out.println(json);
		System.out.println("end helpyou_reply_list");
		return json;
	}
	@RequestMapping(value="/helpyou_reply_delete", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public String helpyou_reply_delete(HttpServletRequest req) {
		int help_reply_id=Integer.parseInt(req.getParameter("reply_id"));
		String post_id=req.getParameter("post_id");
		service.helpyou_reply_delete(help_reply_id);
    	return "redirect:helpyou_write_view?help_post_id="+post_id;
	}
	
	
	
	
	
	
	
	
	//notice
			@RequestMapping(value = "notice", method = {RequestMethod.POST,RequestMethod.GET})
		    public String notice(HttpServletRequest req, Model model) throws Exception{
		        
				List<Dto_post> notice = service.select_post(); 
		        model.addAttribute("notice", notice);

		        return "notice";
		    }
			
			//notice_write
		    @RequestMapping(value = "notice_write", method = {RequestMethod.POST, RequestMethod.GET})
		    public String notice_write(HttpServletRequest req, Model model) {
		       
		       return "notice_write";
		    }
		    
		    //notice_write_add
		    @RequestMapping(value = "notice_write_add", method = {RequestMethod.POST,RequestMethod.GET})
		    public String notice_write_add(HttpServletRequest req, @RequestParam("file_up") MultipartFile file, Model model) throws Exception {
		        System.out.println("Start : notice_write_add");

		    	System.out.println("test1");
		    	String title=req.getParameter("title");
		    	System.out.println(title);
		    	String content=req.getParameter("content");
		    	System.out.println(content);
		    	System.out.println(file);
				String file_up=null;
				if(!file.isEmpty()) {
					file_up=FileuploadServlet.restore(file);
				}
				
				
				service.add_post(title,content,file_up);
				System.out.println("End : notice_write_add");
		       return "redirect:notice";
		    }
		    
		    //add comments
		    @RequestMapping(value = "add_comment", method = {RequestMethod.POST,RequestMethod.GET})
		    public String add_comment(HttpServletRequest req, Model model) {
		    	
		    	System.out.println("add_comment");
		    	String post_post_id=req.getParameter("post_post_id");
		    	String re_comment=req.getParameter("re_comment");
		    	System.out.println("THIS IS post_post_id : "+post_post_id);
		    	System.out.println("THIS IS re_comment : "+re_comment);
		    	service.add_comment(post_post_id, re_comment);
		    	
		    	System.out.println("The end of add_comment");
		    	return "redirect:notice_write_view";
		    }
		    
		    //notice_write_view + comments
		    @RequestMapping(value = "notice_write_view", method = {RequestMethod.POST,RequestMethod.GET})
		    public String notice_write_view(HttpServletRequest req, Model model) throws Exception {
		      
		    	System.out.println("write_view작동");
		    	String post_id=req.getParameter("post_id");
		    	System.out.println("this is post_id : " +post_id);
		    	
		    	List<Dto_reply> reply = service.select_post_reply(post_id);
		    	List<Dto_post> notice = service.select_post_view(post_id);  
		    	
		        model.addAttribute("notice", notice);
		        model.addAttribute("reply", reply);
		    	
		       return "notice_write_view";
		    }

		    //delete posts
		    @RequestMapping(value = "notice_write_delete", method = {RequestMethod.POST,RequestMethod.GET})
		    public String notice_write_delete(HttpServletRequest req, Model model) throws Exception{
		    	
		    	if(req.getParameter("post_id").equals("")) {
					return "notice_write_view";
				}
		    	
		    	String post_id=req.getParameter("post_id");
		    	service.select_reply_delete(post_id);
		    	service.select_post_delete(post_id);
		    	
		    	System.out.println("this is post_id : " +post_id);
		    	
		    	return "redirect:notice";
		    }
		    
		    //delete comments
		    @RequestMapping(value = "delete_comment", method = {RequestMethod.POST,RequestMethod.GET})
		    public String delete_comment(HttpServletRequest req, Model model) throws Exception{
		    	
		    	String reply_id=req.getParameter("reply_id");
		    	String board="0";
			    String post_post_id=req.getParameter("post_id");
		    	
			    System.out.println("this is post_id : " +post_post_id);
		    	System.out.println("this is reply_id : " +reply_id);
			    
				service.delete_comment(reply_id,board,post_post_id);
		    	
		    	System.out.println("The end of delete_comment");
		    	
		    	return "redirect:notice";
		    }
		    
		    //notice_write_edit_reply
		    @RequestMapping(value = "update_comment", method = {RequestMethod.POST,RequestMethod.GET})
		    public String update_comment(HttpServletRequest req, Model model) throws Exception{
		    	
		    	String post_post_id=req.getParameter("post_post_id");
		    	String re_comment=req.getParameter("re_comment");
		    	String reply_id=req.getParameter("reply_id");

		    	System.out.println("this is post_post_id : " +post_post_id);
		    	System.out.println("this is re_comment : " +re_comment);
		    	System.out.println("this is reply_id : " +reply_id);
		    	
		    	model.addAttribute("post_post_id",post_post_id);
		    	model.addAttribute("re_comment",re_comment);
		    	model.addAttribute("reply_id",reply_id);
		    	
		    	return "notice_write_edit_reply";
		    }
		    
		    //update comments
		    @RequestMapping(value = "update_comment_now", method = {RequestMethod.POST,RequestMethod.GET})
		    public String update_comment_now(HttpServletRequest req, Model model) throws Exception{
		    	
		    	String post_post_id=req.getParameter("post_post_id");
		    	String re_comment=req.getParameter("re_comment");
		    	String reply_id=req.getParameter("reply_id");
		    	String board="0";

		    	System.out.println("this is post_post_id : " +post_post_id);
		    	System.out.println("this is re_comment : " +re_comment);
		    	System.out.println("this is reply_id : " +reply_id);
		    	
		    	service.update_comment(reply_id,re_comment,post_post_id,board);
		    	
		    	System.out.println("The end of update_comment_now");
		    	
		    	return "redirect:notice";
		    }
		    
		    //update posts
		    @RequestMapping(value = "update_post", method = {RequestMethod.POST,RequestMethod.GET})
		    public String update_post(HttpServletRequest req, Model model) throws Exception{
		    	
		    	String post_id=req.getParameter("post_id");
		    	String title=req.getParameter("title");
		    	String content=req.getParameter("content");
		    	String board="0";
		    	
		    	model.addAttribute("title",title);
		    	model.addAttribute("post_id",post_id);
		    	model.addAttribute("content",content);

		    	System.out.println("this is post_id : " +post_id);
		    	System.out.println("this is re_comment : " +title);
		    	System.out.println("this is reply_id : " +content);
		    	
		    	System.out.println("The end of update_post");
		    	
		    	return "notice_write_edit";
		    }
		    
		    //update posts
		    @RequestMapping(value = "update_post_now", method = {RequestMethod.POST,RequestMethod.GET})
		    public String update_post_now(HttpServletRequest req, Model model) throws Exception{
		    	
		    	String post_id=req.getParameter("post_id");
		    	String title=req.getParameter("title");
		    	String content=req.getParameter("content");
		    	String board="0";

		    	System.out.println("this is post_id : " +post_id);
		    	System.out.println("this is title : " +title);
		    	System.out.println("this is content : " +content);
		    	
		    	service.update_post(post_id,board,title,content);
		    	
		    	System.out.println("The end of update_post_now");

		    	return "redirect:notice";
		    }
		    
		  //add_re_comments
		    @RequestMapping(value = "add_re_comment", method = {RequestMethod.POST,RequestMethod.GET})
		    public String add_re_comment(HttpServletRequest req, Model model) throws Exception{
		    	
		    	System.out.println("Start add_recomment");
		    	
		    	String re_index=req.getParameter("reply_id");
		    	String re_comment=req.getParameter("re_re_comment");
		    	int order_i=Integer.parseInt(req.getParameter("re_order"));
		    	int groupNum_i=Integer.parseInt(req.getParameter("groupNum"));
		    	String post_post_id=req.getParameter("post_post_id");
		    	
		    	order_i+=1;
		    	groupNum_i+=1;
		    	
		    	String re_order=String.valueOf(order_i);
		    	String groupNum=String.valueOf(groupNum_i);

		    	System.out.println("this is re_index : " +re_index);
		    	System.out.println("this is re_comment : " +re_comment);
		    	System.out.println("this is order : " +re_order);
		    	System.out.println("this is groupNum : " +groupNum);
		    	System.out.println("this is post_post_id : " +post_post_id);
		    	
		    	service.add_re_comment(re_index,re_comment,re_order,groupNum,post_post_id);
		    	
		    	System.out.println("The end of update_post_now");

		    	return "redirect:notice";
		    }
		    
		    
		    
		    
		    
		    
	    
	    //freeboard
		    @RequestMapping(value="freeboard", method = RequestMethod.GET)
			public String freeboard(HttpServletRequest req, Model model) throws Exception{
				
				List<Dto_freeboard> freeboard = service.select_freeboard();
				model.addAttribute("freeboard",freeboard);
				return "freeboard";
			} // 자유게시판 리스트 보여주기
			
		    @RequestMapping(value="freeboard_write", method = RequestMethod.GET)
			public String freeboard_write(HttpServletRequest req, Model model) throws Exception{
				return "freeboard_write";
			}
		    
			@RequestMapping(value="/freeboard_write_view", method = RequestMethod.GET)
			public String freeboard_write_view(HttpServletRequest req, Model model) throws Exception{
				
				if(req.getParameter("post_id").equals("")) {
					return "redirect:freeboard";
				}
				int post_id=Integer.parseInt(req.getParameter("post_id"));				
				List<Dto_freeboard> freeboard = service.select_freeboard_view(post_id);
				model.addAttribute("freeboard",freeboard);
				
				return "freeboard_write_view";
			} //게시글 보기
			
			  @RequestMapping(value = "/freeboard_write_delete", method = RequestMethod.GET)
			    public String freeboard_write_delete(HttpServletRequest req, Model model) throws Exception{
				   System.out.println(req.getParameter("post_id"));
			    	int post_id=Integer.parseInt(req.getParameter("post_id"));			    	
			    	System.out.println("delete: "+post_id);
			    	service.select_freeboard_delete(post_id);
			    	return "redirect:freeboard";
			    } //게시글 삭제
			  
			  @RequestMapping(value="freeboard_modify", method = RequestMethod.GET)
				public String freeboard_modify(HttpServletRequest req, Model model) throws Exception{
				  	String post_id=req.getParameter("post_id");
			    	String title=req.getParameter("title");
			    	String content=req.getParameter("content");
			    	String board="1";
			    	
			    	System.out.println("to modify: "+post_id);
			    	
			    	model.addAttribute("title",title);
			    	model.addAttribute("post_id",post_id);
			    	model.addAttribute("content",content);

			    	return "freeboard_modify";
			    } //수정페이지로 이동
			  @RequestMapping(value = "freeboard_update", method = RequestMethod.GET)
			    public String freeboard_update(HttpServletRequest req, Model model) throws Exception{
			    	
			    	String post_id=req.getParameter("post_id");
			    	String board="1";
			    	String title=req.getParameter("title");
			    	String content=req.getParameter("content");
			    	
			    	System.out.println("test : " +post_id);
			    	System.out.println("test : " +title);
			    	System.out.println("test : " +content);
			    	
			    	service.freeboard_update(post_id,board,title,content);

			    	return "redirect:freeboard";
			    } //게시물 수정
			    	
			@RequestMapping(value="/freeboard_submit", method = RequestMethod.GET)
			public String freeboard_submit(HttpServletRequest req, Model model) throws Exception {
				String post_id="10";
		    	String board="1";
		    	String title=req.getParameter("title");
		    	String operator=null;

		    	String content=req.getParameter("content");
				String user_user_id="b";
				
				System.out.println("test : " +title);
				
				service.freeboard_write(post_id, board, title, content,user_user_id);
				
				return "redirect:freeboard";
			} //게시글 작성
			
			 @RequestMapping(value = "/free_write_reply", method = RequestMethod.GET)
			    public String free_write_comment(HttpServletRequest req, Model model) throws Exception {
			    	
			    	String post_post_id=req.getParameter("post_post_id");
			    	String re_comment=req.getParameter("re_comment");

			    	service.free_write_reply(post_post_id, re_comment);

			    	return "redirect:freeboard_write_view";
			    } //댓글 작성
	
}
