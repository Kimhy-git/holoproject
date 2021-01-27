<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- <link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&display=swap" rel="stylesheet"> -->
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/admin.css">
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
	            <h2>관리자</h2>
	             <form method="post" action="admin_search">
			        <div id="search" >
			            <select name="search_option" id=area>
				            <option value="all"
				            <c:if test="${map.search_option == 'all'}">selected</c:if>
							>전체</option>
							<option value="user_id"
							<c:if test="${map.search_option == 'user_id'}">selected</c:if>
							>회원ID</option>
							<option value="nick"
							<c:if test="${map.search_option == 'nick'}">selected</c:if>
							>닉네임</option>
			            </select>
			            <input name="keyword" value="${map.keyword}" placeholder="키워드를 입력하세요" id="search_txt">
			            <input type="submit" id="scbtn" value="검색">
			        </div>
			     </form>   
	        </div>
	        <div id=tablediv>
	            <table>
	                <tr id="info">
	                    <th>ID</th>
	                    <th>Nick</th>
	                    <th>추천수</th>
	                    <th>가입날짜</th>
	                    <th>탈퇴</th>
	                </tr>
	                <c:forEach var="list" items="${user_list}">
		                <tr>
		                    <td><a href="#">${list.user_id}</a></td>
		                    <td>${list.nick}</td>
		                    <td>${list.likes}</td>
		                    <td>${list.operator}</td>
		                    <td align=center><form action="admin_leave" method="post">
		                    	<input type="hidden" value="${list.user_id}" name="user_id">
		                    	<input type="submit" id="bye" value="탈퇴">
		                    </form></td>
		                </tr>
	                </c:forEach>
	            </table>
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
.on('click','#bye',function(){
	if(confirm("정말 탈퇴시키겠습니까?")){
		
	}else{
		return false;
	}
})
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/admin_search";

		url = url + "?page=" + page;
		url = url + "&range=" + range;		
		url = url + "&keyword=" + '${map.keyword}';
		url = url + "&search_option=" + '${map.search_option}';

		location.href = url;
	}
//페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/admin_search";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&keyword=" + '${map.keyword}';
		url = url + "&search_option=" + '${map.search_option}';
		
		location.href = url;	
	}

	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/admin_search";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&keyword=" + '${map.keyword}';
		url = url + "&search_option=" + '${map.search_option}';
		
		location.href = url;
	}
</script>
</html>