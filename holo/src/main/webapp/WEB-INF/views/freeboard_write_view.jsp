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
	        <h2>자유게시판</h2>
	        <div id="search">
	            <input type="text" id="search_txt">
	            <input type="button" id="search_btn" value="검색">
	        </div>
	        <div id=write><a href="freeboard_write">글쓰기</a></div>
            <table id="first">
               
               <c:forEach var="dto" items="${freeboard}">
                <form action="freeboard_modify" method="get">
	                <tr>
	                 <td><input type="hidden" id="post_id" name="post_id" value="${dto.post_id}"></td>
            		 <td><input type="hidden" id="board" value="${dto.board}"></td>
            		 <td><input type="hidden" id="user_user_id" value="${dto.user_user_id}"></td>
                	</tr>
                	<tr>
                	<td>제목</td>
                    <td>${dto.title}
                    <input type="hidden" name="title" value="${dto.title}"></td>
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
                    <td></td>
                	</tr> 
               </c:forEach>
            </table>
            <table id="second">
            	<c:forEach var="dto" items="${freeboard}">
            	<tr>                
                    <td><textarea id="content" cols="130" rows="40" name="content" readonly>${dto.content}</textarea></td>
                </tr>
                </c:forEach>
            </table>
              <div id="btn">
                <input type="button" id="remove" name="remove" value="삭제">
                <input type="submit" id="edit" value="수정">
                <a href="freeboard"><input type="button" id="list" value="목록보기"></a>
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
	            <c:forEach var="dto_free_reply" items="${free_reply}">
	            <form action="update_free_comment" method=get>
		            ${dto_free_reply.user_user_id}<br>
		            ${dto_free_reply.re_comment}<br>
		            <input type="hidden" name="post_post_id" value="${dto_free_reply.post_post_id}">
		            <input type="hidden" name="reply_id" value="${dto_free_reply.reply_id}">
		            <input type="hidden" name="re_order" value="${dto_free_reply.re_order}">
		            <input type="hidden" name="groupNum" value="${dto_free_reply.groupNum}">
		            <div id="btn_reply">
		                <input type="submit" id="remove_reply${dto_free_reply.reply_id}" name="remove_reply" value="삭제" data_r=${dto_free_reply.reply_id}>
		                <input type="button" id="edit_reply${dto_free_reply.reply_id}" value="수정" data_r=${dto_free_reply.reply_id}>
		                <input type="button" id="reply_again${dto_free_reply.reply_id}" value="답글달기" >
		                <div id="reply_again_textarea${dto_free_reply.reply_id}" style="display:none">
		                <input type=textarea name="re_re_comment"> 
		                <input type=submit value="등록" onclick="javascript: form.action='add_free_re_comment';"/> 
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
		window.location.href="<c:url value='freeboard_write_delete'/>?post_id="+post_id;
	}
})
.on('click','#submit',function changeView(){
	var re_comment=$('#comment-input').val();
	var post_id=$('#post_id').val();
	console.log(post_id);
	console.log(re_comment);
	var answer=confirm("댓글을 등록하시겠습니까?");
	if(answer==true){		
		window.location.href="<c:url value='add_free_comment'/>?post_post_id="+post_id+"&re_comment="+re_comment;
	}
})

//Delete ONLY comments
//.on('click','#remove_reply',function changeView(){
//	var post_id=$('#post_id').val();
//	var reply_id=$('#reply_id').val();
//	console.log(post_id);
//	var answer=confirm("삭제하시겠습니까?");
//	if(answer==true){
//		window.location.href="<c:url value='delete_free_comment'/>?post_id="
//				+post_id+"&reply_id="+reply_id+"&board="+1;
//	}
//})

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