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
    <div id="section_h">
	    <h2>공지사항</h2>
	</div>
	    <div id="wrap">
        	<div id="center">
		        <form action="update_post" method="post">
		                <input type=hidden id=post_id name=post_id value="${notice.post_id}">
		            	<input type=hidden id=user_user_id value="${notice.user_user_id}">
		            	
		             <div id="title">
		             	${notice.title}<input type=hidden name=title value="${notice.title}">
		             </div>
		             <div id="nick">
		             	${notice.nick}
		             </div>
		             <div id="date">
		             	${notice.operator}
		             </div>
		             <div id="hit">
		             	조회수 ${notice.hit}
		             </div>               
		             <div id=content>
		             	<c:if test="${notice.img!=null}">
		                    <img src="holoimg/img/${notice.img}" id="image"/><br><br>
		                </c:if>
		                <pre>${notice.content}</pre>
		             </div>
		          </form> 

         <div id="form-commentInfo"> 
             <div id="comment-count">댓글 <span id="count">(${replyCnt})</span></div> 
             <form method="post" action="add_comment">
	             <div id=cc>
	             	 <input type=hidden value="${login.user_id}" id="user_id_login" name=user_user_id>
	             	 <input type=hidden id=pId value="${notice.post_id}" name="post_post_id">
	             	 <input type="hidden" id="nick" value="${login.nick}" name="nick">
		             <textarea id="comment-input" name="re_comment" placeholder="댓글을 입력해 주세요." style="resize:none"></textarea>
		             <input type=submit id="submit" value="등록">
		         </div> 
		     </form>    
	     </div> 
     		 	
     <!-- comments reply -->
         <c:forEach var="reply" items="${reply}">	
          	<div class="comments" value="${reply.re_class}" style="word-break:break-all;">
          	<input type="hidden" class="re_class" value="${reply.re_class}">	     
            <div id="comments${reply.reply_id}" class="commentsbox" >
               <input type="hidden" name="reply_id" value="${reply.reply_id}">
	      
	      <form method="post" action="mp_popup_post" target="mp_popGoGo" id="mpGol${reply.reply_id}">     
              	  <input type=hidden value="${notice.post_id}" name="post_id">
              	  <input type=hidden value="${reply.user_user_id}" name="user_id">
              	  <input type=hidden id="whoru${reply.reply_id}" value="${reply.nick}" name="nick">   
                  <p class="writer" id="mp_popGo${reply.reply_id}">
                  ${reply.nick}</p>
          </form>
          
          <form method="post">
	           <p class="reply_comment">${reply.re_comment}</p>
	           <p class="reply_date">${reply.operator}</p>
	           <input type=hidden value="${notice.post_id}" name="post_id">
           	<input type="button" class="re_again" id="reply_again${reply.reply_id}" value="답글달기" > 
	        <input type="hidden" id="reply_id" name="reply_id" value="${reply.reply_id}"> 
	        <input type=hidden name="post_post_id" value="${notice.post_id}">
	        <c:if test="${login.user_id==reply.user_user_id || login.user_id=='admin'}">
	           <input type=button class="re_remove" value="삭제"/> 
	           <input type=button class="re_edit" id="re_edit${reply.reply_id}" value="수정"/>
	        </c:if>
          </form> 
            </div>
            </div>
		
	      <form method="post">

	   	        <input type=hidden value="${notice.post_id}" name="post_post_id">
	        	<input type="hidden" name="reply_id" value="${reply.reply_id}">    

	           <div class="re_edit_txt" id="re_edit_txt${reply.reply_id}" style="display:none">
		           <textarea class="edit-input" id="edit-input${reply.reply_id}" name="re_comment_edit" placeholder="댓글을 입력해 주세요." style="resize:none">${reply.re_comment}</textarea>
	           	   <input type=submit class="edit-go" id="edit_go${reply.reply_id}" value="수정" onclick="javascript: form.action='update_comment';"/>
	           	   <input type=button class="edit-cancel" id="edit_cancel${reply.reply_id}" value="취소">
	           </div>
   					
                   <div class="reply_again_txt" id="reply_again_textarea${reply.reply_id}" style="display:none">
                      <input type=hidden value="${login.user_id}" id="user_id_login" name=user_id>
                      <input type="hidden" name="parent_id" value="${reply.reply_id}">
				      <input type="hidden" name="re_index" value="${reply.re_index}">
				      <input type="hidden" name="re_order" value="${reply.re_order}">
				      <input type="hidden" name="re_class" value="${reply.re_class}">
				      <input type="hidden" name="groupNum" value="${reply.groupNum}">
				      <input type="hidden" name="re_post_id" value="${reply.post_post_id}">
                      <textarea id="re_re_comment${reply.reply_id}" class="re_re_comment" name="re_re_comment" placeholder="댓글을 입력해 주세요." style="resize:none"></textarea>
                      <input type=submit class="re_re_submit" id="re_re_submit${reply.reply_id}"value="등록" onclick="javascript: form.action='add_re_comment';"/> 
                   </div>
                   <div id="clr"></div>
            </form>
         
		</c:forEach>
		<div id="comments_add">
				
		</div>
		
		<input type="hidden" name="page" id="page" value="${page}">
		<input type="hidden" name="replyCnt" id="replyCnt" value="${replyCnt}">
		<input type="hidden" name="listCnt" id="listCnt" value="${listCnt}">
		<input type="hidden" id="range" value="${pagination.range}">
		<a href="#" id="more">더보기</a>

	         <div id="btn">
	             <c:if test="${login.user_id==notice.user_user_id || login.user_id=='admin'}">
	              <a href="notice_write_delete?post_id=${notice.post_id}"><input type="button" id="remove" value="삭제"></a>
	              <a href="update_post?post_id=${notice.post_id}"><input type="button" id="edit" value="수정"></a>
	         	</c:if>
	             <a href="notice"><input type="button" id="list" value="목록보기"></a>
	         </div>      
    	</div>
    </div>
    </section>
    <footer>
        <p>copyright 홀로서기 
            alone@alone.co.kr</p>
    </footer>
