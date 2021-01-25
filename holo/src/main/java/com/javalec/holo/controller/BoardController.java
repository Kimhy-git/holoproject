package com.javalec.holo.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.javalec.holo.dto.BoardSearch;
import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
import com.javalec.holo.dto.Dto_login;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Pagination;
import com.javalec.holo.dto.Pagination_help;
import com.javalec.holo.service.MemberService;
import com.javalec.holo.servlet.FileuploadServlet;

@Controller
public class BoardController {
	
	@Inject
    private MemberService service;
	
	
	//helpme
	@RequestMapping(value = "/help_me", method = RequestMethod.GET)
    public String help_me(HttpServletRequest req, Model model,
			    		@RequestParam(required = false, defaultValue = "1") int page, 
						@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		 
		System.out.println("help_me작동");
		//전체 게시글 수
		int listCnt = service.count_helpme();
		System.out.println("listCnt: "+listCnt);
		//Pagination 객제 생성
		Pagination_help pagination = new Pagination_help();
		pagination.pageInfo(page, range, listCnt);
		System.out.println("controller endpage: "+pagination.getEndPage());
		 List<Dto_help_post> list = service.list(pagination);      
		 model.addAttribute("list", list);
		 model.addAttribute("pagination", pagination);
		 Dto_login dto = new Dto_login();
		 model.addAttribute("search_done",0);
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
		 
		 System.out.println("BoardController DTO : "+dto);

	        return "help_me";
    }
			
	@RequestMapping(value = "/helpme_write", method = RequestMethod.GET)
    public String helpme_write(HttpServletRequest req) {
	
		 Dto_login dto = new Dto_login();
		 
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
		 
		 System.out.println("BoardController DTO : "+dto);
		 
   	 return "helpme_write";
    }
			

	@RequestMapping(value="/helpme_write_go", method = RequestMethod.POST)
    public String helpme_write_go(HttpServletRequest req, @RequestParam("file_up") MultipartFile file,
    		Model model)throws Exception {
	    	  
		 System.out.println("helpme_write_go작동");

		  String title=req.getParameter("title");
		  String content=req.getParameter("content"); 
		  String tag_area=req.getParameter("tag_area");
		  String tag_job=req.getParameter("tag_job");
		  String gender=req.getParameter("gender");
		  int min_price=Integer.parseInt(req.getParameter("min_price"));
		  String user_id=req.getParameter("user_id");

		  String[] paymentList =req.getParameterValues("payment");
		  
		  String file_up=null;
			if(!file.isEmpty()) {
				file_up=FileuploadServlet.restore(file);
			}
		  
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
													+gender+","+min_price+","+payment+","+user_id);
		  service.write(title,content,gender,tag_area,tag_job,payment, min_price,file_up,user_id);

