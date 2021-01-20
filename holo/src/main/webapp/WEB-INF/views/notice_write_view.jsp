<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ajax library -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/notice_write_view.css">
<body>
 <header>
        <nav>
	        <input type=hidden value="${login.user_id}" id="user_id_login">
	        <input type="hidden" value="${login.user_id}" id="login_user_id">
	        <c:if test="${login.nick==null}">
	            <a href="login" id=login>로그인</a>
	            <a href="join" id="join">회원가입</a>
	        </c:if>
	        <c:if test="${login.nick!=null}">
	            <a href="logout" id=login>로그아웃</a>
	        </c:if>
        </nav>
        <div id="logo">
            <a href="main"><img src="resources/img/logo1.png"></a>
        </div>
        <div id="move">
                <a href="help_me">도움받기</a>
                <a href="help_you">도움주기</a>
                <a href="freeboard">자유게시판</a>
	            <c:if test="${login.nick==null}">
		           <a href="#" id="mypage">마이페이지</a>
		        </c:if>
	            <c:if test="${login.nick!=null}">
		           <a href="mypage" id="mypage">마이페이지</a>
		        </c:if>
        </div>
    </header>
    <div class="clear"></div>
    <section>
	    <div id="wrap">
	    	<h2>공지사항</h2>
        	<div id="center">
        		<c:forEach var="dto" items="${notice}">
		        <form action="update_post" method="post">
		            <table id="first">
		                <tr>
		                <td><input type=hidden id=post_id name=post_id value=${dto.post_id}></td>
		            	<td><input type=hidden id=user_user_id value=${dto.user_user_id}></td>
		            	</tr>
		            	<tr>
		                    <td>제목</td>
		                    <td>${dto.title}
		                    <input type=hidden name=title value=${dto.title}></td>
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
				   	<div id="btn">
		            <c:forEach var="dto" items="${notice}">
		            <c:if test="${login.user_id==dto.user_user_id}">
			                <input type="button" id="remove" value="삭제">
			                <input type="submit" id="edit" value="수정">
			        </c:if>
			        </c:forEach>
		        </form>
		        </c:forEach>
		        </div>
           
                <a href="notice"><input type="button" id="list" value="목록보기"></a>
            </div>

            <div id="form-commentInfo"> 
                <div id="comment-count">댓글 <span id="count">${replyCnt}</span></div> 
                <form method="post" action="add_comment">
	                <div id=cc>
	                <c:forEach var="dto" items="${notice}">
	                	<input type=hidden value="${dto.post_id}" name="post_post_id">
	                </c:forEach>
	                	<input type="hidden" name="user_user_id" value="${login.user_id}">
	                	<input type="text" name="nick" value="${login.nick}">
	                	<c:if test="${login.nick==null}">
					         <input id="comment-input" name="re_comment" placeholder="로그인 한 회원만 입력이 가능합니다.">
				        </c:if>
	                	<c:if test="${login.nick!=null}">
		                	<input id="comment-input" name="re_comment" placeholder="댓글을 입력해 주세요.">
		                	<input type=submit class="reply_sub_btn" value="등록">
	                	</c:if>
	                </div>
            	</form>
            </div> 
            <br><br><br>
            <!-- DB에서 reply 가져오기 -->
            <c:forEach var="dto_reply" items="${reply}">
            <div id=comments> 
            <form action="update_comment" method=post class="comments" value="${dto_reply.re_class}">
	            <div id="comments${dto_reply.reply_id}">
			            <input type=text id="re_comment" value="${dto_reply.re_comment}" name="re_comment"><br>
			            ${dto_reply.nick}  ${dto_reply.operator}<br>

			            <input type=hidden name="post_post_id" value=${dto_reply.post_post_id}>
			            <input type=hidden name="reply_id" value=${dto_reply.reply_id}>
			            <input type=hidden name="re_index" value=${dto_reply.re_index}>
			            <input type=hidden name="re_order" value=${dto_reply.re_order}>
			            <input type=hidden name="re_class" value=${dto_reply.re_class}>
			            <input type=hidden name="groupNum" value=${dto_reply.reply_id}>    
			    </div>
			            <div id="btn_reply">
			            <c:if test="${login.user_id}==${dto_reply.user_user_id}">
			                <input type="button" id="remove_reply${dto_reply.reply_id}" value="삭제" data_r=${dto_reply.reply_id}>
			                <input type="button" id="reply_update${dto_reply.reply_id}" value="수정" data_r=${dto_reply.reply_id}>
			            </c:if>
			                <input type="button" id="reply_again${dto_reply.reply_id}" value="답글달기" >
			                
			                <br><br><br>
			                <div id="reply_again_textarea${dto_reply.reply_id}" style="display:none">
			                <input id="comment-input" name="re_re_comment">
			                <input type=submit class="reply_sub_btn" value="등록" onclick="javascript: form.action='add_re_comment';">
			                <input type="button" value="취소" id="rere_cancel${dto_reply.reply_id}">
			                </div>
			                
			                <div id="reply_update_textarea${dto_reply.reply_id}" style="display:none">
			                <input id="comment-input" name="update_comment" placeholder="${dto_reply.re_comment}">
			                <input type=submit class="reply_sub_btn" value="등록" onclick="javascript: form.action='update_comment';"/>
			                <input type="button" value="취소" id="edit_cancel${dto_reply.reply_id}">
			                </div>
			         	</div>
			</form>
			</div>
			</c:forEach>
			
			<div id="comments_add">
				
			</div>
		 
		</div>  
		<input type="hidden" name="page" id="page" value="${page}">
		<input type="hidden" id="range" value="${pagination.range}">
		<a href="#" id="more">더보기</a> 
    </section>
    <footer>
        <p>copyright 홀로서기 
            alone@alone.co.kr</p>
    </footer>
