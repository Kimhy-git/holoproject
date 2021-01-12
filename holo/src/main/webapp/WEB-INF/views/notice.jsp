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
<link rel="stylesheet" href="resources/css/freeboard.css">
<body>
     <header>
        <nav>
	        <input type=hidden value="${login.user_id}" id="user_id_login">
	        <input type="hidden" value="${login.user_id}" id="login_user_id">
	        <c:if test="${login.nick==null}">
	            <a href="login" id=login>로그인</a>
	            <a href="join" id="join">회원가입</a>
	        </c:if>
	        <c:if test="${login.nick!=null}">
	            <a href="logout" id=login>로그아웃</a>
	        </c:if>
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
    <div id="center">
        <div id="wrap">
        	<div id="section_h">
	            <h2>공지사항</h2>
			        <div id="search">
			            <input type="text" id="search_txt">
			            <input type="button" id="search_btn" value="검색">
			        </div>
		        <div class="write" id="writing">글쓰기</div>
	        </div>
	        <div id=tablediv>
	            <table>
	                <tr id="info">
	                    <td>제목</td>
	                    <td>작성자</td>
	                    <td>날짜</td>
	                    <td>조회수</td>
	                </tr>
	                <c:forEach var="dto" items="${notice}">
	                <tr>
	                
	                    <td><a href="notice_write_view?post_id=${dto.post_id}">${dto.title}</a></td>
	                    <td>${dto.nick}</td>
	                    <td>${dto.operator}</td>
	                	<td>${dto.hit}</td><br>
	                </tr>
	                </c:forEach>
	            </table>
	        </div>
            <div id="index">
                <a href="#">1</a> <a href="#">2</a> <a href="#">3</a>
            </div>
        </div>
    </div>
    </section>
    <div class="clear"></div> 
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>  
    
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#writing',function(){
	var user_id=$('#user_id_login').val();
	console.log(user_id);
	if(user_id==null || user_id=="" || user_id=="admin"){
		alert("관리자 로그인 해주세요");
		window.location.href="<c:url value='login'/>"
	}else{
		window.location.href="<c:url value='freeboard_write'/>"
	}
})
</script>
</html>