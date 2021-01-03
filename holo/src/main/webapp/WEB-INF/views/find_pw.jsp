<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/find_pw.css">
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
        	<h2>비밀번호 찾기</h2>
            아이디<input type="text" id="id"><br>
            비밀번호 질문
            <select id="choice"><br>
                <option id="q1">처음 키운 강아지 이름은?</option>
                <option id="q2">아버지 성함은?</option>
                <option id="q3">출신 초등학교 이름은?</option>
            </select><br>
            비밀번호 답변 <input type="text" id="answer"><br>
            <input type="button" id="find" value="찾기">
            <a href="find_id">취소</a>
        </div>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
</html>