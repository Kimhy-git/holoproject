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
    <div id="center">
        <div id="wrap">
        	<div id="section_h">
	            <h2>자유게시판</h2>
			        <div id="search">
			            <input type="text" id="search_txt">
			            <input type="button" id="search_btn" value="검색">
			        </div>
		        <a href="freeboard_write" class="write">글쓰기</a>
	        </div>
	        <div id=tablediv>
	            <table>
	                <tr id="info">
	                    <td>제목</td>
	                    <td>작성자</td>
	                    <td>날짜</td>
	                    <td>조회수</td>
	                </tr>
	                <c:forEach var="dto" items="${freeboard}">
	                <tr>
	                
	                    <td><a href="freeboard_write_view?post_id=${dto.post_id}">${dto.title}</a></td>
	                    <td>${dto.nick}</td>
	                    <td>${dto.operator}</td>
	                    <td>${dto.content}</td>
	                    <td><input type=hidden>${dto.post_id}</td>
            			<td><input type=hidden>${dto.board}</td><br>
	                
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
</html>