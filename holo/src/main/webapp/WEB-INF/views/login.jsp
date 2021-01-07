<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/login.css">
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
    <section>
        <div id="wrap">
        <form method="post" action="do_login">
            <table id="info">
            <c:if test="${member ==null}">
                <tr>
                    <td>아이디</td><td><input type="text" id="id"></td>
                     <td rowspan="2"><input type="submit" id="log_btn" value="로그인"></td>   
                </tr>
                <tr>
                    <td>비밀번호</td><td><input type="password" id="passcode"></td>
                </tr>
      		</c:if>
      		</form>
      		<c:if test="${member!=null }">
	            <p>${member.user_id}님 환영합니다</p>
	            <input type="button" id="logout" value="로그아웃">
        	</c:if>
       		<c:if test="${msg==false}">
            	<h1>로그인 실패 : 아이디와 비밀번호를 확인해주세요</h1>
        	</c:if>
            </table>
            <br>
            <div id="bottom">
                <a href="find_id">아이디/비밀번호 찾기 | </a>
                <a href="join">회원가입</a>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
</html>