</body>   

<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
/*
function loadNextPage(){
	var page=$('#page').val();
	page=parseInt(page);
	page+=5;
	var post_id=$('#post_id').val();
}*/
</script>
<script>
/*
function loadNextPage(page){
	var param="page="+page;
	$('#comment').load("notice_write_view",param,function(data){
		alert(data);
	});
}  
*/

$(document)
.ready(function(){
	$('.comments').each(function(index,item){
		var n = $(this).attr("value");
		console.log(n);
		$(this).css("margin-left",(n*50)+"px");
		console.log((n*50));
	//$('.comments').css("margin_left",(n*50)+"px");
	})
})

.on('click','#more',function(){
	console.log("more");
	
	var page=$('#page').val();
	page=parseInt(page);
	page+=5;
	
	var range=$('#range').val();
	var post_id=$('#post_id').val();
	console.log("page : "+page);
	
	$.post("notice_write_view_reply?post_id="+$('#post_id').val(),
			{"page":page,"range":range},
			function(data){
				console.log("post ajax data : "+data);
				
				$.each(data,function(ndx,value){
					console.log("each: "+value['reply_id']+", "+value['re_comment']);
					var ifbtn="";
					if(value['user_id']==value['user_user_id']){
		            	 ifbtn='<input type=button id=remove_reply'+value['reply_id']+'value=삭제 data_r='+value['reply_id']+'>'
			             +'<input type=button id=reply_update'+value['reply_id']+'value=수정 data_r='+value['reply_id']+'>'
		            }
					console.log("ifbtn: "+ifbtn);
					var content=
					'<form action=update_comment method=post class=comments value='+value['re_class']+'>'
					+'<div id=comments'+value['reply_id']+'>'
					+'<input type=text name=re_comment id=re_comment value='+value['re_comment']+'>'+'<br>'
			        +value['user_user_id']+value['operator']+'<br>'
					+'<input type=hidden name=post_post_id value='+value['post_post_id']+'>'
		            +'<input type=hidden name=reply_id value='+value['reply_id']+'>'
		            +'<input type=hidden name=re_index value='+value['re_index']+'>'
		            +'<input type=hidden name=re_order value='+value['re_order']+'>'
		            +'<input type=hidden name=re_class value='+value['re_class']+'>'
		            +'<input type=hidden name=groupNum value='+value['reply_id']+'>'
		            +'</div>'
		            
		            +'<div id=btn_reply>'
		            +ifbtn
		            
		            +'<input type=button id=reply_again'+value['reply_id']+' value=답글달기>'
		            +'<br><br><br>'
	                +'<div id=reply_again_textarea'+value['reply_id']+' style=display:none>'
		                +'<input id=comment-input name=re_re_comment>'
		                +'<input type=submit class=reply_sub_btn value=등록 onclick=javascript: form.action=add_re_comment/>'
		                +'<input type=button value=취소 id=rere_cancel'+value['reply_id']+'>'
	                +'</div>'
	                
	                +'<div id=reply_update_textarea'+value['reply_id']+' style=display:none>'
	                +'<input id=comment-input name=update_comment placeholder='+value['re_comment']+'>'
	                +'<input type=submit class=reply_sub_btn value=등록 onclick=javascript: form.action=update_comment/>'
	                +'<input type=button value=취소 id=edit_cancel'+value['reply_id']+'>'
	                +'</div>'
		            console.log("content: "+content);
					$('#comments_add').append(content);
			})
			
		$('.comments').each(function(index,item){
		var n = $(this).attr("value");
		console.log(n);
		$(this).css("margin-left",(n*50)+"px");
		console.log((n*50));
		})
		},'json')
		
		
})

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


//show re_reply textarea
.on('click','input[id^=reply_again]',function(){ //input[id가 reply_again으로 시작하는 버튼]
	 var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인 해주세요");
			window.location.href="<c:url value='login'/>"
	   }else{
		   var n=(this.id).substr(11); 
		   console.log($('#reply_again_textarea'+n).css("display"));
		   if($('#reply_again_textarea'+n).css("display")=="none"){
		         $('#reply_again_textarea'+n).show();
		   }else{
		      $('#reply_again_textarea'+n).hide();
		   } 
	   }
})

//show re_reply update textarea
.on('click','input[id^=reply_update]',function(){ //input[id가 reply_update으로 시작하는 버튼]
	var n=(this.id).substr(12); 
	console.log($('#reply_update_textarea'+n).css("display"));
	if($('#reply_update_textarea'+n).css("display")=="none"){
			$('#reply_update_textarea'+n).show();
			$('#comments'+n).hide();
			$('#reply_update'+n).hide();
	}else{
		$('#reply_update_textarea'+n).hide();
		$('#comments'+n).show()
	}
})

//cancel
.on('click','input[id^=edit_cancel]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(11); 
   console.log(n)
   console.log($('#comments'+n).css("display"));
   if($('#comments'+n).css("display")=="none"){
       $('#comments'+n).show()
	   $('#reply_update_textarea'+n).hide();
         
   }else{
	  $('#comments'+n).hide()
      $('#reply_update_textarea'+n).show();
   }
})

//cancel
.on('click','input[id^=rere_cancel]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(11); 
   console.log(n)
   console.log($('#comments'+n).css("display"));
   if($('#reply_again_textarea'+n).css("display")=="none"){
	   $('#reply_again_textarea'+n).show();
         
   }else{
      $('#reply_again_textarea'+n).hide();
   }
})

.on('click','#mypage',function(){
	var user_id=$('#user_id_login').val();
	console.log(user_id);
	if(user_id==null || user_id==""){
		alert("로그인하세요");
		window.location.href="<c:url value='login'/>"
	}
})
</script>
</html>