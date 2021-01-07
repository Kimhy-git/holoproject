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

            
        <div>
        <c:forEach var="dto" items="${notice}">
        <form action="update_post" method="post">
            <table id="first">
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
                    
                    <td>조회수</td>
                    <td>${dto.hit}</td>
                </tr>
                <tr>
                    <td>글내용</td>
                </tr>
            </table>
            <table id="second">
            	<tr>                
                    <td><textarea id="content" name="content" cols="130" rows="40" readonly>${dto.content}
                    ${dto.img}
                    </textarea>
                    </td>
                    <img src="http://localhost:8080/holo/img/${dto.img}"/>
                </tr>
            </table>
        </form>
        </c:forEach>
        </div>
            
            <div id="btn">
	                <input type="button" id="remove" value="삭제">
	                <input type="submit" id="edit" value="수정">
                <a href="notice"><input type="button" id="list" value="목록보기"></a>
            </div>
            
            <form action="add_comment" method="post">
            <div id="form-commentInfo"> 
            	<c:forEach var="dto" items="${notice}">
                	<div id="comment-count">댓글 <span id="count">${dto.reply_cnt}</span></div> 
                	<input type=hidden name="post_post_id" value="${dto.post_id}"> 
                <div id=cc>
                	<input id="comment-input" id="re_comment" name="re_comment" placeholder="댓글을 입력해 주세요." > 
                	<button id="submit">등록</button> 
                </div>
                </c:forEach>
            </div>
            </form>
            
            <br><br><br>
            <!-- DB에서 reply 가져오기 -->
            <div id=comments> 
	            <c:forEach var="dto_reply" items="${reply}">
	            <form action="update_comment" method=post>
		            <input type=text id="re_comment" value="${dto_reply.re_comment}" name="re_comment"><br>
		            ${dto_reply.user_user_id} ${dto_reply.operator}<br>
		            
		            ${dto_reply.reply_id}<br>
		            <input type=hidden name="post_post_id" value=${dto_reply.post_post_id}>
		            <input type=hidden name="reply_id" value=${dto_reply.reply_id}>
		            <input type=hidden name="re_index" value=${dto_reply.re_index}>
		            <input type=hidden name="re_order" value=${dto_reply.re_order}>
		            <input type=hidden name="groupNum" value=${dto_reply.groupNum}>
		            <div id="btn_reply">
		                <input type="button" id="remove_reply${dto_reply.reply_id}" value="삭제" data_r=${dto_reply.reply_id}>
		                <input type="submit" id="edit_reply" value="수정" data_r=${dto_reply.reply_id}>
		                <input type="button" id="reply_again${dto_reply.reply_id}" value="답글달기" >
		                <div id="reply_again_textarea${dto_reply.reply_id}" style="display:none">
		                <input type=textarea name="re_re_comment"> 
		                <input type=submit value="등록" onclick="javascript: form.action='add_re_comment';"/> 
		                </div>
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
.on('click','input[id^=remove_reply]',function changeView(){
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

//show re_reply textarea
.on('click','input[id^=reply_again]',function(){ //input[id가 reply_again으로 시작하는 버튼]
	var n=(this.id).substr(11); 
	console.log($('#reply_again_textarea'+n).css("display"));
	if($('#reply_again_textarea'+n).css("display")=="none"){
			$('#reply_again_textarea'+n).show();
	}else{
		$('#reply_again_textarea'+n).hide();
	}
})

//add re_comments

</script>
</html>