package com.javalec.holo.service;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Service;
import com.javalec.holo.dao.IDao;
import com.javalec.holo.dto.BoardSearch;
import com.javalec.holo.dto.Dto;
import com.javalec.holo.dto.Dto_apply;
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

@Service
public class MemberServiceImpl implements MemberService {

	@Inject //@Autowired
    private IDao dao;

//	@Override
//	public List<Dto> selectMember() throws Exception {
//		return dao.list();
//	}

		
		//join
		public void join_submit(String user_id, String user_pw, String gender, String nick, String passwd_q, String passwd_a,
				String email, String mobile, String birth, String address, String tag, String cv) {
			dao.join_submit(user_id, user_pw, gender, nick, passwd_q, passwd_a, email, mobile, birth, address, tag, cv);
		}
	
		//회원탈퇴
		
		public void leave(String user_id) throws Exception {
			dao.leave(user_id);
		}
		
	
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
	
	
	//마이페이지 유저정보 불러오기
	@Override
	public Dto_user mp_user(String user_id) throws Exception{
	return dao.mp_user(user_id);
	}
	
    //마이페이지 정보수정
	@Override
	public void mp_edit(String user_pw, String nick, String passwd_q, String passwd_a, String mobile, String address,
			String tag, String cv ,String user_id)throws Exception {
	System.out.println("마이페이지 정보수정 서비스"+user_id);
	dao.mp_edit(user_pw, nick, passwd_q, passwd_a, mobile, address,
			tag, cv , user_id);
	}
	
	
	//help_me게시글 리스트
	@Override
	public List<Dto_help_post> list(Pagination_help pagination) throws Exception {
		List<Dto_help_post> list=dao.list(pagination);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg()==null) {
				list.get(i).setImg("resources/img/test1.jpg");
			}else {
				String image=list.get(i).getImg();
				list.get(i).setImg("http://localhost:8080/holo/img/"+image);
			}
		}
		return list;
	}
	@Override
	public int count_helpme() throws Exception{
		return dao.count_helpme();
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
			int min_price, String img ,String user_user_id)throws Exception {
		
		dao.write(title,content,gender,tag_area,tag_job,payment,min_price, img,user_user_id);
	
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
	public void re_write(String re_comment,int help_post_id ,String user_user_id) throws Exception {
	System.out.println("멤버서비스 댓글보여주기 reply"+re_comment);
		dao.re_write(re_comment,help_post_id,user_user_id);
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

	//help_me 대댓글 작성
	@Override
	public void helpme_re_recomment_submit(int re_index, String re_comment, 
			int re_order, int re_class, int groupNum, int help_post_post_id,
			String user_user_id) throws Exception {
		dao.helpme_re_recomment_submit(re_index, re_comment, re_order, re_class, groupNum, help_post_post_id, user_user_id);
	}
	
	//help_me hit
	public void hit(int help_post_id) throws Exception{
		dao.hit(help_post_id);
	}
	
	//help_me 댓글 카운트
	@Override
	public int help_reply_count(int help_post_id) throws Exception{
		return dao.help_reply_count(help_post_id);
	}
	
	@Override
	public List<Dto_help_post> helpme_search(BoardSearch search) {
		List<Dto_help_post> list=dao.helpme_search(search);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg()==null) {
				list.get(i).setImg("resources/img/test1.jpg");
			}else {
				String image=list.get(i).getImg();
				list.get(i).setImg("http://localhost:8080/holo/img/"+image);
			}
		}
		return list;
	}
	@Override
	public int helpme_search_count(BoardSearch search) {
		return dao.helpme_search_count(search);
	}
	
	

		
	
	@Override // help_you_write
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id) {
		System.out.println("memberservice helpyou_submit");
		System.out.println(tag_area+", "+title+", "+tag_job+", "+content+", "+img+", "+gender+", "+min_price+", "+payment+", "+user_user_id);
		dao.helpyou_submit(tag_area, title, tag_job, content, img, gender, min_price, payment, user_user_id);
	}
	
	@Override // help_you
	public List<Dto_help_post> helpyou_list(Pagination_help pagination){
		List<Dto_help_post> list=dao.helpyou_list(pagination);
		System.out.println("pagination_EndPage: "+pagination.getEndPage());
		System.out.println("pagination_PageCnt"+pagination.getPageCnt());
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getImg()==null) {
				list.get(i).setImg("resources/img/test1.jpg");
			}else {
				String image=list.get(i).getImg();
				list.get(i).setImg("http://localhost:8080/holo/img/"+image);
			}
		}
		return list;
	}
	@Override
	public int count_helpyou() throws Exception{
		return dao.count_helpyou();
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
	public void helpyou_re_recomment_submit(int re_index, String re_comment, int re_order, int re_class, int groupNum, int help_post_post_id, String user_user_id) throws Exception {
		dao.helpyou_re_recomment_submit(re_index, re_comment, re_order, re_class, groupNum, help_post_post_id, user_user_id);
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
	
	//mypage
	@Override
	public void help_complete(int help_post_id) {
		dao.help_complete(help_post_id);
	}
	
	@Override
	public List<Dto_total> mypage_total_list(Pagination pagination){
		return dao.mypage_total_list(pagination);
	}
	
	@Override
	public List<Dto_apply> mypage_applyme_list(int post_id){
		return dao.mypage_applyme_list(post_id);
	}
	
	@Override
	public void mypage_applyme_choose(int apply_id) {
		dao.mypage_applyme_choose(apply_id);
	}
	@Override
	public void mypage_applier_like(String applier) {
		dao.mypage_applier_like(applier);
	}
	
	
	
	
	
	//NOTICE 
	@Override //notice
	public List<Dto_post> select_post(Pagination pagination) throws Exception {
		return dao.select_post(pagination);
	}

	@Override //notice_write_view
	public List<Dto_post> select_post_view(String post_id) throws Exception {
		return dao.select_post_view(post_id);
	}

	@Override
	public int count_post_reply(String post_id) {
		return dao.count_post_reply(post_id);
	}

	@Override //notice_write_view : comments
	public List<Dto_reply> select_post_reply(String post_id, Pagination pagination) throws Exception {
		return dao.select_post_reply(post_id, pagination);
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
	public void add_comment(String post_post_id, String re_comment, String user_user_id) {
		System.out.println("re_comment, service : "+re_comment);
		dao.add_comment(post_post_id, re_comment, user_user_id);
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
	public void add_re_comment(String re_index, String re_comment, String re_order, String re_class, 
			String groupNum, String post_post_id, String user_user_id) {
		
		System.out.println("MemberServiceImpl : "+re_index+" /"+re_comment+" /"+re_order+" /"+groupNum+" /"+post_post_id);
		dao.add_re_comment(re_index,re_comment,re_order,re_class,groupNum,post_post_id,user_user_id);
		
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
	public Dto_login login(HttpServletRequest request) {
		String user_id=request.getParameter("user_id");
		String user_pw=request.getParameter("user_pw");
		
		Dto_login dto = new Dto_login();
		
		dto = dao.login(user_id,user_pw);
		
		System.out.println("ServiceImpl id, pw : "+user_id+" ,"+user_pw);

		return dto;
	}
	
	//log out
	@Override
	public void logout(HttpSession session) {
		//세션 변수 삭제 및 정보 초기화
		session.invalidate();
	}
	
	//게시물 개수
	@Override
	public int count() throws Exception {
		return dao.count();
	}
	
	//댓글 개수
	@Override
	public int selectCount_notice(int post_id) throws Exception {
		return dao.selectCount_notice(post_id);
	}
	
	//notice 검색 결과
	@Override
	public int count_notie_search() {
		return dao.count_notice_search();
	}
	
	@Override
	public List<Dto_post> list_notice(BoardSearch search) {
		return dao.list_notice(search);
	}	
	
	
	
	
	
		
	

	@Override
	public List<Dto_freeboard> select_freeboard(Pagination pagination) throws Exception {
		// TODO Auto-generated method stub
		return dao.select_freeboard(pagination);
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
	@Override
	public int selectCount (int post_id) throws Exception {
		return dao.selectCount(post_id);
	} // 댓글 갯수 세기
	@Override
	public List<Dto_freeboard> mylist(String user_id) throws Exception{
		return dao.mylist(user_id);
	} // 내가 쓴 글 가져오기
	@Override
	public List<Dto_free_reply> myreply(String user_id) throws Exception{
		return dao.myreply(user_id);
	} // 내가 쓴 댓글 가져오기
	@Override
	public int count_freeboard() {
		return dao.count_freeboard();
	} //페이징 처리
	@Override
	public List<Dto_freeboard> listAll(BoardSearch search) {
		return dao.listAll(search);
	} // 검색하기
	@Override
	public int count_freeboard_search() {
		return dao.count_freeboard_search();
	}
	
	
	
	
	
	
	
	//help_me에 지원하기
	@Override
	public void add_apply_me(String helpme_id, String tag, String cv, String help_post_help_post_id, String gender,
			String applier, String price, String nick, String title) {
		
		dao.add_apply_me(helpme_id, tag, cv, help_post_help_post_id, gender, applier, price, nick, title);
	}
	//help_you에 지원하기
	@Override
	public void add_apply_you(String helpyou_id, String tag, String cv, String board, String help_post_help_post_id,
			String gender, String applier, String price, String nick, String title) {
		System.out.println("service nick and title : "+nick+", "+title);
		dao.add_apply_you(helpyou_id, tag, cv, board, help_post_help_post_id, gender, applier, price, nick, title);	
	}



	//apply_you

	
	//apply you paging
	@Override
	public int count_apply(String applier) {
		return dao.count_apply(applier);
	}

	@Override
	public Dto_apply apply_you_page(Pagination pagination) {
		System.out.println("Service apply_you_page");
		return dao.apply_you_page(pagination);
	}


	//help_post 글제목 가져오기(join 이용)
	@Override
	public List<Dto_help_post> help_title(String user_user_id) {
		System.out.println("service, user_user_id : "+user_user_id);
		return dao.help_title(user_user_id);
	}

	//apply에서 지원자 가져오기
	@Override
	public List<Dto_apply> applier(String user_id) {
		return dao.applier(user_id);
	}
	
	//전체 댓글 가져오기
	@Override
	public List<Dto_total_reply> total_reply(String user_id, Pagination pagination) {
		return dao.total_reply(user_id, pagination);
	}

	@Override
	public int total_reply_count(String user_id) {
		return dao.total_reply_count(user_id);
	}
	
	//전체 지원 게시글 수
	@Override
	public int total_apply_count(String user_id) {
		return dao.total_apply_count(user_id);
	}

	//전체 지원 게시글 가져오기
	@Override
	public List<Dto_apply> total_apply(String user_id, Pagination pagination) {
		return dao.total_apply(user_id,pagination);
	}
	
	//post_id에 해당하는 댓글 수
	@Override
	public int count_reply(String post_id) {
		return dao.count_reply(post_id);
	}
}
