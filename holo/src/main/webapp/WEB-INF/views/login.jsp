<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
            <table id="info">
                <tr>
                    <td>아이디</td><td><input type="text" id="id"></td>
                     <td rowspan="2"><input type="button" id="log_btn" value="로그인"></td>   
                </tr>
                <tr>
                    <td>비밀번호</td><td><input type="password" id="passcode"></td>
                </tr>
      
            </table><br>
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