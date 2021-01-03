package com.javalec.holo.dao;

import java.sql.Blob;
import java.util.List;

import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Help_postDto;

public interface IDao {
	
	//help_me게시글 리스트
		public List<Dto_help_post> list() throws Exception;
		
		//help_me게시글 상세보기
		public Dto_help_post read(int help_post_id) throws Exception;
			
		//help_me게시글 작성
		void write(String title, String content,String gender, String tag_area, String tag_job, String payment, int min_price)throws Exception;

		//help_me게시글 수정
		public void edit(Dto_help_post dto_p) throws Exception;
		
		//help_me게시글 삭제
		public void delete(int help_post_id) throws Exception;
	
	//help_you
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id);
	public List<Help_postDto> helpyou_list();
	
	//notice
		public List<Dto_post> select_post();
		
		//notice_write_view
		public List<Dto_post> select_post_view(int post_id);
		
		//notice_write_view : comments
		public List<Dto_reply> select_post_reply(int post_id);
		
		//notice_write_view : delete
		public List<Dto_post> select_post_delete(int post_id);
		
		//notice_reply_view : delete
		public List<Dto_reply> select_reply_delete(int post_id);
		
		//notice_write : add a post
		public void add_post(String post_id, String board, String title, String operator, 
				String nick, String content, String img, String user_user_id);
		
		public List<Dto_freeboard> select_freeboard();
		//리스트 보여주기
		public List<Dto_freeboard> select_freeboard_view(int post_id);
		//게시글 상세 보기
		public List<Dto_reply> select_freeboard_reply(int post_id);
		//댓글 보여주기
		public List<Dto_freeboard> select_freeboard_delete(int post_id);
		//게시글 삭제
		public List<Dto_reply> select_freeboard_reply_delete(int post_id);
		//댓글 삭제
		
		public void freeboard_submit(int post_id, int board, String title, String operator, String nick, String content, String img,
				String user_user_id) throws Exception;
		//게시글 작성
		
}
