package com.javalec.holo.dao;

import java.sql.Blob;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Help_postDto;

@Repository
public class IDaolmpl implements IDao {
	
	@Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "mapper.mapper";
    
//	@Override
//	public List<Dto> list() {
//		return sqlSession.selectList(Namespace+".selectMember");
//	}
	
    
	//help_me게시글 리스트
  	@Override
  	public List<Dto_help_post> list() throws Exception {
  		// TODO Auto-generated method stub
  		
  		return sqlSession.selectList(Namespace+".list");
  	}
  	
  	//help_me게시글 상세보기 (뷰어)
		@Override
		public Dto_help_post read(int help_post_id) throws Exception{
		return sqlSession.selectOne(Namespace+".read",help_post_id);
		}
  	
		@Override
		public List<Dto_help_post> likes(){
		return sqlSession.selectList(Namespace+".likes");
		}
		
  	//help_me게시글 쓰기

		@Override
  	public void write(String title, String content, String tag_area, String tag_job, String gender, String payment,
			int min_price)throws Exception {
		
		Dto_help_post Dto_p = new Dto_help_post(title, content, gender, tag_area, tag_job, payment, min_price);
  		sqlSession.insert(Namespace+".write",Dto_p);
  	}
  	//help_me게시글 수정
  	@Override
  	public void edit(Dto_help_post dto_p) throws Exception {
  		sqlSession.update(Namespace+".edit");
  		
  	}
  	//help_me게시글 삭제
  	@Override
  	public void delete(int help_post_id) throws Exception {
  		sqlSession.delete(Namespace+".delete",help_post_id);
  	}

		//help_me 댓글 보기
  	@Override
  	public List<Dto_help_reply> re_list(int help_post_id){
  		
  		return sqlSession.selectList(Namespace+".re_list",help_post_id);
  	}
  	//help_me 댓글 작성
  	@Override
  	public void re_write(String re_comment,int help_post_id )throws Exception {
  		System.out.println("아이다오 댓글보여주기 reply :"+re_comment);
  		Dto_help_reply Dto_pr = new Dto_help_reply(re_comment, help_post_id);
  		sqlSession.insert(Namespace+".re_write",Dto_pr);
  	}
  	//help_me 수정 댓글 보기
  	@Override
  	public Dto_help_reply re_read(int help_reply_id)throws Exception{
  		return sqlSession.selectOne(Namespace+".re_edit_view",help_reply_id);
  	};
  	//help_me 댓글 수정
  	@Override
  	public void re_edit(String re_comment, int help_reply_id)throws Exception {
  		Dto_help_reply Dto_pr = new Dto_help_reply(re_comment, help_reply_id);
  		sqlSession.insert(Namespace+".re_edit",Dto_pr);
  	}
  	//help_me 댓글 삭제
	@Override
  	public void re_delete(int help_reply_id) throws Exception {
  		sqlSession.delete(Namespace+".re_delete",help_reply_id);
  	}
	
	
    
		
	//help_you
	@Override
	public List<Dto_help_post> helpyou_list() {
		System.out.println("helpyou_list");
		return sqlSession.selectList(Namespace+".helpyou_list");
	}
		
