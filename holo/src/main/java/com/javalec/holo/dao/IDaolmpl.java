package com.javalec.holo.dao;

import java.sql.Blob;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
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
  		
  		return sqlSession.selectOne(Namespace+".list");
  	}
  	
  	//help_me게시글 상세보기 (뷰어)
		@Override
		public Dto_help_post read(int help_post_id) throws Exception{
		return sqlSession.selectOne(Namespace+".read",help_post_id);
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
    
  	//helpyou_write
	@Override
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id) {
		System.out.println("helpyou_submit");
		System.out.println(tag_area+", "+title+", "+tag_job+", "+content+", "+img+", "+gender+", "+min_price+", "+payment+", "+user_user_id);
		
		Help_postDto helpDto=new Help_postDto(tag_area, title, tag_job, content, img, gender, min_price, payment, user_user_id);		
		
		sqlSession.insert(Namespace+".helpyou_submit",helpDto);
	}
	
	//help_you
	@Override
	public List<Help_postDto> helpyou_list() {
		System.out.println("helpyou_list");
		return sqlSession.selectList(Namespace+".helpyou_list");
	}
	
	@Override //notice
	public List<Dto_post> select_post() {
		return sqlSession.selectList(Namespace+".select_post");
	}

	@Override //notice_write_view
	public List<Dto_post> select_post_view(int post_id) {
		return sqlSession.selectList(Namespace+".select_post_view",post_id);
	}

	@Override //notice_write_view : comments
	public List<Dto_reply> select_post_reply(int post_id) {
		return sqlSession.selectList(Namespace+".select_post_reply",post_id);
	}

	@Override
	public List<Dto_post> select_post_delete(int post_id) {
		return sqlSession.selectList(Namespace+".select_post_delete",post_id);
	}

	@Override
	public List<Dto_reply> select_reply_delete(int post_id) {
		return sqlSession.selectList(Namespace+".select_reply_delete",post_id);
	}

	@Override
	public void add_post(String post_id, String board, String title, String operator, String nick, String content,
			String img, String user_user_id) {
		
		System.out.println("IDaoImpl, content : "+content);
				
		Dto_post Dto_post=new Dto_post(post_id, board, title, nick, operator, content, img, user_user_id);		
				
		sqlSession.insert(Namespace+".add_post",Dto_post);
		
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
	public List<Dto_reply> select_freeboard_reply(int post_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".select_freeboard_reply",post_id);
	}//댓글보기
	@Override
	public List<Dto_freeboard> select_freeboard_delete(int post_id) {
		return sqlSession.selectList(Namespace+".select_freeboard_delete",post_id);
	}//게시글 삭제
	@Override
	public List<Dto_reply> select_freeboard_reply_delete(int post_id) {
		return sqlSession.selectList(Namespace+".select_freeboard_reply_delete",post_id);
	}//댓글 삭제
	@Override
	public void freeboard_submit(int post_id, int board, String title, String operator, String nick, String content, String img, String user_user_id)
	throws Exception{
		Dto_freeboard write_postDto= new Dto_freeboard(post_id, board, title, operator,nick, content, img, user_user_id);
		sqlSession.insert(Namespace+".freeboard_submit",write_postDto);
	}
	

}
