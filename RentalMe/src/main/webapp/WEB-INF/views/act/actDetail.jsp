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
		/* $('#liveviewcnt').text(msg.data); */
		console.log(event.data);
		var msg = JSON.parse(event.data);
		var id= msg.id;
		var text=msg.text;
		var price=msg.price;
		var type=msg.type;
		/* if(msg.cnt==0){
			cnt++;
			$('#liveviewcnt').text(cnt);
		}else if(msg.cnt==1){
			$('#actLive').append(id+">>>"+text+"<br/>");
		} */
		$('#liveviewcnt').text(msg.cnt);
		if(type=='bid'){
			$('#actLive').append(id+"님께서"+price+"응찰하셨습니다<br/>");
		}
		if(type=='enter'){
			$('#actLive').append(id+"님이 경매장에 입장하셨습니다.");
		}
	};
	sock.onclose=function(event){
		exitAct();
	};
	$(function(){
		$('button').click(function(){
			console.log('클릭함');
			sendBid();
			
		}); 
	});

	function exitAct(){
		var msg={
			type: "exit",
			text: $('#actInfo').val(),
			id: $('#idsession').text(),
			price: 0,
			cnt: 0
		};
		sock.send(JSON.stringify(msg));

	}
 	
	function enterAct(){
		var msg={
			type: "enter",
			text: $('#actInfo').val(),
			id: $('#idsession').text(),
			price: 0,
			cnt: 0
		};

		sock.send(JSON.stringify(msg));
	}
	function sendBid(){
		var msg={
			type: "bid",
			text: $('#actInfo').val(),
			id: $('#idsession').text(),
			price: 10000,
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
	<div id="actLive"></div>
	<input id="actInfo"/><button>10000원 추가</button>
</div>	
<div id="footAct"></div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>