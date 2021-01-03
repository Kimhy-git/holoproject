<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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