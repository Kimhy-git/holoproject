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
<link rel="stylesheet" href="resources/css/helpme_write_view.css">
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
            <a href="mypage">마이페이지</a>
        </div>
        <div class="clear"></div>
 </header> 
 <div class="clear"></div>
 <section>
 	 <div id="section_h">   
        <h2>도움받기</h2>
        <form method="post" action="helpme_search_go">
            <div id="search">
               <select id="area" name="area">
               	   <option value="전체"<c:if test="${map.area == '전체'}">selected</c:if>>전체</option>
                   <option value="서울"<c:if test="${map.area == '서울'}">selected</c:if>>서울</option>
                   <option value="경기"<c:if test="${map.area == '경기'}">selected</c:if>>경기</option>
                   <option value="인천"<c:if test="${map.area == '인천'}">selected</c:if>>인천</option>
                   <option value="대전"<c:if test="${map.area == '대전'}">selected</c:if>>대전</option>
                   <option value="대구"<c:if test="${map.area == '대구'}">selected</c:if>>대구</option>
                   <option value="부산"<c:if test="${map.area == '부산'}">selected</c:if>>부산</option>
                   <option value="강원"<c:if test="${map.area == '강원'}">selected</c:if>>강원</option>
                   <option value="경남"<c:if test="${map.area == '경남'}">selected</c:if>>경남</option>
                   <option value="경북"<c:if test="${map.area == '경북'}">selected</c:if>>경북</option>
                   <option value="울산"<c:if test="${map.area == '울산'}">selected</c:if>>울산</option>
                   <option value="광주"<c:if test="${map.area == '광주'}">selected</c:if>>광주</option>
                   <option value="전남"<c:if test="${map.area == '전남'}">selected</c:if>>전남</option>
                   <option value="전북"<c:if test="${map.area == '전북'}">selected</c:if>>전북</option>
                   <option value="세종"<c:if test="${map.area == '세종'}">selected</c:if>>세종</option>
                   <option value="충남"<c:if test="${map.area == '충남'}">selected</c:if>>충남</option>
                   <option value="충북"<c:if test="${map.area == '충북'}">selected</c:if>>충북</option>
                   <option value="제주"<c:if test="${map.area == '제주'}">selected</c:if>>제주</option>
               </select>
               <input name="keyword" value="${map.keyword}" placeholder="키워드를 입력하세요">
			   <input type="submit" value="검색">
            </div>
         </form>
       <a href="helpme_write" class="write">글쓰기</a>
    </div> 
    <div id="wrap">
   		<div id="center">   
	    	<input type=hidden id=pId value="${read.help_post_id}" name="help_post_post_id">
	    	<input type="hidden" value="${read.nick}" id="nick">
	    	<input type=hidden id=userId value="${read.user_user_id}">

            	<div id="first">
                   <div id="title">${read.title}<span>${read.tag_job}</span></div>
                   <div id="nick">${read.nick}</div>
                   <div id="date">${read.operator}</div>
            	</div>
           	<input type="button" id="sub_btn"  value="지원하기">
            <div id="second">
	           	<table>
	           		<tr>
	           			<td>최소 금액</td>
	           			<td>${read.min_price}</td>
	            	</tr>
	            	<tr>
	            		<td>지원 가능 성별</td>
	            		<td>${read.gender}</td>
	            	</tr>
	            	<tr>
	            		<td>작성자 추천수</td>
	            		<td>1</td>
	            	</tr>
	            	<tr>
	            		<td>결제 방법</td>
	            		<td>${read.payment}</td>
	            	</tr>
	            	<tr>
	            		<td>조회수</td>
	            		<td>${read.hit}</td>
	            	</tr>
	           	</table>
			</div>
        <table id="third">
        	<tr>                
                <td>
                <div id="content">
                	<c:if test="${read.img!=null}">
                		<img src="http://localhost:8080/holo/img/${read.img}" id="image"/><br><br>
                	</c:if>
                	${read.content}</div>
                </td>
            </tr>
        </table>
  
        
         <div id="form-commentInfo"> 
             <div id="comment-count">댓글 <span id="count">(${read.replyCnt})</span></div> 
             <form method="post" action="help_reply_go">
	             <div id=cc>
	             	 <input type=hidden value="${login.user_id}" id="user_id_login" name=user_id>
	             	 <input type=hidden id=pId value="${read.help_post_id}" name="help_post_post_id">
		             <input id="comment-input" name="re_comment" placeholder="댓글을 입력해 주세요.">
		             <input type=submit id="submit" value="등록">
		         </div> 
		     </form>    
	     </div> 
     		 	
     
         <c:forEach var="list" items="${re_list}">

          <form method="post" >
          		
          	<div class=comments value="${list.re_class}">
          	<input type="hidden" class="re_class" value="${list.re_class}">	     
            <div id="comments${list.help_reply_id}" >
               <input type="hidden" name="help_reply_id" value="${list.help_reply_id}">
	           <p class="reply_user">${list.nick}</p>
	           <p class="reply_comment">${list.re_comment}</p>
	           <p class="reply_date">${list.operator}</p>
	           <input type=hidden value="${read.help_post_id}" name="help_post_post_id">
	           
	        <c:if test="${login.user_id==list.user_user_id || login.user_id=='admin'}">
	           <input type=submit class="re_remove" value="삭제" onclick="javascript: form.action='help_reply_del';"/> 
	           <input type=button class="re_edit" id="re_edit${list.help_reply_id}" value="수정" onclick="javascript: form.action='help_reply_edit_go';"/>
	        </c:if>
	           <input type="button" class="re_again" id="reply_again${list.help_reply_id}" value="답글달기" >
	        </div>
           
           
           <div class="re_edit_txt" id="re_edit_txt${list.help_reply_id}" style="display:none">
	           <input class="edit-input" id="edit-input${list.help_reply_id}" name="re_comment_edit" value="${list.re_comment}" placeholder="댓글을 입력해 주세요.">
           	   <input type=submit class="edit-go" id="edit_go${list.help_reply_id}" value="수정">
           	   <input type=button class="edit-cancel" id="edit_cancel${list.help_reply_id}" value="취소">
           </div>
   					
                   <div class="reply_again_txt" id="reply_again_textarea${list.help_reply_id}" style="display:none">
                      <input type=hidden value="${login.user_id}" id="user_id_login" name=user_id>
                      <input type="hidden" name="parent_id" value="${list.help_reply_id}">
				      <input type="hidden" name="re_index" value="${list.re_index}">
				      <input type="hidden" name="re_order" value="${list.re_order}">
				      <input type="hidden" name="re_class" value="${list.re_class}">
				      <input type="hidden" name="groupNum" value="${list.groupNum}">
				      <input type="hidden" name="re_post_id" value="${list.help_post_post_id}">
                      <input type=text class="re_re_comment" name="re_re_comment" placeholder="댓글을 입력해 주세요."> 
                      <input type=submit class="re_re_submit"value="등록" onclick="javascript: form.action='helpme_re_recomment_submit';"/> 
                   </div>
                   <div id="clr"></div>
        	</div>
           
          </form>
		</c:forEach>

	         <div id="btn">
	             <c:if test="${login.user_id==read.user_user_id || login.user_id=='admin'}">
	              <a href="helpme_del?help_post_id=${read.help_post_id}"><input type="button" id="remove" value="삭제"></a>
	              <a href="helpme_write_edit?help_post_id=${read.help_post_id}"><input type="button" id="edit" value="수정"></a>
	         	</c:if>
	             <a href="help_me"><input type="button" id="list" value="목록보기"></a>
	         </div>      
    	</div>
    </div>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
	$('.comments').each(function(index,item){
		var n = $(this).attr("value");
		console.log(n);
		$(this).css("margin-left",(n*50)+"px");
		console.log((n*50));
	});
	//$('.comments').css("margin_left",(n*50)+"px");
})
.on('click','#sub_btn',function(){
	var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인 해주세요");
			window.location.href="<c:url value='login'/>"
	   }else{
		   window.open("apply_popup?nick="+$('#nick').val()+
			   "&post_id="+$('#pId').val()+
			   "&user_id="+$('#userId').val(),
			   "applyPop",'width=470, height=580, left=400, top=200, resizable=no');
	   }
})

