<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script  src="http://code.jquery.com/jquery-3.5.0.js" />
<script type="text/javascript">
$(document).ready(function(e){
	$('#log_btn').click(function(){
		location.href="do_login";
	});
})

</script>

<header>
        <nav>
        	<c:choose>
	        	<c:when test="${empty sessionScope.user_id}">
		        	<!-- 로그인 안됨 -->
		            <a href="login" id=login>로그인</a>
		            <a href="join" id="join">회원가입</a>
	            </c:when>
            </c:choose>
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
            <table id="info">
                <c:choose>
	        		<c:when test="${empty sessionScope.user_id}">
		        	<!-- 로그인 안됨 -->
		                <form method="post" action="do_login">
		                <tr>
		                    <td>아이디</td><td><input type="text" id="id" name="user_id"></td>
		                     <td rowspan="2"><input type="submit" id="log_btn" value="로그인"></td>   
		                </tr>
		                <tr>
		                    <td>비밀번호</td><td><input type="password" id="passcode" name="user_pw"></td>
		                </tr>
		                </form>
		            </c:when>
		        </c:choose>
	       		<c:if test="${msg=='fail'}">
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
	<div id="test"></div>
    <footer>
        <p>&copy;copyright 홀로서기 
            alone@alone.co.kr</p>
    </footer>
</body>
</html>