</body>   

<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
var page=$('#page').val();
$(document)
.ready(function(){
	$('.comments').each(function(index,item){
		var n = $(this).attr("value");
		$(this).css("margin-left",(n*50)+"px");
	});
	page=parseInt(page);
	var listCnt=$('#listCnt').val();
	console.log(listCnt+","+15%13+","+5%6);
	if( listCnt<6){
		$('#more').hide();
	}
	//$('.comments').css("margin_left",(n*50)+"px");
})

var maxpage =5;
$(document).on('click','#more',function(){
	console.log("more");
	
	var listCnt=$('#listCnt').val();
	console.log("listCnt : "+listCnt);
	page=parseInt(page);
	page+=5;
	maxpage=maxpage+page;
	console.log("page : "+page);
	console.log("maxpage : "+maxpage);
	if(maxpage>=listCnt){
		$('#more').hide();
	}
	
	var range=$('#range').val();
	var post_id=$('#pId').val();
	console.log("page : "+page);
	
	$.post("notice_write_view_reply",
			{"page":page,"range":range,"post_id":post_id},
			function(data){
				//console.log("post ajax data : "+data);
				
				$.each(data,function(ndx,value){
					console.log("each 유저아디: "+"${login.user_id}");
					console.log("each 유저_유저_아디: "+value['user_user_id']);
					var ifbtn="";
					if("${login.user_id}"==value['user_user_id']||"${login.user_id}"=="admin"){
		            	 ifbtn='<input type=button class=re_remove value=삭제/>'
			             +'<input type=button class=re_edit id=re_edit'+value['reply_id']+' value=수정>'
		            }
					console.log("ifbtn: "+ifbtn);
					var content=
					
						'<div class=comments value='+value['re_class']+'>'
						+'<input type=hidden class="re_class" value='+value['re_class']+'>'
						+'<div id=comments'+value['reply_id']+' class=commentsbox>'
			            +'<input type=hidden id=reply_id name=reply_id value='+value['reply_id']+'>'
			            
						+'<form method="post" action="mp_popup_post" target="mp_popGoGo" id="mpGol'+value['reply_id']+'">'
								+'<input type=hidden name=post_id value='+${notice.post_id}+'>'
								+'<input type=hidden name=user_id value='+value['user_user_id']+'>'
					            +'<input type=hidden id="whoru'+value['reply_id']+'" name=nick value="'+value['nick']+'">'
					            +'<p class="writer" id="mp_popGo'+value['reply_id']+'">'
					            +value['nick']+'</p>'
						+'</form>'
						
						+'<form mehtod="post">'
					            +'<p class="reply_comment">'+value['re_comment']+'</p>'
					            +'<p class="reply_date">'+value['operator']+'</p>'
					            +'<input type=hidden name=post_id value='+${notice.post_id}+'>'
					            +'<input type=button class="re_again" id=reply_again'+value['reply_id']+' value="답글달기">'
					            +'<input type=hidden name="post_post_id" value='+value['post_post_id']+'>'
					            +'<input type=hidden name=reply_id value='+value['reply_id']+'>'
					            +ifbtn

						    +'</form>'
					        +'</div>'
			            	+'</div>'
			            	
				            +'<form method="post">'
					            +'<input type=hidden name="post_post_id" value='+value['post_post_id']+'>'
					            +'<input type=hidden name=reply_id value='+value['reply_id']+'>'
				                +'<div class="re_edit_txt" id=re_edit_txt'+value['reply_id']+' style=display:none>'
						            +'<textarea class=edit-input id=edit-input'+value['reply_id']+' name=re_comment_edit placeholde="댓글을 입력해 주세요" style="resize:none">'
						            +value['re_comment']+'</textarea>'
					                +'<input type=submit class=edit-go id=edit_go'+value['reply_id']+' value="수정" onclick="javascript: form.action=\'update_comment\'";/>'
						            +'<input type=button class=edit-cancel id=edit_cancel'+value['reply_id']+' value="취소">'
				                +'</div>'
				                
				                +'<div class=reply_again_txt id=reply_again_textarea'+value['reply_id']+' style=display:none>'
					                +'<input type=hidden value='+"${login.user_id}"+' id=user_id_login name=user_id>'
						           
					                +'<input type=hidden name=parent_id value='+value['reply_id']+'>'
						            +'<input type=hidden name=re_index value='+value['re_index']+'>'
						            +'<input type=hidden name=re_order value='+value['re_order']+'>'
						            +'<input type=hidden name=re_class value='+value['re_class']+'>'
						            +'<input type=hidden name=groupNum value='+value['groupNum']+'>'
						            +'<input type=hidden name=re_post_id value='+value['post_post_id']+'>'
					                
						            +'<textarea id=re_re_comment'+value['reply_id']+' class=re_re_comment name=re_re_comment placeholder="댓글을 입력해 주세요." style="resize:none"></textarea>'
						            +'<input type=submit class=re_re_submit id="re_re_submit'+value['reply_id']+'" value="등록" onclick="javascript: form.action=\'add_re_comment\'";/>'
				                +'</div>'
				                +'<div id="clr"></div>'
		                
	                +'</form>'
		            //console.log("content: "+content);
					$('#comments_add').append(content);
			})
			
		$('.comments').each(function(index,item){
		var n = $(this).attr("value");
		//console.log(n);
		$(this).css("margin-left",(n*50)+"px");
		//console.log((n*50));
		})
		},'json')	
})
.on('click','[id^=mp_go]',function(){
	console.log("mp_go click");
	var n=(this.id).substr(5);
	console.log("n: "+n);
	window.open("","mp_popGo",'width=500, height=600, left=400, top=200, resizable=no, scrollbar=no');
	$("#mpGo"+n).submit();
})
.on('click','[id^=mp_popGo]',function(){
	console.log("mp_popgo click");
	var n=(this.id).substr(8);
	console.log("n: "+n);
	window.open("","mp_popGoGo",'width=500, height=600, left=400, top=200, resizable=no, scrollbar=no');
	$("#mpGol"+n).submit();
	console.log("end!!");
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
.on('click','input[class=re_remove]',function changeView(){
	var post_id=$('#pId').val();
	var reply_id=$('#reply_id').val();
	console.log(post_id);
	var answer=confirm("삭제하시겠습니까?");
	if(answer==true){
		window.location.href="<c:url value='delete_comment'/>?post_id="
				+post_id+"&reply_id="+reply_id;
	}
})



//show re_reply textarea
$(document).on('click','input[id^=reply_again]',function(){ //input[id가 reply_again으로 시작하는 버튼]
	   var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인 해주세요");
			window.location.href="<c:url value='login'/>"
	   }else{
		   var n=(this.id).substr(11); 
			console.log("닉네임 왜 못불러오나요?"+$('#whoru'+n).val())
		   
		   if($('#reply_again_textarea'+n).css("display")=="none"){
			   $('.reply_again_txt').hide(); 
			   $('.re_edit_txt').hide();
			   $('.commentsbox').show();
			   $('#re_edit_txt'+n).hide();
			   $('#re_re_comment'+n).val("@"+$('#whoru'+n).val()+" ");
			   $('#reply_again_textarea'+n).show();
			   
		   }else{
		      $('#reply_again_textarea'+n).hide();
		   } 
		   
		   
	   }
})   
.on('click','#comment-input',function(){
	   var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인이 필요한 서비스입니다.");
			window.location.href="<c:url value='login'/>"
	   }
})
.on('click','#submit',function(){
	
	   if($('#comment-input').val()==''){
			alert("내용을 입력하세요.");
			return false;
	   }
	     
	   
})
.on('keyup','#comment-input',function(){
	str=document.getElementById("comment-input").value;
	if($('#comment-input').val().length>500){
		alert("최대 500자까지 입력할 수 있습니다.");
		document.getElementById("comment-input").value=str.substring(0,500);
		return;
   }
})
.on('keyup','[id^=edit-input]',function(){
	var n=(this.id).substr(10);
	str=document.getElementById("edit-input"+n).value;
	if($('#edit-input'+n).val().length>500){
		alert("최대 500자까지 입력할 수 있습니다.");
		document.getElementById("edit-input"+n).value=str.substring(0,500);
		return;
   }
})
.on('keyup','[id^=re_re_comment]',function(){
	var n=(this.id).substr(13);
	str=document.getElementById("re_re_comment"+n).value;
	if($('#re_re_comment'+n).val().length>500){
		alert("최대 500자까지 입력할 수 있습니다.");
		document.getElementById("re_re_comment"+n).value=str.substring(0,500);
		return;
   }
})

.on('click','[id^=re_re_submit]',function(){
	var n=(this.id).substr(12); 
	   if($('#re_re_comment'+n).val()==''){
			alert("내용을 입력하세요.");
			return false;
	   }
})
.on('click','[id^=edit-go]',function(){
	var n=(this.id).substr(7); 
		if($('#edit-input'+n).val()==''){
			alert("내용을 입력하세요.");
			return false;
	   }
})
.on('click','#remove',function(){
	if(confirm('삭제하시겠습니까?')){	
	}else{
		return false;
	}
})

  

.on('click','input[id^=re_edit]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(7); 
	console.log("n: "+n);
   if($('#re_edit_txt'+n).css("display")=="none"){
	   $('.reply_again_txt').hide(); 
	   $('.re_edit_txt').hide();
	   $('.commentsbox').show();       
	   $('#comments'+n).hide()
	   $('#re_edit_txt'+n).show();
       $('#reply_again_textarea'+n).hide();
   }
})

.on('click','input[id^=edit_cancel]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(11); 
   console.log(n)
   console.log($('#comments'+n).css("display"));
   if($('#comments'+n).css("display")=="none"){
       $('#comments'+n).show()
	   $('#re_edit_txt'+n).hide();
         
   }
})  
</script>
</html>