<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <input type=hidden value="${login.user_id}" id="user_id_login">
	        <c:if test="${login.nick==null}">
	            <a href="login" id=login>로그인</a>
	            <a href="join" id="join">회원가입</a>
	        </c:if>
	        <c:if test="${login.nick!=null}">
	        	<a href="logout" id=login>로그아웃</a>
	        	<a href="mypage" id="mypage">마이페이지</a>
			<a href="#" id="chat_room">채팅</a>
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
            <a href="notice">공지사항</a>
        </div>
    </header>
    <section>
    	
        <div id="wrap">
        <form method="post" action="join_submit" id="join_form">
        <h2>회원가입</h2>
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" id="id" name="user_id">
                    </td>
                </tr>
                <tr><td></td><td colspan=3><span id="id_check" class="w3-text-red"></span><td></tr>
                <tr>
                    <td>성별</td>
                    <td><input type="radio" id="female" name="gender" value="f">여자 
                    <input type="radio" id="male" name="gender" value="m">남자</td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" id="nick" name="nick"></td>
                </tr>
                <tr><td></td><td colspan=3><span id="nick_check" class="w3-text-red"></span><td></tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" id="passcode1" name="passcode"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" id="passcode2"></td>
                </tr>
                <tr><td></td><td colspan=3><span id="pw_check" class="w3-text-red"></span><td></tr>
                <tr>
                    <td>비밀번호 질문</td>
                    <td>
                        <select id="choice" name="passwd_q">
                            <option id="q0">질문을 선택해 주세요</option>
                            <option id="q1" value="처음 키운 강아지 이름은?">처음 키운 강아지 이름은?</option>
                            <option id="q2" value="아버지 이름은?">아버지 이름은?</option>
                            <option id="q3" value="출신 초등학교 이름은?">출신 초등학교 이름은?</option>
                            <option id="q4" value="나의 보물 1호는?">나의 보물 1호는?</option>
                            <option id="q5" value="가장 친한 친구 이름은?">가장 친한 친구 이름은?</option>
                            <option id="q6" value="내가 살고싶은 나라는?">내가 살고싶은 나라는?</option>
                            <option id="q7" value="내가 다닌 중학교가 위치한 지역은?">내가 다닌 중학교가 위치한 지역은?</option>
                            <option id="q8" value="가장 즐겨했던 게임은?">가장 즐겨했던 게임은?</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 질문 답변</td>
                    <td><input type="text" id="answer" name="passwd_a"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" id="email" name="email"></td>
                </tr>
                <tr><td></td><td colspan=3><span id="email_check" class="w3-text-red"></span><td></tr>
                <tr>
                    <td>모바일번호</td>
                    <td><input type="tel" id="mobile" name="mobile"></td>
                </tr>
                <tr><td></td><td colspan=3><span id="mobile_check" class="w3-text-red"></span><td></tr>
                <tr>
                    <td>생년월일</td>
                    <td><input type="date" id="birth" name="birth"></td>
                </tr>
                <tr>
                	<td>성격 태그</td>
                	<td>
						<label for="c1"><input type="checkbox" value="성실해요" name="ptag" id="c1">성실해요</label> 
						<label for="c2"><input type="checkbox" value="친절해요" name="ptag" id="c2"> 친절해요</label> 
						<label for="c3"><input type="checkbox" value="책임감" name="ptag" id="c3"> 책임감</label>  
						<label for="c4"><input type="checkbox" value="적극적" name="ptag" id="c4"> 적극적</label><br>  
						<label for="c5"><input type="checkbox" value="세심해요" name="ptag" id="c5"> 세심해요</label>  
						<label for="c6"><input type="checkbox" value="지각안해요" name="ptag" id="c6"> 지각안해요</label>  
						<label for="c7"><input type="checkbox" value="정리정돈" name="ptag" id="c7"> 정리정돈</label>  
						<label for="c8"><input type="checkbox" value="체력좋아요" name="ptag" id="c8"> 체력좋아요</label>  
					</td>
                </tr>
                <tr>
                	<td>자기소개</td>
                	<td><textarea id="cv" name="cv" placeholder="100자 이하로 입력해 주세요"></textarea></td>
                </tr>
                <tr>
                	<td>주소</td>
                	<td>
						<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address01">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<br>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address02">
					</td>
                </tr>
                
                <tr>
                    <td colspan="3" id="btn">
                        <input type="button" id="cancel" value="취소">
                        <input type="reset" id="empty" value="비우기">
                        <input type="submit" id="submit" value="확인">
                    </td>
                </tr>
            </table>
        </form>
        </div>
    </section>
    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document)
