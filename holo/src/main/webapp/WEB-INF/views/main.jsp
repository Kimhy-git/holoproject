<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- <link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&display=swap" rel="stylesheet"> -->
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/main.css">
<style>
h1 span{color:rgb(107, 156, 230); font-size:17px;}
</style>
<body>
 <header>
        <nav>
        <c:if test="${login.nick==null}">
            <a href="login" id=login>로그인</a>
            <a href="join" id="join">회원가입</a>
        </c:if>
        <c:if test="${login.nick!=null}">
            <a href="logout" id=login>로그아웃</a>
            <a href="mypage" id="mypage">마이페이지</a>
            <a href="#" id="chat_room">채팅</a>
        </c:if>
        <c:if test="${login.nick!=null}">
        	<h1><span>${login.nick}</span>님 환영합니다</h1>
        </c:if>
        </nav>
        <div id="logo">
            <a href="main"><img src="resources/img/logo1.png"></a>
        </div>
    </header>
    <section>
        <div id="wrap">
            <div id=box>
                <a href="help_me" id="help_me">도움받기</a><br>
                <a href="help_you" id="help_you">도움주기</a>
            </div>
            <c:forEach var="dto" items="${memberList}">
            	${dto.user_id}
            	${dto.user_pw}
            </c:forEach>
            <nav id="sub_menu">
                <a href="freeboard">자유게시판</a>&nbsp;&nbsp;
                <a href="notice">공지사항</a>
            </nav>
        </div>
    </section>
    <footer>
        <p id="p">copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script  src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
var n=0;
$(document)
.on('click','#p',function(){
	n=n+1;
	//console.log("n: "+n);
	if(n>=5){
		//console.log("if");
		//console.log("user_id:"+'${login.user_id}');
		if('${login.user_id}'=='admin'){
			if(confirm("관리자 페이지로 이동하시겠습니까?")){
				window.location.href = 'admin';	
			}
		}
	}
})

.on('click','#mypage',function(){
	var user_id=$('#user_id_login').val();
	//console.log(user_id);
	if(user_id==""){
		alert("로그인하세요");
		window.location.href="<c:url value='login'/>"
	}
})
.on('click','#chat_room',function(){
	var user_id='${login.user_id}';
	window.open("chat_room?user_id="+user_id,"ChatRoom",'width=490, height=685, left=400, top=200, resizable=no, scrollbar=no');
})
</script>
</html>