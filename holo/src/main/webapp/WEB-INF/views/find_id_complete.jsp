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
<link rel="stylesheet" href="resources/css/find_id.css">
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
    	<form method="POST" action="find_id_go">
	        <div id="wrap">
	        	<h2>아이디 찾기 검색결과</h2>
	            <div>
	            	<p>${id}</p>
	                <a href="login"><input type=button value="로그인"></a><br>
	                <a href="main"><input type=button value="취소"></a>
	            </div>
	        </div>
        </form>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	console.log(${ id });
	if(${ id }!=null){
		alert=("${ id }")
	}
})

</script>
</html>
