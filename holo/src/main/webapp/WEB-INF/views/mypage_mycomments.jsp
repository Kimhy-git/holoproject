<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
#current{
font-weight: bold;
color:#000;
}
</style>
<meta charset="UTF-8">
<title>마이페이지</title>

</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/mypage_mycomments.css">
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
    <section>
        <div id="wrap">
        <h2 onclick="location.href='/holo/mypage'">마이페이지</h2>
            <nav id="mine">
                <span><a href="mypage_myposts" >내가 쓴 글</a></span>
                &nbsp; &nbsp; 
                <span><a href="mypage_mycomments" id="current">내가 쓴 댓글</a></span>
                &nbsp; &nbsp; 
                <span><a href="mypage_apply">내가 지원한 게시글 목록</a></span>
                &nbsp; &nbsp; 
                <span><a href="edit_mp?user_id=${login.user_id}">내 정보 수정</a></span>
            </nav>
            
            <div class="clear"></div>
            <div id="center">
        	<div id="tabContent02" class="tabPage">
	            <table id="my_list1">
	                <tr id="info">
	                    <td>댓글내용</td>
	                    <td>날짜</td>
	                    <td>게시판</td>
	                </tr>
	                <c:forEach var="item2" items="${total_reply}">
	                <tr>
	                
	                    <td>${item2.re_comment}</td>
	                    <td>${item2.operator}</td>

	                	<td>
	                	<c:if test="${item2.board==0}">
	                		help_you(도움주기)
	                	</c:if>
	                	<c:if test="${item2.board==1}">
	                		help_me(도움받기)
	                	</c:if>
	                	<c:if test="${item2.board==2}">
	                		자유게시판
	                	</c:if>
	                	<c:if test="${item2.board==3}">
	                		공지사항
	                	</c:if>
	                	</td>
	                </tr>
	                </c:forEach>
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
$(document)
.on('click','#chat_room',function(){
	var user_id='${login.user_id}';
	window.open("chat_room?user_id="+user_id,"ChatRoom",'width=490, height=685, left=400, top=200, resizable=no, scrollbar=no');
})

</script>
<script>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/mypage_mycomments";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
//페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/mypage_mycomments";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/mypage_mycomments";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
		//console.log(url);
	}
</script>
</html>