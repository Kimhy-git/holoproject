<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움받기</title>
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
        <h2>도움받기</h2>
                    <form id="form1" method="post" action="help_me_search" >
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
                        	<select name="search_option">
                        		<option value="all"
								<c:if test="${map.search_option == 'all'}">selected</c:if>
								>전체</option>
								<option value="user_id"
								<c:if test="${map.search_option == 'user_id'}">selected</c:if>
								>작성자</option>
							    <option value="title" 
								<c:if test="${map.search_option == 'title'}">selected</c:if>
							    >제목</option>
							    <option value="content" 
								<c:if test="${map.search_option == 'content'}">selected</c:if>
							    >내용</option>
		
						 	</select>
                        <input name="keyword" value="${map.keyword}" placeholder="키워드를 입력하세요">
					    <input type="submit" id="scbtn" value="검색">
	                    </div>
                    </form>
        <div class="write" id="writing">글쓰기</div>
    </div> 
    <div id="wrap">
   		<div id="center">   
	    	<input type=hidden id=pId value="${read.help_post_id}" name="help_post_post_id">
	    	<input type="hidden" value="${read.nick}" id="nick">
	    	<input type=hidden id=userId value="${read.user_user_id}">

            <div id="first">
            	<div id="title">
                    <div id="tags">
                    	<span>${read.tag_area}</span><span>${read.tag_job}</span>
                    </div>
                    	<c:if test="${read.complete==1}">[완료]</c:if>
                    	${read.title}
                   </div>
                        <form method="post" action="mp_popup" target="mp_popGo" id="mpGo${read.help_post_id}"> 
  	                        <input type="hidden" value="${read.help_post_id}" name="help_post_id">
                        	<input type=hidden value="${read.user_user_id}" name="user_id">
                        	<input type=hidden value="${read.nick}" name="nick" id="who">   
                            <c:if test="${read.user_user_id=='admin'}">
			                  	<p class="writer" id="admin_mp_go" >
	                            ${read.nick} <span class="like" style="color:#412e74; font-size:13px;"> 
	                            ♥ ${read.likes}</span></p>
		              	    </c:if>
		              	    <c:if test="${read.user_user_id!='admin'}">
			                  	<p class="writer" id="mp_go${read.help_post_id}" >
	                            ${read.nick} <span class="like" style="color:#412e74; font-size:13px;"> 
	                            ♥ ${read.likes}</span></p>
		                    </c:if>   
                        </form>
                    <input type="hidden" id="NICK" value="${read.nick}">
                    <div id="date">${read.operator}</div>
                    <input type="hidden" id="title_par" value="${read.title}">
            </div>
			<c:if test="${read.complete==0}">
						<input type="button" id="sub_btn"  value="지원하기">
	        </c:if>
            <div id="second">
	           	<table>
	           	<tr>
	            	<tr>
	            		<td>지원 가능 성별</td>
	            		<td>${read.gender}</td>
	            	</tr>
	           		<tr>
	           			<td>최소 금액</td>
	           			<td id="min_price">${read.min_price}</td>
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
                		<img src="${read.img}" id="image"/><br><br>
                	</c:if>
                	<pre>${read.content}</pre></div>
                </td>
            </tr>
        </table>
  
        
         <div id="form-commentInfo"> 
             <div id="comment-count">댓글 <span id="count">(${read.replyCnt})</span></div> 
             <form method="post" action="help_reply_go">
	             <div id=cc>
	             	 <input type=hidden value="${login.user_id}" id="user_id_login" name=user_id>
	             	 <input type=hidden id=pId value="${read.help_post_id}" name="help_post_post_id">
		             <textarea id="comment-input" name="re_comment" placeholder="댓글을 입력해 주세요." style="resize:none"></textarea>
		             <input type=submit id="submit" value="등록">
		         </div> 
		     </form>    
	     </div> 
     		 	
     
         <c:forEach var="list" items="${re_list}">

         
          		
          	<div class="comments" value="${list.re_class}" style="word-break:break-all;">
          	<input type="hidden" class="re_class" value="${list.re_class}">	     
            <div id="comments${list.help_reply_id}" class="commentsbox" >
               <input type="hidden" name="help_reply_id" value="${list.help_reply_id}">
	      
	      <form method="post" action="mp_popup" target="mp_popGoGo" id="mpGol${list.help_reply_id}">     
              	  <input type=hidden value="${read.help_post_id}" name="help_post_id">
              	  <input type=hidden value="${list.user_user_id}" name="user_id">
              	  <input type=hidden id="whoru${list.help_reply_id}" value="${list.nick}" name="nick">   
              	  <c:if test="${list.user_user_id=='admin'}">
              			<p class="writer" id="admin_mp_popGo">${list.nick}</p>
              	  </c:if>
              	  <c:if test="${list.user_user_id!='admin'}">
                  		<p class="writer" id="mp_popGo${list.help_reply_id}">${list.nick}</p>
                  </c:if>
          </form>
          
          <form method="post">
	           <p class="reply_comment">${list.re_comment}</p>
	           <p class="reply_date">${list.operator}</p>
	           <input type=hidden value="${read.help_post_id}" name="help_post_id">
           	<input type="button" class="re_again" id="reply_again${list.help_reply_id}" value="답글달기" > 
	        <input type="hidden" name="help_reply_id" value="${list.help_reply_id}"> 
	        <input type=hidden name="help_post_post_id" value="${read.help_post_id}">
	        <c:if test="${login.user_id==list.user_user_id || login.user_id=='admin'}">
	           <input type=submit class="re_remove" value="삭제" onclick="javascript: form.action='help_reply_del';"/> 
	           <input type=button class="re_edit" id="re_edit${list.help_reply_id}" value="수정"/>
	        </c:if>
          </form> 
            </div>
            
		
	      <form method="post">

	   	        <input type=hidden value="${read.help_post_id}" name="help_post_post_id">
	        	<input type="hidden" name="help_reply_id" value="${list.help_reply_id}">    

	           <div class="re_edit_txt" id="re_edit_txt${list.help_reply_id}" style="display:none">
		           <textarea class="edit-input" id="edit-input${list.help_reply_id}" name="re_comment_edit" placeholder="댓글을 입력해 주세요." style="resize:none">${list.re_comment}</textarea>
	           	   <input type=submit class="edit-go" id="edit_go${list.help_reply_id}" value="수정" onclick="javascript: form.action='help_reply_edit_go';"/>
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
                      <textarea id="re_re_comment${list.help_reply_id}" class="re_re_comment" name="re_re_comment" placeholder="댓글을 입력해 주세요." style="resize:none"></textarea>
                      <input type=submit class="re_re_submit" id="re_re_submit${list.help_reply_id}"value="등록" onclick="javascript: form.action='helpme_re_recomment_submit';"/> 
                   </div>
                   <div id="clr"></div>
            </form>
         	</div>
		</c:forEach>
		<div id="comments_add">
				
		</div>
		
		<input type="hidden" name="page" id="page" value="${page}">
		<input type="hidden" name="listCnt" id="listCnt" value="${pagination.listCnt}">
		<input type="hidden" id="range" value="${pagination.range}">
		<div id="more" >더보기</div>

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
var page=$('#page').val();
$(document)
.ready(function(){
	$('.comments').each(function(index,item){
		var n = $(this).attr("value");
		$(this).css("margin-left",(n*50)+"px");
	});
	page=parseInt(page);
	var listCnt=$('#listCnt').val();
	//console.log(listCnt+","+15%13+","+5%6);
	if( listCnt<6){
		$('#more').hide();
	}
	//$('.comments').css("margin_left",(n*50)+"px");
})
.on('click','#sub_btn',function(){
	var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인 해주세요");
			window.location.href="<c:url value='login'/>"
	   }else if(login_user_id==$('#userId').val()){
		   alert("본인 글에 지원할 수 없습니다");
	   }else if('${already_apply}'==1){
	       alert("이미 요청 완료한 글입니다");
	   }else if($('#gender').text()=='여성'){
		   if('${login.gender}'=='m'){
			   alert('지원 가능 성별을 확인해주세요');
		   }
	   }else if($('#gender').text()=='남성'){
		   if('${login.gender}'=='f'){
			   alert('지원 가능 성별을 확인해주세요');
		   }
	   }else{
		   window.open("apply_popup?nick="+$('#nick').val()+
			   "&post_id="+$('#pId').val()+
			   "&user_id="+$('#userId').val()+
			   "&title="+$('#title_par').val()+
			   "&price="+$('#min_price').text(),
			   "applyPop",'width=470, height=580, left=400, top=200, resizable=no');
	   }
})

