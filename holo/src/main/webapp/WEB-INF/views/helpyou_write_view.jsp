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
<link rel="stylesheet" href="resources/css/helpyou_write_view.css">
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
    <section>
        <div id="wrap">
            <table id="first">
                <tr>
                    <td>제목</td>
                    <td>제목테스트</td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td>닉</td>
                </tr>
                <tr>
                    <td>작성날짜</td>
                    <td>2020.12.21 15:30</td>
                </tr>
                <tr>
                    <td>태그</td>
                    <td><div id="choice">
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
                        <select id="job">
                            <option value="벌레잡기">벌레잡기</option>
                            <option value="줄서주기">줄서주기</option>
                            <option value="대리전화">대리전화</option>
                            <option value="기타">기타</option>
                        </select>
                    </div></td>
                </tr>
                <tr>
                    <td>글내용</td>
                </tr>
            </table>
            <table id="second">
            	<tr>                
                    <td><textarea id="content" cols="130" rows="40" readonly></textarea></td>
                </tr>
            </table>
            <div id="form-commentInfo"> 
                <div id="comment-count">댓글 <span id="count">0</span></div> 
                <div id=cc><input id="comment-input" placeholder="댓글을 입력해 주세요." > 
                <button id="submit">등록</button> </div>
            </div> 
            <div id=comments> </div>

            <div id="btn">
                <input type="button" id="remove" value="삭제">
                <input type="button" id="edit" value="수정">
                <a href="helpyou_write"><input type="button" id="list" value="목록보기"></a>
            </div>
        </div>
    </section>
    <footer>
        <p>copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
</html>