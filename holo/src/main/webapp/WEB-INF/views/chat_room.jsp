<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/chat_room.css">
<!------ Include the above in your HEAD tag ---------->


<html>
<head>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">

</head>
<body>
<div class="container">
<div class="messaging">

        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>대화목록</h4>
            </div>
          </div>
          <div class="inbox_chat">
          <c:forEach var="list" items="${chat_list}">
          <form method="post" id="chat_pop${list.message_id}" action="chat_pop" target="chat_pop">
            <div class="chat_list active_chat" id="chat_btn${list.message_id}">
              <div class="chat_people">
                <div class="chat_img"> </div>
                <div class="chat_ib">
                  <h5>
                  	<c:if test="${list.message_sender==login.user_id}">
                  		<input type="hidden" name="applier" value="${list.message_receiver}">
						${list.receiver_nick}
					</c:if>
					<c:if test="${list.message_receiver==login.user_id}">
						<input type="hidden" name="applier" value="${list.message_sender}">
						${list.sender_nick}
					</c:if>
					<c:if test="${list.unread!=0}">
						<span class="unread">${list.unread}</span>
					</c:if>
                  <span class="chat_date">${list.message_sendTime}</span></h5>
                  <p>${list.message_content}</p>
                </div>
              </div>
            </div>
            </form>
          </c:forEach>
          </div>
          

        
      
      
      <p class="text-center top_spac"> Design by <a target="_blank" href="#">Sunil Rajput</a></p>
      
    </div></div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','[id^=chat_btn]',function(){
	console.log("chat_btn click");
	var n=(this.id).substr(8);
	console.log("n: "+n);
	window.open("","chat_pop",'width=500, height=730, left=400, top=200, resizable=no, scrollbar=no');
	$("#chat_pop"+n).submit();
})
</script>
</html>