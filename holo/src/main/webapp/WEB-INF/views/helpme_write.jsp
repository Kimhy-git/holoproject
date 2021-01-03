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
            <form method='post' action='helpme_write_go'>
            <input type="text" id="title" name="title" class="input-title" placeholder="제목을 입력하세요.">
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
                
                <div id="gender">지원자 성별 <input type="checkbox" name="gender" value='f'>여 <input type="checkbox" name="gender" value='f'>남</div>
                <div>최소 금액 <input type="number" name="min_price">원</div>
                <div id="payment" >결제 방법 <input type="checkbox" value="현금" name="payment">현금 <input type="checkbox" value="계좌이체" name="payment">계좌이체</div>
            </div>
            <div id="content">
                <!-- <p>글내용</p>  -->
                <textarea id="txtarea" name="content" cols="60" rows="40" placeholder="내용을 입력하세요."></textarea>
            </div>
            <div id="img_up">
                <span>이미지첨부 </span><input type="file" id="file_up">
            </div>
            <div id="btn">
                <input type="button" id="cancel" value="취소">
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
</html>