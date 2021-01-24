<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="resources/css/chat_pop.css">
<body>
	<div class="chat_window">
		<div class="top_menu">
			<div class="title"><span id="nick">아이작2세</span></div>
		</div>
		<ul class="messages">
		</ul>
		<div class="bottom_wrapper clearfix">
			<div class="message_input_wrapper">
				<input class="message_input" placeholder="여기에 채팅을 입력하세요." />
			</div>
			<div class="send_message">
				<div class="icon"></div>
				<div class="text">Send</div>
			</div>
		</div>
	</div>
	<div class="message_template">
		<li class="message">
			<div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div>
		</li>
	</div>
</body>
<script>
var last_id=0;

function submitFunction(){
	var sender='${login.user_id}';
	var receiver='${applier}';
	var content=$('.message_input').val();
	$.post('chat_send',
		{'message_sender':sender, 'message_receiver':receiver, 'message_content':content},
		function(data){
			$('.message_input').val('');
			alert(data);
		}
	)
}

function MessageFunction(arg) {
	console.log(arg);
    this.text = arg.text, this.message_side = arg.message_side;
    this.draw = function (_this) {
        return function () {
            var $message;
            $message = $($('.message_template').clone().html());
            $message.addClass(_this.message_side).find('.text').html(_this.text);
            $('.messages').append($message);
            return setTimeout(function () {
                return $message.addClass('appeared');
            }, 0);
        };
    }(this);
    return this;
}

function readFunction(){
	var sender='${login.user_id}';
	var receiver='${applier}';
	$.post('chat_read',
		{'message_sender':sender, 'message_receiver':receiver, 'last_id':last_id},
		function(data){
			console.log("data: "+data);
			$.each(data,function(ndx,value){
				var text=value['message_content'];
				var message_side;
				console.log("content: "+text);
				if(value['message_sender']=='${login.user_id}'){
					message_side='right';
				}else if(value['message_sender']=='${applier}'){
					message_side='left';
				}
				$messages = $('.messages');
				var message=MessageFunction({text: text, message_side: message_side});
				message.draw();
	            return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
			})
		}
	)
}





$(document)
.ready(function(){
	readFunction();
})
	

.on('click','.send_message',function(){
	submitFunction();
})

/*
(function () {
    var Message;
    Message = function (arg) {
        this.text = arg.text, this.message_side = arg.message_side;
        this.draw = function (_this) {
            return function () {
                var $message;
                $message = $($('.message_template').clone().html());
                $message.addClass(_this.message_side).find('.text').html(_this.text);
                console.log("Message function: "+$message);
                console.log("applier: "+'${applier}');
                $('.messages').append($message);
                return setTimeout(function () {
                    return $message.addClass('appeared');
                }, 0);
            };
        }(this);
        return this;
    };
    
    $(function () {
        var getMessageText, message_side, sendMessage;
        message_side = 'right';
        
        getMessageText = function () {
            var $message_input;
            $message_input = $('.message_input');
            return $message_input.val();
        };
        
        sendMessage = function (text) {
            var $messages, message;
            if (text.trim() === '') {
                return;
            }
            $('.message_input').val('');
            $messages = $('.messages');
            //message_side = message_side === 'left' ? 'right' : 'left';
            message = new Message({
                text: text,
                message_side: message_side
            });
            message.draw();
            return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
        };
        
        
        $('.send_message').click(function (e) {
            return sendMessage(getMessageText());
        });
        $('.message_input').keyup(function (e) {
            if (e.which === 13) {
                return sendMessage(getMessageText());
            }
        });
    });
}.call(this));
*/
</script>
</html>