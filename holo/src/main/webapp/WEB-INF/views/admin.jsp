<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
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
	            <h2>관리자</h2>
			        <div id="search">
			            회원 ID : 
			            <input type="text" id="search_txt">
			            <input type="button" id="search_btn" value="검색">
			        </div>
	        </div>
	        <div id=tablediv>
	            <table>
	                <tr id="info">
	                    <th>ID</th>
	                    <th>Nick</th>
	                    <th>추천수</th>
	                    <th>가입날짜</th>
	                    <th>탈퇴</th>
	                </tr>
	                <tr>
	                    <td><a href="#">admin</a></td>
	                    <td>관리자</td>
	                    <td>5</td>
	                    <td>2020.12.28</td>
	                    <td><input type="button" value="탈퇴"></td>
	                </tr>
	                <tr>
	                    <td><a href="#">id</a></td>
	                    <td>닉네임</td>
	                    <td>5</td>
	                    <td>2020.12.28</td>
	                    <td><input type="button" value="탈퇴"></td>
	                </tr>
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