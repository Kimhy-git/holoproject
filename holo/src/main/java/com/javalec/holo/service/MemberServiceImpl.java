package com.javalec.holo.service;

import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Service;
import com.javalec.holo.dao.IDao;
import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.dto.Help_postDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
    private IDao dao;

//	@Override
//	public List<Dto> selectMember() throws Exception {
//		return dao.list();
//	}


	
		//find_id

	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	//아이디 중복 체크
	
	@Override
	public void check_id(String user_id, HttpServletResponse response) throws Exception {
		
		PrintWriter out = response.getWriter();
		out.println(dao.check_id(user_id));
		out.close();
		
	}

	//이메일 중복 체크

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println(dao.check_email(email));
		out.close();
	}
	
	
	
		//help_me게시글 리스트
		@Override
		public List<Dto_help_post> list() throws Exception {

			return dao.list();
		}
		
		//help_me게시글 상세보기(뷰어)
		@Override
		public Dto_help_post read(int help_post_id) throws Exception {

		return dao.read(help_post_id);
		}
		

		//help_me like 불러오기

		@Override
		public List<Dto_help_post> likes() throws Exception{
		return dao.likes();
		}

		//help_me게시글 쓰기

		@Override
		public void write(String title, String content, String tag_area, String tag_job, String gender, String payment,
				int min_price, String img )throws Exception {
			
			dao.write(title,content,gender,tag_area,tag_job,payment,min_price, img);
		
		}
		//help_me게시글 수정
		@Override
		public void edit(String title, String content, String gender, String tag_area, String tag_job, String payment,
				int min_price, int help_post_id, String img)throws Exception {
			
			dao.edit(title,content,gender,tag_area,tag_job,payment,min_price,help_post_id,img);
		
		}
		//help_me게시글 삭제
		@Override
		public void delete(int help_post_id) throws Exception {

			dao.delete(help_post_id);
		}

		//help_me 댓글 보여주기
		public List<Dto_help_reply> re_list(int help_post_id) throws Exception{
				
		return dao.re_list(help_post_id);
		}
		//help_me 댓글 작성
		public void re_write(String re_comment,int help_post_id ) throws Exception {
		System.out.println("멤버서비스 댓글보여주기 reply"+re_comment);
			dao.re_write(re_comment,help_post_id);
		}
		
		//help_me  수정 댓글 보기
		public Dto_help_reply re_read(int help_reply_id)throws Exception{
			return dao.re_read(help_reply_id);
		};
		//help_me 댓글 수정
		public void re_edit(int help_reply_id, String re_comment)throws Exception {
			System.out.println("멤버 서비스에서 리코멘트 수정한거 ~~:"+re_comment);
			dao.re_edit(help_reply_id,re_comment);
		}
		//help_me 댓글 삭제
		public void re_delete(int help_reply_id) throws Exception{
		dao.re_delete(help_reply_id);
		}
		
		//help_me hit
		public void hit(int help_post_id) throws Exception{
			dao.hit(help_post_id);
		}
		
		
		
	
	@Override // help_you_write
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id) {
		System.out.println("memberservice helpyou_submit");
		System.out.println(tag_area+", "+title+", "+tag_job+", "+content+", "+img+", "+gender+", "+min_price+", "+payment+", "+user_user_id);
		dao.helpyou_submit(tag_area, title, tag_job, content, img, gender, min_price, payment, user_user_id);
	}
	
	@Override // help_you
	public List<Dto_help_post> helpyou_list(){
		return dao.helpyou_list();
	}
	@Override // helpyou_write_view
	public Dto_help_post helpyou_write_view(int help_post_id) {
		return dao.helpyou_write_view(help_post_id);
	}
	@Override
	public void helpyou_delete(int help_post_id) {
		dao.helpyou_delete(help_post_id);
	}
	@Override
	public void helpyou_reply_submit(String comment, int help_post_post_id, String user_user_id) {
		dao.helpyou_reply_submit(comment, help_post_post_id, user_user_id);
	}
	@Override
	public void helpyou_re_recomment_submit(int re_index, String comment, int re_order, int help_post_post_id, String user_user_id) {
		dao.helpyou_re_recomment_submit(re_index, comment, re_order, help_post_post_id, user_user_id);
	}
	@Override
	public List<Dto_help_reply> helpyou_reply_list(int help_post_post_id){
		return dao.helpyou_reply_list(help_post_post_id);
	}
	@Override
	public void helpyou_reply_delete(int help_reply_id) {
		dao.helpyou_reply_delete(help_reply_id);
	}
	@Override
	public void helpyou_edit(int help_post_id,String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id) {
		dao.helpyou_edit(help_post_id,tag_area, title, tag_job, content, img, gender, min_price, payment, user_user_id);
	}
	@Override
	public void helpyou_reply_edit(int help_reply_id, String re_comment) {
		dao.helpyou_reply_edit(help_reply_id, re_comment);
	}
	
	
	
	
	//NOTICE 
	@Override //notice
	public List<Dto_post> select_post() throws Exception {
		return dao.select_post();
	}

	@Override //notice_write_view
	public List<Dto_post> select_post_view(String post_id) throws Exception {
		return dao.select_post_view(post_id);
	}

	@Override //notice_write_view : comments
	public List<Dto_reply> select_post_reply(String post_id) throws Exception {
		return dao.select_post_reply(post_id);
	}

	@Override //delete posts
	public List<Dto_post> select_post_delete(String post_id) throws Exception {
		return dao.select_post_delete(post_id);
	}
	
	@Override //delete comments with a post
	public List<Dto_reply> select_reply_delete(String post_id) throws Exception {
		return dao.select_reply_delete(post_id);
	}
	
	//add posts

	@Override
	public void add_post(String title, String content, String img) {
	System.out.println("MemberServiceImpl, content : "+content);
		dao.add_post(title,content,img);
	}

	

	
	//add comments
	@Override
	public void add_comment(String post_post_id, String re_comment) {
		System.out.println("MemberServiceImpl, post_post_id : "+post_post_id);
		System.out.println("MemberServiceImpl, re_comment : "+re_comment);
		dao.add_comment(post_post_id, re_comment);
	}
	
	//delete comments ONLY
	@Override
	public void delete_comment(String reply_id, String board, String post_post_id) {
		
		System.out.println("MemberServiceImpl, reply_id : "+reply_id);
		System.out.println("MemberServiceImpl, board : "+board);
		System.out.println("MemberServiceImpl, post_post_id : "+post_post_id);
		
		dao.delete_comment(reply_id,board,post_post_id);
	}
	
	//update comments
	@Override
	public void update_comment(String reply_id, String re_comment, String post_post_id, String board) {
		
		System.out.println("MemberServiceImpl, reply_id : "+reply_id);
		System.out.println("MemberServiceImpl, re_comment : "+re_comment);
		System.out.println("MemberServiceImpl, post_post_id : "+post_post_id);
		
		dao.update_comment(reply_id,re_comment,post_post_id,board);
	}

	@Override
	public void update_post(String post_id, String board, String title, String content) {

		System.out.println("MemberServiceImpl, post_id : "+post_id);
		System.out.println("MemberServiceImpl, title : "+title);
		System.out.println("MemberServiceImpl, content : "+content);
		
		dao.update_post(post_id,board,title,content);
		
	}
	
	//add re_comments
	@Override
	public void add_re_comment(String re_index, String re_comment, String re_order, String groupNum, String post_post_id) {
		
		System.out.println("MemberServiceImpl : "+re_index+" /"+re_comment+" /"+re_order+" /"+groupNum+" /"+post_post_id);
		dao.add_re_comment(re_index,re_comment,re_order,groupNum,post_post_id);
		
	}	

	//hits
	@Override
	public void uphit(String post_id) {
		System.out.println("MemberServiceImpl, post_id : "+post_id);
		dao.uphit(post_id);
	}
	
	//the number of comments
