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
                <li>
                	<a href="mypage_mypage_myposts">내가 쓴 글</a>
                </li>
                <li class="tabMenu">
                	<a href="#tabContent02" >내가 쓴 댓글</a> 
                </li>
            	<li class="tabMenu">
                	<a href="#tabContent03">내가 지원/요청한 목록</a>
                </li>
            </ul>
            <div id="tossJsp" class="tossJsp">
				<form action="edit_mp" method="post" id="edit_page">
					<input type=hidden value="${login.user_id}" id="user_id_login" name="user_id">
                	<span id="edit_btn">내 정보 수정</span>
				</form>
            </div>
            </nav>
            <div class="clear"></div>
            
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
<script>
$(document)
.on('click','#edit_btn',function(){
	console.log("click");
	$('#edit_page').submit();
})
.on('click','input[id^=choosebtn]',function(){ //input[id가 choosebtn으로 시작하는 버튼]
    var n=(this.id).substr(9); 
    console.log("choose id: "+n);
    $.post("${pageContext.request.contextPath}/help_complete",
			{"post_id":39},
			function(data){
				console.log(data);
				alert(data);
			})


})
</script>
</html>