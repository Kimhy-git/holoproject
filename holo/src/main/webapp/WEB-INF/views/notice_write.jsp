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
<link rel="stylesheet" href="resources/css/freeboard_write.css">
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
        <div id="all">
            <!-- <h2>자유게시판 글 작성</h2> -->
            <div id="wrap">
                <h3>공지사항</h3>
                <!-- <span>제목</span>  -->
                
                <!-- insert -->
                <form action="notice_write_add" method="get" enctype="multipart/form-data">
             <input type="text" id="title" class="input-title" name="title" placeholder="제목을 입력하세요.">
                <div id="content">
                    <!-- <p>글내용</p>  -->
                    <textarea id="txtarea" name="content" cols="60" rows="40" placeholder="내용을 입력하세요."></textarea>
                </div>
                <div id="img_up">
                    <span>이미지첨부 </span><input type="file" id="file_up">
                </div>
                <div id="btn">
                    <a href="notice"><input type="button" id="cancel" value="취소"></a>
                    <input type="submit" id="submit" value="등록">
                </div>
                </form>
            </div>
        </div>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>


<script  src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
//Delete post and comments

</html>