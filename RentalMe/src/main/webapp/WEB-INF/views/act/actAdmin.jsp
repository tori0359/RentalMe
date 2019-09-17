<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:include page="../template/header.jsp"></jsp:include>
<style type="text/css">
	#headAct{
		clear: both;
		height: 300px;
	}
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">
	var sock=new SockJS("${root}act/ac");
	sock.onopen=function(event){
		
	};
	sock.onmessage=function(event){			//이 서버에서 메시지를 받았을 때
		
		console.log("들어온 데이터"+event.data);
		console.log("타입:"+typeof(event.data));
		var msg = JSON.parse(event.data);
		var id= msg.id;
		var text=msg.text;
		var type=msg.type;
		
		$('#liveviewcnt').text(msg.cnt);
		if(type=='bid'){
			$('#actLive').append(id+"님께서 응찰하셨습니다<br/>");
			$('#bidList').append("<li>"+id+"</li>");
			$('#countView').text('');
		}else if(type=='enter'){
			$('#actLive').append(id+"님이 경매장에 입장하셨습니다<br/>");
		}else if(type=='adminMsg'){
			$('#actLive').append(text+"원 응찰하실 분?<br/>");
			$('#nowPrice').text('');
			$('#nowPrice').append("현재가격: "+text+"원");
			$('#bidList').empty();
		}else if(typeof(msg)=='number'){
			$('#countView').text('');
			$('#countView').append('<img alt="count" src="/imgs/'+msg+'.png">');
		}else if(type=='endMsg'){
			$('#sendMsg').attr('disabled', true);
			$('#countView').text('');
			$('#countView').append(text+'님 입찰되었습니다.');
		}else if(type=='listMsg'){
			$('#listMsg').text('');
			text=text.slice(1,-1);				//앞뒤 중괄호없애기
			var textSplit=text.split(', ');
			for (var i in textSplit){
				$('#listMsg').append('<li>'+textSplit[i]+'</li>');	
			}
		}else if(type=='bidResult'){
			text=text.split('바꿈').join('"');
			
			$('#bidresult').val(text);
		}
	};
	function sendServer(who){
		var msg={
			type: "adminMsg",
			text: who.val(),
			id: "admin",
			cnt: 0
		};
		
		sock.send(JSON.stringify(msg));
	}
	function countDown(){
		var msg={
			type: "countDown",
			text: 'countDown',
			id: "admin",
			cnt: 0
		};
		sock.send(JSON.stringify(msg));
	}
	$(function(){
		$('.sendMsg').click(function(){
			sendServer($(this));
		});
		$('#countDown').click(function(){
			countDown();
		});
	});
</script>
</head>
<div id="headAct"></div>
<body>
	<div id="nowPrice"></div>
	<div id="actLive"></div>
	<input type="button" class="sendMsg" value="1000">
	<input type="button" class="sendMsg" value="5000">
	<input type="button" class="sendMsg" value="10000">
	<input type="button" class="sendMsg" value="50000">
	<input type="button" class="sendMsg" value="100000">
	<div id="countView"></div>
	<button id="countDown">끝내기 카운트</button>
	<ol id="bidList"></ol>
	<ol id="listMsg">
	</ol>
	<form action="/act/result" method="post">
	<input type="hidden" name="gdsCd" value="${list1.gdsCd }">
	<input type="hidden" id="bidresult" name="bidresult">
	<button>종료</button>
	</form>
</body>
</html>