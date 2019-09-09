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
		console.log("타입:"+typeof(event.data))
		var msg = JSON.parse(event.data);
		console.log("타입:"+typeof(msg));
		var id= msg.id;
		var text=msg.text;
		var type=msg.type;
		
		$('#liveviewcnt').text(msg.cnt);
		if(type=='bid'){
			$('#actLive').append(id+"님께서 응찰하셨습니다<br/>");
			$('#bidList').append("<li>"+id+"</li>");
			$('#countView').text('');
		}
		if(type=='enter'){
			$('#actLive').append(id+"님이 경매장에 입장하셨습니다<br/>");
		}
		if(type=='adminMsg'){
			$('#actLive').append(text+"원 응찰하실 분?<br/>");
			$('#nowPrice').text('');
			$('#nowPrice').append("현재가격: "+text+"원");
			$('#bidList').empty();
		}
		if(typeof(msg)=='number'){
			$('#countView').text('');
			$('#countView').append('<img alt="count" src="/imgs/'+msg+'.png">');
			if(msg==0){
				$('#sendMsg').attr('disabled', true);
				$('#countView').append('축하합니다');
			}
		}
	};
	function sendServer(){
		var msg={
			type: "adminMsg",
			text: $('#money').val(),
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
		$('#sendMsg').click(function(){
			sendServer();
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
	<input type="number" id="money"><button id="sendMsg">전송</button>
	<div id="countView"></div>
	<button id="countDown">끝내기 카운트</button>
</body>
</html>