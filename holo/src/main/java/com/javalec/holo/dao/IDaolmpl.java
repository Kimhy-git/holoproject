package com.javalec.holo.dao;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.holo.dto.BoardSearch;
import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_apply;
import com.javalec.holo.dto.Dto_chat;
import com.javalec.holo.dto.Dto_free_reply;
import com.javalec.holo.dto.Dto_freeboard;
import com.javalec.holo.dto.Dto_help_post;
import com.javalec.holo.dto.Dto_help_reply;
import com.javalec.holo.dto.Dto_login;
import com.javalec.holo.dto.Dto_post;
import com.javalec.holo.dto.Dto_reply;
import com.javalec.holo.dto.Dto_total;
import com.javalec.holo.dto.Dto_total_reply;
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.dto.Pagination;
import com.javalec.holo.dto.Pagination_help;

@Repository
public class IDaolmpl implements IDao {
	
	@Inject//@Autowired
    private SqlSession sqlSession;
    
    private static final String Namespace = "mapper.mapper";
    
//	@Override
//	public List<Dto> list() {
//		return sqlSession.selectList(Namespace+".selectMember");
//	}
	
    


    //회원 가입 submit
    public void join_submit(String user_id, String user_pw, String gender, String nick, String passwd_q, String passwd_a,
			String email, String mobile, String birth, String address, String tag, String cv) {
    	System.out.println("start idao join");
    	Dto_user dto_user=new Dto_user();
    	dto_user.Dto_user_submit(user_id, user_pw, gender, nick, passwd_q, passwd_a, email, mobile, birth, address, tag, cv);
    	sqlSession.insert(Namespace+".join",dto_user);
    }
    
    //회원탈퇴
  	@Override
  	public void leave(String user_id) throws Exception {
  		sqlSession.delete(Namespace+".user_del0",user_id);
  		sqlSession.delete(Namespace+".user_del00",user_id);
  		sqlSession.delete(Namespace+".user_del1",user_id);
  		sqlSession.delete(Namespace+".user_del2",user_id);
  		sqlSession.delete(Namespace+".user_del3",user_id);
  		sqlSession.delete(Namespace+".user_del4",user_id);
  		sqlSession.delete(Namespace+".user_del5",user_id);
  		sqlSession.delete(Namespace+".user_del6",user_id);
  		sqlSession.delete(Namespace+".leave",user_id);
  	}
        

    
    //find_id
    public String find_id(String email) throws Exception{
		return sqlSession.selectOne(Namespace+".find_id", email);
	}
    
    //아이디 중복 검사
    public int check_id(String user_id) throws Exception{
		return sqlSession.selectOne(Namespace+".check_id", user_id);
	}
    //이메일 중복 검사
    public int check_email(String email) throws Exception{
		return sqlSession.selectOne(Namespace+".check_email", email);
	}
    //닉넴 중복 검사 01.26
    public int check_nick(String nick) throws Exception{
    	//System.out.println("아이다오 닉넴뭐임?: "+nick);
		return sqlSession.selectOne(Namespace+".check_nick", nick);
	}    
    
