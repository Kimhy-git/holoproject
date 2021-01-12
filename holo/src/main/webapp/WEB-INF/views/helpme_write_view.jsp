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
        <h2>도움받기</h2>
        <div id="search">
        
            <select id="area">
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
                <option value="대전">대전</option>
                <option value="대구">대구</option>
                <option value="부산">부산</option>
                <option value="강원">강원</option>
                <option value="경남">경남</option>
                <option value="경북">경북</option>
                <option value="울산">울산</option>
                <option value="광주">광주</option>
                <option value="전남">전남</option>
                <option value="전북">전북</option>
                <option value="세종">세종</option>
                <option value="충남">충남</option>
                <option value="충북">충북</option>
                <option value="제주">제주</option>
            </select>
            <input type="text" id="search_txt">
            <input type="button" id="search_btn" value="검색">
        </div>
       <div id=write><a href="helpme_write">글쓰기</a></div>
    </header>
    <section>
    
    	
        <div id="wrap">
        	<input type=text value="${read.help_post_id}" name="help_post_post_id">
            <table id="first">
                <tr>
                    <td>제목</td>
                    <input type="hidden" value="${read.user_user_id}" id="user_user_id">
                    
                    <td>${read.title}</td>
                </tr>
                <tr>
                    <td>조회수</td>
                    
                    <td>${read.hit}</td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td>${read.nick}</td>
                </tr>
                <tr>
                    <td>작성날짜</td>
                    <td>${read.operator}</td>
                </tr>
                <tr>
                    <td>태그</td>
                    <td>${read.tag_job}<td> 
                </tr>
            </table>
            <table id="second">
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
            		<td>${read.likes}</td>
            	</tr>
            	<tr>
            		<td>결제 방법</td>
            		<td>${read.payment}</td>
            	</tr>
            </table>
            <input type="button" id="sub_btn"  value="지원하기">
            <table id="third">
            	<tr>      
                    <td><textarea id="content" cols="130" rows="40" readonly>
                    <img src="http://localhost:8080/holo/img/${read.img}"/>
                    ${read.content}</textarea></td>
                </tr>
            </table>
            <form method="post" action="help_reply_go">
	            <div id="form-commentInfo"> 
	                <div id="comment-count">댓글 <span id="count">0</span></div> 
	                <input type=hidden id=pId value="${read.help_post_id}" name="help_post_post_id">
	                <div id=cc><input id="comment-input" name="re_comment" placeholder="댓글을 입력해 주세요.">
	                <input type=submit id="submit" value="등록"></div>  
	            </div> 
	        </form>	
	        
	            <c:forEach var="list" items="${re_list}">

		            <form method="post" >
		            	<div id=comments>
				            <div id="comments${list.help_reply_id}">
				               <input type="hidden" name="help_reply_id" value="${list.help_reply_id}">
					           <p class="reply_user">${list.nick}</p>
					           <p class="reply_comment">${list.re_comment}</p>
					           <p class="reply_date">${list.operator}</p>
					           <input type=hidden value="${read.help_post_id}" name="help_post_post_id">
					           <input type=submit value="삭제" onclick="javascript: form.action='help_reply_del';"/> 
					           <input type=button id="re_edit${list.help_reply_id}" value="수정" onclick="javascript: form.action='help_reply_edit_go';"/>
					           <input type="button" id="reply_again${list.help_reply_id}" value="답글달기" >
					         </div>
				           
				           
				           <div id="re_edit_txt${list.help_reply_id}" style="display:none">
					           <input id="edit-input${list.help_reply_id}" name="re_comment_edit" value="${list.re_comment}" placeholder="댓글을 입력해 주세요.">
		                	   <input type=submit id="edit_go${list.help_reply_id}" value="수정">
		                	   <input type=button id="edit_cancel${list.help_reply_id}" value="취소">
				           </div>
				           
				          
	                      <div id="reply_again_textarea${list.help_reply_id}" style="display:none">
		                      <input type=textarea name="re_re_comment" size=100> 
		                      <input type=submit value="등록" onclick="javascript: form.action='add_re_comment';"/> 
	                      </div>
				        </div>
			            
		            </form>
				</c:forEach>
			
	            <div id="btn">
	            <c:if test="${login.user_id==read.user_user_id}">
	                <a href="helpme_del?help_post_id=${read.help_post_id}"><input type="button" id="remove" value="삭제"></a>
	                <a href="helpme_write_edit?help_post_id=${read.help_post_id}"><input type="button" id="edit" value="수정"></a>
	            </c:if>    
	                <a href="help_me"><input type="button" id="list" value="목록보기"></a>
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

.on('click','input[id^=re_edit]',function(){ //input[id가 reply_again으로 시작하는 버튼]
   var n=(this.id).substr(7); 
   console.log($('#re_edit_txt'+n).css("display"));
   if($('#re_edit_txt'+n).css("display")=="none"){
       $('#comments'+n).hide()
	   $('#re_edit_txt'+n).show();
         
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