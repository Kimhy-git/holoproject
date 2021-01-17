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
<link rel="stylesheet" href="resources/css/helpyou_write_view.css">
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
            <h2>도움 주기</h2>
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
            <a href="helpyou_write" class="write">글쓰기</a>
       </div>
       <div id="wrap">
			<div id="center">   
		    	<input type=hidden id=pId value="${read.help_post_id}">
		    	<input type=hidden id=userId value="${read.user_user_id}">
		        
		            <div id="first">
		            	<div id="title">
		                    <div id="tags">
		                    	<span>${read.tag_area}</span><span>${read.tag_job}</span>
		                    </div>
		                    	<c:if test="${read.complete==1}">[완료]</c:if>
		                    	${read.title}
	                    </div>
		                    <div id="nick">${read.nick}</div>
		                    <input type="hidden" id="NICK" value="${read.nick}">
		                    <div id="date">${read.operator}</div>
		            </div>
		            <c:if test="${read.complete==0}">
						<input type="button" id="sub_btn"  value="요청하기">
	                </c:if>
		            <input type="hidden" value="${read.user_user_id}" id="user_user_id">
		            <div id="second">
		            	<table>
		            		<tr>
		            			<td>최소 금액</td>
		            			<td>${read.min_price}</td>
			            	</tr>
			            	<tr>
			            		<td>요청 가능 성별</td>
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
		            	</table>
					</div>
					
		            <table id="third">
		            	<tr>                
		                    <td>
		                    <div id="content">
		                    	<c:if test="${read.img!=null}">
		                    		<img src="${read.img}"/><br><br>
		                    	</c:if>
		                    	${read.content}</div>
		                    </td>
		                </tr>
		            </table>
		            <div id="form-commentInfo"> 
		                <div id="comment-count">댓글 <span id="count">(${read.replyCnt})</span></div> 
		                <form method="post" action="helpyou_reply_done">
			                <div id=cc>
			                <input type=hidden name="post_id" value="${read.help_post_id}">
			                <input id="comment-input" name="re_comment" placeholder="댓글을 입력해 주세요.">
			                <input type=submit value="등록">
			                </div>
		            	</form>
		            </div> 
		            <div id=comments>
		            <c:forEach var="reply" items="${reply}">
		            	<div id="comments${reply.help_reply_id}" class="comments" value="${reply.re_class}">
						    <input type="hidden" class="reply_id" value="${reply.help_reply_id}">
						    <input type="hidden" class="re_index" value="${reply.re_index}">
				            <p class="reply_user">${reply.nick}</p>
				            <p class="reply_comment">${reply.re_comment}</p>
				            <p class="reply_date">${reply.operator}</p>
				            <c:if test="${login.user_id==reply.user_user_id}">
				            <a href="helpyou_reply_delete?post_id=${reply.help_post_post_id}&reply_id=${reply.help_reply_id}"><input type="button" value="삭제"></a> 
				            <input type="button" id="reply_btn${reply.help_reply_id}" value="수정"> 
				            </c:if>
				            <input type="button" id="reply_again${reply.help_reply_id}" value="답글달기">
				            <form method="post" action="helpyou_re_recomment_submit" id="reply_recomment${reply.help_reply_id}" style="display:none;">
				            	<div>
				            	<input type="hidden" name="parent_id" value="${reply.help_reply_id}">
				            	<input type="hidden" name="re_index" value="${reply.re_index}">
				            	<input type="hidden" name="re_order" value="${reply.re_order}">
				            	<input type="hidden" name="re_class" value="${reply.re_class}">
				            	<input type="hidden" name="groupNum" value="${reply.groupNum}">
				            	<input type="hidden" name="re_post_id" value="${reply.help_post_post_id}">
			                	<input type=textarea name="re_re_comment">
			                	<input type=submit value="등록">
			                	</div>
			                </form>
		                </div>
		                <div id="reply_edit${reply.help_reply_id}" style="display:none;">
				            <form method="post" action="helpyou_reply_edit">
	               				<input type="hidden" name="post_id" value="${reply.help_post_post_id }">
	               				<input type="hidden" name="reply_id" value="${reply.help_reply_id }">
	               				<input id="comment-input" name="re_comment" value="${reply.re_comment }">
	               				<input type=button id="reply_edit_cancle${reply.help_reply_id }" value="취소">
	               				<input type=submit value="등록">
	         				</form>
       					</div>
					</c:forEach>
		            </div>
		
		            <div id="btn">
		            <c:if test="${login.user_id==read.user_user_id || login.user_id=='admin'}">
		                <input type="button" id="remove" value="삭제">
		                <a href="helpyou_write_edit?help_post_id=${read.help_post_id}"><input type="button" id="edit" value="수정"></a>
		            </c:if>
		                <a href="help_you"><input type="button" id="list" value="목록보기"></a>
		            </div>
		        </div>
        	</div>
       
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
/*
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    console.log("location: "+location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) ));
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
var ip='http://localhost:8080';
*/
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

