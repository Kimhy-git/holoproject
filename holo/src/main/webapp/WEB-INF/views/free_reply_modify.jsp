<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/freeboard_write_view.css">
<body>
 <header>
        <nav>
           <a href="login" id=login>로그인</a>
            <a href="join" id="join">회원가입</a>
        </nav>
        <div id="logo">
            <a href="main"><img src="resources/img/logo1.png"></a>
        </div>
        <div id="move">
                <a href="help_me">도움받기</a>
                <a href="help_you">도움주기</a>
                <a href="freeboard">자유게시판</a>
                <a href="mypage">마이페이지</a>
        </div>
    </header>
    <div class="clear"></div>
    <section>
        <div id="wrap">
	        <h2>자유게시판</h2>
	        <div id="search">
	            <input type="text" id="search_txt">
	            <input type="button" id="search_btn" value="검색">
	        </div>
	        <!-- <div id=write><a href="freeboard_write">댓글 수정</a></div> -->
            </table>
            <div id="form-commentInfo"> 
            <form action="update_free_comment_now" method=post>
            	<input type=hidden name="reply_id" value=${reply_id}>
            	<input type=hidden name="post_post_id" value=${post_post_id}>
                <div id=cc><input id="comment-input" name="re_comment" value="${re_comment}"></div>
            	<a href="freeboard"><input type="button" id="cancel" value="취소"></a>
            	<input type="submit" value="등록">
            </form>
            </div> 
            
            <br><br><br>
            <!-- DB에서 reply 가져오기 -->
            <div id=comments> 
            
            </div>

        </div>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>   

<script  src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)

</script>
</html>