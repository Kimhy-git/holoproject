package com.javalec.holo.service;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.holo.dto.Dto_total;
import com.javalec.holo.dto.Dto_total_reply;
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
import com.javalec.holo.dto.Dto_user;
import com.javalec.holo.dto.Pagination;
import com.javalec.holo.dto.Pagination_help;

public interface MemberService {
//	public List<Dto> selectMember() throws Exception;
	
	
	//join
	public void join_submit(String user_id, String user_pw, String gender, String nick, String passwd_q, String passwd_a,
			String email, String mobile, String birth, String address, String tag, String cv);
	
	
	//회원탈퇴
	public void leave(String user_id) throws Exception;
	
	
	//help_you
	public void helpyou_submit(String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id);
	public List<Dto_help_post> helpyou_list(Pagination_help pagination);
	public int count_helpyou() throws Exception;
	//help_you 검색
	public List<Dto_help_post> helpyou_search(BoardSearch search);
	//help_you 검색 카운트
	public int helpyou_search_count(BoardSearch search);
	
	public Dto_help_post helpyou_write_view(int help_post_id);
	public void helpyou_delete(int help_post_id);
	public void helpyou_reply_submit(String comment, int help_post_post_id, String user_user_id);
	public List<Dto_help_reply> helpyou_reply_list(Pagination_help pagination);
	public void helpyou_reply_delete(int help_reply_id);
	public void helpyou_edit(int help_post_id,String tag_area,String title,String tag_job, String content,String img,String gender,int min_price,String payment,String user_user_id);
	public void helpyou_reply_edit(int help_reply_id, String re_comment);
	public void helpyou_re_recomment_submit(int re_index, String re_comment, int re_order, int re_class, int groupNum, int help_post_post_id, String user_user_id) throws Exception;
	
	public List<String> helpyou_applier_check(int help_post_id);
	
	//mypage
	public void help_complete(int help_post_id);
	public List<Dto_total> mypage_total_list(Pagination pagination);
	public int mypage_total_list_count(String user_id);
	public List<Dto_apply> mypage_applyme_list(int post_id);
	public List<Dto_apply> mypage_applyyou_list(int post_id);
	public void mypage_applyme_choose(int apply_id);
	public void mypage_applier_like(String applier);
	public List<Dto_user> admin_user_list(Pagination pagination);
	public int admin_user_list_count();
	
	//chat
	public void chat_send(String message_sender, String message_receiver, String message_content);
	public List<Dto_chat> chat_read(String message_sender, String message_receiver,int last_id);
	public Dto_user chat_nick(String applier);
	public List<Dto_chat> chat_room_list(String user_id);
	
	
	
	
	//notice
	public List<Dto_post> select_post(Pagination pagination) throws Exception;
	
	//notice_write_view
	public Dto_post select_post_view(int post_id) throws Exception;
	
	//notice_write_view : 총 댓글 수
	public int count_post_reply(int post_id);
	
	//notice_write_view : comments
	public List<Dto_reply> select_post_reply(int post_id) throws Exception;
	
	//notice_write_view : delete
	public List<Dto_post> select_post_delete(int post_id) throws Exception;
	
	//notice_write_view : delete comments with a post
	public List<Dto_reply> select_reply_delete(int post_id) throws Exception;


	public void add_post(String title,String content, String file_up);
	
	//add comments
	public void add_comment(String post_post_id, String re_comment, String user_user_id, String nick);
	
	//delete comments ONLY
	public void delete_comment(String reply_id, String board, String post_post_id);
	
	//update comments
	public void update_comment(String reply_id, String re_comment, String post_post_id, String board);
	
	//update posts
	public void update_post(int post_id, String board, String title, String content, String img);

	//add re_comments
	public void add_re_comment(String re_index,String re_comment,String re_order,String re_class,String groupNum,String post_post_id,String user_user_id, String nick);
	
	//hits
	public void uphit(int post_id);
	
	//the number of comments
//	public void num_of_comments(String post_id);
	
	//login
	public Dto_login login(HttpServletRequest request);
	
	//log out
	public void logout(HttpSession session);
	
	//게시물 개수
	public int count() throws Exception;
	
	//댓글 수
	public int selectCount_notice (int post_id) throws Exception;
	
	//notice 검색 결과
	public int count_notie_search(BoardSearch search);
	
	//noitce 검색 조건으로 게시글 목록 조회
	public List<Dto_post> list_notice(BoardSearch search);
	
	//help_me에 지원하기
	public void add_apply_me(String helpme_id, String tag, String cv, String help_post_help_post_id, String gender,
			String applier, String price, String nick, String title);

	//help_you에 지원하기
	public void add_apply_you(String helpyou_id, String tag, String cv, String board, String help_post_help_post_id,
			String gender, String applier, String price, String nick, String title);

	//apply_you page
	public Dto_apply apply_you_page(Pagination pagination);

	//apply_you paging
	public int count_apply(String applier);


	//help_post 제목 가져오기(Join 사용)
	public List<Dto_help_post> help_title(String user_user_id);

	//apply에서 지원자 가져오기
	public List<Dto_apply> applier(String user_id);

	//전체 댓글 가져오기
	public List<Dto_total_reply> total_reply(String user_id, Pagination pagination);

	//전체 댓글 수 
	public int total_reply_count(String user_id);

	//전체 지원 게시글 수
	public int total_apply_count(String user_id);

	//전체 지원 게시글 가져오기
	public List<Dto_apply> total_apply(String user_id, Pagination pagination);

	//post_id에 해당하는 댓글 개수
	public int count_reply(int post_id);


	public void cancel_apply(String apply_id);


