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
<link rel="stylesheet" href="resources/css/helpme_write.css">
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
        <!-- <h2>도움받기 글 작성</h2> -->
        <div id="wrap">
        
        <!-- <span>제목</span> -->
            <h3>도움받기</h3>
            <form method='post' action='helpme_write_go' name="write_go">
            
            <div id="choice">
                <!-- <span>태그</span>  -->
                <select id="area" name="tag_area">
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
                <select id="job" name="tag_job">
                    <option value="벌레잡기">벌레잡기</option>
                    <option value="줄서주기">줄서주기</option>
                    <option value="대리전화">대리전화</option>
                    <option value="기타">기타</option>
                </select>
                <input type="text" id="title" name="title" class="input-title" placeholder="제목을 입력하세요.">
                <div id="gender">지원자 성별 <input type="checkbox" name="gender" id="female" value='f'>여 <input type="checkbox" id="male" name="gender" value='f'>남</div>
                <div id="payment" >결제 방법 
                <input type="checkbox" value="현금" name="payment" id="cash">현금 
                <input type="checkbox" value="계좌이체" name="payment" id="account">계좌이체</div>
            	<div><input type="text" id="min" name="min_price" size=9 placeholder="최소(보장) 금액">원</div>
            </div>
            <div id="content">
                <!-- <p>글내용</p>  -->
                <textarea id="txtarea" name="content" cols="60" rows="40" placeholder="내용을 입력하세요."></textarea>
            </div>
            <div id="img_up">
                <span>이미지첨부 </span><input type="file" id="file_up">
            </div>
            <div id="btn">
                <a href="help_me"><input type="button" id="cancel" value="취소"></a>
                <input type="submit" id="submit" value="등록" >
            </div>
        </form>   
        </div>
        
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>

$(document)
.on('click','#submit',function(){
	console.log($.isNumeric($('#min').val()));
	//console.log($('#min').isNumeric());
	if($('#title').val()==""){
		alert("제목을 입력하세요.");
		return false;
	}if($('#female').is(':checked')==false && $('#male').is(':checked')==false){
		alert("지원자 희망 성별을 선택하세요.");
		return false;
	}if($('#cash').is(':checked')==false && $('#account').is(':checked')==false){
		alert("결제 방법을 선택하세요.");
		return false;
	}if($('#job').val()==''){
		alert("도움받을 종류를 선택하세요.");
		return false;
	}if($('#min').val()==''){
		alert("최소(보장)금액을 입력하세요.");
		return false;
	}if($.isNumeric($('#min').val())==false){
		alert("최소(보장)금액은 숫자만 입력할 수 있습니다.");
		return false;	
	}if($('#txtarea').val()==''){
		alert("내용을 입력하세요.");
		return false;
	}
	else{
		
	}
	
	
})
</script>
</html>