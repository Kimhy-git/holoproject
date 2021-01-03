<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/join.css">
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
    <section>
    	
        <div id="wrap">
        <h2>회원가입</h2>
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" id="id"></td>
                    <td><input type="button" id="overlap" value="중복확인"></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td><input type="radio" id="female">여자 
                    <input type="radio" id="male">남자</td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" id="nick"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" id="passcode1"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" id="passcode2"></td>
                </tr>
                <tr>
                    <td>비밀번호 질문</td>
                    <td>
                        <select id="choice">
                        	<option id="q0">질문을 선택해 주세요</option>
                            <option id="q1">처음 키운 강아지 이름은?</option>
                            <option id="q2">아버지 이름은?</option>
                            <option id="q3">출신 초등학교 이름은?</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 질문 답변</td>
                    <td><input type="text" id="answer"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" id="email"></td>
                </tr>
                <tr>
                    <td>모바일번호</td>
                    <td><input type="tel" id="mobile"></td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td><input type="date"></td>
                </tr>
                <tr>
                	<td>성격 태그</td>
                	<td><select id="ptag">
						<option>성실해요</option>
						<option>친절해요</option>
						<option>책임감</option>
						<option>적극적</option>
						<option>세심해요</option>
						<option>지각안해요</option>
						<option>정리정돈</option>
						<option>체력좋아요</option>
					</select></td>
                </tr>
                <tr>
                	<td>자기소개</td>
                	<td><textarea></textarea></td>
                </tr>
                <tr>
                	<td>주소</td>
                	<td>어케하지</td>
                </tr>
                
                <tr>
                    <td colspan="3" id="btn">
                        <input type="button" id="cancel" value="취소">
                        <input type="button" id="empty" value="비우기">
                        <input type="button" id="submit" value="확인">
                    </td>
                </tr>
            </table>
        </div>
    </section>
    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
</html>