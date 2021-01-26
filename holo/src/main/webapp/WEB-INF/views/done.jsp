<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완료</title>
</head>
<style>
*{
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
}
h2{
	color:rgb(107, 156, 230);
	font-weight:700;
	font-size:25px;
}

#wrap{
	margin-top:70px;
	text-align: center;
}
p{
	font-size:17px;
	margin-top:30px;
	font-weight:400;
}
#btn{
	height:220px;
}
button{
	padding:5px 13px;
	cursor:pointer;
	border:1px solid #ccc;
	border-radius:5px;
	outline:none;
	background-color:#fff;
	box-shadow:3px 3px 4px rgba(0,0,0,0.1);
}
#long{
	height:20px;
}

</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<body>

<div id=wrap>
	<h2>완료</h2>
	<div id=long></div>
	<p>제출이 완료되었습니다.<br>
	좋은하루 보내세요:)</p> 
	<div id=btn></div>
	<button id=cancel>닫기</button>
</div>


</body>
<script  src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#cancel',function(){
	window.close();
})
</script>
</html>