<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/notice";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
//페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/notice";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/notice";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/freeboard.css">
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
    <div id="center">
        <div id="wrap">
        	<div id="section_h">
	            <h2>공지사항</h2>
			        <form name="form1" method="post" action="notice_do">
				    <select name="search_option">
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
					    <input name="keyword" value="${map.keyword}">
					    <input type="submit" value="조회">
					</form>
		         	<c:if test="${login.nick!=admin}">
		        		<div class="write" id="writing">글쓰기</div>
		        	</c:if>
	        </div>
	        <div id=tablediv>
	            <table>
	                <tr id="info">
	                    <td>제목</td>
	                    <td>작성자</td>
	                    <td>날짜</td>
	                    <td>조회수</td>
	                </tr>
	                <c:forEach var="dto" items="${notice}">
	                <tr>
	                
	                    <td><a href="notice_write_view?post_id=${dto.post_id}">${dto.title} (${dto.replyCnt})</a></td>
	                    <td>${dto.nick}</td>
	                    <td>${dto.operator}</td>
	                	<td>${dto.hit}</td>
	                </tr>
	                </c:forEach>
	            </table>
	        </div>
	<!-- pagination{s} -->
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
	<!-- pagination{e} -->
        </div>
    </div>
    </section>
    <div class="clear"></div> 
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>  
    
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#writing',function(){
	var user_id=$('#user_id_login').val();
	console.log(user_id);
	if(user_id==null || user_id=="" || user_id!="admin"){
		alert("관리자 로그인 해주세요");
		window.location.href="<c:url value='notice'/>"
	}else{
		window.location.href="<c:url value='notice_write'/>"
	}
})

//mypage
.on('click','#mypage',function(){
	 var login_user_id=$('#login_user_id').val();
	   if(login_user_id==null || login_user_id==""){
			alert("로그인 해주세요");
			window.location.href="<c:url value='login'/>"
	   }
})
</script>
</html>