   	  return "redirect:help_me";
     }
     
		 
     
   @RequestMapping(value = "/helpme_write_view", method = RequestMethod.GET)
   public String helpme_write_view(HttpServletRequest req, Model model,
		    @RequestParam(required = false, defaultValue = "1") int page, 
   			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		  System.out.println("helpme_write_view작동");
		  
		  
		  Dto_login dto = new Dto_login();
			 
		  HttpSession session = req.getSession();
		  dto=(Dto_login)session.getAttribute("login");

		  int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
  		  System.out.println("help_post_id:"+help_post_id);
		  
			int listCnt = service.help_reply_count(help_post_id);
	  		System.out.println("listCnt: "+listCnt);
	  		Pagination_help pagination = new Pagination_help();
	  		pagination.pageInfo(0, range, listCnt);
	  		pagination.setHelp_post_id(help_post_id);
	  		model.addAttribute("pagination", pagination);
	  		model.addAttribute("page",0);
	        System.out.println("range : "+pagination.getRange());
			List<Dto_help_reply> re_list=service.re_list(pagination);
			model.addAttribute("re_list",re_list);

		  service.hit(help_post_id);
		  Dto_help_post read = service.read(help_post_id);
		  System.out.println("겟 젠더 : "+read.getGender());
		  
		  model.addAttribute("re_list",re_list);
		  if(read.getGender().equals("a")) {
			  read.setGender("상관없음");
		  }else if(read.getGender().equals("f")) {
			  read.setGender("여성");
		  }else if(read.getGender().equals("m")) {
			  read.setGender("남성");
		  }
			if(read.getImg()!=null) {
				String image=read.getImg();
				read.setImg("holoimg/img/"+image);
			}
		  model.addAttribute("read", read);

			
		  System.out.println("helpme_write_view종료");
	      return "helpme_write_view";
   }
   
   @RequestMapping(value = "/helpme_write_edit", method = RequestMethod.GET)
   public String helpme_write_edit(HttpServletRequest req, Model model) throws Exception {
	   System.out.println("helpme_write_eidt 작동");
	   
	   int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
	   System.out.println("헬프미 롸잇 에딧 포스트 아이디 :"+help_post_id);
	   Dto_help_post read = service.read(help_post_id);
	   model.addAttribute("read", read);
	   
		  Dto_login dto = new Dto_login();
			 
		  HttpSession session = req.getSession();
		  dto=(Dto_login)session.getAttribute("login");
	   
	   return "helpme_write_edit";
   }
   
   @RequestMapping(value="/helpme_edit_go", method = {RequestMethod.POST,RequestMethod.GET})
   public String helpme_edit_go(HttpServletRequest req,@RequestParam("file_up") MultipartFile file,
		   Model model)throws Exception {
	    	  
		 System.out.println("helpme_edit_go작동");

		  String title=req.getParameter("title");
		  String content=req.getParameter("content"); 
		  String tag_area=req.getParameter("tag_area");
		  System.out.println("가져요?");
		  String tag_job=req.getParameter("tag_job");
		  String gender=req.getParameter("gender");
		  int min_price=Integer.parseInt(req.getParameter("min_price"));
		  int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
		  System.out.println("가져요2?");
		  String[] paymentList =req.getParameterValues("payment");
		  String payment=String.join(", ",paymentList);

		  String file_up=null;
			if(!file.isEmpty()) {
				file_up=FileuploadServlet.restore(file);
			}
		  
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
		  service.edit(title,content,gender,tag_area,tag_job,payment, min_price,help_post_id,file_up);
		  System.out.println("가져요?3");
   	  return "redirect:help_me";
     }


     @RequestMapping(value="/helpme_del", method=RequestMethod.GET)
     public String helpme_del(HttpServletRequest req, Model model)throws Exception {
 	  System.out.println("helpme_del작동");
 	  
 	  int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
 	  System.out.println("del id="+help_post_id);
 	  service.delete(help_post_id);
   	  
 	  return "redirect:help_me";
     }


	@RequestMapping(value="/help_reply_go", method=RequestMethod.POST)
    public String help_reply_go(HttpServletRequest req, Model model) throws Exception{
   	System.out.println("help_reply go 작동");
    int help_post_id=Integer.parseInt(req.getParameter("help_post_post_id"));
   	String re_comment=req.getParameter("re_comment");
   	System.out.println("서비스");
   	String user_id=req.getParameter("user_id");
   	
   	service.re_write(re_comment,help_post_id,user_id);   	
   	
   	System.out.println("help_reply 아이디 받아오기"+help_post_id+", 유저아이디: "+user_id);
   	return "redirect:helpme_write_view?help_post_id="+help_post_id;
   }
	
	@RequestMapping(value="/help_reply_del", method={RequestMethod.POST,RequestMethod.GET})
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
	
	@RequestMapping(value="/help_reply_edit_go", method={RequestMethod.POST,RequestMethod.GET})
	    public String help_reply_edit_go(HttpServletRequest req, Model model) throws Exception{
	   	System.out.println("help_reply_edit_go 작동");
	   	int help_post_id=Integer.parseInt(req.getParameter("help_post_post_id"));
	   	int help_reply_id=Integer.parseInt(req.getParameter("help_reply_id"));
	   	System.out.println("help_reply 아이디 받아오기"+help_reply_id);
	   	String re_comment_edit=req.getParameter("re_comment_edit");
	   	System.out.println(re_comment_edit);
	   	service.re_edit(help_reply_id, re_comment_edit);
	   	System.out.println("help_reply_edit_go 종료");
	   	return "redirect:helpme_write_view?help_post_id="+help_post_id;
   }

	@RequestMapping(value="/helpme_re_recomment_submit", method = {RequestMethod.POST,RequestMethod.GET})
	public String helpme_re_recomment_submit(HttpServletRequest req, Model model) throws Exception {
		System.out.println("start re_recomment");
		int help_post_id=Integer.parseInt(req.getParameter("re_post_id"));
		int re_order=Integer.parseInt(req.getParameter("parent_id"));
		System.out.println("parent_id: "+re_order);
		int re_class=Integer.parseInt(req.getParameter("re_class"));
		if(re_class==0) {
			re_class=re_class+1;
		}
		int parent_re_order=Integer.parseInt(req.getParameter("re_order"));
		int parent_groupNum=Integer.parseInt(req.getParameter("groupNum"));
		int groupNum=0;
		if(parent_re_order==0) {
			groupNum=re_order;
		}else {
			groupNum=parent_groupNum;
		}
		System.out.println("groupNum: "+groupNum);
		String comment=req.getParameter("re_re_comment");		
		String user_id=req.getParameter("user_id");;
		int re_index=Integer.parseInt(req.getParameter("re_index"));
		System.out.println("re_index: "+re_index+"re_order: "+re_order+", re_class: "+re_class+", re_groupNum: "+groupNum);
		service.helpme_re_recomment_submit(re_index, comment, re_order, re_class, groupNum, help_post_id, user_id);
		System.out.println("end re_recomment");
		return "redirect:helpme_write_view?help_post_id="+help_post_id;
	}			
	
	@RequestMapping("help_me_search") //url mapping
    public ModelAndView helpme_search_list(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
            @RequestParam(defaultValue="1") int curPage,
            @RequestParam(defaultValue="") String search_option, //기본 검색 옵션값을 작성자로 한다.
            @RequestParam(defaultValue="전체") String area, //기본 검색 옵션값을 작성자로 한다.
            @RequestParam(defaultValue="") String keyword,   //키워드의 기본값을 ""으로 한다.
            @RequestParam(defaultValue="1") int board,
            @RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(defaultValue="전체") String tagJob
            )
             throws Exception{
        
		BoardSearch search = new BoardSearch();
        //전체 로우 수
        if(!area.equals("")) {
        	search.setArea(area);
        }
        if(!keyword.equals("")) {
        	search.setKeyword(keyword);
        }
        search.setSearch_option(search_option);
        search.setTagJob(tagJob);
        System.out.println("boardsearch area: "+search.getArea());
        System.out.println("boardsearch option: "+search.getSearch_option());
        System.out.println("boardsearch keyword: "+search.getKeyword());
        search.setBoard(board);
        int listCnt = service.helpme_search_count(search);
        System.out.println("리스트 카운트는 과연~? : "+listCnt);
        // 검색조건 + 보드서치 객체 생성
        Pagination_help pagination = new Pagination_help();
        pagination.pageInfo(page,range,listCnt);
        
        search.setPagination_help(pagination);
        
        System.out.println("help_me board page: "+search.getPagination_help().getStartList());
        //검색 조건으로 게시글 목록 조회
        List<Dto_help_post> list = service.helpme_search(search);
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<String, Object>();    
        //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
        System.out.println("boardcontroller"+pagination.getEndPage());
        map.put("search_option", search_option);
        map.put("tagJob", tagJob);
        map.put("area", area);
        map.put("keyword", keyword);
        mav.addObject("map", map);             
        mav.addObject("pagination", pagination);
        mav.addObject("list", list);
        mav.addObject("search_done", 1);
        
        System.out.println("map : "+map);
        mav.setViewName("help_me_search");   //자료를 넘길 뷰의 이름
        return mav;   //게시판 페이지로 이동   
    } // 검색하기
	
	
	@RequestMapping(value = "helpme_write_view_reply", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
    public @ResponseBody String helpme_write_view_reply(HttpServletRequest req, Model model,
    		@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
			
    		System.out.println("댓글 페이징");
    	
    		//전체 댓글 수
    		int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
    		System.out.println("this is post_id : " +help_post_id);
			int listCnt = service.help_reply_count(help_post_id);
			System.out.println("json listCnt: "+listCnt);
			Dto_help_post read = service.read(help_post_id);
			
			//Pagination 객제 생성
			Pagination_help pagination = new Pagination_help();
	  		pagination.pageInfo(page, range, listCnt);
	  		pagination.setHelp_post_id(help_post_id);
	  		model.addAttribute("pagination", pagination);
	        System.out.println("range : "+pagination.getRange());
			List<Dto_help_reply> reply_list=service.re_list(pagination);
			Gson gson = new Gson();
			String json = gson.toJson(reply_list);
			
			return json;
	}
	
	
	
	
	
	
	
	// helpyou
	// 글쓰기 완료
	@RequestMapping(value = "/helpyou_done", method = {RequestMethod.POST,RequestMethod.GET})
    public String helpyou_done(HttpServletRequest req, @RequestParam("file_up") MultipartFile file,
    					Model model){
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		String area=req.getParameter("tag_area");
		String title=req.getParameter("title");
		String job=req.getParameter("tag_job");
		String txtarea=req.getParameter("content");
		System.out.println(file);
		String file_up=null;
		if(!file.isEmpty()) {
			file_up=FileuploadServlet.restore(file);
		}
		String gender=null;
		if(req.getParameter("male")!=null && req.getParameter("female")!=null) {
			gender="a";
		}else if(req.getParameter("female")!=null) {
			gender="f";
		}else if(req.getParameter("male")!=null) {
			gender="m";
		}
		int price=Integer.parseInt(req.getParameter("min_price"));
		String[] paymentList=req.getParameterValues("payment");
		String payment=String.join(", ", paymentList);
		String user_id=dto.getUser_id();
		System.out.println("board controller user_id: "+user_id);
		service.helpyou_submit(area,title,job,txtarea,file_up,gender,price,payment,user_id);
        return "redirect:help_you";
    }
	// 게시글 불러오기1
	@RequestMapping(value="/help_you", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public String helpyou_list(HttpServletRequest req, Model model,
											@RequestParam(required = false, defaultValue = "1") int page, 
    										@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		
		//전체 게시글 수
		int listCnt = service.count_helpyou();
		System.out.println("listCnt: "+listCnt);
		//Pagination 객제 생성
		Pagination_help pagination = new Pagination_help();
		pagination.pageInfo(page, range, listCnt);
		System.out.println("controller endpage: "+pagination.getEndPage());
		List<Dto_help_post> dto_list=service.helpyou_list(pagination);
		System.out.println(dto_list);
		
		System.out.println("the number of pages : "+pagination.getPageCnt());
		model.addAttribute("list",dto_list);
		model.addAttribute("pagination", pagination);
		return "help_you";
	}
	// 게시글 불러오기2
	@RequestMapping(value="/helpyou_list", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public @ResponseBody String helpyou_list(@RequestParam(required = false, defaultValue = "1") int page, 
											@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		//전체 게시글 수
		int listCnt = service.count_helpyou();
		System.out.println("json listCnt: "+listCnt);
		//Pagination 객제 생성
		Pagination_help pagination = new Pagination_help();
		pagination.pageInfo(page, range, listCnt);
		System.out.println("json page: "+page);
		List<Dto_help_post> dto=service.helpyou_list(pagination);
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		return json;
	}
	@RequestMapping("help_you_search") //url mapping
    public ModelAndView helpyou_search_list(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
            @RequestParam(defaultValue="1") int curPage,
            @RequestParam(defaultValue="all") String search_option, //기본 검색 옵션값을 작성자로 한다.
            @RequestParam(defaultValue="전체") String area, //기본 검색 옵션값을 작성자로 한다.
            @RequestParam(defaultValue="") String keyword,   //키워드의 기본값을 ""으로 한다.
            @RequestParam(defaultValue="1") int board,
            @RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(defaultValue="전체") String tagJob
            )
             throws Exception{
        
		BoardSearch search = new BoardSearch();
        //전체 로우 수
        if(!area.equals("")) {
        	search.setArea(area);
        }
        if(!keyword.equals("")) {
        	search.setKeyword(keyword);
        }
        search.setSearch_option(search_option);
        search.setTagJob(tagJob);
        System.out.println("boardsearch area: "+search.getArea());
        System.out.println("boardsearch option: "+search.getSearch_option());
        System.out.println("boardsearch keyword: "+search.getKeyword());
        search.setBoard(board);
        int listCnt = service.helpyou_search_count(search);
        System.out.println("리스트 카운트는 과연~? : "+listCnt);
        // 검색조건 + 보드서치 객체 생성
        Pagination_help pagination = new Pagination_help();
        pagination.pageInfo(page,range,listCnt);
        
        search.setPagination_help(pagination);
        
        System.out.println("help_you board page: "+search.getPagination_help().getStartList());
        //검색 조건으로 게시글 목록 조회
        List<Dto_help_post> list = service.helpyou_search(search);
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<String, Object>();    
        //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
        System.out.println("boardcontroller"+pagination.getEndPage());
        map.put("search_option", search_option);
        map.put("tagJob", tagJob);
        map.put("area", area);
        map.put("keyword", keyword);
        mav.addObject("map", map);             
        mav.addObject("pagination", pagination);
        mav.addObject("list", list);
        mav.addObject("search_done", 1);
        
        System.out.println("map : "+map);
        mav.setViewName("help_you_search");   //자료를 넘길 뷰의 이름
        return mav;   //게시판 페이지로 이동   
    } // 검색하기
	
	@RequestMapping(value="/helpyou_write_view")
	public String helpyou_write_view(HttpServletRequest req, Model model,
						    		@RequestParam(required = false, defaultValue = "1") int page, 
						    		@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
		service.hit(help_post_id);
		Dto_help_post read=service.helpyou_write_view(help_post_id);
		  if(read.getGender().equals("a")) {
			  read.setGender("상관없음");
		  }else if(read.getGender().equals("f")) {
			  read.setGender("여성");
		  }else if(read.getGender().equals("m")) {
			  read.setGender("남성");
		  }
		if(read.getImg()!=null) {
			String image=read.getImg();
			read.setImg("holoimg/img/"+image);
		}
		int already_apply=0;
		if(dto!=null) {
			List<String> applier_list=service.helpyou_applier_check(help_post_id);
			System.out.println(service.helpyou_applier_check(help_post_id));
			
			for(int i=0; i<applier_list.size();i++) {
				System.out.println("applier list: "+applier_list.get(i));
				if((dto.getUser_id()).equals(applier_list.get(i))) {
					already_apply=1;
				}
			}
		}
		
		System.out.println("boardcontroller nick: "+read.getlikes());
		int listCnt = service.help_reply_count(help_post_id);
  		System.out.println("listCnt: "+listCnt);
  		Pagination_help pagination = new Pagination_help();
  		pagination.pageInfo(0, range, listCnt);
  		pagination.setHelp_post_id(help_post_id);
  		model.addAttribute("already_apply",already_apply);
  		model.addAttribute("pagination", pagination);
  		model.addAttribute("page",0);
        System.out.println("range : "+pagination.getRange());
		List<Dto_help_reply> reply_list=service.helpyou_reply_list(pagination);
		model.addAttribute("read",read);
		model.addAttribute("reply",reply_list);
		return "helpyou_write_view";
	}
	
	@RequestMapping(value = "helpyou_write_view_reply", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
    public @ResponseBody String helpyou_write_view_reply(HttpServletRequest req, Model model,
    		@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
			
    		System.out.println("댓글 페이징");
    	
    		//전체 댓글 수
    		int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
    		System.out.println("this is post_id : " +help_post_id);
			int listCnt = service.help_reply_count(help_post_id);
			System.out.println("json listCnt: "+listCnt);
			
			//Pagination 객제 생성
			Pagination_help pagination = new Pagination_help();
	  		pagination.pageInfo(page, range, listCnt);
	  		pagination.setHelp_post_id(help_post_id);
	  		model.addAttribute("pagination", pagination);
	        System.out.println("range : "+pagination.getRange());
			List<Dto_help_reply> reply_list=service.helpyou_reply_list(pagination);
			Gson gson = new Gson();
			String json = gson.toJson(reply_list);
			
			return json;
	}
	
	@RequestMapping(value="/helpyou_write_edit")
	public String helpyou_write_edit(HttpServletRequest req, Model model) {
		
		String post_id=req.getParameter("help_post_id");
		model.addAttribute("post_id",post_id);
		
		 Dto_login dto = new Dto_login();
		 
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
		return "helpyou_write_edit";
	}
	@RequestMapping(value="helpyou_edit_list", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public @ResponseBody String helpyou_edit_list(@RequestParam("post_id") int help_post_id) {
		Dto_help_post dto=service.helpyou_write_view(help_post_id);
		Gson gson = new Gson();
		String json = gson.toJson(dto);
		return json;
	}
	@RequestMapping(value = "/helpyou_edit_done", method = {RequestMethod.POST,RequestMethod.GET})
    public String helpyou_edit_done(HttpServletRequest req, @RequestParam("file_up") MultipartFile file,
    					Model model){
		
		int post_id=Integer.parseInt(req.getParameter("post_id"));
		String area=req.getParameter("tag_area");
		String title=req.getParameter("title");
		String job=req.getParameter("tag_job");
		String txtarea=req.getParameter("content");
		String file_up=null;
		if(!file.isEmpty()) {
			file_up=FileuploadServlet.restore(file);
		}

		String gender=null;
		if(req.getParameter("male")!=null && req.getParameter("female")!=null) {
			gender="a";
		}else if(req.getParameter("female")!=null) {
			gender="f";
		}else if(req.getParameter("male")!=null) {
			gender="m";
		}
		int price=Integer.parseInt(req.getParameter("min_price"));
		String[] paymentList=req.getParameterValues("payment");
		String payment=String.join(", ", paymentList);
		String user_id="a";
		System.out.println(post_id+","+area+","+title+","+job+","+txtarea+","+file_up+","+gender+","+price+","+payment+","+user_id);
		service.helpyou_edit(post_id,area,title,job,txtarea,file_up,gender,price,payment,user_id);
        return "redirect:help_you";
    }
	@RequestMapping(value="/helpyou_delete", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public String helpyou_delete(HttpServletRequest req) {
    	int help_post_id=Integer.parseInt(req.getParameter("help_post_id"));
    	service.helpyou_delete(help_post_id);
		return "redirect:help_you";
	}
	@RequestMapping(value="/helpyou_reply_done", method = {RequestMethod.POST,RequestMethod.GET})
	public String helpyou_reply_done(HttpServletRequest req, Model model) {
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		int help_post_id=Integer.parseInt(req.getParameter("help_post_post_id"));
		String comment=req.getParameter("re_comment");
		String user_id=dto.getUser_id();
		service.helpyou_reply_submit(comment, help_post_id, user_id);
		return "redirect:helpyou_write_view?help_post_id="+help_post_id;
	}
	@RequestMapping(value="/helpyou_re_recomment_submit", method = {RequestMethod.POST,RequestMethod.GET})
	public String helpyou_re_recomment_submit(HttpServletRequest req, Model model) throws Exception {
		System.out.println("start re_recomment");
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
		int help_post_id=Integer.parseInt(req.getParameter("re_post_id"));
		//re_order=부모의id
		int re_order=Integer.parseInt(req.getParameter("parent_id"));
		System.out.println("parent_id: "+re_order);
		int re_class=Integer.parseInt(req.getParameter("re_class"));
		//re_class=깊이. 부모의 깊이가 0일경우에만 +1
		if(re_class==0) {
			re_class=re_class+1;
		}
		//부모의 re_order값, 부모의 groupNum값
		int parent_re_order=Integer.parseInt(req.getParameter("re_order"));
		int parent_groupNum=Integer.parseInt(req.getParameter("groupNum"));
		//groupNum=조상의id
		int groupNum=0;
		//부모의 re_order값이 0일때, 즉 일반댓글일때는 groupNum이 부모의id가 된다.
		//그 외에는 부모의 groupNum값이 현재대댓글의 groupNum값이 된다. 
		if(parent_re_order==0) {
			groupNum=re_order;
		}else {
			groupNum=parent_groupNum;
		}
		System.out.println("groupNum: "+groupNum);
		String comment=req.getParameter("re_re_comment");		
		String user_id=dto.getUser_id();
		//re_index=순서. IDaoImpl에서 처리한다.
		int re_index=Integer.parseInt(req.getParameter("re_index"));
		System.out.println("re_index: "+re_index+"re_order: "+re_order+", re_class: "+re_class+", re_groupNum: "+groupNum+"user_id: "+user_id);
		service.helpyou_re_recomment_submit(re_index, comment, re_order, re_class, groupNum, help_post_id, user_id);
		System.out.println("end re_recomment");
		return "redirect:helpyou_write_view?help_post_id="+help_post_id;
	}
//	@RequestMapping(value="/helpyou_reply_list", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
//	public @ResponseBody String helpyou_reply_list(@RequestParam("post_id") int post_id) {
//		List<Dto_help_reply> dto=service.helpyou_reply_list(post_id);
//		Gson gson = new Gson();
//		String json = gson.toJson(dto);
//		return json;
//	}
	@RequestMapping(value="/helpyou_reply_delete", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
	public String helpyou_reply_delete(HttpServletRequest req) {
		int help_reply_id=Integer.parseInt(req.getParameter("help_reply_id"));
		String post_id=req.getParameter("help_post_post_id");
		service.helpyou_reply_delete(help_reply_id);
    	return "redirect:helpyou_write_view?help_post_id="+post_id;
	}
	@RequestMapping(value="/helpyou_reply_edit", method = {RequestMethod.POST,RequestMethod.GET})
	public String helpyou_reply_edit(HttpServletRequest req, Model model) {
		System.out.println("start reply_edit");
		int help_post_id=Integer.parseInt(req.getParameter("help_post_post_id"));
		int help_reply_id=Integer.parseInt(req.getParameter("help_reply_id"));
		String re_comment=req.getParameter("re_comment_edit");
		System.out.println("edit: "+help_post_id+","+help_reply_id+","+re_comment);
		service.helpyou_reply_edit(help_reply_id, re_comment);
		System.out.println("end reply_edit");
		return "redirect:helpyou_write_view?help_post_id="+help_post_id;
	}
	@RequestMapping(value="/helpyou_write")
	public String helpyou_write(HttpServletRequest req) {
		 Dto_login dto = new Dto_login();
		 
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
		
		return "helpyou_write";
	}
	
	
	
	
	
	
	
	
	//notice
	@RequestMapping(value = "/notice", method = {RequestMethod.POST,RequestMethod.GET})
    public String notice(HttpServletRequest req, Model model,
    		@RequestParam(required = false, defaultValue = "1") int page, 
    		@RequestParam(required = false, defaultValue = "1") int range) throws Exception{
        
  		//전체 게시글 수
  		int listCnt = service.count();
  		System.out.println("listCnt: "+listCnt);
  		//Pagination 객제 생성
  		Pagination pagination = new Pagination();
  		pagination.pageInfo(page, range, listCnt);
        model.addAttribute("pagination", pagination);
		
		List<Dto_post> notice = service.select_post(pagination); 
        model.addAttribute("notice", notice);
        System.out.println("startPage: "+pagination.getStartPage());
		 
        Dto_login dto = new Dto_login();
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");

        return "notice";
    }
	
	//notice_write
    @RequestMapping(value = "/notice_write", method = {RequestMethod.POST, RequestMethod.GET})
    public String notice_write(HttpServletRequest req, Model model) {
       
		 Dto_login dto = new Dto_login();
		 
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
		 
       return "notice_write";
    }
    
    //notice_write_add
    @RequestMapping(value = "/notice_write_add", method = {RequestMethod.POST,RequestMethod.GET})
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
    	
		 Dto_login dto = new Dto_login();
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
    	
    	System.out.println("add_comment");
    	String user_user_id=req.getParameter("user_user_id");
    	String post_post_id=req.getParameter("post_post_id");
    	String re_comment=req.getParameter("re_comment");
    	String nick=req.getParameter("nick");
    	
    	System.out.println("THIS IS user_user_id : "+user_user_id);
    	System.out.println("THIS IS post_post_id : "+post_post_id);
    	System.out.println("THIS IS re_comment : "+re_comment);
    	System.out.println("THIS IS nick : "+nick);
    	service.add_comment(post_post_id, re_comment,user_user_id,nick);
//    	service.get_reply_id(re_comment);//방금 쓴 댓글의 reply_id를 가져옴
//    	service.set_re_index//그 댓글의 re_index에 reply_id를 넣음
    	
    	System.out.println("The end of add_comment");
    	return "redirect:notice_write_view?post_id="+post_post_id;
    }
    
    //notice_write_view + comments
    @RequestMapping(value = "notice_write_view", method = {RequestMethod.POST,RequestMethod.GET})
    public String notice_write_view(HttpServletRequest req, Model model,
    		@RequestParam(required = false, defaultValue = "1") int page, 
    		@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
      
    	System.out.println("write_view작동");
    	System.out.println("notice_write_view post_id: "+req.getParameter("post_id"));
    	int post_id=Integer.parseInt(req.getParameter("post_id"));
    	System.out.println("this is post_id : " +post_id);
    	
  		int listCnt = service.count_reply(post_id);
  		System.out.println("listCnt: "+listCnt);
  		Pagination pagination = new Pagination();
  		pagination.pageInfo(page, range, listCnt);
        model.addAttribute("pagination", pagination);
        System.out.println("range : "+pagination.getRange());
    	
    	//hits
    	service.uphit(post_id);
    	List<Dto_reply> reply = service.select_post_reply(post_id);
    	Dto_post notice = service.select_post_view(post_id);
    	int replyCnt = service.count_post_reply(post_id);

        model.addAttribute("notice", notice);
        model.addAttribute("reply", reply);
        model.addAttribute("page",0);
        model.addAttribute("replyCnt",replyCnt);
        model.addAttribute("listCnt",listCnt);
        
		 Dto_login dto = new Dto_login();
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
    	
       return "notice_write_view";
    }
    
    @RequestMapping(value = "notice_write_view_reply", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
    public @ResponseBody String notice_write_view_reply(HttpServletRequest req, Model model,
    		@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
			
    		System.out.println("댓글 페이징");
    	
    		//전체 댓글 수
    		int post_id=Integer.parseInt(req.getParameter("post_id"));
    		System.out.println("this is post_id : " +post_id);
			int listCnt = service.count_reply(post_id);
			System.out.println("json listCnt: "+listCnt);
			
			//Pagination 객제 생성
			Pagination pagination = new Pagination();
			pagination.pageInfo(page, range, listCnt);
			System.out.println("json page: "+page);
			List<Dto_reply> reply = service.select_post_reply_ajax(post_id, pagination);
			Gson gson = new Gson();
			String json = gson.toJson(reply);
			
			return json;
	}

    //delete posts
    @RequestMapping(value = "notice_write_delete", method = {RequestMethod.POST,RequestMethod.GET})
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
    	
    	return "redirect:notice_write_view?post_id="+post_post_id;
    }
    
    //notice_write_edit_reply
    @RequestMapping(value = "update_comment", method = {RequestMethod.POST,RequestMethod.GET})
    public String update_comment(HttpServletRequest req, Model model) throws Exception{
    	
		System.out.println("start reply_edit");
		String post_post_id=req.getParameter("post_post_id");
		String reply_id=req.getParameter("parent_id");
		String re_comment=req.getParameter("re_comment_edit");
		String board="0";

		service.update_comment(reply_id, re_comment, post_post_id, board);
		System.out.println("end reply_edit");
		return "redirect:notice_write_view?post_id="+post_post_id;
    }
    
    //update posts
    @RequestMapping(value = "update_post", method = {RequestMethod.POST,RequestMethod.GET})
    public String update_post(HttpServletRequest req, Model model) throws Exception{

		 Dto_login dto = new Dto_login();
		 
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
		 
    	int post_id=Integer.parseInt(req.getParameter("post_id"));
    	Dto_post notice = service.select_post_view(post_id);
    	String title=notice.getTitle();
    	String content=notice.getContent();
    	String img=notice.getImg();
    	String board="3";
    	
    	model.addAttribute("title",title);
    	model.addAttribute("post_id",post_id);
    	model.addAttribute("content",content);
    	model.addAttribute("img",img);

    	System.out.println("this is post_id : " +post_id);
    	System.out.println("this is title : " +title);
    	System.out.println("this is content : " +content);
    	
    	System.out.println("The end of update_post");
    	
    	return "notice_write_edit";
    }
    
//    private int parseInt(String parameter) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

	//update posts
    @RequestMapping(value = "update_post_now", method = {RequestMethod.POST,RequestMethod.GET})
    public String update_post_now(HttpServletRequest req,  @RequestParam("file_up") MultipartFile file, Model model) throws Exception{
    	
    	int post_id=Integer.parseInt(req.getParameter("post_id"));
    	String title=req.getParameter("title");
    	String content=req.getParameter("content");
    	String board="3";
    	
		String img=null;
		if(!file.isEmpty()) {
			img=FileuploadServlet.restore(file);
		}

    	System.out.println("this is post_id : " +post_id);
    	System.out.println("this is title : " +title);
    	System.out.println("this is content : " +content);
    	
    	service.update_post(post_id,board,title,content,img);
    	
    	System.out.println("The end of update_post_now");

    	return "redirect:notice";
    }
    
  //add_re_comments
    @RequestMapping(value = "add_re_comment", method = {RequestMethod.POST,RequestMethod.GET})
    public String add_re_comment(HttpServletRequest req, Model model) throws Exception{
    	
    	System.out.println("Start add_recomment");

		 Dto_login dto = new Dto_login();
		 
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
		 
			int re_order_=Integer.parseInt(req.getParameter("parent_id"));
			int re_class_=Integer.parseInt(req.getParameter("re_class"));
			if(re_class_==0) {
				re_class_=re_class_+1;
			}
			int parent_re_order=Integer.parseInt(req.getParameter("re_order"));
			int parent_groupNum=Integer.parseInt(req.getParameter("groupNum"));
			int groupNum_=0;
			if(parent_re_order==0) {
				groupNum_=re_order_;
			}else {
				groupNum_=parent_groupNum;
			}
			System.out.println("groupNum: "+groupNum_);
			
    	String user_user_id=dto.getUser_id();
    	String re_index=req.getParameter("re_index");
    	String re_comment=req.getParameter("re_re_comment");
    	String post_post_id=req.getParameter("post_post_id");

    	String re_order=String.valueOf(re_order_);
    	String re_class=String.valueOf(re_class_);
    	String groupNum=String.valueOf(groupNum_);

    	System.out.println("this is re_index : " +re_index);
    	System.out.println("this is re_comment : " +re_comment);
    	System.out.println("this is order : " +re_order);
    	System.out.println("this is groupNum : " +groupNum);
    	System.out.println("this is post_post_id : " +post_post_id);
    	
    	service.add_re_comment(re_index,re_comment,re_order,re_class,groupNum,post_post_id,user_user_id, groupNum);
    	
    	
    	System.out.println("The end of update_post_now");

    	return "redirect:notice_write_view?post_id="+post_post_id;
    }
	
    //검색하기
    @RequestMapping("notice_do") //url mapping
    public ModelAndView notice_do(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
            @RequestParam(defaultValue="1") int curPage,
            @RequestParam(defaultValue="user_id") String search_option, //기본 검색 옵션값을 작성자로 한다.
            @RequestParam(defaultValue="") String keyword,   //키워드의 기본값을 ""으로 한다.
            @RequestParam(defaultValue="2") int board,
            @RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range
            )
             throws Exception{
        
        //전체 로우 수
        int count = 1000;
        BoardSearch search = new BoardSearch();
        search.setSearch_option(search_option);
        search.setKeyword(keyword);
        search.setBoard(board);
        int listCnt = service.count_notie_search(search);
        
        //검색조건 + 보드서치 객체 생성
        Pagination pagination = new Pagination();
        pagination.pageInfo(page,range,listCnt);
        
        search.setPagination(pagination);
        
             
        //검색 조건으로 게시글 목록 조회
        List<Dto_post> list = service.list_notice(search);
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<String, Object>();    
        //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정

        map.put("count", count);
        map.put("search_option", search_option);
        map.put("keyword", keyword);
        mav.addObject("map", map);                    
        mav.addObject("pagination", pagination);   
        mav.addObject("notice", list);   
        System.out.println("map : "+map);
        mav.setViewName("notice_do");   //자료를 넘길 뷰의 이름
        return mav;   //게시판 페이지로 이동   
    }
    
		    
		    
		    
		    
		    
		    
		    
		    
	    
    //freeboard
    @RequestMapping(value="freeboard", method = {RequestMethod.POST,RequestMethod.GET})
	public String freeboard(HttpServletRequest req, Model model,
			@RequestParam(required = false, defaultValue = "1") int page, 
    		@RequestParam(required = false, defaultValue = "1") int range) throws Exception{
		
		//전체 게시글 수
		int listCnt = service.count_freeboard();

		//Pagination 객제 생성
		Pagination pagination = new Pagination();
		System.out.println("board controller range01: "+pagination.getRange());
		pagination.pageInfo(page, range, listCnt);
		System.out.println("board controller range02: "+pagination.getRange());
		List<Dto_freeboard> freeboard = service.select_freeboard(pagination);
		System.out.println("board controller range03: "+pagination.getRange());
		model.addAttribute("freeboard",freeboard);
		model.addAttribute("pagination", pagination);
		model.addAttribute("search_do",0);
		
		  Dto_login dto = new Dto_login();
		  
		  HttpSession session = req.getSession();
		  dto=(Dto_login)session.getAttribute("login");
		return "freeboard";
	} // 자유게시판 리스트 보여주기

	
    @RequestMapping(value="freeboard_write", method = {RequestMethod.POST,RequestMethod.GET})
	public String freeboard_write(HttpServletRequest req, Model model) throws Exception{
		
		 Dto_login dto = new Dto_login();
		 
		 HttpSession session = req.getSession();
		 dto=(Dto_login)session.getAttribute("login");
	
    	return "freeboard_write";
	} // 자유게시판 글쓰기 페이지
    
	@RequestMapping(value="/freeboard_write_view", method = {RequestMethod.POST,RequestMethod.GET})
	public String freeboard_write_view(HttpServletRequest req, Model model, 
			@RequestParam(required = false, defaultValue = "1") int page, 
    		@RequestParam(required = false, defaultValue = "1") int range) throws Exception{
			String post_id=req.getParameter("post_id");
		
			int listCnt = service.selectCount(post_id);
			Pagination pagination = new Pagination();
	  		pagination.pageInfo(page, range, listCnt);
	  		model.addAttribute("pagination", pagination);
		
	  		service.free_uphit(post_id);
		List<Dto_freeboard> freeboard = service.select_freeboard_view(post_id);
		List<Dto_free_reply> free_reply = service.select_free_reply(post_id);
		int replyCnt = service.selectCount(post_id);
		model.addAttribute("freeboard",freeboard);
        model.addAttribute("free_reply", free_reply);
        model.addAttribute("page",0);
        model.addAttribute("replyCnt",replyCnt);
        model.addAttribute("listCnt",listCnt);
        
		  Dto_login dto = new Dto_login();
			 
		  HttpSession session = req.getSession();
		  dto=(Dto_login)session.getAttribute("login");
    	
		return "freeboard_write_view";
	} //게시글 + 댓글 보기
	
	@RequestMapping(value = "freeboard_write_view_reply", method = {RequestMethod.POST,RequestMethod.GET},produces="application/json;charset=UTF-8")
    public @ResponseBody String freeboard_write_view_reply(HttpServletRequest req, Model model,
    		@RequestParam(required = false, defaultValue = "1") int page, 
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
			
    		System.out.println("댓글 페이징");
    	
    		//전체 댓글 수
    		String post_id=req.getParameter("post_id");
    		System.out.println("this is post_id : " +post_id);
			int listCnt = service.selectCount(post_id);
			System.out.println("json listCnt: "+listCnt);
			
			//Pagination 객제 생성
			Pagination pagination = new Pagination();
			pagination.pageInfo(page, range, listCnt);
			System.out.println("json page: "+page);
			List<Dto_free_reply> reply = service.select_free_reply_ajax(post_id, pagination);
			Gson gson = new Gson();
			String json = gson.toJson(reply);
			System.out.println("댓글 페이징 완료");
			
			System.out.println("freeboard_write_view_reply, json : "+json);
			return json;
	}





	
	  @RequestMapping(value = "/freeboard_write_delete", method = {RequestMethod.POST,RequestMethod.GET})
	    public String freeboard_write_delete(HttpServletRequest req, Model model) throws Exception{
	    	
	    	String post_id=req.getParameter("post_id");
	    	service.select_free_reply_delete(post_id);
	    	service.select_freeboard_delete(post_id);
	    	
	    	System.out.println("this is post_id : " +post_id);
	    	return "redirect:freeboard";
	    } //게시글 삭제
	  
	  @RequestMapping(value="freeboard_modify", method = {RequestMethod.POST,RequestMethod.GET})
		public String freeboard_modify(HttpServletRequest req, Model model) throws Exception{
		  	String post_id=req.getParameter("post_id");
	    	String title=req.getParameter("title");
	    	String content=req.getParameter("content");
	    	String board="2";
	    	
	    	System.out.println("to modify: "+post_id);
	    	
	    	model.addAttribute("title",title);
	    	model.addAttribute("post_id",post_id);
	    	model.addAttribute("content",content);

	    	return "freeboard_modify";
	    } //수정페이지로 이동
	  @RequestMapping(value = "freeboard_update", method = {RequestMethod.POST,RequestMethod.GET})
	    public String freeboard_update(HttpServletRequest req, Model model) throws Exception{
	    	
	    	String post_id=req.getParameter("post_id");
	    	String board="2";
	    	String title=req.getParameter("title");
	    	String content=req.getParameter("content");
	    	
	    	System.out.println("test : " +post_id);
	    	System.out.println("test : " +title);
	    	System.out.println("test : " +content);
	    	
	    	service.freeboard_update(post_id,board,title,content);
	    	
			 Dto_login dto = new Dto_login();
			 
			 HttpSession session = req.getSession();
			 dto=(Dto_login)session.getAttribute("login");

	    	return "redirect:freeboard";
	    } //게시물 수정
	    	
		@RequestMapping(value="/freeboard_submit", method = {RequestMethod.POST,RequestMethod.GET})
		public String freeboard_submit(HttpServletRequest req, @RequestParam("file_up") MultipartFile file, Model model) throws Exception {
			Dto_login dto = new Dto_login();
			HttpSession session = req.getSession();
			dto=(Dto_login)session.getAttribute("login");
			 
			String file_up=null;
				if(!file.isEmpty()) {
					file_up=FileuploadServlet.restore(file);
				}
				
			String post_id="10";
	    	String board="2";
	    	String title=req.getParameter("title");
	    	String operator=null;
	    	String content=req.getParameter("content");
	    	String nick=req.getParameter("nick");
			String user_user_id=dto.getUser_id();
			
			System.out.println("test : " +title);
			System.out.println("file_up : " +file_up);
			service.freeboard_write(post_id, board, title, content,user_user_id,nick, file_up);
			return "redirect:freeboard";
		} //게시글 작성
	
	@RequestMapping(value = "add_free_comment", method = {RequestMethod.POST,RequestMethod.GET})
    public String add_free_comment(HttpServletRequest req, Model model) throws Exception {
		Dto_login dto = new Dto_login();
		HttpSession session = req.getSession();
		dto=(Dto_login)session.getAttribute("login");
    	String post_post_id=req.getParameter("post_post_id");
    	String re_comment=req.getParameter("re_comment");
    	String user_user_id=dto.getUser_id();
    	service.add_free_comment(post_post_id, re_comment, user_user_id);
    	
    	return "redirect:freeboard_write_view?post_id="+post_post_id;
    } //댓글 작성
	 
	 @RequestMapping(value = "delete_free_comment", method = {RequestMethod.POST,RequestMethod.GET})
	    public String delete_free_comment(HttpServletRequest req, Model model) throws Exception{
	    	
	    	String reply_id=req.getParameter("reply_id");
	    	String board="2";
		    String post_post_id=req.getParameter("post_id");

			service.delete_free_comment(reply_id,board,post_post_id);

			return "redirect:freeboard_write_view?post_id="+post_post_id;
	    } //댓글 삭제
	 
	 @RequestMapping(value = "update_free_comment", method = {RequestMethod.POST,RequestMethod.GET})
	    public String update_free_comment(HttpServletRequest req, Model model) throws Exception{
	    	
	    	String post_post_id=req.getParameter("post_post_id");
	    	String re_comment=req.getParameter("re_comment");
	    	String reply_id=req.getParameter("reply_id");
	    	String board="2";
	    	
	    	model.addAttribute("post_post_id",post_post_id);
	    	model.addAttribute("re_comment",re_comment);
	    	model.addAttribute("reply_id",reply_id);
	    	
	    	return "free_reply_modify";
	    } // 댓글 수정 페이지로
	 
	    @RequestMapping(value = "update_free_comment_now", method = {RequestMethod.POST,RequestMethod.GET})
	    public String update_free_comment_now(HttpServletRequest req, Model model) throws Exception{
	    	String post_post_id=req.getParameter("post_post_id");
	    	String re_comment=req.getParameter("re_comment");
	    	String reply_id=req.getParameter("reply_id");
	    	String board="2";
	    	
	    	service.update_free_comment_now(reply_id,re_comment,post_post_id,board);

	    	return "redirect:freeboard_write_view?post_id="+post_post_id;
	    } // 댓글 수정
	    
	    @RequestMapping(value = "add_free_re_comment", method = {RequestMethod.POST,RequestMethod.GET})
	    public String add_free_re_comment(HttpServletRequest req, Model model) throws Exception{
	    	//test_2	    	
	       	
	    	System.out.println("Start add_recomment");

			 Dto_login dto = new Dto_login();
			 
			 HttpSession session = req.getSession();
			 dto=(Dto_login)session.getAttribute("login");
			
	    	String user_user_id=dto.getUser_id();
	    	String re_index=req.getParameter("reply_id");
	    	String re_comment=req.getParameter("re_re_comment");
	    	int order=Integer.parseInt(req.getParameter("re_order"));
	    	int class_re=Integer.parseInt(req.getParameter("re_class"));
	    	String groupNum=req.getParameter("groupNum");
	    	String post_post_id=req.getParameter("post_post_id");
	    	
	    	order+=1;
	    	class_re+=1;

	    	
	    	String re_order=String.valueOf(order);
	    	String re_class=String.valueOf(class_re);

	    	System.out.println("this is re_index : " +re_index);
	    	System.out.println("this is re_comment : " +re_comment);
	    	System.out.println("this is order : " +re_order);
	    	System.out.println("this is groupNum : " +groupNum);
	    	System.out.println("this is post_post_id : " +post_post_id);
	    	
	    	service.add_free_re_comment(re_index,re_comment,re_order,re_class,groupNum,post_post_id,user_user_id);
	    	
	    	
	    	System.out.println("The end of update_post_now");

	    	return "redirect:freeboard_write_view?post_id="+post_post_id;
	    } // 대댓글 작성

	    @RequestMapping("freeboard_search") //url mapping
	    public ModelAndView list(HttpServletRequest req, //RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
	            @RequestParam(defaultValue="1") int curPage,
	            @RequestParam(defaultValue="") String search_option, //기본 검색 옵션값을 작성자로 한다.
	            @RequestParam(defaultValue="") String keyword,   //키워드의 기본값을 ""으로 한다.
	            @RequestParam(defaultValue="2") int board,
	            @RequestParam(required = false, defaultValue = "1") int page, 
				@RequestParam(required = false, defaultValue = "1") int range
	            )
	             throws Exception{
	    	Dto_login dto = new Dto_login();
			HttpSession session = req.getSession();
			dto=(Dto_login)session.getAttribute("login");
	    	
	    	
	    	BoardSearch search = new BoardSearch();
	        //전체 로우 수
	        if(!search_option.equals("")) {
	        	search.setSearch_option(search_option);
	        }
	        if(!keyword.equals("")) {
	        	search.setKeyword(keyword);
	        }
	        System.out.println("boardsearch: "+search.getKeyword());
	        search.setBoard(board);
	        int listCnt = service.count_freeboard_search(search);
	        // 검색조건 + 보드서치 객체 생성
	        System.out.println("search_count"+listCnt);
	        Pagination pagination = new Pagination();
	        pagination.pageInfo(page,range,listCnt);
	        search.setPagination(pagination);
	        
	        
	        //검색 조건으로 게시글 목록 조회
	        List<Dto_freeboard> list = service.listAll(search);
	        ModelAndView mav = new ModelAndView();
	        Map<String,Object> map = new HashMap<String, Object>();    
	        //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
	        System.out.println("search endPage: "+pagination.getEndPage());
	        map.put("search_option", search_option);
	        map.put("keyword", keyword);
	        mav.addObject("map", map);                    
	        mav.addObject("pagination", pagination);   
	        mav.addObject("freeboard", list);   
	        mav.addObject("search_do",1);
	        System.out.println("map : "+map);
	        mav.setViewName("freeboard_search");   //자료를 넘길 뷰의 이름
	        return mav;   //게시판 페이지로 이동   
	    } // 검색하기
}