    //마이페이지 유저정보 불러오기
  	@Override
  	public Dto_user mp_user(String user_id) throws Exception{
  	return sqlSession.selectOne(Namespace+".mp_user",user_id);
  	}
      //마이페이지 정보수정
  	@Override
  	public void mp_edit(String user_pw, String nick, String passwd_q, String passwd_a, String mobile, String address,
  			String tag, String cv ,String user_id)throws Exception {
  	System.out.println("마이페이지 정보수정 아이다오"+user_id);
  	Dto_user Dto_user = new Dto_user(user_pw, nick, passwd_q, passwd_a, mobile, address,
  			tag, cv , user_id);
  		sqlSession.insert(Namespace+".mp_edit",Dto_user);
  	}
    //마이페이지 팝업
	@Override
	public List<Dto_total_reply> total_reply_pop(String user_id){
		return sqlSession.selectList(Namespace+".total_reply_pop",user_id);
	};
	@Override
	public List<Dto_total> mypage_total_list_pop(String user_id){
		return sqlSession.selectList(Namespace+".mypage_total_list_pop",user_id);
	};
    
	   
	@Override
  	public List<Dto_help_post> list(Pagination_help pagination) throws Exception {
  		// TODO Auto-generated method stub
  		System.out.println("idao pagination: "+pagination.getStartPage());
  		System.out.println("idao pagination: "+pagination.getEndPage());
  		return sqlSession.selectList(Namespace+".list",pagination);
  	}
  	//카운트
  	public int count_helpme() throws Exception{
  		return sqlSession.selectOne(Namespace+".count_helpme");
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
			int min_price,String img, String user_user_id)throws Exception {
		System.out.println("title :"+title+" content :"+content+" tag_area :"+tag_area+" tag_job :"+tag_job+
				"gender :"+gender+" payment :"+payment+" minp_price :"+min_price+"img :"+img+" user_user_id : "+user_user_id);
		Dto_help_post Dto_p = new Dto_help_post(title, content, gender, tag_area, tag_job, payment, min_price,img,user_user_id);
  		sqlSession.insert(Namespace+".write",Dto_p);
  	}
  	//help_me게시글 수정
		@Override
		public void edit(String title, String content, String gender, String tag_area, String tag_job, String payment,
				int min_price, int help_post_id,String img)throws Exception {
		System.out.println("헬프미 에디트 아이다오 임플로먼트 실행이 잘 되고있나요?"+help_post_id);
		Dto_help_post Dto_p = new Dto_help_post(title,content,gender,tag_area,
				tag_job,payment, min_price,help_post_id,img);
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
  	public List<Dto_help_reply> re_list(Pagination_help pagination){
  		
  		return sqlSession.selectList(Namespace+".re_list",pagination);
  	}
  	//help_me 댓글 작성
  	@Override
  	public void re_write(String re_comment,int help_post_id ,String user_user_id)throws Exception {
  		System.out.println("아이다오 댓글보여주기 reply :"+re_comment+" 유저아이디 : "+user_user_id);
  		
  		Dto_help_reply Dto_pr = new Dto_help_reply(re_comment, help_post_id, user_user_id);
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
	
	//help_me 대댓글 작성
	@Override
	public void helpme_re_recomment_submit(int re_index, String re_comment, 
			int re_order, int re_class, int groupNum, int help_post_post_id, 
			String user_user_id) throws Exception {
		System.out.println("submit idao: "+re_index+","+re_comment+","+re_order+","+help_post_post_id+","+user_user_id);
		int re_groupNum=sqlSession.selectOne(Namespace+".helpme_groupNum_select",groupNum);
		re_index=re_groupNum+1;
		Dto_help_reply recomment=new Dto_help_reply();
		recomment.Dto_help_re_reply(re_index, re_comment, re_order, re_class, groupNum, help_post_post_id, user_user_id);
		System.out.println(recomment.getRe_index());
		sqlSession.insert(Namespace+".helpme_re_recommnet_submit",recomment);
		
	}
	
	//help_me hit
	@Override
	public void hit(int help_post_id) throws Exception{
	    sqlSession.insert(Namespace+".hit",help_post_id);
	};
	
	//help_me 댓글 카운트
	@Override
	public int help_reply_count(int help_post_id){
		
		return sqlSession.selectOne(Namespace+".help_reply_count",help_post_id);
	}
	//help_me 검색
	@Override
	public List<Dto_help_post> helpme_search(BoardSearch search) {
		return sqlSession.selectList(Namespace+".helpme_search", search);
	}
	//help_me 검색 카운트
	@Override
	public int helpme_search_count(BoardSearch search) {
		return sqlSession.selectOne(Namespace+".helpme_search_count",search);
	}
	
    
		
	//help_you
	@Override
	public List<Dto_help_post> helpyou_list(Pagination_help pagination) {
		System.out.println("helpyou_list");
		return sqlSession.selectList(Namespace+".helpyou_list",pagination);
	}
	public int count_helpyou() throws Exception{
		return sqlSession.selectOne(Namespace+".count_helpyou");
	}
	
	@Override
	public List<Dto_help_post> helpyou_search(BoardSearch search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".helpyou_search", search);
	}

	@Override
	public int helpyou_search_count(BoardSearch search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".helpyou_search_count", search);
	}
		
