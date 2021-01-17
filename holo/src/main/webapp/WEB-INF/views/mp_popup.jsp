<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<body>
<h3><span id="who">${nick}</span> 님의 마이페이지</h3>

<table>       
                <tr>
                    <td>닉네임</td>
                    <td>${mp_user.nick}</td>
                </tr>         
                <tr id="gender">
                    <td>성별</td>
                    <td class="readonly"><p id="genderC">${mp_user.gender}</p></td>
                </tr>
                <tr id="like">
                    <td>좋아요</td>
                    <td class="readonly">${mp_user.likes}</td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td id="readonly">${mp_user.birth}</td>
                </tr>
                <tr>
                	<td>성격 태그</td>
                	<td>
                		<input type=hidden value="${mp_user.tag}" id="tags">
                		${mp_user.tag}
					</td>
                </tr>
                <tr>
                	<td>자기소개</td>
                	<td><textarea id="cv" name="cv" placeholder="100자 이하로 입력해 주세요" >${mp_user.cv}</textarea></td>
                </tr>
                <tr>
                	<td>내가 쓴 글</td>
                	<td><ul><li>리스트</li></ul></td>
                </tr>
                <tr>
                	<td>내가 쓴 댓글</td>
                	<td><ul><li>리스트</li></ul></td>
                </tr>
                <tr>
                    <td id="btn">
                        <input type="button" id="cancel" value="취소"  onclick="history.back();">
                    </td>
                </tr>
            </table><br>
<body>

</body>
</html>