.on('click','#remove',function(){
	var post_id=$('#pId').val();
	console.log(post_id);
	if(confirm('삭제하시겠습니까?')){
		window.location.href="<c:url value='helpyou_delete'/>?post_id="+post_id;
	}else{
		return false;
	}
})
.on('click','input[id^=reply_btn]',function(){
	var n=(this.id).substr(9);
	console.log("reply: "+n);
	console.log($('#reply_edit'+n).css("display"));
	if($('#reply_edit'+n).css("display")=="none"){
			$('#reply_edit'+n).show();
			$('#comments'+n).hide();
	}else{
		$('#reply_edit'+n).hide();
		$('#comments'+n).show();
	}
})

.on('click','#sub_btn',function(){
	var login_user_id=$('#login_user_id').val();
	console.log(login_user_id);
	   if(login_user_id==null || login_user_id==""){
			alert("로그인 해주세요");
			window.location.href="<c:url value='login'/>"
	   }else{
		   window.open("request_popup?nick="+$('#NICK').val()+
				   "&post_id="+$('#pId').val()+
				   "&user_id="+$('#user_user_id').val()
				   +"&title="+$('#title_table').val(),
				   "applyPop",'width=470, height=580, left=400, top=200, resizable=no');
	   }
})
.on('click','input[id^=reply_edit_cancle]',function(){
	var n=(this.id).substr(17); 
	console.log($('#comments'+n).css("display"));
	if($('#comments'+n).css("display")=="none"){
			$('#comments'+n).show();
			$('#reply_edit'+n).hide();
	}else{
		$('#comments'+n).hide();
		$('#reply_edit'+n).show();
	}
})
.on('click','input[id^=reply_again]',function(){
	var n=(this.id).substr(11); 
	console.log($('#reply_recomment'+n).css("display"));
	if($('#reply_recomment'+n).css("display")=="none"){
			$('#reply_recomment'+n).show();
	}else{
		$('#reply_recomment'+n).hide();
	}
})
/*
.ready(function(){
	console.log($('#pId').val());
	$.post(ip+getContextPath()+'/helpyou_reply_list',
			{"post_id":$('#pId').val()},
			function(data){
				console.log(data);
				$.each(data,function(ndx,value){
					console.log(value['re_comment']);
					var content='<div id=comments'+value['help_reply_id']+' style="margin-left:'+(value['re_class']*50)+'px">'+
								    '<input type="hidden" class="reply_id" value="'+value['help_reply_id']+'">'+
								    '<input type="hidden" class="re_index" value="'+value['re_index']+'">'+
						            '<p class="reply_user">'+value['user_user_id']+'</p>'+
						            '<p class="reply_comment">'+value['re_comment']+'</p>'+
						            '<p class="reply_date">'+value['operator']+'</p>'+
						            '${login.user_id}'+
						            '<a href="helpyou_reply_delete?post_id='+value['help_post_post_id']+'&reply_id='+value['help_reply_id']+'"><input type="button" value="삭제"></a> '+
						            '<input type="button" id="reply_btn'+value['help_reply_id']+'" value="수정"> '+
						            '<input type="button" id="reply_again'+value['help_reply_id']+'" value="답글달기">'+
						            '<form method="post" action="helpyou_re_recomment_submit" id="reply_recomment'+value['help_reply_id']+'" style="display:none;">'+
						            	'<div>'+
						            	'<input type="hidden" name="parent_id" value="'+value['help_reply_id']+'">'+
						            	'<input type="hidden" name="re_index" value="'+value['re_index']+'">'+
						            	'<input type="hidden" name="re_order" value="'+value['re_order']+'">'+
						            	'<input type="hidden" name="re_class" value="'+value['re_class']+'">'+
						            	'<input type="hidden" name="groupNum" value="'+value['groupNum']+'">'+
						            	'<input type="hidden" name="re_post_id" value="'+value['help_post_post_id']+'">'+
					                	'<input type=textarea name="re_re_comment">'+
					                	'<input type=submit value="등록">'+ 
					                	'</div>'+
					                '</form>'+
						                '<form method="post" action="helpyou_reply_edit" id="reply_edit'+value['help_reply_id']+'" style="display:none;">'+
		                				'<div id=cc>'+
		                				'<input type="hidden" name="post_id" value="'+value['help_post_post_id']+'">'+
		                				'<input type="hidden" name="reply_id" value="'+value['help_reply_id']+'">'+
		                				'<input id="comment-input" name="re_comment" value='+value['re_comment']+'>'+
		                				'<input type=button id="reply_edit_cancle'+value['help_reply_id']+'" value="취소">'+
		                				'<input type=submit value="등록">'+
		                				'</div>'+
            						'</form>'+
						        '</div>';
					console.log(content);
                	$('#comments').append(content); 
				})
		},'json')
})
*/

</script>
</html>