  	//helpyou_write
	@Override
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id) {
		System.out.println("helpyou_submit");
		System.out.println(tag_area+", "+title+", "+tag_job+", "+content+", "+img+", "+gender+", "+min_price+", "+payment+", "+user_user_id);
		
		Dto_help_post dto=new Dto_help_post();
		dto.Dto_helpyou_list(tag_area, title, tag_job, content, img, gender, min_price, payment, user_user_id);		
		Dto_help_post helpDto=dto;
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
	
	//대댓글
	@Override
	public void helpyou_re_recomment_submit(int re_index, String re_comment, int re_order, int re_class, int groupNum, int help_post_post_id, String user_user_id) throws Exception {
		System.out.println("submit idao: "+re_index+","+re_comment+","+re_order+","+help_post_post_id+","+user_user_id);
		//re_groupNum=동일한 groupNum을 가지고 있는 row들의 수
		int re_groupNum=sqlSession.selectOne(Namespace+".helpyou_groupNum_select",groupNum);
		//re_index=순서. re_groupNum에 1을 더해준다.
		re_index=re_groupNum+1;
		Dto_help_reply recomment=new Dto_help_reply();
		recomment.Dto_help_re_reply(re_index, re_comment, re_order, re_class, groupNum, help_post_post_id, user_user_id);
		System.out.println(recomment.getRe_index());
		sqlSession.insert(Namespace+".helpyou_re_recommnet_submit",recomment);
		
	}
	
	@Override
	public List<Dto_help_reply> helpyou_reply_list(Pagination_help pagination){
		return sqlSession.selectList(Namespace+".helpyou_reply_list",pagination);
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
	
	@Override
	public List<String> helpyou_applier_check(int help_post_id) {
		System.out.println("Idao, help_post_id : "+help_post_id);
		return sqlSession.selectList(Namespace+".helpyou_applier_check", help_post_id);
	}
	
	// Mypage
	// help_complete
	@Override
	public void help_complete(int help_post_id) {
		sqlSession.update(Namespace+".help_complete",help_post_id);
	}
	@Override
	public List<Dto_total> mypage_total_list(Pagination pagination){
		return sqlSession.selectList(Namespace+".mypage_post_list",pagination);
	}
	@Override
	public int mypage_total_list_count(String user_id) {
		return sqlSession.selectOne(Namespace+".mypage_post_list_count",user_id);
	}
	@Override
	public List<Dto_apply> mypage_applyme_list(int post_id){
		return sqlSession.selectList(Namespace+".mypage_applyme_list",post_id);
	}
	@Override
	public List<Dto_apply> mypage_applyyou_list(int post_id){
		return sqlSession.selectList(Namespace+".mypage_applyyou_list",post_id);
	}
	@Override
	public void mypage_applyme_choose(int apply_id) {
		sqlSession.update(Namespace+".mypage_applyme_choose", apply_id);
	}
	@Override
	public void mypage_applier_like(String applier) {
		sqlSession.update(Namespace+".mypage_applier_like",applier);
	}
	
	//adminpage
	@Override
	public List<Dto_user> admin_user_list(Pagination pagination){
		return sqlSession.selectList(Namespace+".admin_user_list",pagination);
	}
	@Override
	public int admin_user_list_count() {
		return sqlSession.selectOne(Namespace+".admin_user_list_count");
	}
	
	//chat

	@Override
	public void chat_send(String message_sender, String message_receiver, String message_content) {
		// TODO Auto-generated method stub
		Dto_chat chat = new Dto_chat(message_sender, message_receiver, message_content);
		sqlSession.insert(Namespace+".chat_send",chat);
	}
	@Override
	public List<Dto_chat> chat_read(String message_sender, String message_receiver,int last_id) {
		Dto_chat chat = new Dto_chat(message_sender, message_receiver, last_id);
		sqlSession.update(Namespace+".chat_read_check",chat);
		return sqlSession.selectList(Namespace+".chat_read",chat);
	}
	
	@Override
	public Dto_user chat_nick(String applier) {
		String user_id=applier;
		return sqlSession.selectOne(Namespace+".chat_nick",user_id);
	}
	@Override
	public int chat_unread_count(String message_sender, String message_receiver) {
		Dto_chat chat = new Dto_chat(message_sender, message_receiver);
		return sqlSession.selectOne(Namespace+".chat_unread_count", chat);
	}
	
	@Override
	public List<Dto_chat> chat_room_list(String user_id) {
		return sqlSession.selectList(Namespace+".chat_room_list", user_id);
	}
	
	
	
	
	
	
	
	//NOTICE
	@Override //notice
	public List<Dto_post> select_post(Pagination pagination) {
		return sqlSession.selectList(Namespace+".select_post",pagination);
	}

	@Override //notice_write_view
	public Dto_post select_post_view(int post_id) {
		return sqlSession.selectOne(Namespace+".select_post_view",post_id);
	}
	
	//notice_write_view : 댓글 개수
	@Override
	public int count_post_reply(int post_id) {
		return sqlSession.selectOne(Namespace+".count_post_reply",post_id);
	}

	@Override //notice_write_view : comments
	public List<Dto_reply> select_post_reply(int post_id) {
		return sqlSession.selectList(Namespace+".select_post_reply",post_id);
	}

	@Override //delete posts
	public List<Dto_post> select_post_delete(int post_id) {
		return sqlSession.selectList(Namespace+".select_post_delete",post_id);
	}

	@Override //delete comments with a post
	public List<Dto_reply> select_reply_delete(int post_id) {
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
	public void add_comment(String post_post_id, String re_comment, String user_user_id, String nick) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("post_post_id", post_post_id);
		map.put("re_comment",re_comment);
		map.put("user_user_id",user_user_id);
		map.put("nick",nick);
		System.out.println("Idao, re_comment : "+re_comment);
		System.out.println("Idao, user_user_id : "+user_user_id);
		sqlSession.insert(Namespace+".add_comment",map);
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
	public void add_re_comment(String re_index,String re_comment,String re_order,String re_class,String groupNum,String post_post_id,String user_user_id,String nick) {
		
		System.out.println("IdaoImpl : "+re_index+" /"+re_comment+" /"+re_order+" /"+groupNum+" /"+post_post_id+" /"+nick);
		
		int re_groupNum=sqlSession.selectOne(Namespace+".notice_groupNum_select",groupNum);
		int re_index_=Integer.parseInt(re_index);
		re_index_=re_groupNum+1;
		
		re_index=String.valueOf(re_index_);
		
		Dto_reply add_re_comment=new Dto_reply(re_index,re_comment,re_order,re_class,groupNum,post_post_id,user_user_id,nick);
		sqlSession.insert(Namespace+".add_re_comment",add_re_comment);
	}

	//hits
	@Override
	public void uphit(int post_id) {
		System.out.println("IdaoImpl, uphit : "+post_id);
		sqlSession.insert(Namespace+".uphit",post_id);
	}
	
	//the number of comments
//	@Override
//	public void num_of_comments(String post_id) {
//		System.out.println("IdaoImpl, uphit, number : "+post_id);
//		sqlSession.insert(Namespace+".num_of_comments",post_id);
//	}
	
	@Override
	public void update_post(int post_id, String board, String title, String content, String img) {

		System.out.println("IDaoImpl, post_id : "+post_id);
		System.out.println("IDaoImpl, title : "+title);
		System.out.println("IDaoImpl, content : "+content);
		
		Dto_post update_post=new Dto_post(post_id,board,title,content,img);
		
		sqlSession.insert(Namespace+".update_post",update_post);
	}

	//log in
	@Override
	public Dto_login login(String user_id, String user_pw) {
		Dto_login dto = new Dto_login(user_id, user_pw);
		System.out.println("IDaoImpl dto : "+dto);
		return sqlSession.selectOne(Namespace+".login",dto);
	}
	
	//log out
	@Override
	public void logout(HttpSession session) {
		
	}
	
	//r게시물 개수
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne(Namespace+".count");
	}
	
	//댓글 수
	@Override
	public int selectCount_notice(int post_id) {
		Object selectCount = sqlSession.selectList(Namespace+".selectCount_notice",post_id);
		return (Integer) selectCount;
	}
	
	//notice 검색 결과
	@Override
	public int count_notice_search(BoardSearch search) {
		return sqlSession.selectOne(Namespace+".count_notice_search",search);
	}
	
	//notice 
	@Override
	public List<Dto_post> list_notice(BoardSearch search) {
		return sqlSession.selectList(Namespace+".list_notice", search);
	}

	//notice_mpPopUp
	@Override
	public Dto_post read_post(int post_id) {
		return sqlSession.selectOne(Namespace+".read_post",post_id);
	}
	@Override
	public Dto_user mp_user_post(String user_id) {
		return sqlSession.selectOne(Namespace+".mp_user_post",user_id);
	}
	
	//helpme에 지원하기
	@Override
	public void add_apply_me(String helpme_id, String tag, String cv, String help_post_help_post_id,
			String gender, String applier, String price, String nick, String title) {
		
		Dto_apply dto = new Dto_apply(helpme_id, tag, cv, help_post_help_post_id, gender, applier, price, nick, title);
		sqlSession.insert(Namespace+".add_apply_me",dto);	
	}

	//help you//helpyou에 지원하기
	@Override
	public void add_apply_you(String helpyou_id, String tag, String cv, String board,
			String help_post_help_post_id, String gender, String applier, String price, String nick, String title) {
		System.out.println("Idao, nick : "+nick);
		System.out.println("Idao, title : "+title);
		Dto_apply dto = new Dto_apply(helpyou_id, tag, cv,board, help_post_help_post_id, gender, applier, price,nick,title);
		sqlSession.insert(Namespace+".add_apply_you",dto);

	}

	//apply_you 게시물 수
	@Override
	public int count_apply(String applier) {
		return sqlSession.selectOne(Namespace+".count_apply",applier);
	}

	//apply_you page 보여줌
	@Override
	public Dto_apply apply_you_page(Pagination pagination) {
		System.out.println("IDao apply_you_page");
		return sqlSession.selectOne(Namespace+".apply_you_page",pagination);
	}


	//help_post 글제목 가져오기(join)
	@Override
	public List<Dto_help_post> help_title(String user_user_id) {
		System.out.println("dao, user_user_id : "+user_user_id);
		return sqlSession.selectList(Namespace+".help_title",user_user_id);
	}

	//apply에서 지원자 가져오기
	@Override
	public List<Dto_apply> applier(String user_id) {
		return sqlSession.selectList(Namespace+".applier",user_id);
	}

	//전체 댓글 가져오기
	@Override
	public List<Dto_total_reply> total_reply(String user_id, Pagination pagination) {
		HashMap<Object,Object> dto = new HashMap<Object,Object>();
		dto.put("user_id", user_id);
		dto.put("pagination", pagination);
//		dto.put(pagination, pagination);
//		int startList=pagination.getStartList();
//		int listSize=pagination.getListSize();
//		dto.put(startList, startList);
//		dto.put(listSize, listSize);
		
		return sqlSession.selectList(Namespace+".total_reply",dto);
	}

	//전체 댓글 수
	@Override
	public int total_reply_count(String user_id) {
		return sqlSession.selectOne(Namespace+".total_reply_count",user_id);
	}
	
	//전체 지원 게시글 수
	@Override
	public int total_apply_count(String user_id) {
		return sqlSession.selectOne(Namespace+".total_apply_count",user_id);
	}
	
	//전체 지원 게시글 가져오기
	@Override
	public List<Dto_apply> total_apply(String user_id, Pagination pagination) {
		HashMap<Object,Object> dto = new HashMap<Object,Object>();
		dto.put("user_id", user_id);
		dto.put("pagination", pagination);
		
		return sqlSession.selectList(Namespace+".total_apply",dto);
	}
	
	//post_id에 해당하는 댓글 수
	@Override
	public int count_reply(int post_id) {
		return sqlSession.selectOne(Namespace+".count_reply",post_id);
	}
	
	//apply_cancel
	@Override
	public void cancel_apply(String apply_id) {
		System.out.println("IDao apply_id : "+apply_id);
		sqlSession.selectOne(Namespace+".cancel_apply",apply_id);
	}

	@Override
	public List<Dto_reply> select_post_reply_ajax(int post_id, Pagination pagination) {
		HashMap<Object,Object> dto = new HashMap<Object,Object>();
		dto.put("post_post_id", post_id);
		dto.put("pagination", pagination);
		return sqlSession.selectList(Namespace+".select_post_reply_ajax",dto);
	}
	
			
			
			
	
		
		
		
		
		
	@Override
	public List<Dto_freeboard> select_freeboard(Pagination pagination) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".select_freeboard",pagination);
	} //리스트 보기
	@Override
	public List<Dto_freeboard> select_freeboard_view(String post_id) {
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
	public void freeboard_update(String post_id, String board, String title, String content, String file_up) {			
		Dto_freeboard freeboard_update=new Dto_freeboard(post_id,board,title,content, file_up);
		
		sqlSession.insert(Namespace+".freeboard_update",freeboard_update);
	}// 게시물 수정
	@Override
	public void freeboard_write(String post_id, String board, String title, String content, String user_user_id, String nick, String file_up)
	throws Exception{
		Dto_freeboard Dto_freeboard= new Dto_freeboard(post_id, board, title, content, user_user_id, nick, file_up);
		sqlSession.insert(Namespace+".freeboard_write",Dto_freeboard);
	}// 게시물 달기
	
	@Override 
	public List<Dto_free_reply> select_free_reply(String post_id, Pagination pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("post_id", post_id);
		map.put("pagination", pagination);
		return sqlSession.selectList(Namespace+".select_free_reply",map);
	}// 댓글 보여주기
	@Override
	public void add_free_comment(String user_user_id, String post_post_id, String re_comment, String nick) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_user_id",user_user_id);
		map.put("post_post_id", post_post_id);
		map.put("re_comment",re_comment);
		System.out.println("IDao nick: "+nick);
		map.put("nick",nick);
		sqlSession.insert(Namespace+".add_free_comment",map);
	} //댓글 달기

	@Override
	public void delete_free_comment(String reply_id, String board, String post_post_id) {
		Dto_free_reply delete_free_comment=new Dto_free_reply();
		delete_free_comment.Dto_free_reply_delete(reply_id, board, post_post_id);
		sqlSession.insert(Namespace+".delete_free_comment",delete_free_comment);
	} // 댓글 삭제
	@Override
	public void update_free_comment(String reply_id, String re_comment, String post_post_id, String board) {
		Dto_free_reply update_free_comment=new Dto_free_reply(reply_id,re_comment,post_post_id,board);
		sqlSession.insert(Namespace+".update_free_comment",update_free_comment);			
	} //댓글 수정
	@Override
	public void add_free_re_comment(String re_index, String re_comment, String re_order, String re_class,
			String groupNum, String post_post_id, String user_user_id, String nick) {
		System.out.println("idao re_re_comment: "+re_comment);
		int re_groupNum=sqlSession.selectOne(Namespace+".freeboard_groupNum_select",groupNum);
		re_index=String.valueOf(re_groupNum+1);
		Dto_free_reply add_free_re_comment=new Dto_free_reply(re_index,re_comment,re_order,re_class, groupNum,post_post_id,user_user_id, nick);
		System.out.println("get comment"+add_free_re_comment.getRe_comment());
		System.out.println("get nick: "+add_free_re_comment.getNick());
		sqlSession.insert(Namespace+".add_free_re_comment",add_free_re_comment);
	} //대댓글 작성

	public void free_uphit(String post_id) throws Exception {
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
	@Override
	public int selectCount (String post_id) {
		String post_post_id=post_id;
		int selectCount = sqlSession.selectOne(Namespace+".selectCount",post_post_id);
		return selectCount;
	} // 댓글 갯수 세기
	@Override
	public List<Dto_freeboard> mylist(String user_user_id) throws Exception{
		return sqlSession.selectList(Namespace+".mylist",user_user_id);
	}// 내가 쓴 글 조회
	@Override
	public List<Dto_free_reply> myreply(String user_user_id) throws Exception{
		return sqlSession.selectList(Namespace+".myreply",user_user_id);
	}// 내가 쓴 댓글 조회
	@Override
	public int count_freeboard() {
		return sqlSession.selectOne(Namespace+".count_freeboard");
	} // 페이징

	@Override
	public List<Dto_freeboard> listAll(BoardSearch search) {
		return sqlSession.selectList(Namespace+".listAll", search);
	} // 검색하기
	
	@Override
	public int count_freeboard_search(BoardSearch search) {
		return sqlSession.selectOne(Namespace+".search_count",search);
	}
	@Override
	public List<Dto_free_reply> select_free_reply_ajax(String post_id, Pagination pagination) {
		HashMap<Object,Object> dto = new HashMap<Object,Object>();
		dto.put("post_id", post_id);
		dto.put("pagination", pagination);
		
		return sqlSession.selectList(Namespace+".select_free_reply_ajax",dto);
	}



}