  	//helpyou_write
	@Override
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id) {
		System.out.println("helpyou_submit");
		System.out.println(tag_area+", "+title+", "+tag_job+", "+content+", "+img+", "+gender+", "+min_price+", "+payment+", "+user_user_id);
		
		Help_postDto helpDto=new Help_postDto(tag_area, title, tag_job, content, img, gender, min_price, payment, user_user_id);		
		
		sqlSession.insert(Namespace+".helpyou_submit",helpDto);
	}

	@Override
	public Dto_help_post helpyou_write_view(int help_post_id) {
		return sqlSession.selectOne(Namespace+".helpyou_write_view",help_post_id);
	}
	
	@Override
	public void helpyou_delete(int help_post_id) {
		sqlSession.delete(Namespace+".helpyou_delete",help_post_id);
	}
	
	@Override
	public void helpyou_reply_submit(String comment, int help_post_post_id, String user_user_id) {
		Dto_help_reply helpreplyDto=new Dto_help_reply(comment,help_post_post_id,user_user_id);
		sqlSession.insert(Namespace+".helpyou_reply_submit",helpreplyDto);
	}
	
	@Override
	public List<Dto_help_reply> helpyou_reply_list(int help_post_post_id){
		return sqlSession.selectList(Namespace+".helpyou_reply_list",help_post_post_id);
	}
	
	@Override
	public void helpyou_reply_delete(int help_reply_id) {
		System.out.println("IDaoImpl: "+help_reply_id);
		sqlSession.delete(Namespace+".helpyou_reply_delete",help_reply_id);
	}
	
	
	
	//NOTICE
		@Override //notice
		public List<Dto_post> select_post() {
			return sqlSession.selectList(Namespace+".select_post");
		}

		@Override //notice_write_view
		public List<Dto_post> select_post_view(String post_id) {
			return sqlSession.selectList(Namespace+".select_post_view",post_id);
		}

		@Override //notice_write_view : comments
		public List<Dto_reply> select_post_reply(String post_id) {
			return sqlSession.selectList(Namespace+".select_post_reply",post_id);
		}

		@Override //delete posts
		public List<Dto_post> select_post_delete(String post_id) {
			return sqlSession.selectList(Namespace+".select_post_delete",post_id);
		}

		@Override //delete comments with a post
		public List<Dto_reply> select_reply_delete(String post_id) {
			return sqlSession.selectList(Namespace+".select_reply_delete",post_id);
		}

		//add posts

		@Override
		public void add_post(String title, String content, String img) {
			
			Dto_post Dto_post=new Dto_post(title, content, img);
			sqlSession.insert(Namespace+".add_post",Dto_post);
			
		}

		
		//add comments
		@Override
		public void add_comment(String post_post_id, String re_comment) {
			Dto_reply dto_reply=new Dto_reply(re_comment, post_post_id);
			sqlSession.insert(Namespace+".add_comment",dto_reply);
			System.out.println("IDaoImpl, post_post_id : "+post_post_id);
			System.out.println("IDaoImpl, re_comment : "+re_comment);
		}
		
		//delete comments ONLY
		@Override
		public void delete_comment(String reply_id, String board, String post_post_id) {
			Dto_reply delete_comment=new Dto_reply(reply_id, board, post_post_id);
			
			System.out.println("IDAoImpl, reply_id : "+reply_id);
			System.out.println("IDAoImpl, board : "+board);
			System.out.println("IDAoImpl, post_post_id : "+post_post_id);
			
			sqlSession.insert(Namespace+".delete_comment",delete_comment);
			System.out.println("delete_comment : "+delete_comment);
		}
			
		//update comments
		@Override
		public void update_comment(String reply_id, String re_comment, String post_post_id, String board) {
			
			System.out.println("IDAoImpl, reply_id : "+reply_id);
			System.out.println("IDAoImpl, re_comment : "+re_comment);
			System.out.println("IDAoImpl, post_post_id : "+post_post_id);
			
			Dto_reply update_comment=new Dto_reply(reply_id,board,re_comment,post_post_id);
			
			sqlSession.insert(Namespace+".update_comment",update_comment);
			
		}

		@Override
		public void update_post(String post_id, String board, String title, String content) {

			System.out.println("IDaoImpl, post_id : "+post_id);
			System.out.println("IDaoImpl, title : "+title);
			System.out.println("IDaoImpl, content : "+content);
			
			Dto_post update_post=new Dto_post(post_id,board,title,content);
			
			sqlSession.insert(Namespace+".update_post_title",update_post);
			sqlSession.insert(Namespace+".update_post_content",update_post);
		}
	
		@Override
		public List<Dto_freeboard> select_freeboard() {
			// TODO Auto-generated method stub
			return sqlSession.selectList(Namespace+".select_freeboard");
		} //리스트 보기
		@Override
		public List<Dto_freeboard> select_freeboard_view(int post_id) {
			// TODO Auto-generated method stub
			return sqlSession.selectList(Namespace+".select_freeboard_view",post_id);
		}//게시글 상세보기
	
		@Override
		public void select_freeboard_delete(int post_id) {
			sqlSession.selectList(Namespace+".select_freeboard_delete",post_id);
		}//게시글 삭제
		@Override
		public void freeboard_update(String post_id, String board, String title, String content) {			
			Dto_freeboard freeboard_update=new Dto_freeboard(post_id,board,title,content);
			
			sqlSession.insert(Namespace+".freeboard_update",freeboard_update);
		}// 게시물 수정
		@Override
		public void freeboard_write(String post_id, String board, String title, String content, String user_user_id)
		throws Exception{
			Dto_freeboard Dto_freeboard= new Dto_freeboard(post_id, board, title, content, user_user_id);
			sqlSession.insert(Namespace+".freeboard_write",Dto_freeboard);
		}// 게시물 달기
		@Override
		public void free_write_reply(String post_post_id, String re_comment) {
			Dto_free_reply Dto_free_reply=new Dto_free_reply(re_comment, post_post_id);
			sqlSession.insert(Namespace+".free_write_reply",Dto_free_reply);

		}// 댓글 쓰기
}
