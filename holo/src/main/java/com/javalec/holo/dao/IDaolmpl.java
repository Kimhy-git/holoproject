package com.javalec.holo.dao;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Dto_user;
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
	
    
  //아이디 중복 검사
    public int check_id(String user_id) throws Exception{
		return sqlSession.selectOne(Namespace+".check_id", user_id);
	}
    //이메일 중복 검사
    public int check_email(String email) throws Exception{
		return sqlSession.selectOne(Namespace+".check_email", email);
	}
    //회원 가입 submit
    public void join_submit(String user_id, String user_pw, String gender, String nick, String passwd_q, String passwd_a,
			String email, String mobile, String birth, String address, String tag, String cv) {
    	System.out.println("start idao join");
    	Dto_user dto_user=new Dto_user();
    	dto_user.Dto_user_submit(user_id, user_pw, gender, nick, passwd_q, passwd_a, email, mobile, birth, address, tag, cv);
    	sqlSession.insert(Namespace+".join",dto_user);
    }
    
    
    
    
    
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
			int min_price,String img)throws Exception {
		System.out.println("title :"+title+" content :"+content+" tag_area :"+tag_area+" tag_job :"+tag_job+
				"gender :"+gender+" payment :"+payment+" minp_price :"+min_price+"img :"+img);
		Dto_help_post Dto_p = new Dto_help_post(title, content, gender, tag_area, tag_job, payment, min_price,img);
  		sqlSession.insert(Namespace+".write",Dto_p);
  	}
  	//help_me게시글 수정
		@Override
		public void edit(String title, String content, String gender, String tag_area, String tag_job, String payment,
				int min_price, int help_post_id)throws Exception {
		System.out.println("헬프미 에디트 아이다오 임플로먼트 실행이 잘 되고있나요?"+help_post_id);
		Dto_help_post Dto_p = new Dto_help_post(title,content,gender,tag_area,tag_job,payment, min_price,help_post_id);
  		sqlSession.insert(Namespace+".edit",Dto_p);
		}
  	//help_me게시글 삭제
  	@Override
  	public void delete(int help_post_id) throws Exception {
  		sqlSession.delete(Namespace+".delete_re",help_post_id);
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
  	public void re_edit(int help_reply_id,String re_comment)throws Exception {
  		System.out.println("아이다오임플로먼트~ 리코멘트 수정한거 ~~:"+re_comment);
  		System.out.println("아이다오 아이디는 replyID :"+help_reply_id);
  		Dto_help_reply Dto_pr = new Dto_help_reply(help_reply_id, re_comment);
  		sqlSession.insert(Namespace+".re_edit",Dto_pr);
  	}
  	//help_me 댓글 삭제
	@Override
  	public void re_delete(int help_reply_id) throws Exception {
  		sqlSession.delete(Namespace+".re_delete",help_reply_id);
  	}
	
	//help_me hit
	@Override
	public void hit(int help_post_id) throws Exception{
	    sqlSession.insert(Namespace+".hit",help_post_id);
	};
	
	
    
		
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
		
		Dto_help_post helpDto=new Dto_help_post(tag_area, title, tag_job, content, img, gender, min_price, payment, user_user_id);		
		
		sqlSession.insert(Namespace+".helpyou_submit",helpDto);
	}

	@Override
	public Dto_help_post helpyou_write_view(int help_post_id) {
		return sqlSession.selectOne(Namespace+".helpyou_write_view",help_post_id);
	}
	
	@Override
	public void helpyou_delete(int help_post_id) {
		sqlSession.delete(Namespace+".helpyou_repost_delete",help_post_id);
		sqlSession.delete(Namespace+".helpyou_delete",help_post_id);
	}
	
	@Override
	public void helpyou_edit(int help_post_id,String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id) {
		Dto_help_post helpDto=new Dto_help_post(help_post_id,tag_area, title, tag_job, content, img, gender, min_price, payment, user_user_id);
		System.out.println("idao help edit");
		System.out.println(helpDto.getTitle());
		System.out.println(helpDto.getHelp_post_id());
		sqlSession.update(Namespace+".helpyou_edit",helpDto);
	}
	
	@Override
	public void helpyou_reply_submit(String comment, int help_post_post_id, String user_user_id) {
		Dto_help_reply helpreplyDto=new Dto_help_reply(comment,help_post_post_id,user_user_id);
		sqlSession.insert(Namespace+".helpyou_reply_submit",helpreplyDto);
	}
	
	@Override
	public void helpyou_re_recomment_submit(int re_index, String re_comment, int re_order, int re_class, int groupNum, int help_post_post_id, String user_user_id) throws Exception {
		System.out.println("submit idao: "+re_index+","+re_comment+","+re_order+","+help_post_post_id+","+user_user_id);
		int re_groupNum=sqlSession.selectOne(Namespace+".helpyou_groupNum_select",groupNum);
		re_index=re_groupNum+1;
		Dto_help_reply recomment=new Dto_help_reply();
		recomment.Dto_help_re_reply(re_index, re_comment, re_order, re_class, groupNum, help_post_post_id, user_user_id);
		System.out.println(recomment.getRe_index());
		sqlSession.insert(Namespace+".helpyou_re_recommnet_submit",recomment);
		
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
	
	@Override
	public void helpyou_reply_edit(int help_reply_id,String comment) {
		Dto_help_reply helpreplyDto=new Dto_help_reply(help_reply_id,comment);
		sqlSession.update(Namespace+".helpyou_reply_edit",helpreplyDto);
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
			
			//add re_comments
			@Override
			public void add_re_comment(String re_index, String re_comment, String re_order, String groupNum, String post_post_id) {
				
				System.out.println("IdaoImpl : "+re_index+" /"+re_comment+" /"+re_order+" /"+groupNum+" /"+post_post_id);
				
				Dto_reply add_re_comment=new Dto_reply(re_index,re_comment,re_order,groupNum,post_post_id);
				sqlSession.insert(Namespace+".add_re_comment",add_re_comment);
			}

			//hits
			@Override
			public void uphit(String post_id) {
				System.out.println("IdaoImpl, uphit : "+post_id);
				sqlSession.insert(Namespace+".uphit",post_id);
			}
			
			//the number of comments
//			@Override
//			public void num_of_comments(String post_id) {
//				System.out.println("IdaoImpl, uphit, number : "+post_id);
//				sqlSession.insert(Namespace+".num_of_comments",post_id);
//			}
			
			@Override
			public void update_post(String post_id, String board, String title, String content) {

				System.out.println("IDaoImpl, post_id : "+post_id);
				System.out.println("IDaoImpl, title : "+title);
				System.out.println("IDaoImpl, content : "+content);
				
				Dto_post update_post=new Dto_post(post_id,board,title,content);
				
				sqlSession.insert(Namespace+".update_post_title",update_post);
				sqlSession.insert(Namespace+".update_post_content",update_post);
			}


			//log in
			@Override
			public boolean login(Dto_user dto) {
				String name = sqlSession.selectOne(Namespace+".login",dto);
				return (name==null) ? false : true;
			}

			//회원 로그인 정보
			@Override
			public Dto_user viewMember(Dto_user dto) {
				return sqlSession.selectOne(Namespace+".viewMember",dto);
			}

			//log out
			@Override
			public void logout(HttpSession session) {
				
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
			public void select_freeboard_delete(String post_id) {
				sqlSession.selectList(Namespace+".select_freeboard_delete",post_id);
			}//게시글 삭제
			
			@Override //delete comments with a post
			public List<Dto_free_reply> select_free_reply_delete(String post_id) {
				return sqlSession.selectList(Namespace+".select_free_reply_delete",post_id);
			} //게시글 + 댓글 삭제
			
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
			public List<Dto_free_reply> select_free_reply(int post_id) {
				return sqlSession.selectList(Namespace+".select_free_reply",post_id);
			}// 댓글 보여주기
			@Override
			public void add_free_comment(String post_post_id, String re_comment) {
				Dto_free_reply dto_free_reply=new Dto_free_reply(re_comment, post_post_id);
				sqlSession.insert(Namespace+".add_free_comment",dto_free_reply);
			} //댓글 달기
			@Override
			public void delete_free_comment(String reply_id, String board, String post_post_id) {
				Dto_free_reply delete_free_comment=new Dto_free_reply(reply_id, board, post_post_id);			
				sqlSession.insert(Namespace+".delete_free_comment",delete_free_comment);
			} // 댓글 삭제
			@Override
			public void update_free_comment(String reply_id, String re_comment, String post_post_id, String board) {
				Dto_free_reply update_free_comment=new Dto_free_reply(reply_id,re_comment,post_post_id,board);
				sqlSession.insert(Namespace+".update_free_comment",update_free_comment);			
			} //댓글 수정
			@Override
			public void add_free_re_comment(String re_index, String re_comment, String re_order, String groupNum,
					String post_post_id, String board) {
				System.out.println("idao re_re_comment: "+re_comment);
				Dto_free_reply add_free_re_comment=new Dto_free_reply(re_index,re_comment,re_order,groupNum,post_post_id);
				System.out.println("get comment"+add_free_re_comment.getRe_comment());
				sqlSession.insert(Namespace+".add_free_re_comment",add_free_re_comment);
			} //대댓글 작성

			public void free_uphit(int post_id) throws Exception {
				sqlSession.insert(Namespace+".free_uphit",post_id);
			} // 조회수
			@Override
			public void edit_free_re_comment(String re_index, String re_comment, String re_order, String groupNum,
					String post_post_id, String board) {
				System.out.println("idao re_re_comment: "+re_comment);
				Dto_free_reply edit_free_re_comment=new Dto_free_reply(re_index,re_comment,re_order,groupNum,post_post_id);
				System.out.println("get comment"+edit_free_re_comment.getRe_comment());
				sqlSession.insert(Namespace+".edit_free_re_comment",edit_free_re_comment);
			}
			@Override
			public void find_pw(String user_id, String passwd_q, String passwd_a) throws Exception{
				Dto_user Dto_user= new Dto_user(user_id, passwd_q, passwd_a);
				sqlSession.insert(Namespace+".find_pw",Dto_user);
			}// 게시물 달기

			@Override
			public void update_free_comment_now(String reply_id, String re_comment, String post_post_id, String board) {
				Dto_free_reply update_free_comment_now=new Dto_free_reply(reply_id,board, re_comment, post_post_id);
				sqlSession.insert(Namespace+".update_free_comment_now",update_free_comment_now);
			}

			@Override
			public int checkQueestionPw(String user_id, String passwd_q, String passwd_a) {
				Dto_user Dto_user= new Dto_user(user_id, passwd_q, passwd_a);
				Object selRes = sqlSession.selectOne(Namespace+".checkQueestionPw",Dto_user);
				return (Integer)selRes;
			}

			@Override
			public int checkQueestionPw2(Dto_user user) {
				Object selRes = sqlSession.selectOne(Namespace+".checkQueestionPw2",user);
				return (Integer)selRes;
			}

			@Override
			public Dto_user getUserByUserId(String user_id) {
				return sqlSession.selectOne(Namespace+".getUserByUserId",user_id);
			}

}
