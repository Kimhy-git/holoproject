package com.javalec.holo.service;

import java.sql.Blob;
import java.util.List;

import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Help_postDto;

public interface MemberService {
//	public List<Dto> selectMember() throws Exception;
	
	//help_you
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id);
	public List<Help_postDto> helpyou_list();
	
	//notice
			public List<Dto_post> select_post() throws Exception;
			
			//notice_write_view
			public List<Dto_post> select_post_view(String post_id) throws Exception;
			
			//notice_write_view : comments
			public List<Dto_reply> select_post_reply(String post_id) throws Exception;
			
			//notice_write_view : delete
			public List<Dto_post> select_post_delete(String post_id) throws Exception;
			
			//notice_write_view : delete comments with a post
			public List<Dto_reply> select_reply_delete(String post_id) throws Exception;

			public void add_post(String title,String content, String file_up);
			
			//add comments
			public void add_comment(String post_post_id, String re_comment);
			
			//delete comments ONLY
			public void delete_comment(String reply_id, String board, String post_post_id);
			
			//update comments
			public void update_comment(String reply_id, String re_comment, String post_post_id, String board);
			
			//update posts
			public void update_post(String post_id, String board, String title, String content);
		
			//help_me게시글 상세보기
			public Dto_help_post read(int help_post_id) throws Exception;
			
			//help_me게시글 목록(리스트)
			public List<Dto_help_post> list() throws Exception;

			//help_me like 불러오기
			public List<Dto_help_post> likes() throws Exception;

			//help_me게시글 작성
			public void write(String title, String content,String gender, String tag_area, String tag_job, String payment,
						int min_price) throws Exception;

			//help_me게시글 수정
			public void edit(Dto_help_post dto_p) throws Exception;
			
			//help_me게시글 삭제
			public void delete(int help_post_id) throws Exception;

			//help_me 댓글 보기
			public List<Dto_help_reply> re_list(int help_post_id) throws Exception;
			
			//help_me 댓글 쓰기
			public void re_write(String re_comment,int help_post_id) throws Exception;
			
			//help_me 댓글 삭제
			public void re_delete(int help_reply_id) throws Exception;
		
			
		//freeboard
		public List<Dto_freeboard> select_freeboard() throws Exception;
		//리스트 보기
		public List<Dto_freeboard> select_freeboard_view(int post_id) throws Exception;
		//게시글 보기
		public List<Dto_reply> select_freeboard_reply(int post_id) throws Exception;
		//댓글 보기
		public void select_freeboard_delete(int post_id) throws Exception;
		//게시글 삭제
		public List<Dto_reply> select_freeboard_reply_delete(int post_id) throws Exception;
		//댓글 삭제
		public void freeboard_submit(String post_id, String board, String title, String operator, 
				String nick, String content, String img, String user_user_id)throws Exception;

}
