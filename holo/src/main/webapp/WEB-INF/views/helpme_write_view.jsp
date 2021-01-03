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
<link rel="stylesheet" href="resources/css/helpme_write_view.css">
<body>
 <header>
        <nav>
           <a href="login" id=login>로그인</a>
            <a href="join" id="join">회원가입</a>
        </nav>
        <div id="logo">
            <a href="main"><img src="resources/img/logo1.png"></a>
        </div>
        <h2>도움받기</h2>
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
       <div id=write><a href="helpme_write">글쓰기</a></div>
    </header>
    <section>
    <form name=helpme_form method="post">
    	<input type=hidden id=pId value="${read.help_post_id}">
        <div id="wrap">
            <table id="first">
                <tr>
                    <td>제목</td>
                    
                    <td>${read.title}</td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td>${read.nick}</td>
                </tr>
                <tr>
                    <td>작성날짜</td>
                    <td>${read.operator}</td>
                </tr>
                <tr>
                    <td>태그</td>
                    <td>${read.tag_job}<td> 
                </tr>
            </table>
            <table id="second">
            	<tr>
            		<td>최소 금액</td>
            		<td>${read.min_price}</td>
            	</tr>
            	<tr>
            		<td>지원 가능 성별</td>
            		<td>${read.gender}</td>
            	</tr>
            	<tr>
            		<td>작성자 추천수</td>
            		<td>1</td>
            	</tr>
            	<tr>
            		<td>결제 방법</td>
            		<td>${read.payment}</td>
            	</tr>
            </table>
            <input type="button" id="sub_btn"  value="지원하기">
            <table id="third">
            	<tr>                
                    <td><textarea id="content" cols="130" rows="40" readonly>${read.content}</textarea></td>
                </tr>
            </table>
            
            <div id="form-commentInfo"> 
                <div id="comment-count">댓글 <span id="count">0</span></div> 
                <div id=cc><input id="comment-input" placeholder="댓글을 입력해 주세요." > 
                <button id="submit">등록</button> </div>
            </div> 
            <div id=comments> </div>

            <div id="btn">
                <a href="helpme_del?help_post_id=${read.help_post_id}"><input type="button" id="remove" value="삭제"></a>
                <a href="helpme_edit?help_post_id=${read.help_post_id}"><input type="button" id="edit" value="수정"></a>
                <a href="helpme_write"><input type="button" id="list" value="목록보기"></a>
            </div>            
        </div>
    </form>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#remove',function(){
	if(confirm('삭제하시겠습니까?')){	
	}else{
		return false;
	}
})
</script>
</html>