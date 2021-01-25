<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<style>
#center{width:600px;}
table{width:600px;}
td{padding:10px 0;}
textarea{
	padding:5px;
	width:450px;
	height:100px;
	border:1px solid #ccc;
	outline:none;
	resize: none;
}
tr td:first-child{font-weight:bold;}
</style>
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
    <section>
        <div id="wrap">
        <h2>마이페이지</h2>
         
            <nav id="mine">
                <span><a href="mypage_myposts" >내가 쓴 글</a></span>
                &nbsp; &nbsp; 
                <span><a href="mypage_mycomments" >내가 쓴 댓글</a></span>
                &nbsp; &nbsp; 
                <span><a href="mypage_apply">내가 지원한 게시글 목록</a></span>
                &nbsp; &nbsp; 
                <span><a href="edit_mp?user_id=${login.user_id}">내 정보 수정</a></span>
            </nav>
            <div class="clear"></div>
            <div id="center">
                <table>
	                <tr>
	                    <td>아이디</td>
	                    <td>${user.user_id}</td>
	                </tr>
	                <tr id="like">
	                    <td>좋아요</td>
	                    <td>${user.likes}</td>
	                </tr>
	                <tr>
	                    <td>닉네임</td>
	                    <td>${user.nick}</td>
	                </tr>
	                <tr>
	                	<td>성격 태그</td>
	                	<td id="user_tag">
						</td>
	                </tr>
	                <tr>
	                	<td>자기소개</td>
	                	<td><textarea readonly>${user.cv}</textarea></td>
	                </tr>
                </table>
 			</div><br><br>
    </section>
    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script  src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
	var tag="${user.tag}";
	console.log(tag);
	var tags=tag.split(',');
	var content="";
	for(var i in tags){
		console.log("tag: "+tags[i]);
		content=content+"<span>"+tags[i]+"</span>";
		console.log("content: "+content);
	}
	$('#user_tag').append(content);
})
</script>
<script>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/mypage";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
//페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/mypage";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/mypage";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
		console.log(url);
	}
</script>
</html>