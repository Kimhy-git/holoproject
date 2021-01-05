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
            <a href="login" id=login>로그인</a>
            <a href="join" id="join">회원가입</a>
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
                <div id="category">
                    <a href="#">전체</a>
                    <a href="#">벌레잡기</a>
                    <a href="#">줄서주기</a>
                    <a href="#">대리전화</a>
                    <a href="#">기타</a>
                </div>
                <div id="content">
					<ul>
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

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
var ip='http://localhost:8080';
function read(id){
	console.log("read");
	$.post(ip+getContextPath()+'/helpyou_read',
		{post_id:id},
		function(){
	})
}
$(document)
.ready(function(){
	console.log("test");
	$.post(ip+getContextPath()+'/helpyou_list',
			{},
			function(data){
				console.log("post");
				console.log(data);
				$.each(data,function(ndx,value){
					console.log(value['title']);
					var content='<li>'+
									'<input type=hidden id=help_post_id value='+value['help_post_id']+'>'+
									'<input type="hidden" id=user_user_id value='+value['user_user_id']+'>'+
                        			'<img class="thumbnail" src="resources/img/test1.jpg" onclick="location.href=\'holo/helpyou_write_view?help_post_id='+value['help_post_id']+'\'">'+
                    				'<p class=title onclick="location.href=\'/holo/helpyou_write_view?help_post_id='+value['help_post_id']+'\'"><span class="address">['+value['tag_area']+']['+value['tag_job']+']</span>'+value['title']+'</p>'+
                    				'<p>'+value['nick']+'<span class="like"> ♥ 5</span></p>'+
                    				'<p class="price">최소금액 : '+value['min_price']+'원</p>'+
                    				'<p>'+value['operator']+'</p>'+
                				'</li>';

                	$('#content ul').append(content);
 
				})
				var count = 0;
            	console.log($("#content ul li").length);
            	for (count; count<=$("#content ul li").length; count=count+3){
            		$("#content ul li:eq("+count+")").css("margin-left","0");
            		console.log("count: "+count);
            	}
		},'json')


})
/* .on('click','.thumbnail',function(){
	console.log("thumbnail");
	var id=$('#help_post_id').val();
	console.log(id);
	read(id);
})
.on('click','.title',function(){
	var id=$('#help_post_id').val();
	read(id);
}) */

</script>

</html>