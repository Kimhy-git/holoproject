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
<link rel="stylesheet" href="resources/css/freeboard_write_view.css">
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
	        <h2>공지사항</h2>
	        <div id="search">
	            <input type="text" id="search_txt">
	            <input type="button" id="search_btn" value="검색">
	        </div>

            <table id="first">
            <div>
            <c:forEach var="dto" items="${notice}">
            <form action="update_post" method="get">
                <tr>
                <td><input type=hidden id=post_id name=post_id value=${dto.post_id}></td>
            	<td><input type=hidden id=user_user_id value=${dto.user_user_id}></td>
            	
                    <td>제목</td>
                    <td>${dto.title}
                    <input type=hidden name=title value=${dto.title}></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td>${dto.nick}</td>
                </tr>
                <tr>
                    <td>작성날짜</td>
                    <td>${dto.operator}</td>
                </tr>
                <tr>
                    <td>글내용</td>
                </tr>
            </table>
            <table id="second">
            	<tr>                
                    <td><textarea id="content" name="content" cols="130" rows="40" readonly>${dto.content}</textarea></td>
                </tr>
                </c:forEach>   
            </table>
            
            <div id="btn">
	                <input type="button" id="remove" value="삭제">
	                <input type="submit" id="edit" value="수정">
                <a href="notice"><input type="button" id="list" value="목록보기"></a>
            	</div>
            </form>
            
            <div id="form-commentInfo"> 
                <div id="comment-count">댓글 <span id="count">0</span></div> 
                <div id=cc>
                	<input id="comment-input" name="re_comment" placeholder="댓글을 입력해 주세요." > 
                	<button id="submit">등록</button> 
                </div>
            </div> 
            
            <br><br><br>
            <!-- DB에서 reply 가져오기 -->
            <div id=comments> 
	            <c:forEach var="dto_reply" items="${reply}">
	            <form action="update_comment" method=get>
		            ${dto_reply.operator}<br>
		            <input type=text id="re_comment" value="${dto_reply.re_comment}" name="re_comment"><br>
		            ${dto_reply.user_user_id}<br>
		            ${dto_reply.reply_id}<br>
		            <input type=hidden name="post_post_id" value=${dto_reply.post_post_id}>
		            <input type=hidden name="reply_id" value=${dto_reply.reply_id}>
		            <div id="btn_reply">
		                <input type="button" id="remove_reply" value="삭제" data_r=${dto_reply.reply_id}>
		                <input type="submit" id="edit_reply" value="수정" data_r=${dto_reply.reply_id}>
		            </div>
	            </form>
	            </c:forEach>
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
.on('click','#remove',function changeView(){
	var post_id=$('#post_id').val();
	console.log(post_id);
	var answer=confirm("삭제하시겠습니까?");
	if(answer==true){
		window.location.href="<c:url value='notice_write_delete'/>?post_id="+post_id;
	}
})

//Delete ONLY comments
.on('click','#remove_reply',function changeView(){
	var post_id=$('#post_id').val();
	console.log(post_id);
	var answer=confirm("삭제하시겠습니까?");
	if(answer==true){
		window.location.href="<c:url value='delete_comment'/>?post_id="
				+post_id+"&reply_id="+$(this).attr("data_r");
	}
})

//update comments
//.on('click','#edit_reply',function changeView(){
//	var re_comment=$('#re_comment').val();
//	console.log(re_comment);
//	$.get("update_comment", //URL
//			 {post_post_id:$('input[name=post_id]').val(),
//			 re_comment:$('#re_comment').val(),
//			 reply_id:$(this).attr("data_r")}, //data
//			 function(txt){ 
//		 }, //function
//		'text'); //dataType
//})

//add comments
.on('click','#submit',function changeView(){
	$.get("add_comment", //URL
			 {post_post_id:$('input[name=post_id]').val(),
			 re_comment:$('input[name=re_comment]').val()}, //data
			 function(txt){ 
			 }, //function
		'text'); //dataType
})
</script>
</html>