<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/header.jsp"></jsp:include>
<style type="text/css">
	#headAct{
		clear: both;
		height: 300px;
	}
	#actBody{
		clear: both;
	}
	#liveview{
		display: inline-block;
		width: 30px;
		height: 25px;
	}
	#chattingRoom{
		border: 1px solid black;
		height: 500px;
	}
	#footAct{
		clear: both;
		height: 300px;
	}
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">
	var sock=new SockJS("${root}act/ac");
	var cnt=0;
	sock.onopen=function(event){					//이 서버에 접속했을때
		enterAct();
	};
	sock.onmessage=function(event){			//이 서버에서 메시지를 받았을 때	
		console.log(event.data);
		console.log(typeof(event.data));
		var msg = JSON.parse(event.data);
		console.log(typeof(msg));
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
			$('#sendMsg').attr('disabled', false);
			$('#nowPrice').text('');
			$('#nowPrice').append("현재가격: "+text+"원");
			$('#bidList').empty();
		}else if(typeof(msg)=='number'){
			$('#countView').text('');
			$('#countView').append('<img alt="count" src="/imgs/'+msg+'.png">');
			if(msg==0){
				$('#sendMsg').attr('disabled', true);
				$('#countView').append('축하합니다');
			}
		}else if(type=='endMsg'){
			$('#sendMsg').attr('disabled', true);
			$('#countView').append(text+'님 입찰되었습니다.');
		}

	};
	sock.onclose=function(event){
		
	};
	$(function(){
		$('#sendMsg').click(function(){
			console.log('클릭함');
			$('#sendMsg').attr('disabled', true);
			sendBid();
			
		}); 
	});
	function enterAct(){
		var msg={
			type: "enter",
			text: $('#actInfo').val(),
			id: $('#idsession').text(),
			cnt: 0
		};

		sock.send(JSON.stringify(msg));
	}
	function sendBid(){
		var msg={
			type: "bid",
			text: $('#actInfo').val(),
			id: $('#idsession').text(),
			cnt: 1
		};

		sock.send(JSON.stringify(msg));
	}

</script>
</head>
<body>
<div id="headAct"></div>
<div id="actBody">
	<div id="idsession">${loginUserId}</div>
	<div id="liveview">
		<img alt="" src="/imgs/liveview.png" style="width:100%;height:100%;">
	</div>
	<span id="liveviewcnt"></span>
	<div id="nowPrice"></div>
	<div id="actLive"></div>
	<button id="sendMsg">응찰하기</button>
	<div id="countView"></div>
	<ol id="bidList">
	
	</ol>
</div>	
<div id="footAct"></div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>