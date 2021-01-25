<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/edit_mp.css">
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
        <h2>내 정보 수정</h2>
        	<form method="post" id="modify">
        	<input type="hidden" value="${mp_user.user_id}" name=user_id>
            <table>
                <tr>
                    <td>아이디</td>
                    <td class="readonly">${mp_user.user_id}</td>
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
                    <td>닉네임</td>
                    <td><input type="text" id="nick" name="nick" value="${mp_user.nick}"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" id="pass1" name="passcode" value="${mp_user.user_pw}" style="background-color:#eee" readonly></td>
                </tr>
                <tr>
                	<td>비밀번호 확인</td>
                	<td colspan=2><input type="password" id="pass2" value="${mp_user.user_pw}" style="background-color:#eee" readonly >
                		<input type="button" id="passC" value="변경하기"></td>
                </tr>
                <tr><td></td><td colspan=3><span id="pw_check" class="w3-text-red"></span><td></tr>
                <tr>
                    <td>비밀번호 질문</td>
                    <td>
                    	<input type="hidden" value="${mp_user.passwd_q}" id="passQ">
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
                    <td><input type="text" id="answer" name="passwd_a" value="${mp_user.passwd_a}" ></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td id="email">${mp_user.email}</td>
                </tr>
                <tr>
                    <td>모바일번호</td>
                    <td><input type="tel" id="mobile" name=mobile value="${mp_user.mobile}"></td>
                </tr>
                 <tr><td></td><td colspan=3><span id="mobile_check" class="w3-text-red"></span><td></tr>
                <tr id="birth">
                    <td>생년월일</td>
                    <td id="readonly">${mp_user.birth}</td>
                </tr>
                <tr>
                	<td>성격 태그</td>
                	<td>
                		<input type=hidden value="${mp_user.tag}" id="tags">
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
                	<td><textarea id="cv" name="cv" placeholder="100자 이하로 입력해 주세요" >${mp_user.cv}</textarea></td>
                </tr>
                <tr id ="addS">
                	<td>주소</td>
                	<td>
                		<input type="text" id="addr" value="${mp_user.address}" name="address00" readonly style="background-color:#eee">
                		<input type="button" id="showaddr" value="변경하기">
                	</td>
                </tr>
                <tr id="addH" style="display:none">
                	<td>주소</td>
                	<td >
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
                	<td></td><td><span id="addrN">※주소는 도로명까지 저장됩니다.</span></td>
                </tr>
                <tr>
                    <td colspan="2" id="btn">
                        <input type="button" id="cancel" value="취소"  onclick="history.back();">
                        
                        <input type="submit" id="submit" value="수정" onclick="javascript: form.action='editmp_go';"/>
                    </td>
                </tr>
            </table><br>
            </form>
            <form method="post" id="bye" action="leave">
            	<input type="hidden" value="${mp_user.user_id}" name=user_id id=user>
            	<span id="sign_out">회원탈퇴</span>
            </form>
        </div>
    </section>
    <footer>
        <p>&copy;copyright 홀로서기
            alone@alone.co.kr</p>
    </footer>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
var c = 0;
$(document)
.ready(function(){
	
	console.log($('#genderC').text())
	if($('#genderC').text()=="f"){
		$('#genderC').text("여성");
	}else if($('#genderC').text()=="m"){
		$('#genderC').text("남성");
	}
	
	console.log("태그 :"+$('#tags').val());
	
	$('#choice').val($('#passQ').val());
	
	//if($('#movie').val("").prop('checked',false);
	var mp_ptag=$('#tags').val().split(",");
	console.log("mp_ptag: "+mp_ptag);
	$('input:checkbox[name="ptag"]').each(function() {
		for(var i in mp_ptag){
			if(this.value == mp_ptag[i]){ //값 비교
		           this.checked = true; //checked 처리
		     }
		}
	});
})
		
