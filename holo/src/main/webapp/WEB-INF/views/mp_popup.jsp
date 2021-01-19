<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/slick-master/slick/slick.css">
<link rel="stylesheet" type="text/css" href="resources/slick-master/slick/slick-theme.css">
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/mp_popup.css">
<body>
<h3><span id="who">${mp_user.nick}</span> 님의 마이페이지</h3>

<table>       
    <tr>
        <td class="bold">닉네임</td>
        <td>${mp_user.nick}</td>
    </tr>         
    <tr id="gender">
        <td class="bold">성별</td>
        <td class="readonly">
	<c:if test="${mp_user.gender=='f'}">
		여성
	</c:if>
	<c:if test="${mp_user.gender=='m'}">
		남성
	</c:if>
	</td>
    </tr>
    <tr id="like">
        <td class="bold">좋아요</td>
        <td class="readonly">${mp_user.likes}</td>
    </tr>
    <tr>
        <td class="bold">생년월일</td>
        <td id="readonly">${mp_user.birth}</td>
    </tr>
    <tr>
   		<td class="bold">성격 태그</td>
   		<td>
   		<input type=hidden value="${mp_user.tag}" id="tags">
   		${mp_user.tag}
		</td>
     </tr>
     <tr><td class="bold">자기소개</td></tr>
 </table>
 <textarea id="cv" name="cv" placeholder="100자 이하로 입력해 주세요" readonly>${mp_user.cv}</textarea>
            
 <h4>내가 쓴 글</h4>
	<c:set var="i" value="0" />
	<c:set var="j" value="5" />
 
 
    <div class="your-class" style="width: 100%; ">
    <c:forEach items="${mylist}" var="item" varStatus="status"> 
    <c:if test="${i%j == 0 }">
     <div class=line>
    </c:if>
    	<div class="atag"> 
	    <c:if test="${item.board==0}"><span class="help_you board">도움주기</span></c:if>
        <c:if test="${item.board==0}"><a href="helpyou_write_view?help_post_id=${item.post_id}" target="_blank">${item.title}</a><span class=time>${item.operator}</span></c:if>
          	
		<c:if test="${item.board==1}"><span class="help_me board">도움받기</span></c:if>
		<c:if test="${item.board==1}"><a href="helpme_write_view?help_post_id=${item.post_id}" target="_blank">${item.title}</a><span class=time>${item.operator}</span></c:if>
		
		<c:if test="${item.board==2}"><span class="freeboard board">자유게시판</span></c:if>
		<c:if test="${item.board==2}"><a href="freeboard_write_view?post_id=${item.post_id}" target="_blank">${item.title}</a><span class=time>${item.operator}</span></c:if> 
    	</div>
    <c:if test="${i%j==j-1}"> 
     </div>
    </c:if> 
    <c:set var="i" value="${i+1}" /> 
    </c:forEach> 
    </div>

  </div>
  
   <h4>내가 쓴 댓글</h4>
	<c:set var="i" value="0" />
	<c:set var="j" value="5" />
 
 
    <div class="your-class" style="width: auto; ">
    <c:forEach items="${total_reply}" var="item" varStatus="status"> 
    <c:if test="${i%j == 0}">
     <div class=line>
    </c:if>
    	
    	<div class="atag"> 
	    <span class="recon">${read.nick}</span>
       	<span class="re">${item.re_comment}</span>
	    <span class="time">${item.operator}</span>
    	</div>
    <c:if test="${i%j == j-1}"> 
     </div>
    </c:if> 
    <c:set var="i" value="${i+1}" /> 
    </c:forEach> 
    </div>

  </div>  
  
  <div class="cancel-box">
  	 <input type="button" id="cancel" value="닫기">
  </div>

 
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="resources/slick-master/slick/slick.min.js"></script>
 

</body>
<script type="text/javascript">
$(document).ready(function(){
  console.log($('.how').length);
  $('.your-class').slick({
    dots: true,
    infinite: true,
    arrows: false
  });
});



$(document)
.on('click','#cancel',function(){
	window.close();
})
</script>

</html>