<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight:300;
	margin:0 auto;
	text-align:center;
}

td{
	text-align:left;
}
.bold{
	font-weight:500;
}
#info{
	font-weight:500;
	color:#999;
	margin-bottom:10px;
	font-size: 18px;
	padding-bottom:15px;
}
h3{
	font-size:23px;
	font-weight:500;
	margin:35px 0 20px 0;
}
#max{
	font-size:12px;
	color:#aaa;
}
#txt{
	border:1px solid #ddd;	
	border-radius:5px;
	background-color:rgb(245, 232, 255);
	width:300px;
	text-align:left; font-size:15px;
	outline:none;
}
#who{
	color: #9660b6;
	font-weight:700;

}
#submit, #cancel{
	border:1px solid #ccc;	
	border-radius:30px;
	padding:10px 30px;
	font-size:17px;
	font-weight:500;
	color:#777;

}
#submit{
	background-color: rgb(175, 107, 230);
	color:white;
	margin-left:50px;
	border:1px solid #fff;
}
div{
	width:350px;
	margin:0 auto;
}
</style>
<head>
<meta charset="UTF-8">
<title>지원하기</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<body>
<h3>'<span id="who">청소박사</span>' 님의 도움을 요청합니다.</h3>

<form method="post" action="request_go">
	<div>
		<table>
			
			<tr>
				<td id="info" colspan=2>지원 정보</td>
				
			</tr>
			<tr>
				<td class="bold">이름 </td>
				<td>요청자 이름</td>
				<td></td><td></td>
			</tr>
			<tr>
				<td class="bold">성별</td>
				<td>요청자 성별</td>
			</tr>
			<tr>
				<td class="bold">요청일</td>
				<td>2021-01-11 14:37</td>
				<td></td><td></td>
			</tr>
			<tr>
				<td class="bold">성격태그</td>
				<td>요청자 성격</td>
				<td></td><td></td>
			</tr>
			<tr>
				<td class="bold">희망금액</td>
				<td><span id="hope">희망금액</span> 원</td>
				
			</tr>
			<tr>
				<td class="bold">자기소개</td>
				<td id="max">100자 이내로 입력하세요.</td>
				
			</tr>	
			<tr>
				<td colspan=12>
					<textarea placeholder="100자 이내로 입력하세요." id="txt"
					rows="8" cols="30" style="resize: none">기본값으로 자기가 적은 자기소개가 뜹니다. 수정 가능 합니다.</textarea>
				</td>
				
			</tr>
			<tr>
				<td colspan=12><input type=submit id="submit" value="제출">
				<input type=button id="cancel" value="취소"></td>
			</tr>
		</table>
	</div>	
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#submit',function(){
	if(confirm('제출 하시겠습니까?')){	
		alert("제출 되었습니다.")
		window.close();
	}else{
		return false;
	}
})
.on('click','#cancel',function(){
	window.close();
})
</script>
</html>