.on('keyup','#pass1',function(){
	if ($("#pass1").val().length < 6) { 
		$("#pw_check").css("color","rgb(223, 64, 43)")
		$("#pw_check").html("비밀번호는 6-30자 사이로 입력해야 합니다.");

	}else if($("#pass1").val().length > 30){
		$("#pw_check").css("color","rgb(223, 64, 43)")
		$("#pw_check").html("비밀번호가 30자를 초과하였습니다.");

	}else{
		$("#pw_check").html("");
	}
})
.on('keyup','#pass2',function(){

	console.log($("#pass1"))
	if($("#pass1").val() !== $("#pass2").val()){
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
.on('keyup','#mobile',function(){
	var phone = /^01[0179][0-9]{7,8}$/;
	if(!phone.test($('#mobile').val())){
		$("#mobile_check").css("color","rgb(223, 64, 43)")
		$("#mobile_check").html("잘못된 모바일 번호 형식입니다.");
	}else{
		$("#mobile_check").html("");
	}
})		
.on('click', '#showaddr', function(){
	c=1;
	$('#addr').val("");
	console.log($('#addH').css("display"));
	if($('#addH').css("display")=="none"){
		$('#addH').show();
		$('#addS').hide();
	}
})
.on('click','input:checkbox[name=ptag]',function(){
	console.log($("input:checkbox[name='ptag']:checked").length)
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

.on('click','#passC',function(){
	
	$('#pass1').attr('readonly', false);
	$('#pass2').attr('readonly', false);
	$('#pass1').css("background-color","#fff")
	$('#pass2').css("background-color","#fff")
	$('#pass1').val("");
	$('#pass2').val("");
	
	$('#passC').hide();
	
})

.on('click','#submit',function(){
	var maxChecked = 3;   //선택가능한 체크박스 갯수
	var totalChecked = 0;
	
	console.log($("input:checkbox[name='ptag']").is(':checked'))
	console.log($("#nick").val().length)
	
	if(c==1){
		if($('#sample4_postcode').val()=='' || $('#sample4_roadAddress').val()==''){
			alert("주소를 입력해 주세요.");
			return false;
		}
	}
	
	
	if($("#nick").val()==""){
		alert("닉네임을 입력해 주세요.")
		$("#nick").focus();
		return false;
	}else if($("#nick").val().length<2){
		alert("닉네임은 2-20자 사이로 입력해 주세요.")
		$("#nick").focus();
		return false;
	}else if($("#nick").val().length>20){
		alert("닉네임은 20자를 넘을 수 없습니다.")
		$("#nick").focus();
		return false;
	}else if($("#pw_check").html()=="비밀번호가 다릅니다." || 
			$("#pw_check").html()=="비밀번호가 30자를 초과하였습니다." ||
			$("#pw_check").html()=="비밀번호는 6-30자 사이로 입력해야 합니다." ||
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
	}else if($("#mobile").val()==""){
		alert("모바일 번호를 입력해 주세요");
		$("#mobile").focus();
		return false;
	}else if($("#mobile_check").html()=="잘못된 모바일 번호 형식입니다."){
		alert("모바일 번호을 확인해 주세요")
		$("#mobile").focus();
		return false;
	}else if($("input:checkbox[name='ptag']").is(':checked')==false){
		alert("성격 태그를 선택해 주세요")
		return false;
	}else if($("#cv").val().length>100){
		alert("자기소개가 100자를 초과합니다.");
		
		return false;
	}else{
		if(confirm("수정하시겠습니까?")){
			alert("수정되었습니다.");
		}
	}
})	


.on('click','#sign_out',function(){
	console.log($('#user').val());
	
	if(confirm("정말 탈퇴 하시겠습니까? 지금까지 쓴 글과 댓글이 삭제됩니다.")){
		if(confirm("확인을 누르면 탈퇴됩니다.")){
			alert("탈퇴되었습니다.");
			$('#bye').submit();	
		}
	}
	

	
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