.ready(function(){
	var engNum = /^[a-zA-Z0-9]*$/;
	var email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 

})
.on('click','#overlap',function(){
	alert($("#id").val().length+","+$('#birth').val());
})
.on('keyup','#id',function(){
	var engNum = /^[a-zA-Z0-9]*$/;
	$.ajax({
		url : "check_id_go",
		type : "POST",
		data : {
		id : $("#id").val()
		},
		success : function(result) {
			if ($("#id").val().length<5 ){
				$("#id_check").css("color","rgb(223, 64, 43)")
				$("#id_check").html("아이디는 5~20자 사이로 입력해 주세요.")
				//$("#submit").attr("disabled", "disabled");
			}else if($("#id").val().length>21){
				$("#id_check").css("color","rgb(223, 64, 43)")
				$("#id_check").html("아이디가 20자를 초과하였습니다.")
				//$("#submit").attr("disabled", "disabled");
			}else if (result == 1) {
				$("#id_check").css("color","rgb(223, 64, 43)")
				$("#id_check").html("중복된 아이디가 있습니다.");
				//$("#submit").attr("disabled", "disabled"); //중복된 아이디가 있으면 전송하지 못하게 하는 것 같음..
			}else {
				$("#id_check").css("color","rgb(22, 97, 182)")
				$("#id_check").html("사용가능한 아이디 입니다.");
				//$("#submit").removeAttr("disabled"); 
			}
			
			if(!engNum.test($("#id").val())){
				$("#id_check").css("color","rgb(223, 64, 43)")
				$("#id_check").html("아이디는 영어와 숫자로만 입력해 주세요.")
				
			}
		},
	})
})
.on('keyup','#email',function(){
		var email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		$.ajax({
				url : "check_email_go",
				type : "POST",
				data : {
				email : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").css("color","rgb(223, 64, 43)")
						$("#email_check").html("중복된 이메일이 있습니다.");
						//$("#submit").attr("disabled", "disabled");
					} else {
						$("#email_check").css("color","rgb(22, 97, 182)")
						$("#email_check").html("사용 가능한 이메일 입니다.");
						//$("#submit").removeAttr("disabled");
					}
					
					if (!email.test($("#email").val())){
						$("#email_check").css("color","rgb(223, 64, 43)")
						$("#email_check").html("잘못된 이메일 형식입니다.");
						//$("#submit").attr("disabled", "disabled");
					}
				},
			})
			
})
.on('keyup','#nick',function(){
		var email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		$.ajax({
				url : "check_nick_go",
				type : "POST",
				data : {
				nick : $("#nick").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#nick_check").css("color","rgb(223, 64, 43)")
						$("#nick_check").html("중복된 닉네임이 있습니다.");
						//$("#submit").attr("disabled", "disabled");
					} else if($("#nick").val().length<2){
						$("#nick_check").css("color","rgb(223, 64, 43)")
						$("#nick_check").html("닉네임은 2-20자 사이로 입력해 주세요.");
						return false;
					}else if($("#nick").val().length>20){
						$("#nick_check").css("color","rgb(223, 64, 43)")
						$("#nick_check").html("닉네임이 20자를 초과하였습니다.");
						return false;
					}else {
						$("#nick_check").css("color","rgb(22, 97, 182)")
						$("#nick_check").html("사용 가능한 닉네임 입니다.");
						//$("#submit").removeAttr("disabled");
					}
					
				},
			})
			
})
.on('keyup','#mobile',function(){
	var phone = /^01[0179][0-9]{7,8}$/;
	if(!phone.test($('#mobile').val())){
		$("#mobile_check").css("color","rgb(223, 64, 43)")
		$("#mobile_check").html("잘못된 모바일 번호 형식입니다.");
	}else{
		$("#mobile_check").html("");
	}
})		

