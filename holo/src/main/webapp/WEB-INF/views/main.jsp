<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- <link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&display=swap" rel="stylesheet"> -->
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/main.css">
<body>
 <header>
        <nav>
            <a href="login" id=login>로그인</a>
            <a href="join" id="join">회원가입</a>
        </nav>
        <div id="logo">
            <a href="main"><img src="resources/img/logo1.png"></a>
        </div>
    </header>
    <section>
        <div id="wrap">
            <div id=box>
                <a href="help_me" id="help_me">도움받기</a><br>
                <a href="help_you" id="help_you">도움주기</a>
            </div>
            <c:forEach var="dto" items="${memberList}">
            	${dto.user_id}
            	${dto.user_pw}
            </c:forEach>
            <nav id="sub_menu">
                <a href="freeboard">자유게시판</a> | 
                <a href="mypage">마이페이지</a> | 
                <a href="notice">공지사항</a>
            </nav>
        </div>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
</html>