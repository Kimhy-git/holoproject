<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원하기</title>
</head>
<body>
	<p id="title">***님 글에 지원합니다.</p>
	<h2>지원 정보</h2>
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" readonly></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" id="gender" readonly></td>
		</tr>
		<tr>
			<td>신청일</td>
			<td><input type="text" id="date" readonly></td>
		</tr>
		<tr>
			<td>태그</td>
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
			<td>희망금액</td>
			<td><input type="text" id="price">원</td>
		</tr>
		<tr>
			<td>자기소개(100자 이내)</td>
			<td><textarea  placeholder="자기소개를 입력하세요 (100자이내)"></textarea></td>
		</tr>
	</table>
	<div id="btns">
		<input type="button" value="취소">
		<input type="button" value="제출">
	</div>
</body>
</html>