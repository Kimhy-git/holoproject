<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<style>
#current{
font-weight: bold;
color:#000;
}
section{
	height:900px;
}
</style>
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
                <a href="edit_mp">마이페이지</a>
            </div>
    </header>
    <section>
        <div id="wrap">
        <h2 onclick="location.href='/holo/mypage'">마이페이지</h2>
         
            <nav id="mine">
                <span><a href="mypage_myposts" >내가 쓴 글</a></span>
                &nbsp; &nbsp; 
                <span><a href="mypage_mycomments" >내가 쓴 댓글</a></span>
                &nbsp; &nbsp; 
                <span><a href="mypage_apply"  id="current">내가 지원한 게시글 목록</a></span>
                &nbsp; &nbsp; 
                <span><a href="edit_mp?user_id=${login.user_id}">내 정보 수정</a></span>
            </nav>
            
            <div class="clear"></div>
            <c:forEach var="item" items="${total_apply}">
            <div id="center">
          	<article>
				<div class="applier">
					<div class="info">
						<div class="title">
						<p id="apply_title">${item.title}</p>
						<input type="hidden" id="helpyou_id" value="${item.helpyou_id}">
						<input type="hidden" id="helpyou_id" value="${item.help_post_help_post_id}">
							<span class="date">${item.operator}</span>
						</div>
						<div class="nick">
							<span class="info02">
								<a href="#" class="info_nick">지원목록</a> | 
								<span class="info_gender">${item.gender}</span> | 
								♥ <span class="info_like">0</span>
							</span>
							<span class="ptag">
							${item.tag}
							</span>
						</div>
						<div class="intro">
							<p>${item.cv}</p>
						</div>
					</div>
					<div class="btns">
						<input class="btn" type="button" value="채팅하기"><br>
						<input class="btn last" type="button" value="취소하기">
					</div>
				</div>
			</c:forEach>
			</article>
	            </table>
				   <div id="paginationBox">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<a class="page-link" href="#" onClick="fn_prev
							('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
						</c:if>
			
						<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
							<c:out value="${pagination.page == idx ? '' : ''}"/><a class="page-link" href="#" onClick="fn_pagination
							('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
						</c:forEach>			
			
						<c:if test="${pagination.next}">
							<a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
							'${pagination.range}', '${pagination.rangeSize}')" >Next</a>
						</c:if>
					</ul>
				</div>
        	</div>
    </section>
    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script  src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/mypage";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
//페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/mypage";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/mypage";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
		console.log(url);
	}
</script>
<script>
$(document)
.on('click','#apply_title',function(){
	var helpyou_id=$('#helpyou_id').val();
	var post_id=$('#help_post_help_post_id').val();
	if(helpyou_id==null){
		var url = "http://localhost:8080/holo/helpme_write_view?help_post_id="+post_id;    
		$(location).attr('href',url);
	}else{
		var url = "http://localhost:8080/holo/helpyou_write_view?help_post_id="+post_id;    
		$(location).attr('href',url);
	}
})
</script>
</html>