//	@Override
//	public void num_of_comments(String post_id) {
//		System.out.println("MemberServiceImpl, post_id, number : "+post_id);
//		dao.num_of_comments(post_id);
//	}
		
	//login
	@Override
	public boolean login(Dto_user dto, HttpSession session) {
		boolean result = dao.login(dto);
		if(result) {//true일 경우 session에 등록
			Dto_user dto2 = viewMember(dto);
			//세션 변수 등록
			session.setAttribute("user_id", dto2.getUser_id());
			session.setAttribute("user_pw", dto2.getUser_pw());
		}
		return result;
	}

	//회원 로그인 정보
	@Override
	public Dto_user viewMember(Dto_user dto) {
		return dao.viewMember(dto);
	}

	//log out
	@Override
	public void logout(HttpSession session) {
		//세션 변수 삭제 및 정보 초기화
		session.invalidate();
	}
	
	
	
	
	
		
	

	@Override
	public List<Dto_freeboard> select_freeboard() throws Exception {
		// TODO Auto-generated method stub
		return dao.select_freeboard();
	} //리스트 보기
	@Override
	public List<Dto_freeboard> select_freeboard_view(int post_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.select_freeboard_view(post_id);
	} // 게시글 보기

	@Override
	public void select_freeboard_delete(String post_id) throws Exception {
		// TODO Auto-generated method stub
		dao.select_freeboard_delete(post_id);
	} //게시글 삭제
	
	@Override 
	public List<Dto_free_reply> select_free_reply_delete(String post_id) throws Exception {
		return dao.select_free_reply_delete(post_id);
	} //게시글 + 댓글 삭제
	
	@Override
	public void freeboard_update(String post_id, String board, String title, String content) {

		dao.freeboard_update(post_id,board,title,content);			
	} // 게시글 수정
	
	@Override
	public void freeboard_write(String post_id, String board, String title,
			String content, String user_user_id) throws Exception
			{
		dao.freeboard_write(post_id, board, title, content, user_user_id);
	} // 게시글 작성
	
	@Override 
	public List<Dto_free_reply> select_free_reply(int post_id) throws Exception {
		return dao.select_free_reply(post_id);
	} // 댓글 보여주기
	@Override
		public void add_free_comment(String post_post_id, String re_comment) {
			dao.add_free_comment(post_post_id, re_comment);
	} // 댓글 작성
	@Override
	public void delete_free_comment(String reply_id, String board, String post_post_id) {
		dao.delete_free_comment(reply_id,board,post_post_id);
	} // 댓글 삭제
	@Override
	public void update_free_comment(String reply_id, String re_comment, String post_post_id, String board) {
		dao.update_free_comment(reply_id,re_comment,post_post_id,board);
	} // 댓글 수정
	@Override


	public void add_free_re_comment(String re_index, String re_comment, String re_order, String groupNum,
			String post_post_id, String board) {
		dao.add_free_re_comment(re_index,re_comment,re_order,groupNum,post_post_id, board);
	} // 대댓글 작성
	@Override
	public void free_uphit(int post_id) throws Exception {
		dao.free_uphit(post_id);
	} // 조회수 올리기
	public void edit_free_re_comment(String re_index, String re_comment, String re_order, String groupNum,
			String post_post_id, String board) {
		dao.edit_free_re_comment(re_index,re_comment,re_order,groupNum,post_post_id, board);
	}
	public void find_pw(String user_id, String passwd_q, String passwd_a) throws Exception {
		dao.find_pw(user_id, passwd_q, passwd_a);
	}

	@Override
	public void update_free_comment_now(String reply_id, String re_comment, String post_post_id, String board) {
		dao.update_free_comment_now(reply_id,re_comment,post_post_id,board);
		
	}

	@Override
	public void checkQueestionPw(String user_id, String passwd_q, String passwd_a) {
		dao.checkQueestionPw(user_id, passwd_q, passwd_a);
		
	}

	@Override
	public int checkQueestionPw2(Dto_user user) {
		return dao.checkQueestionPw2(user);
	}

	@Override
	public Dto_user getUserByUserId(String user_id) {
		return dao.getUserByUserId(user_id);
	}

}
