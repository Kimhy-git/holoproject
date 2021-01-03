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
	        <h2>공지사항</h2>
	        <div id="search">
	            <input type="text" id="search_txt">
	            <input type="button" id="search_btn" value="검색">
	        </div>
	        <div id=write><a href="freeboard_write">글쓰기</a></div>
            <table id="first">
            <div>
            <form action="notice" method="post">
            <c:forEach var="dto" items="${notice}">
                <tr>
                <td><input type=hidden id=post_id value=${dto.post_id}></td>
            	<td><input type=hidden id=user_user_id value=${dto.user_user_id}></td>
            	
                    <td>제목</td>
                    <td><input type=text name=title>${dto.title}</td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td>${dto.nick}</td>
                </tr>
                <tr>
                    <td>작성날짜</td>
                    <td>${dto.operator}</td>
                </tr>
                <tr>
                    <td>글내용</td>
                </tr>
            </table>
            <table id="second">
            	<tr>                
                    <td><textarea id="content" cols="130" rows="40" name="content">${dto.content}</textarea></td>
                </tr>
                </c:forEach>
                <div id="btn">
                <input type="button" id="remove" value="삭제">
                <input type="submit" id="edit" value="수정">
                <a href="notice"><input type="button" id="list" value="목록보기"></a>
            </div>
            </form>
                </div>
            </table>
            <div id="form-commentInfo"> 
                <div id="comment-count">댓글 <span id="count">0</span></div> 
                <div id=cc><input id="comment-input" placeholder="댓글을 입력해 주세요." > 
                <button id="submit">등록</button> </div>
            </div> 
            
            <br><br><br>
            <!-- DB에서 reply 가져오기 -->
            <div id=comments> 
            <div id="btn_reply">
                <input type="button" id="remove_reply" value="삭제">
                <input type="button" id="edit_reply" value="수정">
            </div>
            <c:forEach var="dto_reply" items="${reply}">
            ${dto_reply.operator}<br>
            ${dto_reply.re_comment}<br>
            ${dto_reply.user_user_id}<br>
            </c:forEach>
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
//Update posts

</script>
</html>