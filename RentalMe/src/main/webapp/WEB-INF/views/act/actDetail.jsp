<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/header.jsp"></jsp:include>
<style type="text/css">

	#brandNmStyle{
		line-height: 0.2em;
		text-decoration:none;
		font-size: 1.8rem;
		color: #999;
		font-family:"nanumB";
		font-weight: 600;
	}
	#gdsNmStyle { 
		line-height: 30px;
		font-weight: bolder;
		font-family:"nanumEB";
	}
	/* --------- 상세 캐러셀 시작 --------- */
	.product-slider {
		padding: 0px 5px 5px 5px; 
	}	

	.product-slider #carousel { 
		border: 1px solid; border-color:#cecece; 
	}
	
	.product-slider #thumbcarousel { 
		margin: 12px 0 0; padding: 0 0px; 
	}
	
	.product-slider #thumbcarousel .item { 
		text-align: center; 
	}
	
	.product-slider #thumbcarousel .item .thumb { 
		border: 1px solid #cecece; 
		width: %; margin: 0 2%; 
		display: inline-block; 
		vertical-align: middle; 
		cursor: pointer; 
		max-width: 75px; 
	}
	
	.product-slider #thumbcarousel .item .thumb:hover { 
		border: 3px solid; 
		border-color: black; 
	}
	
	.product-slider .item img { 
		width: 90%; 
	}
	
	.carousel-control { 
		color: #0284b8; 
		text-align: center; 
		text-shadow: none; 	
		font-size: 30px; 
		width: 30px; 
		height: 30px; 
		line-height: 20px; 
		top: 23%; 
	}
	
	.carousel-control:hover, 
	.carousel-control:focus, 
	.carousel-control:active { 
		color: #333; 
	}
	
	.carousel-caption, .carousel-control .fa { 
		font: normal normal normal 30px/26px FontAwesome; 
	}
	
	
	.carousel-control { 
		background-color: rgba(0, 0, 0, 0); 
		bottom: auto; 
		font-size: 20px; 
		left: 0; 
		position: absolute; 
		top: 30%; 
		width: auto; 
	}
	.carousel-control.right, 
	.carousel-control.left { 
		background-color: rgba(0, 0, 0, 0); 
		background-image: none; 
	}
/* --------- 상세 캐러셀 끝 ----------- */
	#actContent{
		height:100%;
	}
	#optionSelect1 {
		line-height:1.1em;
		font-weight: bolder;
		font-family: "nanumB";
		font-size:12pt;
		padding: 8px 0px 8px 0px;
	}
	.detailText{
		color: #DF7401;
		font-weight: bolder;
	}



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
<div id="actContent">
	<div class="container">
		<div class="row">
					<!-- ********************* -->
					<!-- 상세 캐러셀 영역 시작 -->
					<!-- ********************* -->
					<div style="border:0px solid red; width:40%; margin-top:100px; margin-bottom:100px;"  class="product-slider col-md-4">
						<div id="carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<c:forEach items="${list1}" var="list1">
								<div class="item active">
									<img src="${list1.img1 }">
								</div>
								<div class="item"> <img src="${list1.img2 }"> </div>
								<div class="item"> <img src="${list1.img3 }"> </div>
								<div class="item"> <img src="${list1.img4 }"> </div>

								</c:forEach>
							</div>
						</div>
						<div class="clearfix">
							<div id="thumbcarousel" class="carousel slide" data-interval="false">
								<div class="carousel-inner">
								<c:forEach items="${list1}" var="list1">
									<div class="item active">
										<div data-target="#carousel" data-slide-to="0" class="thumb"><img src="${list1.img1 }"></div>
										<div data-target="#carousel" data-slide-to="1" class="thumb"><img src="${list1.img2 }"></div>
										<div data-target="#carousel" data-slide-to="2" class="thumb"><img src="${list1.img3 }"></div>
										<div data-target="#carousel" data-slide-to="3" class="thumb"><img src="${list1.img4 }"></div>
									</div>
									</c:forEach>
								</div>
						    	<!-- /carousel-inner --> 
							</div>
							<!-- /thumbcarousel --> 
						</div>
						<!-- /.container -->
					</div>
					<!-- ******************* -->
					<!-- 상세 캐러셀 영역 끝 -->
					<!-- ******************* -->
					<!-- ******************* -->
					<!-- 상세 정보 영역 시작 -->
					<!-- ******************* -->
					<div style="border:0px solid blue; height:100%; margin-top:100px; margin-bottom:100px; padding-left:3%" class="col-md-6">
						<c:forEach items="${list1}" var="list1">
							<h4 id="brandNmStyle">${list1.brandNm }</h4>
							<h2 id="gdsNmStyle">${list1.gdsNm }</h2>
							<div class="hr"></div>
							<div class="row">
								<div class="col-md-3" style="display:inline-block">
									<h4 id="optionSelect1">브랜드</h4>
									<h4 id="optionSelect1">제품코드</h4>
									<h4 class="detailText" id="optionSelect1">시작가</h4>
									<h4 class="detailText" id="optionSelect1">응찰단위</h4>
									<h4 class="detailText" id="optionSelect1">경매 시작 시간</h4>
								</div>
								<div class="col-md-6" style="display:inline-block">
									<h4 id="optionSelect1">${list1.brandNm }</h4>
									<h4 id="optionSelect1">${list1.gdsCd }</h4>
									<h4 id="optionSelect1"><fmt:formatNumber pattern="#,###.###"> ${list1.gdsStPrice }</fmt:formatNumber> 원</h4>
									<h4 id="optionSelect1"><fmt:formatNumber pattern="#,###.###">${list1.unitPrice }</fmt:formatNumber> 원</h4>
									<h4 id="optionSelect1">${list1.actStTime }</h4>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			<div style="border:1px solid grey; margin-bottom:100px; height: 500px;">
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
			</div>
			</div>
		</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>