.on('click','#comment-input',function(){
	   var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인이 필요한 서비스입니다.");
			window.location.href="<c:url value='login'/>"
	   }else{
	   }
})
.on('click','#submit',function(){
	
	   if($('#comment-input').val()==''){
			alert("내용을 입력하세요.");
			return false;
	   }
		   
	   
})
.on('click','.re_re_submit',function(){
	   if($('.re_re_comment').val()==''){
			alert("내용을 입력하세요.");
			return false;
	   }
})
.on('click','.edit-go',function(){
		if($('.edit-input').val()==''){
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
		         $('#re_edit_txt'+n).hide();
		         //$('.reply_again_txt').hide()
			     //$('.re_edit_txt').hide()
			     $('#reply_again_textarea'+n).show()
		   }else{
		      $('#reply_again_textarea'+n).hide();
		   } 
		   
		   
	   }
})     

.on('click','input[id^=re_edit]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(7); 
   console.log($('#re_edit_txt'+n).css("display"));
   if($('#re_edit_txt'+n).css("display")=="none"){
       $('#comments'+n).hide()
	   $('#re_edit_txt'+n).show();
       $('#reply_again_textarea'+n).hide();
   }else{
	  $('#comments'+n).show()
      $('#re_edit_txt'+n).hide();
   }
})

.on('click','input[id^=edit_cancel]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(11); 
   console.log(n)
   console.log($('#comments'+n).css("display"));
   if($('#comments'+n).css("display")=="none"){
       $('#comments'+n).show()
	   $('#re_edit_txt'+n).hide();
         
   }else{
	  $('#comments'+n).hide()
      $('#re_edit_txt'+n).show();
   }
})  



</script>
</html>