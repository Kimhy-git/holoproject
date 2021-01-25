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
	        <input type=hidden value="${login.user_id}" id="user_id_login">
	        <input type="hidden" value="${login.user_id}" id="login_user_id">
	        <c:if test="${login.nick==null}">
	            <a href="login" id=login>로그인</a>
	            <a href="join" id="join">회원가입</a>
	            
	        </c:if>
	        <c:if test="${login.nick!=null}">
	        	<a href="mypage" id="mypage">마이페이지</a>
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
                <a href="notice">공지사항</a>
        </div>
    </header>
    <div class="clear"></div>
    <section>
        <div id="section_h">
	    	<h2>자유게시판</h2>
		</div>
        <div id="wrap">
           <div id="center">
               <c:forEach var="dto" items="${freeboard}">
               
					<div id="title">
		             	${dto.title}<input type=hidden name=title value="${dto.title}">
		             </div>
		             <div id="nick">
		             	${dto.nick}
		             </div>
		             <div id="date">
		             	${dto.operator}
		             </div>
		             <div id="hit">
		             	조회수 ${dto.hit}
		             </div>               
		             <div id=content>
		             	<c:if test="${dto.img!=null}">
		                    <img src="holoimg/img/${dto.img}" id="image"/><br><br>
		                </c:if>
		                <pre>${dto.content}</pre>
		             </div>	
		             			
                	 <input type="hidden" name="title" value="${dto.title}">
                	 <input type="hidden" name="nick" value="${dto.nick}">
	                 <input type="hidden" id="post_id" name="post_id" value="${dto.post_id}">
            		 <input type="hidden" id="board" value="${dto.board}">
            		 <input type="hidden" id="user_user_id" value="${dto.user_user_id}">
            		 <input type="hidden" name="content" value="${dto.content}">

               </c:forEach>
    
            
            <div id="form-commentInfo"> 
            <c:forEach var="dto" items="${freeboard}">
                <div id="comment-count">댓글 <span id="count">(${dto.replyCnt})</span></div> 
                <div id=cc>
                	<textarea id="comment-input" name="re_comment" placeholder="댓글을 입력해 주세요." style="resize:none"></textarea>
                	<button id="submit" class="reply_sub_btn">등록</button>
                </div>
			</c:forEach>
            </div> 

            <!-- DB에서 reply 가져오기 -->
            
	            <c:forEach var="dto_free_reply" items="${free_reply}">
		            <div class="comments" value="${dto_free_reply.re_class}">
			        	<div id="comments${dto_free_reply.reply_id}" class="commentsbox" > 
				            
				            
				  	    <form method="post" action="mp_popup_post" target="mp_popGoGo" id="mpGol${dto_free_reply.reply_id}">     
			              	  <input type=hidden value="${dto_free_reply.post_post_id}" name="post_id">
			              	  <input type=hidden value="${dto_free_reply.user_user_id}" name="user_id">
			              	  <input type=hidden id="whoru${dto_free_reply.reply_id}" value="${dto_free_reply.nick}" name="nick">   
					          <p class="writer" id="mp_popGo${dto_free_reply.reply_id}">
			                  ${dto_free_reply.nick}</p>
		          		</form>        
		                    <p class="reply_comment">${dto_free_reply.re_comment}</p>
			           		<p class="reply_date">${dto_free_reply.operator}</p>
				           <!--${dto_free_reply.re_comment} ${dto_free_reply.operator}-->
				            <input type="hidden" name="post_post_id" value="${dto_free_reply.post_post_id}">
				            <input type="hidden" name="reply_id" value="${dto_free_reply.reply_id}">
				            <input type="hidden" name="re_order" value="${dto_free_reply.re_order}">
				            <input type="hidden" name="groupNum" value="${dto_free_reply.reply_id}">
				        
				            <div id="btn_reply">
					            <c:if test="${login.user_id==dto_free_reply.user_user_id || login.user_id=='admin'}">
					                <input type="button" class="re_remove" id="remove_reply${dto_free_reply.reply_id}" value="삭제" data_r="${dto_free_reply.reply_id}">
					                <input type="button" class="re_edit" id="reply_update${dto_free_reply.reply_id}" value="수정" data_r="${dto_free_reply.reply_id}">
					            </c:if>
				                <input type="button" class="re_again" id="reply_again${dto_free_reply.reply_id}" value="답글달기" >
				            </div>
						</div>
				            <div class="reply_again_txt" id="reply_again_textarea${dto_free_reply.reply_id}" style="display:none">
				            	<form action="add_free_re_comment" method="post">
				            	<input type="hidden" name="nick" value="${login.nick}">
				            	<input type="hidden" name="post_post_id" value="${dto_free_reply.post_post_id}">
					            <input type="hidden" name="parent_id" value="${dto_free_reply.reply_id}">
					            <input type="hidden" name="re_index" value="${dto_free_reply.re_index}">
					            <input type="hidden" name="re_order" value="${dto_free_reply.re_order}">
					            <input type="hidden" name="re_class" value="${dto_free_reply.re_class}">
					            <input type="hidden" name="groupNum" value="${dto_free_reply.groupNum}">
					            <textarea id="re_re_comment${dto_free_reply.reply_id}" class="re_re_comment" name="re_re_comment" placeholder="댓글을 입력해 주세요." style="resize:none"></textarea>
					            <input type=submit class="re_re_submit" id="re_re_submit${dto_free_reply.reply_id}" value="등록" > 
					        	</form>		        	
					        </div>
					        
					        <div class="re_edit_txt" id="re_edit_txt${dto_free_reply.reply_id}" style="display:none">
					            <form action="update_free_comment_now" method="post">
					            	<input type="hidden" name="post_post_id" value="${dto_free_reply.post_post_id}">
						            <input type="hidden" name="reply_id" value="${dto_free_reply.reply_id}">
						            <input type="hidden" name="re_order" value="${dto_free_reply.re_order}">
						            <input type="hidden" name="groupNum" value="${dto_free_reply.groupNum}">
						            <input type="hidden" name="board" value="${dto_free_reply.board}">
						            <!--  <div id=cc>-->
				                	<textarea class="edit-input" id="edit-input${dto_free_reply.reply_id}" name="re_comment" placeholder="댓글을 입력해 주세요." style="resize:none">${dto_free_reply.re_comment}</textarea>
				                	<input type=submit class="edit-go" id="edit_go${dto_free_reply.reply_id}" value="수정">
				           	   		<input type=button class="edit-cancel" id="edit_cancel${dto_free_reply.reply_id}" value="취소">
			                		<!--  </div>-->
			                		<div id="clr"></div>
					        	</form>	
					        </div>  	        	
				        
			        </div>
	            </c:forEach>
	             
	            <div id="comments_add"></div>
	             
        	
        <input type="hidden" name="page" id="page" value="${page}">
		<input type="hidden" name="listCnt" id="listCnt" value="${listCnt}">
		<input type="hidden" id="range" value="${pagination.range}">
		<a href="#" id="more">더보기</a>  
		
		<form action="freeboard_modify" method="get">
              <div id="btn">
              <c:forEach var="dto" items="${freeboard}">
	            <c:if test="${login.user_id==dto.user_user_id || login.user_id=='admin'}">
		                <input type="hidden" name="title" value="${dto.title}">
                	 <input type="hidden" name="nick" value="${dto.nick}">
	                 <input type="hidden" id="post_id" name="post_id" value="${dto.post_id}">
            		 <input type="hidden" id="board" value="${dto.board}">
            		 <input type="hidden" id="user_user_id" value="${dto.user_user_id}">
            		 <input type="hidden" name="content" value="${dto.content}">
 	                <input type="button" id="remove" value="삭제">
  	                <input type="submit" id="edit" value="수정">
		                
		        </c:if>
		        </c:forEach>
                <a href="freeboard"><input type="button" id="list" value="목록보기"></a>
            	</div>
         </form>
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
var page=$('#page').val();
$(document)
.ready(function(){
	$('.comments').each(function(index,item){
		var n = $(this).attr("value");
		console.log(n);
		$(this).css("margin-left",(n*50)+"px");
		console.log((n*50));
	})
	page=parseInt(page);
	var listCnt=$('#listCnt').val();
	if( listCnt<6){
		$('#more').hide();
	}
	//$('.comments').css("margin_left",(n*50)+"px");
	console.log("dto.user_user_id: "+'${dto.user_user_id}');
	console.log("login.user_id: "+'${login.user_id}');
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


/*.on('click','input[id^=reply_again]',function(){ //input[id가 reply_again으로 시작하는 버튼]
	   var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인 해주세요");
			window.location.href="<c:url value='login'/>"
	   }else{
		   var n=(this.id).substr(11); 

		   
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
})*/    


.on('click','input[id^=reply_update]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(12);
	console.log("n: "+n);
	console.log("display: "+$('#re_edit_txt'+n).css("display"));
   if($('#re_edit_txt'+n).css("display")=="none"){
	   console.log("test");
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

var maxpage =5;
$(document).on('click','#more',function(){
console.log("more");
	
	var listCnt=$('#listCnt').val();
	console.log("listCnt : "+listCnt);
	page=parseInt(page);
	page+=5;
	maxpage=maxpage+page;
	console.log("page : "+page);
	if(maxpage>=listCnt){
		$('#more').hide();
	}
	
	if(page>listCnt){
		alert("댓글이 더 없습니다");
		$('#more').hide();
	}
	
	var range=$('#range').val();
	var post_id=$('#post_id').val();
	console.log("page : "+page);
	
	$.post("freeboard_write_view_reply?post_id="+$('#post_id').val(),
			{"page":page,"range":range},
			function(data){
				console.log("post ajax data : "+data);
				
				$.each(data,function(ndx,value){
					console.log("each: "+value['reply_id']+", "+value['re_comment']);
					var ifbtn="";
					if("${login.user_id}"==value['user_user_id'] || "${login.user_id}"=="admin"){
		            	 ifbtn='<input type="button" class="re_remove" id="remove_reply'+value['reply_id']+'" value="삭제" data_r='+value['reply_id']+'>'
			             +'<input type="button" class="re_edit" id="reply_update'+value['reply_id']+'" value="수정" data_r='+value['reply_id']+'>'
		            }
					console.log("ifbtn: "+ifbtn);
					var user_nick='${login.nick}';
					console.log("user_nick: "+user_nick);
					var content=
						'<div class="comments" value='+value['re_class']+'>'
							+'<input type=hidden class="re_class" value='+value['re_class']+'>'
														
							+'<div id="comments"'+value['reply_id']+' class="commentsbox">'
							+'<input type=hidden name=reply_id value='+value['reply_id']+'>'
							
							+'<form  method="post" action="mp_popup_post" target="mp_popGoGo" id="mpGol'+value['reply_id']+'>'
								+'<input type="hidden" name="post_id" value='+value['post_post_id']+'>'
								+'<input type="hidden" name="user_id" value='+value['user_user_id']+'>'
								+'<input type="hidden" id="whoru'+value['reply_id']+'" name="nick" value="'+value['nick']+'">'
					            +'<p class="writer" id="mp_popGo'+value['reply_id']+'">'
					            +value['nick']+'</p>'
					        +'</form>'
					        +'<p class="reply_comment">'+value['re_comment']+'</p>'
					        +'<p class="reply_date">'+value['operator']+'</p>'
					        +'<input type="hidden" name="post_post_id" value='+value['post_post_id']+'>'
		                	+'<input type="hidden" name="reply_id" value='+value['reply_id']+'>'
		                	+'<input type="hidden" name="re_order" value='+value['re_order']+'>'
		                	+'<input type="hidden" name="groupNum" value='+value['groupNum']+'>'
			            
			            	+'<div id=btn_reply>'
					            +ifbtn
					            +'<input type="button" class="re_again" id="reply_again'+value['reply_id']+'" value="답글달기">'		
			                +'</div>'
			                +'</div>'
			                +'<div class="reply_again_txt" id="reply_again_textarea'+value['reply_id']+'" style="display:none"">'
				                +'<form action="add_free_re_comment" method="post">'
				                	+'<input type="hidden" name="nick" value='+user_nick+'>'
				                	+'<input type="hidden" name="post_post_id" value='+value['post_post_id']+'>'
				                	+'<input type="hidden" name="parent_id" value='+value['reply_id']+'>'
				                	+'<input type="hidden" name="re_index" value='+value['re_index']+'>'
				                	+'<input type="hidden" name="re_order" value='+value['re_order']+'>'
				                	+'<input type="hidden" name="re_class" value='+value['re_class']+'>'
				                	+'<input type="hidden" name="groupNum" value='+value['groupNum']+'>'
				                	+'<textarea id="re_re_comment'+value['reply_id']+'" class="re_re_comment" name="re_re_comment" placeholder="댓글을 입력해 주세요." style="resize:none">'+'</textarea>'
					                +'<input type="submit" class="re_re_submit" id="re_re_submit'+value['reply_id']+'" value="등록">'
				            	+'</form>'    
			                +'</div>'
			                
		                +'<div class="re_edit_txt" id="re_edit_txt'+value['reply_id']+'" style="display:none">'
				             +'<form action="update_free_comment_now" method="post">'
			                	+'<input type="hidden" name="post_post_id" value='+value['post_post_id']+'>'
			                	+'<input type="hidden" name="reply_id" value='+value['reply_id']+'>'
			                	+'<input type="hidden" name="re_order" value='+value['re_order']+'>'
			                	+'<input type="hidden" name="groupNum" value='+value['groupNum']+'>'
			                	+'<input type="hidden" name="board" value='+value['board']+'>'
			                	
			                	+'<textarea class="edit-input" id="edit-input'+value['reply_id']+'" name="re_comment" placeholder="댓글을 입력해 주세요." style="resize:none">'+value['re_comment']+'</textarea>'
			                	+'<input type="submit" class="edit-go" id="edit_go'+value['reply_id']+'" value="수정">'
			           	   		+'<input type="button" class="edit-cancel" id="edit_cancel'+value['reply_id']+'" value="취소">'
			           	   		+'<div id="clr">'
			           	   		+'</div>'
			            	+'</form>'  
	                	+'</div>'
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
		window.location.href="<c:url value='freeboard_write_delete'/>?post_id="+post_id;
	}
})
//Delete ONLY comments
.on('click','input[id^=remove_reply]',function changeView(){
	var post_id=$('#post_id').val();
	console.log(post_id);
	var answer=confirm("삭제하시겠습니까?");
	if(answer==true){
		window.location.href="<c:url value='delete_free_comment'/>?post_id="
				+post_id+"&reply_id="+$(this).attr("data_r");
	}
})
.on('click','#submit',function changeView(){
	var re_comment=$('#comment-input').val();
	var post_id=$('#post_id').val();
	var nick='${login.nick}';
	console.log(post_id);
	console.log(re_comment);
	console.log("nick: "+nick);
	var answer=confirm("댓글을 등록하시겠습니까?");
	if(answer==true){		
		window.location.href="<c:url value='add_free_comment'/>?post_post_id="+post_id+"&re_comment="+re_comment+"&nick="+nick;
	}
})


//show re_reply update textarea
/*.on('click','input[id^=reply_update]',function(){ //input[id가 reply_update으로 시작하는 버튼]
	var n=(this.id).substr(12);
	console.log("n: "+n);
	console.log($('#edit_reply_textarea'+n).css("display"));
	if($('#edit_reply_textarea'+n).css("display")=="none"){
			$('#edit_reply_textarea'+n).show();
			$('#comments'+n).hide();
			$('#reply_update'+n).hide();
	}else{
		$('#edit_reply_textarea'+n).hide();
		$('#comments'+n).show()
	}
})*/
//cancel

//cancel
/*
.on('click','input[id^=rere_cancel]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(11); 
   console.log(n)
   console.log($('#comments'+n).css("display"));
   if($('#reply_again_textarea'+n).css("display")=="none"){
	   $('#reply_again_textarea'+n).show();
         
   }else{
      $('#reply_again_textarea'+n).hide();
   }
})*/
</script>
</html>