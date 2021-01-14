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
                <a href="mypage">마이페이지</a>
            </div>
    </header>
    <section>
        <div id="wrap">
        <h2>마이페이지</h2>
         
            <nav id="mine">
            <ul class="tabs">
                <li class="tabMenu current">
                <a href="#tabContent01" >내가 쓴 글 |</a></li>
                <li class="tabMenu">
                <a href="#tabContent02" >내가 쓴 댓글 |</a></li>
            </ul>
            <div id="tossJsp" class="tossJsp">
                <a href="apply_you">지원자 목록</a> | 
                <a href="apply_me">지원 목록</a> |
                <a href="edit_mp">내 정보 수정</a>
            </div>
            </nav>
            <div  id="tabContent01" class="tabPage">
            <table id="my_list">
                <tr>
                    <td id="list_title" class="small_title" name="my_post">내가 쓴 글 목록</td>
                </tr>
	                <tr id="info">
	                    <td>제목</td>
	                    <td>작성자</td>
	                    <td>날짜</td>
	                    <td>조회수</td>
	                </tr>
	                <c:forEach var="item" items="${mylist}">
	                <tr>
	                
	                    <td><a href="freeboard_write_view?post_id=${item.post_id}">${item.title}</a></td>
	                    <td>${item.nick}</td>
	                    <td>${item.operator}</td>
	                    <td>${item.hit}</td>
	                    
	                    
	                    <td><input type="hidden" value="${item.post_id}"></td>
            			<td><input type="hidden" value="${item.board}"></td>
	                
	                </tr>
	                </c:forEach>
	            </table>
        </div>
                  <div id="tabContent02" class="tabPage">
            <table id="my_list1">
                <tr>
                    <td id="list_title" class="small_title" name="my_post">내가 쓴 댓글 목록</td>
                </tr>
	                <tr id="info">
	                    <td>댓글내용</td>
	                    <td>날짜</td>
	                </tr>
	                <c:forEach var="item" items="${myreply}">
	                <tr>
	                
	                    <td><a href="freeboard_write_view?post_id=${item.post_post_id}">${item.re_comment}</a></td>
	                    <td>${item.operator}</td>

	                </tr>
	                </c:forEach>
	            </table>
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
function tabSetting() {
	// 탭 컨텐츠 hide 후 현재 탭메뉴 페이지만 show
	$('.tabPage').hide();
	$($('.current').find('a').attr('href')).show();

	// Tab 메뉴 클릭 이벤트 생성
	$('li').click(function (event) {
		var tagName = event.target.tagName; // 현재 선택된 태그네임
		var selectedLiTag = (tagName.toString() == 'A') ? $(event.target).parent('li') : $(event.target); // A태그일 경우 상위 Li태그 선택, Li태그일 경우 그대로 태그 객체
		var currentLiTag = $('li[class~=current]'); // 현재 current 클래그를 가진 탭
		var isCurrent = false;  
		
		// 현재 클릭된 탭이 current를 가졌는지 확인
		isCurrent = $(selectedLiTag).hasClass('current');
		
		// current를 가지지 않았을 경우만 실행
		if (!isCurrent) {
			$($(currentLiTag).find('a').attr('href')).hide();
			$(currentLiTag).removeClass('current');

			$(selectedLiTag).addClass('current');
			$($(selectedLiTag).find('a').attr('href')).show();
		}

		return false;
	});
}

$(function () {
	// 탭 초기화 및 설정
	tabSetting();
});
</script>
</html>