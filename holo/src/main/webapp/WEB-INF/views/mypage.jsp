<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
        <h2>마이페이지</h2>
         
            <nav id="mine">
                <a href="#">내가 쓴 글 | </a>
                <a href="#">내가 쓴 댓글 | </a>
                <a href="apply_you">지원자 목록</a> | 
                <a href="apply_me">지원자 목록</a> |
                <a href="edit_mp">내 정보 수정</a>
            </nav>
            <table id="my_list">
                <tr>
                    <td id="list_title" class="small_title">내가 쓴 글 목록</td>
                </tr>
                <tr>
                    <td id="list_title">글제목</td>
                    <td id="count">날짜</td>
                    <td id="count">댓글수</td>
                    <td id="count">조회수</td>
                </tr>
                <tr>
                    <td id="list_title">글제목</td>
                    <td id="count">날짜</td>
                    <td id="count">댓글수</td>
                    <td id="count">조회수</td>
                </tr>
                <tr>
                    <td id="list_title">글제목</td>
                    <td id="count">날짜</td>
                    <td id="count">댓글수</td>
                    <td id="count">조회수</td>
                </tr>
            </table>
            <table id="my_comment">
                <tr>
                    <td id="list_title" class="small_title">내가 쓴 댓글</td>
                </tr>
                <tr>
                    <td id="list_title">글제목</td>
                    <td id="count">날짜</td>
                    <td id="count">댓글수</td>
                    <td id="count">조회수</td>
                </tr>
                <tr>
                    <td id="list_title">글제목</td>
                    <td id="count">날짜</td>
                    <td id="count">댓글수</td>
                    <td id="count">조회수</td>
                </tr>
            </table>
        </div>    
    </section>
    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
</html>