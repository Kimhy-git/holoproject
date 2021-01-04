<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <ul id="content_ul">
                        <li>
                            <img class="thumbnail" src="resources/img/test1.jpg">
                            <p>[지역]글제목</p>
                            <p>작성자</p>
                            <p>2020.12.21 13:15</p>
                        </li>
                        <li>
                            <img class="thumbnail" src="resources/img/test2.jpg">
                            <p>[지역]글제목</p>
                            <p>작성자</p>
                            <p>2020.12.21 13:15</p>
                        </li>
                        <li>
                            <img class="thumbnail" src="resources/img/test3.jpg">
                            <p>[지역]글제목</p>
                            <p>작성자</p>
                            <p>2020.12.21 13:15</p>
                        </li>
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
	console.log(ip+getContextPath()+'/helpyou_list');
	$.post(ip+getContextPath()+'/helpyou_list',
			{},
			function(data){
				console.log("post");
				console.log(data);
				$.each(data,function(ndx,value){
					console.log(value['title']);
					var content='<li onclick="location.href=\'/holo/helpyou_write_view?help_post_id='+value['help_post_id']+'\'">'+
									'<input type=hidden id=help_post_id value='+value['help_post_id']+'>'+
                        			'<img class="thumbnail" src="resources/img/test1.jpg">'+
                    				'<p class=title>[지역]'+value['title']+'</p>'+
                    				'<p>'+value['nick']+'</p>'+
                    				'<p>'+value['operator']+'</p>'+
                				'</li>';
                	$('#content_ul').append(content);
				})
		},'json')
	var count = 0
	for (count; count<=$("#content ul li").length; count=count+3){
		$("#content ul li:eq("+count+")").css("margin-left","0");
		console.log(count)
	}
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