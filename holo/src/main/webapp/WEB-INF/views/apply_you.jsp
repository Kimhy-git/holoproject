<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원자 목록</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/mypage.css">

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
    <section>
		<div id="wrap">
		<h2>지원자 목록</h2>
         
            <nav id="mine">
            <ul class="tabs">
                <li class="tabMenu current">
                <a href="#tabContent01" >내가 쓴 글 |</a></li>
                <li class="tabMenu">
                <a href="#tabContent02" >내가 쓴 댓글 |</a></li>
            </ul>
            <div id="tossJsp" class="tossJsp">
                <a href="apply_you">지원자 목록</a> | 
                <a href="apply_me">지원 목록</a> |
                <a href="edit_mp">내 정보 수정</a>
            </div>
            </nav>
			<article>
				<div class="title"><a href="#">게시글 제목</a></div>
				<div class="info">
					<div class="nick">
						<a href="#">닉네임</a> | 
						<span class="info_gender">female</span>
						<span class="info_like">2</span>
					</div>
					<div class="ptag">
						조용함, 꼼꼼함, 신속함
					</div>
					<div class="intro">
						<p>자기소개서 내용</p>
					</div>
				</div>
				<div class="btns">
					<input type="button" value="채팅하기">
					<input type="button" value="채택하기">
				</div>
			</article>
		</div>            
    </section>
    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
</html>