	public List<Dto_reply> select_post_reply_ajax(int post_id, Pagination pagination);

	//notice_mpPopUp
	public Dto_post read_post(int post_id);
	public Dto_user mp_user_post(String user_id);
	
	
	
	


	
	
	//find_id
	public String find_id(HttpServletResponse response, String email) throws Exception;
	
	//아이디 중복 체크
	public void check_id(String user_id, HttpServletResponse response) throws Exception;
	//이메일 중복 체크
	public void check_email(String email, HttpServletResponse response) throws Exception;
	//회원가입
	
	//마이페이지 유저정보 불러오기
	public Dto_user mp_user(String user_id) throws Exception;
	//마이페이지 유저정보 수정
	public void mp_edit(String user_pw, String nick, String passwd_q, String passwd_a, String mobile, String address,
			String tag, String cv, String user_id) throws Exception;
	//마이페이지 팝업
	public List<Dto_total_reply> total_reply_pop(String user_id);
	public List<Dto_total> mypage_total_list_pop(String user_id);
	
	
	//help_me게시글 상세보기
	public Dto_help_post read(int help_post_id) throws Exception;
	
	//help_me게시글 목록(리스트)
	public List<Dto_help_post> list(Pagination_help pagination) throws Exception;
	public int count_helpme() throws Exception;

	//help_me like 불러오기
	public List<Dto_help_post> likes() throws Exception;

	//help_me게시글 작성
	public void write(String title, String content, String tag_area, String tag_job, String gender, String payment,
			int min_price, String img, String user_user_id) throws Exception;

	//help_me게시글 수정
	public void edit(String title, String content, String gender, String tag_area, String tag_job, String payment,
			int min_price, int help_post_id, String img) throws Exception;
	
	//help_me게시글 삭제
	public void delete(int help_post_id) throws Exception;

	//help_me 댓글 보기
	public List<Dto_help_reply> re_list(Pagination_help pagination) throws Exception;
	
	//help_me 댓글 쓰기
	public void re_write(String re_comment,int help_post_id, String user_user_id) throws Exception;
	
	//help_me 댓글 삭제
	public void re_delete(int help_reply_id) throws Exception;
	
	//help_me  수정 댓글 보기
	public Dto_help_reply re_read(int help_reply_id)throws Exception;
	
	//help_me 댓글 수정
	public void re_edit(int help_reply_id,String re_comment) throws Exception;

	//help_me 대댓글 작성
	void helpme_re_recomment_submit(int re_index, String re_comment, int re_order, int re_class, int groupNum,
			int help_post_post_id, String user_user_id) throws Exception;
	
	//help_me hit
	public void hit(int help_post_id) throws Exception;
			
	//help_me 댓글 카운트
	public int help_reply_count(int help_post_id) throws Exception;
	
	//help_me 검색
	public List<Dto_help_post> helpme_search(BoardSearch search);
	//help_me 검색 카운트
	public int helpme_search_count(BoardSearch search);
	

	
	
			
			
	
	// freeboard
	public List<Dto_freeboard> select_freeboard(Pagination pagination) throws Exception;
	// 리스트 보기
	public List<Dto_freeboard> select_freeboard_view(String post_id) throws Exception;
	// 게시글 보기
	public void select_freeboard_delete(String post_id) throws Exception;
	//게시글 삭제
	public List<Dto_free_reply> select_free_reply_delete(String post_id) throws Exception;
	//게시글+댓글 삭제

	public void freeboard_update(String post_id, String board, String title, String content);
	// 게시글 수정
	public void freeboard_write(String post_id, String board, String title,
			String content, String user_user_id, String nick, String file_up)throws Exception;
	// 게시물 쓰기
	public List<Dto_free_reply> select_free_reply(String post_id) throws Exception;
	// 댓글 보기
	public void add_free_comment(String post_post_id, String re_comment, String user_user_id) throws Exception;
	// 댓글 쓰기
 
	public void delete_free_comment(String reply_id, String board, String post_post_id);
	// 댓글 삭제
	public void update_free_comment(String reply_id, String re_comment, String post_post_id, String board);
	// 댓글 수정
	public void add_free_re_comment(String re_index, String re_comment, String re_order, String re_class,
			String groupNum, String post_post_id, String user_user_id);
	// 대댓글 작성	

	public void free_uphit(String post_id) throws Exception;
	// 조회수
	public void edit_free_re_comment(String re_index, String re_comment, String re_order, String groupNum,
			String post_post_id, String board);
	
	public void find_pw(String user_id, String passwd_q, String passwd_a) throws Exception;
	// 비밀번호 찾기 입력
	public void update_free_comment_now(String reply_id, String re_comment, String post_post_id, String board);
	
	public void checkQueestionPw(String user_id, String passwd_q, String passwd_a);
	//비밀번호 찾기 문답
	public int checkQueestionPw2(Dto_user user);
	
	public Dto_user getUserByUserId(String user_id);
	// 유저아이디로 유저 정보 조회
	public int selectCount (String post_id) throws Exception;
	// 댓글 갯수 세기
	public List<Dto_freeboard> mylist(String user_id) throws Exception;
	// 내가 쓴 글 조회
	public List<Dto_free_reply> myreply(String user_user_id)throws Exception;
	// 내가 쓴 댓글 조회
	public int count_freeboard();
	// 페이징
	public List<Dto_freeboard> listAll(BoardSearch search);
	// 검색하기
	public int count_freeboard_search(BoardSearch search);
	// 검색하기 카운트

	public List<Dto_free_reply> select_free_reply_ajax(String post_id, Pagination pagination);
}


