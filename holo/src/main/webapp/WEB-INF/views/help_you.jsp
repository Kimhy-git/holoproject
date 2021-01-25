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
<link rel="stylesheet" href="resources/css/help_you.css">
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
                    <h2>도움주기</h2>
                    <form id="form1" method="post" action="help_you_search" >
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
					    <input type="submit" value="검색" id="scbtn">
	                    </div>
                    </form>
                    
                    <div class="write" id="writing">글쓰기</div>
                </div>
                <div id="category">
                     <a href="#" class="cate-active">전체</a>
                    <a href="#">벌레잡기</a>
                    <a href="#">쓰레기 분리수거</a>
                    <a href="#">음식물쓰레기 처리</a>
                    <a href="#">장봐주기</a>
                    <a href="#">이삿짐 도와주기</a>
                    <a href="#">가구 조립</a>
                    <a href="#">설거지</a>
                    <a href="#">변기 뚫기</a>
                    <a href="#">냉장고 정리</a>
                    <a href="#">모닝콜</a>
                    <a href="#">기타</a>
                </div>
                <div id="content">
					<input type="hidden" id="thisPage" value=1>
					<ul>
						<c:forEach items="${list}" var="list">
							<li>
                        	<div id="box" onclick="location.href='/holo/helpyou_write_view?help_post_id=${list.help_post_id}'">
	                        	<input type="hidden" value="${list.user_user_id}" name="user_id">
	                        	<input type="hidden" value="${list.help_post_id}">
	                            <img class="thumbnail" src="${list.img}">
	                            
	                            <c:if test="${list.complete==1}">
	                            	<span>[완료]</span>
	                            </c:if>
	                            <span class="address">[${list.tag_area}][${list.tag_job}]</span>
	                            <br>
	                            <div id="left"><p class="title" style="max-width: 210px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.title}</p>
	                            <span class="comments">(${list.replyCnt})</span></div>
                            </div>
	                        <form method="post" action="mp_popup" target="mp_popGo" id="mpGo${list.help_post_id}"> 
	  	                        <input type="hidden" value="${list.help_post_id}" name="help_post_id">
	                        	<input type=hidden value="${list.user_user_id}" name="user_id">
	                        	<input type=hidden value="${list.nick}" name="nick">   
	                            <p class="writer" id="mp_go${list.help_post_id}"
	                            style="max-width: 500px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
	                            ${list.nick} <span class="like"> ♥ ${list.likes}</span></p>
	                        </form>
                            <p class="price" style="max-width: 500px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">최소금액 : ${list.min_price}원</p>
                            <p class="date" style="max-width: 500px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.operator}</p>
                        </li> 
                		</c:forEach>
                    </ul>
                </div>
                <div class="clear"></div>
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
.ready(function(){

	var count = 0
	for (count; count<=$("#content ul li").length; count=count+3){
		$("#content ul li:eq("+count+")").css("margin-left","0");
		console.log(count)
	}
	
	$("#category > a").on("click", clickTagAction);
})

.on('click','#writing',function(){
	user_id=$('#user_id_login').val();
	console.log(user_id);
	if(user_id==null || user_id==""){
		alert("로그인이 필요한 서비스입니다.");
		window.location.href="<c:url value='login'/>"
	}else{
		window.location.href="<c:url value='helpyou_write'/>"
	}
})


.on('click','#mypage',function(){
	var user_id=$('#user_id_login').val();
	console.log(user_id);
	if(user_id==null || user_id==""){
		alert("로그인하세요");
		window.location.href="<c:url value='login'/>"
	}
})

.on('click','[id^=mp_go]',function(){
	console.log("mp_go click");
	var n=(this.id).substr(5);
	console.log("n: "+n);
	window.open("","mp_popGo",'width=500, height=600, left=400, top=200, resizable=no, scrollbar=no');
	$("#mpGo"+n).submit();
})


function clickTagAction(){
	var form = $("#form1 > div");
	var tagJob = $(this).text();
	console.log("tagJob : "+tagJob);
	$("#tagJob").remove();
	form.append("<input id='tabJob' name='tagJob' type='hidden' value='"+tagJob+"'/>");
	$("#form1")[0].submit();
}

</script>
<script>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/help_you";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
//페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/help_you";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/help_you";

		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
</html>