package com.javalec.holo.service;

import java.sql.Blob;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.javalec.holo.dao.IDao;
import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Help_postDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
    private IDao dao;

//	@Override
//	public List<Dto> selectMember() throws Exception {
//		return dao.list();
//	}

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
		public void write(String title, String content, String tag_area,
											String gender, String tag_job, String payment,int min_price
				)throws Exception {
			
			dao.write(title,content,tag_area,gender,tag_job,payment,min_price);
		
		}
		//help_me게시글 수정
		@Override
		public void edit(Dto_help_post dto_p) throws Exception {
			// TODO Auto-generated method stub
			
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
		public void re_write(int help_post_id, String reply) throws Exception {
		System.out.println("멤버서비스 댓글보여주기 help_post_id"+help_post_id);
		dao.re_write(help_post_id,reply);
		};
		//help_me 댓글 수정

		//help_me 댓글 삭제
		public void re_delete(int help_reply_id) throws Exception{
		dao.re_delete(help_reply_id);
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
	public void helpyou_write_view(int help_post_id) {
		dao.helpyou_write_view(help_post_id);
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
		public void add_post(String title, String content) {
		System.out.println("MemberServiceImpl, content : "+content);
			dao.add_post(title,content);
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
		@Override //notice_write_view : comments
		public List<Dto_reply> select_freeboard_reply(int post_id) throws Exception {
			// TODO Auto-generated method stub
			return dao.select_freeboard_reply(post_id);
		}//댓글 보기
		@Override
		public void select_freeboard_delete(int post_id) throws Exception {
			// TODO Auto-generated method stub
			dao.select_freeboard_delete(post_id);
		}//게시글 삭제
		@Override
		public List<Dto_reply> select_freeboard_reply_delete(int post_id) throws Exception {
			// TODO Auto-generated method stub
			return dao.select_freeboard_reply_delete(post_id);
		}//댓글 삭제
		@Override
		public void freeboard_submit(String post_id, String board, String title, String operator, 
				String nick, String content, String img, String user_user_id) throws Exception
				{
			dao.freeboard_submit(post_id, board, title, operator, nick, content, img, user_user_id);
		}
}
