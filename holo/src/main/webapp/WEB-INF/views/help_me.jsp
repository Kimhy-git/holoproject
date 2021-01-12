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
<link rel="stylesheet" href="resources/css/help_me.css">
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
    </header>
    <div class="clear"></div>
    <section>
        <div id="center">
            <div id="wrap">
                <div id="section_h">
                    <h2>도움 받기</h2>
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
                    
                    <div class="write" id="writing">글쓰기</div>
                </div>
                <div id="category">
                    <a href="#">전체</a>
                    <a href="#">벌레잡기</a>
                    <a href="#">줄서주기</a>
                    <a href="#">대리전화</a>
                    <a href="#">기타</a>
                </div>
                <div id="content">
                    <ul>
                    <c:forEach var="list" items="${list}">
                    
                        <li onclick="location.href='/holo/helpme_write_view?help_post_id=${list.help_post_id}'">
                        	<input type="hidden" value="${list.user_user_id}" name="user_id">
                        	<input type="hidden" value="${list.help_post_id}">
                            <img class="thumbnail" src="resources/img/test1.jpg">
                            <p class="title" style="max-width: 500px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><span class="address">[${list.tag_area}][${list.tag_job}]</span> ${list.title}
                            <!--<span class="hit">${list.hit}</span> --></p>
                            <p class="writer" style="max-width: 500px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.nick} <span class="like"> ♥ ${list.likes}</span>
                            <p class="price" style="max-width: 500px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">최소금액 : ${list.min_price}원</p>
                            <p class="date" style="max-width: 500px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.operator}</p>
                        </li> 
                    
                    </c:forEach>                
                    </ul>
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
.ready(function(){

	var count = 0
	for (count; count<=$("#content ul li").length; count=count+3){
		$("#content ul li:eq("+count+")").css("margin-left","0");
		console.log(count)
	}
})

.on('click','#writing',function(){
	user_id=$('#user_id_login').val();
	console.log(user_id);
	if(user_id==null || user_id==""){
		alert("로그인하세요");
		window.location.href="<c:url value='login'/>"
	}else{
		window.location.href="<c:url value='helpme_write'/>"
	}
})
</script>
</html>