.on('keyup','#passcode1',function(){
	if ($("#passcode1").val().length < 6) { 
		$("#pw_check").css("color","rgb(223, 64, 43)")
		$("#pw_check").html("비밀번호는 6-30자 사이로 입력해야 합니다.");

	}else if($("#passcode1").val().length > 30){
		$("#pw_check").css("color","rgb(223, 64, 43)")
		$("#pw_check").html("비밀번호가 30자를 초과하였습니다.");

	}else{
		$("#pw_check").html("");
	}
})
.on('keyup','#passcode2',function(){

	//console.log($("#passcode1"))
	if($("#passcode1").val() !== $("#passcode2").val()){
		$("#pw_check").css("color","rgb(223, 64, 43)")
		$("#pw_check").html("비밀번호가 다릅니다.");
		//$("#passcode1").val("").focus();
		//$("#pwsscode2").val("");
		return false;
	}else {
		$("#pw_check").css("color","rgb(22, 97, 182)")
		$("#pw_check").html("비밀번호가 일치합니다.");
	}
})
.on('click','input:checkbox[name=ptag]',function(){
	//console.log($("input:checkbox[name='ptag']:checked").length)
	if($("input:checkbox[name='ptag']:checked").length>3){
		alert("3개까지 선택할 수 있습니다.");
		return false;
	};
})
.on('keyup','#cv',function(){
	
	if($("#cv").val().length>100){
		alert("자기소개는 100자 이하로 입력해 주세요");
		return false;
	}
})

.on('click','#submit',function(){
	var maxChecked = 3;   //선택가능한 체크박스 갯수
	var totalChecked = 0;
	
	//console.log($("input:checkbox[name='ptag']").is(':checked'))
	//console.log($("#nick").val().length)
	if($("#id_check").html()!="사용가능한 아이디 입니다."){
		alert("아이디를 확인해 주세요")
		$("#id").focus();
		return false;
	}else if($("#female").is(':checked')==false && $("#male").is(':checked')==false){
		alert("성별을 선택해 주세요.")
		return false;
	}else if($("#nick").val()==""){
		alert("닉네임을 입력해 주세요.")
		$("#nick").focus();
		return false;
	}else if($("#nick_check").html()!="사용 가능한 닉네임 입니다."){
			alert("닉네임을 확인해 주세요.")
			$("#nick").focus();
			return false;
	}else if($("#pw_check").html()!="비밀번호가 일치합니다." ||
			 $("#pass2").val()==""){
		alert("비밀번호를 확인해 주세요");
		$("#passcode1").focus();
		return false;
	}else if($("#choice").val()=="질문을 선택해 주세요"){
		alert("비밀번호 질문을 선택해 주세요");
		$("#choice").focus();
		return false;
	}else if($("#answer").val()==""){
		alert("비밀번호 질문 답변을 작성해 주세요");
		$("#answer").focus();
		return false;
	}else if($("#email_check").html()!="사용 가능한 이메일 입니다."){
		alert("이메일을 확인해 주세요");
		$("#email").focus();
		return false;
	}else if($("#mobile").val()==""){
		alert("모바일 번호를 입력해 주세요");
		$("#mobile").focus();
		return false;
	}else if($("#mobile_check").html()=="잘못된 모바일 번호 형식입니다."){
		alert("모바일 번호을 확인해 주세요")
		$("#mobile").focus();
		return false;
	}else if($("#birth").val()==""){
		alert("생년월일을 입력해 주세요")
		$("#birth").focus();
		return false;
	}else if($("#birth").val()==""){
		alert("생년월일을 입력해 주세요")
		$("#birth").focus();
		return false;
	}else if($("input:checkbox[name='ptag']").is(':checked')==false){
		alert("성격 태그를 선택해 주세요")
		return false;
	}else if($("#cv").val().length>100){
		alert("자기소개가 100자를 초과합니다.");
		
		return false;
	}else if($("#sample4_postcode").val()==""||
			$("#sample4_roadAddress").val()==""){
		alert("주소를 입력해 주세요");
		
		return false;
	}else{
		alert("회원가입이 완료되었습니다.");
	}
})	
.on('click','#cancel',function(){
	window.history.back();
})


</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
        
    }
</script>
</html>