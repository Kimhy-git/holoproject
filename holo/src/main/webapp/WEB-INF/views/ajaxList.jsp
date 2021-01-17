<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="dto_reply" items="${reply}">
            <div id=comments> 
            <form action="update_comment" method=post class="comments" value="${dto_reply.re_class}">
	            <div id="comments${dto_reply.reply_id}">
			            <input type=text id="re_comment" value="${dto_reply.re_comment}" name="re_comment"><br>
			            ${dto_reply.user_user_id} ${dto_reply.operator}<br>

			            <input type=hidden name="post_post_id" value=${dto_reply.post_post_id}>
			            <input type=hidden name="reply_id" value=${dto_reply.reply_id}>
			            <input type=hidden name="re_index" value=${dto_reply.re_index}>
			            <input type=hidden name="re_order" value=${dto_reply.re_order}>
			            <input type=hidden name="re_class" value=${dto_reply.re_class}>
			            <input type=hidden name="groupNum" value=${dto_reply.reply_id}>    
			    </div>
			            <div id="btn_reply">
			            <c:if test="${login.user_id}==${dto_reply.user_user_id}">
			                <input type="button" id="remove_reply${dto_reply.reply_id}" value="삭제" data_r=${dto_reply.reply_id}>
			                <input type="button" id="reply_update${dto_reply.reply_id}" value="수정" data_r=${dto_reply.reply_id}>
			            </c:if>
			                <input type="button" id="reply_again${dto_reply.reply_id}" value="답글달기" >
			                
			                <br><br><br>
			                <div id="reply_again_textarea${dto_reply.reply_id}" style="display:none">
			                <input id="comment-input" name="re_re_comment">
			                <input type=submit class="reply_sub_btn" value="등록" onclick="javascript: form.action='add_re_comment';">
			                <input type="button" value="취소" id="rere_cancel${dto_reply.reply_id}">
			                </div>
			                
			                <div id="reply_update_textarea${dto_reply.reply_id}" style="display:none">
			                <input id="comment-input" name="update_comment" placeholder="${dto_reply.re_comment}">
			                <input type=submit class="reply_sub_btn" value="등록" onclick="javascript: form.action='update_comment';"/>
			                <input type="button" value="취소" id="edit_cancel${dto_reply.reply_id}">
			                </div>
			             </div>
				</form>
			</div>
		</c:forEach>