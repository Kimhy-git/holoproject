package com.javalec.holo.service;

import java.sql.Blob;
import java.util.List;

import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.dto.Help_postDto;

public interface MemberService {
//	public List<Dto> selectMember() throws Exception;
	
	//help_you
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id);
	public List<Dto_help_post> helpyou_list();
	public Dto_help_post helpyou_write_view(int help_post_id);
	public void helpyou_delete(int help_post_id);
	public void helpyou_reply_submit(String comment, int help_post_post_id, String user_user_id);
	public List<Dto_help_reply> helpyou_reply_list(int help_post_post_id);
	public void helpyou_reply_delete(int help_reply_id);
	public void helpyou_edit(int help_post_id,String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id);
	public void helpyou_reply_edit(int help_reply_id, String re_comment);
	public void helpyou_re_recomment_submit(int re_index, String comment, int re_order, int help_post_post_id, String user_user_id);
	
	
	
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
		
			//add re_comments
			public void add_re_comment(String re_index, String re_comment, String re_order, String groupNum, String post_post_id);
			
			
			
			
			
			
			
			//help_me게시글 상세보기
			public Dto_help_post read(int help_post_id) throws Exception;
			
			//help_me게시글 목록(리스트)
			public List<Dto_help_post> list() throws Exception;

			//help_me like 불러오기
			public List<Dto_help_post> likes() throws Exception;

			//help_me게시글 작성
			public void write(String title, String content, String tag_area, String tag_job, String gender, String payment,
					int min_price, String img) throws Exception;

			//help_me게시글 수정
			public void edit(String title, String content, String gender, String tag_area, String tag_job, String payment,
					int min_price, int help_post_id) throws Exception;
			
			//help_me게시글 삭제
			public void delete(int help_post_id) throws Exception;

			//help_me 댓글 보기
			public List<Dto_help_reply> re_list(int help_post_id) throws Exception;
			
			//help_me 댓글 쓰기
			public void re_write(String re_comment,int help_post_id) throws Exception;
			
			//help_me 댓글 삭제
			public void re_delete(int help_reply_id) throws Exception;
			
			//help_me  수정 댓글 보기
			public Dto_help_reply re_read(int help_reply_id)throws Exception;
			
			//help_me 댓글 수정
			public void re_edit(int help_reply_id,String re_comment) throws Exception;
			
			
			
		// freeboard
			// freeboard
			public List<Dto_freeboard> select_freeboard() throws Exception;
			// 리스트 보기
			public List<Dto_freeboard> select_freeboard_view(int post_id) throws Exception;
			// 게시글 보기
			public void select_freeboard_delete(int post_id) throws Exception;
			//게시글 삭제


			public void freeboard_update(String post_id, String board, String title, String content);
			// 게시글 수정
			public void freeboard_write(String post_id, String board, String title,
					String content, String user_user_id)throws Exception;
			// 게시물 쓰기
			public List<Dto_free_reply> select_free_reply(int post_id) throws Exception;
			// 댓글 보기
			public void add_free_comment(String post_post_id, String re_comment) throws Exception;
			// 댓글 쓰기

			public void delete_free_comment(String reply_id, String board, String post_post_id);
			// 댓글 삭제
			public void update_free_comment(String reply_id, String re_comment, String post_post_id, String board);
			// 댓글 수정
			public void add_free_re_comment(String re_index, String re_comment, String re_order, String groupNum, String post_post_id);
			// 대댓글 작성	

}

