<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/find_id.css">
<body>
    <header>
        <nav>
        <input type=hidden value="${login.user_id}" id="user_id_login">
	        <c:if test="${login.nick==null}">
	            <a href="login" id=login>로그인</a>
	            <a href="join" id="join">회원가입</a>
	        </c:if>
	        <c:if test="${login.nick!=null}">
	        	<a href="logout" id=login>로그아웃</a>
	        	<a href="mypage" id="mypage">마이페이지</a>
			<a href="#" id="chat_room">채팅</a>
	        </c:if>
	        <input type="hidden" value="${login.user_id}" id="login_user_id">
        </nav>
        <div id="logo">
            <a href="main"><img src="resources/img/logo1.png"></a>
        </div>
        <div id="move">
            <a href="help_me">도움받기</a>
            <a href="help_you">도움주기</a>
            <a href="freeboard">자유게시판</a>
            <a href="notice">공지사항</a>
        </div>
    </header>
    <div class="clear"></div>
    <section>
    	<form method="POST" action="find_id_go">
	        <div id="wrap">
	        	<h2>아이디 찾기 검색결과</h2>
	            <div id="cpl">
	            	<p>회원님의 아이디는 '<span id="idC">${id}</span>'입니다</p>
	                <div id=btn>
		                <a href="login"><input type=button value="로그인"></a><br>
		                <a href="main" id="cancel">취소</a>
	            	</div>
	            </div>
	        </div>
        </form>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>


</script>
</html>
