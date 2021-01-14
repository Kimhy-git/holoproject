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
					<input type="hidden" id="thisPage" value=1>
					<ul>
						<c:forEach items="${list}" var="list">
							<li>
								<input type=hidden id=help_post_id value=${list.help_post_id }>
								<input type="hidden" id=user_user_id value=${list.user_user_id }>
                        		<img class="thumbnail" src="${list.img }" onclick="location.href='/holo/helpyou_write_view?help_post_id=${list.help_post_id}'">
                    			<p class=title onclick="location.href='/holo/helpyou_write_view?help_post_id=${list.help_post_id}'"><span class="address">[${list.tag_area }]</span><span class="job">[${list.tag_job }]</span>${list.title}</p>
                    			<p>${list.nick }<span class="like"> ♥ ${list.likes }</span></p>
                    			<p class="price">최소금액 : ${list.min_price }원</p>
                    			<p>${list.operator}</p>
                			</li>
                		</c:forEach>
                    </ul>
                </div>
                <div class="clear"></div>
                
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
/*
        let currentPage = 1;
        const DATA_PER_PAGE = 9,
            lastPage = ${pagination.pageCnt}

        const msgLoading = document.getElementById("msg-loading")


        // 데이터 추가 함수
        function addData(currentPage) {
        	console.log("data add function");
			console.log("currenPage: "+currentPage);
			
			for (let i = (currentPage - 1) * DATA_PER_PAGE + 1; i <= currentPage * DATA_PER_PAGE; i++){
				$.post("${pageContext.request.contextPath}/helpyou_list",
	        			{"page":i,"range":${pagination.range}},
	        			function(data){
	        				console.log("post");
	        				console.log(data);
	        				$.each(data,function(ndx,value){
	        					console.log(value['img']);
	        					var content='<li>'+
	        						'<input type=hidden id=help_post_id value='+value['help_post_id']+'>'+
	        						'<input type="hidden" id=user_user_id value='+value['user_user_id']+'>'+
	        	        			'<img class="thumbnail" src="'+value['img']+'" onclick="location.href=\'/holo/helpyou_write_view?help_post_id='+value['help_post_id']+'\'">'+
	        	    				'<p class=title onclick="location.href=\'/holo/helpyou_write_view?help_post_id='+value['help_post_id']+'\'"><span class="address">['+value['tag_area']+']['+value['tag_job']+']</span>'+value['title']+'</p>'+
	        	    				'<p>'+value['nick']+'<span class="like"> ♥ '+value['likes']+'</span></p>'+
	        	    				'<p class="price">최소금액 : '+value['min_price']+'원</p>'+
	        	    				'<p>'+value['operator']+'</p>'+
	        						'</li>';
	        					$('#content ul').append(content);
	            				var count = 0;
	                        	console.log($("#content ul li").length);
	                        	for (count; count<=$("#content ul li").length; count=count+3){
	                        		$("#content ul li:eq("+count+")").css("margin-left","0");
	                        		console.log("count: "+count);
	                        	}
	         
	        				})
	        		},'json')	
			}
        	
        }	

        // IntersectionObserver 갱신 함수
        function observeLastChild(intersectionObserver) {

            const listChildren = document.querySelectorAll("#content ul li")
            listChildren.forEach(el => {
				console.log("observeLastChild currentPage: "+currentPage);
                if (!el.nextSibling && currentPage < lastPage) {
                    intersectionObserver.observe(el) // el에 대하여 관측 시작
                } else if (currentPage >= lastPage) {
                    intersectionObserver.disconnect()
                    msgLoading.textContent = "페이지의 끝입니다."
                }

            })
        }

        // IntersectionObeserver 부분
        const observerOption = {
            root: null,
            rootMargin: "0px 0px 0px 0px",
            threshold: 0.2
        }

        // IntersectionObserver 인스턴스 생성
        const io = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
				
                // entry.isIntersecting: 특정 요소가 뷰포트와 50%(threshold 0.5) 교차되었으면
                if (entry.isIntersecting) {
                	
                    msgLoading.classList.add("fade-in")
                    // 다음 데이터 가져오기: 자연스러운 연출을 위해 setTimeout 사용
                    setTimeout(() => {
                        addData(++currentPage)
                        observer.unobserve(entry.target)
                        observeLastChild(observer)
						console.log("IntersectionObserver currentPage: "+currentPage);
                        msgLoading.classList.remove("fade-in")
                    }, 1000)
                }
            })
        }, observerOption)


        // 초기 데이터 생성
        addData(currentPage)
        observeLastChild(io)
*/      
</script>
<script>
var count = 0;
console.log($("#content ul li").length);
for (count; count<=$("#content ul li").length; count=count+3){
	$("#content ul li:eq("+count+")").css("margin-left","0");
	console.log("count: "+count);
}
$(document)
.on('click','#writing',function(){
	user_id=$('#user_id_login').val();
	console.log(user_id);
	if(user_id==null || user_id==""){
		alert("로그인하세요");
		window.location.href="<c:url value='login'/>"
	}else{
		window.location.href="<c:url value='helpyou_write'/>"
	}
})

.scroll(function() {
    var maxHeight = $(document).height();
    var currentScroll = $(window).scrollTop() + $(window).height();
	var thisPage=$('#thisPage').val();
	var lastPage=${pagination.endPage};
	if (maxHeight <= currentScroll) {
    	console.log("scroll: "+thisPage+", "+lastPage);
    	if(thisPage<lastPage){
    		console.log("if this page");
    		thisPage=thisPage*1;
    		var postPage=thisPage+1;
    		console.log("postPage: "+postPage);
    		$.post("${pageContext.request.contextPath}/helpyou_list",
        			{"page":postPage,"range":${pagination.range}},
        			function(data){
        				console.log("post");
        				console.log(data);
        				$.each(data,function(ndx,value){
        					console.log(value['img']);
        					var content='<li>'+
        						'<input type=hidden id=help_post_id value='+value['help_post_id']+'>'+
        						'<input type="hidden" id=user_user_id value='+value['user_user_id']+'>'+
        	        			'<img class="thumbnail" src="'+value['img']+'" onclick="location.href=\'/holo/helpyou_write_view?help_post_id='+value['help_post_id']+'\'">'+
        	    				'<p class=title onclick="location.href=\'/holo/helpyou_write_view?help_post_id='+value['help_post_id']+'\'"><span class="address">['+value['tag_area']+']['+value['tag_job']+']</span>'+value['title']+'</p>'+
        	    				'<p>'+value['nick']+'<span class="like"> ♥ '+value['likes']+'</span></p>'+
        	    				'<p class="price">최소금액 : '+value['min_price']+'원</p>'+
        	    				'<p>'+value['operator']+'</p>'+
        						'</li>';
        					$('#content ul').append(content);
         
        				})
        				$('#thisPage').val(postPage);
        				console.log("thispage: "+$('#thisPage').val());
        				var count = 0;
                    	console.log($("#content ul li").length);
                    	for (count; count<=$("#content ul li").length; count=count+3){
                    		$("#content ul li:eq("+count+")").css("margin-left","0");
                    		console.log("count: "+count);
                    	}
        		},'json')
        	}	
    	}
    	
  });

</script>

</html>