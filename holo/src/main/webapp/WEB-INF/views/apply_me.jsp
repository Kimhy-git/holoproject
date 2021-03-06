<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원자 목록</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/apply_me.css">

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
		<h2 onclick="location.href='/holo/mypage'">마이페이지</h2>
         
            <p id="mine">지원자 목록</p>
            <div class="clear"></div>
            <div id="center">
			<article>
			
			<c:forEach var="list" items="${list}">
        		<div class="applier">
					<div class="info">
						<input type="hidden" id="applier${list.apply_id}" value="${list.applier}">
						<div class="title"><a href="helpyou_write_view?help_post_id=${list.help_post_help_post_id}">${list.title}</a>
							<span class="date">${list.operator}</span>
						</div>
						<div class="nick">
							<span>금액: ${list.price}원</span> | 
							<span class="info02">
								<a href="#">${list.nick}</a> | 
								<span class="info_gender">
									<c:if test="${list.gender=='f'}">여</c:if>
									<c:if test="${list.gender=='m'}">남</c:if>
								</span> | 
								♥ <span class="info_like">${list.likes}</span>
							</span>
							<span id="ptag${list.apply_id}" class="ptag">
								<input type="hidden" id="hidden${list.apply_id}" value="${list.tag}">
							</span>
						</div>
						<div class="intro">
							<p>${list.cv}</p>
						</div>
					</div>
					<div class="btns">
						<input class="btn" type="button" value="채팅하기" id="chat${list.apply_id}"><br>
						<c:if test="${list.complete==0}">
							<input class="btn last" type="button" value="채택하기" id="choosebtn${list.help_post_help_post_id}" data-n="${list.apply_id}">
						</c:if>
						<c:if test="${list.complete==1}">
							<c:if test="${list.choose==2}">
							<input class="btn last choose0" type="button" value="채택완료">
							</c:if>
							<c:if test="${list.choose==1}">
							<input class="btn last choose1" type="button" value="추천하기" id="likesbtn" data-l="${list.applier}">
							</c:if>
						</c:if>
					</div>
				</div>
			</c:forEach>
			</article>
			</div>
		</div>            
    </section>
    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script  src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
$(document)
.ready(function(){
	$('input[id^=hidden]').trigger('click');
})
.on('click','input[id^=choosebtn]',function(){ //input[id가 choosebtn으로 시작하는 버튼]
    var n=(this.id).substr(9); 
    var applyId=$(this).data("n");
	$.ajax({
	    type: 'POST',
	    url: "${pageContext.request.contextPath}/help_complete",
	    data: { 
	    	"post_id":n,
	    	"apply_id":applyId
	    },
	    dataType: "text",
	    success: function(data){
			alert(data);
			location.reload();
	    },
	    error: function (request, status, error){
	    }

	});
    
   
})
.on('click','input[id^=hidden]',function(){
	var n=(this.id).substr(6);
	var tags=$(this).val();
	var list=tags.split(',');
	var string="";
	for( var i in list){
		string=string+'<span>'+list[i]+'</span>';
	}
	$('#ptag'+n).append(string);
})
.on('click','#likesbtn',function(){
	var applier=$(this).data('l');
	$.ajax({
	    type: 'POST',
	    url: "${pageContext.request.contextPath}/applier_like",
	    data: { 
	    	"applier":applier
	    },
	    dataType: "text",
	    success: function(data){
			alert(data);
			location.reload();
	    },
	    error: function (request, status, error){
	    }

	});
})
.on('click','input[id^=chat]',function(){ //input[id가 chat으로 시작하는 버튼]
    var n=(this.id).substr(4); 
    var applier=$('#applier'+n).val();
    window.open("chat_pop?applier="+applier,"chat_pop",'width=500, height=730, left=400, top=200, resizable=no, scrollbar=no');    
   
})
.on('click','#chat_room',function(){
	var user_id='${login.user_id}';
	window.open("chat_room?user_id="+user_id,"ChatRoom",'width=490, height=685, left=400, top=200, resizable=no, scrollbar=no');
})
</script>
</html>