.on('click','[id^=mp_go]',function(){
	//console.log("mp_go click");
	var n=(this.id).substr(5);
	//console.log("n: "+n);
	window.open("","mp_popGo",'width=500, height=600, left=400, top=200, resizable=no, scrollbar=no');
	$("#mpGo"+n).submit();
})
.on('click','[id^=mp_popGo]',function(){
	//console.log("mp_popgo click");
	var n=(this.id).substr(8);
	//console.log("n: "+n);
	window.open("","mp_popGoGo",'width=500, height=600, left=400, top=200, resizable=no, scrollbar=no');
	$("#mpGol"+n).submit();
	//console.log("end!!");
})

.on('click','#admin_mp_popGo',function(){
	alert("관리자의 마이페이지는 열람이 불가능합니다");
})
.on('click','#admin_mp_go',function(){
	alert("관리자의 마이페이지는 열람이 불가능합니다");
})
/*
$('[id^=mp_popGo]').click(function () {
	console.log("mp_popgo click");
	var n=(this.id).substr(8);
	console.log("n: "+n);
	window.open("","mp_popGoGo",'width=500, height=600, left=400, top=200, resizable=no, scrollbar=no');
	$("#mpGol"+n).submit();
	console.log("end!!");
})
*/

var maxpage =5;
$(document).on('click','#more',function(){
	//console.log("more");
	
	var listCnt=$('#listCnt').val();
	//console.log("listCnt : "+listCnt);
	page=parseInt(page);
	page+=5;
	maxpage=maxpage+page;
	//console.log("page : "+page);
	//console.log("maxpage : "+maxpage);
	if(maxpage>=listCnt){
		$('#more').hide();
	}
	
	var range=$('#range').val();
	var post_id=$('#pId').val();
	//console.log("page : "+page);
	
	$.post("helpme_write_view_reply",
			{"page":page,"range":range,"help_post_id":post_id},
			function(data){
				//console.log("post ajax data : "+data);
				
				$.each(data,function(ndx,value){
					//console.log("each 유저아디: "+"${login.user_id}");
					//console.log("each 유저_유저_아디: "+value['user_user_id']);
					var ifbtn="";
					if("${login.user_id}"==value['user_user_id']||"${login.user_id}"=="admin"){
		            	 ifbtn='<input type=submit class=re_remove value=삭제 onclick="javascript: form.action=\'help_reply_del\';"/>'
			             +'<input type=button class=re_edit id=re_edit'+value['help_reply_id']+' value=수정>'
		            }
					
					var ifadmin="";
					if("${list.user_user_id=='admin'}"){
						ifadmin='<p class=writer id=admin_mp_popGo>'+value['nick']+'</p>'
					}else{
						ifadmin='<p class=writer id=mp_popGo'+value['help_reply_id']+'>'+value['nick']+'</p>'
					}
					//console.log("ifbtn: "+ifbtn);
					var content=
					
						'<div class=comments value='+value['re_class']+'>'
						+'<input type=hidden class="re_class" value='+value['re_class']+'>'
							+'<div id=comments'+value['help_reply_id']+' class=commentsbox>'
				            +'<input type=hidden name=help_reply_id value='+value['help_reply_id']+'>'
					            
								+'<form method="post" action="mp_popup" target="mp_popGoGo" id="mpGol'+value['help_reply_id']+'">'
										+'<input type=hidden name=help_post_id value='+${read.help_post_id}+'>'
										+'<input type=hidden name=user_id value='+value['user_user_id']+'>'
							            +'<input type=hidden id="whoru'+value['help_reply_id']+'" name=nick value="'+value['nick']+'">'
							            +'<br>'+ifadmin
								+'</form>'
								
								+'<form mehtod="post">'
							            +'<p class="reply_comment">'+value['re_comment']+'</p>'
							            +'<p class="reply_date">'+value['operator']+'</p>'
							            +'<input type=hidden name=help_post_id value='+${read.help_post_id}+'>'
							            +'<input type=button class="re_again" id=reply_again'+value['help_reply_id']+' value="답글달기">'
							            +'<input type=hidden name="help_post_post_id" value='+value['help_post_post_id']+'>'
							            +'<input type=hidden name=help_reply_id value='+value['help_reply_id']+'>'
							            +ifbtn
		
							    +'</form>'
					        +'</div>'
			            
				            	
					            +'<form method="post">'
						            +'<input type=hidden name="help_post_post_id" value='+value['help_post_post_id']+'>'
						            +'<input type=hidden name=help_reply_id value='+value['help_reply_id']+'>'
					                +'<div class="re_edit_txt" id=re_edit_txt'+value['help_reply_id']+' style=display:none>'
							            +'<textarea class=edit-input id=edit-input'+value['help_reply_id']+' name=re_comment_edit placeholde="댓글을 입력해 주세요" style="resize:none">'
							            +value['re_comment']+'</textarea>'
						                +'<input type=submit class=edit-go id=edit_go'+value['help_reply_id']+' value="수정" onclick="javascript: form.action=\'help_reply_edit_go\'";/>'
							            +'<input type=button class=edit-cancel id=edit_cancel'+value['help_reply_id']+' value="취소">'
					                +'</div>'
					                
					                +'<div class=reply_again_txt id=reply_again_textarea'+value['help_reply_id']+' style=display:none>'
						                +'<input type=hidden value='+"${login.user_id}"+' id=user_id_login name=user_id>'
							           
						                +'<input type=hidden name=parent_id value='+value['help_reply_id']+'>'
							            +'<input type=hidden name=re_index value='+value['re_index']+'>'
							            +'<input type=hidden name=re_order value='+value['re_order']+'>'
							            +'<input type=hidden name=re_class value='+value['re_class']+'>'
							            +'<input type=hidden name=groupNum value='+value['groupNum']+'>'
							            +'<input type=hidden name=re_post_id value='+value['help_post_post_id']+'>'
						                
							            +'<textarea id=re_re_comment'+value['help_reply_id']+' class=re_re_comment name=re_re_comment placeholder="댓글을 입력해 주세요." style="resize:none"></textarea>'
							            +'<input type=submit class=re_re_submit id="re_re_submit'+value['help_reply_id']+'" value="등록" onclick="javascript: form.action=\'helpme_re_recomment_submit\'";/>'
					                +'</div>'
					                +'<div id="clr"></div>'
			                
		                	+'</form>'
		                +'</div>'
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



//show re_reply textarea
$(document).on('click','input[id^=reply_again]',function(){ //input[id가 reply_again으로 시작하는 버튼]
	   var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인 해주세요");
			window.location.href="<c:url value='login'/>"
	   }else{
		   var n=(this.id).substr(11); 
			//console.log("닉네임 왜 못불러오나요?"+$('#whoru'+n).val())
		   
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
.on('click','#writing',function(){
	user_id=$('#user_id_login').val();
	//console.log(user_id);
	if(user_id==null || user_id==""){
		alert("로그인이 필요한 서비스입니다.");
		window.location.href="<c:url value='login'/>"
	}else{
		window.location.href="<c:url value='helpme_write'/>"
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
	//console.log("n: "+n);
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
   //console.log(n)
   //console.log($('#comments'+n).css("display"));
   if($('#comments'+n).css("display")=="none"){
       $('#comments'+n).show()
	   $('#re_edit_txt'+n).hide();
         
   }
})  
.on('click','#chat_room',function(){
	var user_id='${login.user_id}';
	window.open("chat_room?user_id="+user_id,"ChatRoom",'width=490, height=685, left=400, top=200, resizable=no, scrollbar=no');
})

function clickTagAction(){
	var form = $("#form1 > div");
	var tagJob = $(this).text();
	//console.log("tagJob : "+tagJob);
	$("#tagJob").remove();
	form.append("<input id='tabJob' name='tagJob' type='hidden' value='"+tagJob+"'/>");
	$("#form1")[0].submit();
}



</script>
</html>