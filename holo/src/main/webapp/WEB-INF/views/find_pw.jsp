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
<link rel="stylesheet" href="resources/css/find_pw.css">
<body>
    <header>
        <nav>
        <input type=hidden value="${login.user_id}" id="user_id_login">
	        <c:if test="${login.nick==null}">
	            <a href="login" id=login>로그인</a>
	            <a href="join" id="join">회원가입</a>
	        </c:if>
	        <c:if test="${login.nick!=null}">
	        	<a href="logout" id=login>로그아웃</a>
	        	<a href="mypage" id="mypage">마이페이지</a>
			<a href="#" id="chat_room">채팅</a>
	        </c:if>
	        <input type="hidden" value="${login.user_id}" id="login_user_id">
        </nav>
        <div id="logo">
            <a href="main"><img src="resources/img/logo1.png"></a>
        </div>
        <div id="move">
            <a href="help_me">도움받기</a>
            <a href="help_you">도움주기</a>
            <a href="freeboard">자유게시판</a>
            <a href="notice">공지사항</a>
        </div>
    </header>
    <div class="clear"></div>
    <section>
        <div id="wrap">
        	<h2>비밀번호 찾기</h2>
            아이디<input type="text" id="user_id" name="user_id"><br>
            비밀번호 질문
            <select id="passwd_q" name="passwd_q"><br>
                            <option id="q0">질문을 선택해 주세요</option>
                            <option id="q1" value="처음 키운 강아지 이름은?">처음 키운 강아지 이름은?</option>
                            <option id="q2" value="아버지 이름은?">아버지 이름은?</option>
                            <option id="q3" value="출신 초등학교 이름은?">출신 초등학교 이름은?</option>
                            <option id="q4" value="나의 보물 1호는?">나의 보물 1호는?</option>
                            <option id="q5" value="가장 친한 친구 이름은?">가장 친한 친구 이름은?</option>
                            <option id="q6" value="내가 살고싶은 나라는?">내가 살고싶은 나라는?</option>
                            <option id="q7" value="내가 다닌 중학교가 위치한 지역은?">내가 다닌 중학교가 위치한 지역은?</option>
                            <option id="q8" value="가장 즐겨했던 게임은?">가장 즐겨했던 게임은?</option>
            </select><br>
            비밀번호 답변 <input type="text" id="passwd_a" name="passwd_a"><br>
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


<script  src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>

$(document).ready(function(){
	
	$("#find").on("click", function(){
		$.ajax({

		      type: 'POST',

		      url: "/holo/find_pw",

		      data: {"user_id":$("#user_id").val(),
		    	  "passwd_q":$("#passwd_q").val(),
		    	  "passwd_a":$("#passwd_a").val(),
		    	  },

		      success: function(data, status){
		    	  console.log("data");
		    	  console.log(data);
		    	  
		    	  alert(data);
		      },
		 	  complete : function(data){
		 		 console.log("data");
		    	  console.log(data);
		    	  
		    	  alert(data.responseText);
		    	  
		 	  },

		      dataType: "application/text"

		});
	});
	
	
});

</script>