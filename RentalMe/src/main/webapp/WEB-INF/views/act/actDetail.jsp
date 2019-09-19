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

	#actBody{
		clear: both;
	}
	#liveview{
		display: inline-block;
		width: 30px;
		height: 25px;
		float: right;
	}
	#chattingRoom{
		
	}
	#actLive{
		height: 400px;
		overflow-y: auto;
		border: 1px solid lightgrey;

	}
	#bidListBody{
		border: 1px solid lightgrey;
		height: 400px;
	}
	.idIn{
		color: #FF851C;
	}
	.moneyIn{
		font-weight: bold;
		font-size: 13pt;
		font-family:"nanumB";
	}
	.enterIn{
		margin-top:5px;
	}
	.whoIn{
		font-weight: bold;
	}
	#adminimg{
		width:80px;
		padding:10px;
	}
	#moneyInText{
		color:grey;
	}
	#liveviewcnt{
		font-family: "nanumB";
		font-weight:bolder;
		font-size:13pt;
	}
	.col-md-2{
		padding:0;
	}
	.textgroup{
		font-family: "nanumB";
		font-weight:bolder;
	}
	.textgroup2{
		font-family: "nanumB";
	}
	#countimg{
		width:300px;
		margin-top:50px;
	}
	#countView{
		position:absolute;
		z-index:100;
		text-align:center;
		width:95%;
		
	}
	#winnerView{
		text-align:center;
		height:23px;
		font-family:"nanumB";
		font-weight:bolder;
		line-height:23px;
		font-size:11pt;
		position:absolute;
		z-index:100;
		width:97%;
		margin-top:5px;
		bottom:0;
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
		var price=msg.price;
		
		$('#liveviewcnt').text(msg.cnt);
		if(type=='bid'){
			$('#actLive').append('<div class="bidIn"><span class="idIn">'+id+'</span>님께서 응찰하셨습니다</div>');
			$('#bidList').append("<li>"+id+"</li>");
			$('#countView').text('');
		}else if(type=='enter'){
			text=text+'';
			$('#actLive').append('<div class="enterIn"><span class="idIn textgroup">'+id+"</span><span class='textgroup2'>님이 경매장에 입장하셨습니다</span></div>");
			$('#nowPrice').text("");
			$('#nowPrice').prepend("<p class='textgroup'>현재 가격 </p >"+price+" 원");
			$('#bidList').text("");
			var textArr=text.split(',');
			for(var i in textArr){
				$('#bidList').append("<li>"+textArr[i]+"</li>");
			}
			
		}else if(type=='adminMsg'){
			$('#actLive').append('<div style="text-align:right;" class="whoIn"><span class="moneyIn">'+text+'</span><span id="moneyInText">원 응찰하실 분?</span><img id="adminimg" src="./../imgs/admin.PNG"/></div>');
			$('#sendMsg').attr('disabled', false);
			$('#nowPrice').text('');
			$('#nowPrice').append("현재 가격<br/> <span class='moneyIn'>"+text+"</span>원");
			$('#bidList').empty();
		}else if(typeof(msg)=='number'){
			$('#countView').text('');
			$('#countView').append('<img id="countimg" alt="count" src="/imgs/'+msg+'.png">');
			if(msg==0){
				$('#sendMsg').attr('disabled', true);
				$('#winnerView').append('축하합니다');
			}
		}else if(type=='endMsg'){
			$('#sendMsg').attr('disabled', true);
			$('#winnerView').text('');
			$('#winnerView').append("<div style='background-color:black; color:white;'>"+text+"님 입찰되었습니다.</div>");
		}else if(type=='endBid'){
			console.log('연결끊김');
			sock.close();
		}

	};
	sock.onclose=function(event){
		alert('이용해주셔서 감사합니다.');
		window.location.href='/act/';
	};
	$(function(){
		$('#sendMsg').attr('disabled', true);
		if($('#hiddenStsCd').val()=='1'){
			alert('아직 경매가 열리지않았습니다');
			window.location.href="/act/";
		}
		
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
			cnt: 0,
			price: 0
		};

		sock.send(JSON.stringify(msg));
	}
	function sendBid(){
		var msg={
			type: "bid",
			text: $('#actInfo').val(),
			id: $('#idsession').text(),
			cnt: 1,
			price: 0
		};

		sock.send(JSON.stringify(msg));
	}






	
</script>
</head>
<body>
<input type="hidden" id="hiddenStsCd" value="${list2.actStsCd }">
<div id="actContent">
	<div class="container" >
		<div class="row">
					<!-- ********************* -->
					<!-- 상세 캐러셀 영역 시작 -->
					<!-- ********************* -->
					<div style="border:0px solid red; width:50%; margin-top:100px; margin-bottom:100px;"  class="product-slider col-md-4">
						<div id="carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<img src="${list2.img1 }">
								</div>
								<div class="item"> <img src="${list2.img2 }"> </div>
								<div class="item"> <img src="${list2.img3 }"> </div>
								<div class="item"> <img src="${list2.img4 }"> </div>

							</div>
						</div>
						<div class="clearfix">
							<div id="thumbcarousel" class="carousel slide" data-interval="false">
								<div class="carousel-inner">
									<div class="item active">
										<div data-target="#carousel" data-slide-to="0" class="thumb"><img src="${list2.img1 }"></div>
										<div data-target="#carousel" data-slide-to="1" class="thumb"><img src="${list2.img2 }"></div>
										<div data-target="#carousel" data-slide-to="2" class="thumb"><img src="${list2.img3 }"></div>
										<div data-target="#carousel" data-slide-to="3" class="thumb"><img src="${list2.img4 }"></div>
									</div>
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
					
							<h4 id="brandNmStyle">${list1.brandNm }</h4>
							<h2 id="gdsNmStyle">${list1.gdsNm }</h2>
							<div class="hr"></div>
							<div class="row">
								<div class="col-md-3" style="display:inline-block">
									<h4 id="optionSelect1">브랜드</h4>
									<h4 id="optionSelect1">제품코드</h4>
									<h4 class="detailText" id="optionSelect1">시작가</h4>
									<h4 class="detailText" id="optionSelect1">경매 시작 시간</h4>
								</div>
								<div class="col-md-6" style="display:inline-block">
									<h4 id="optionSelect1">${list1.brandNm }</h4>
									<h4 id="optionSelect1">${list1.gdsCd }</h4>
									<h4 id="optionSelect1"><fmt:formatNumber pattern="#,###.###"> ${list2.gdsStPrice }</fmt:formatNumber> 원</h4>
									<h4 id="optionSelect1">${list2.actStTime }</h4>

								</div>
							</div>
					</div>
				</div>
			</div>
			<div class="container" style="border-top:10px solid black;">
			<div style="border:0px solid yellow; margin-bottom:100px; height: 500px;">
					<div id="actBody">
						<div class="row">
							
							<div id="actLive" class="col-md-8">

								<div id="countView"></div>
								<div id="winnerView"></div>
									
							</div>
							<div id="bidListBody" class="col-md-2">
								<div style="margin-top:5px; margin-left:10px; display: inline-block; width:50%;">
									<div><p class="textgroup">내 아이디</p></div>
									<div id="idsession">${loginUserId}</div><br/><br/>
									<div id="nowPrice"></div>
								</div>
								<div style="padding-right:3px; display: inline-block; width:50px; float:right; padding-top:0;">
									<div id="liveview" style="float:none;">
										<img alt="" src="/imgs/liveview.png" style="display: inline-block; margin-right:10px; width:100%; height:100%;">
									</div>
									<div style="float:none; display: inline-block; float:right;" id="liveviewcnt"></div>
								</div>
								
							</div>
							<div id="bidListBody" class="col-md-2">
								<p style="margin-top:5px; margin-left:10px;" class="textgroup">&nbsp;현재 응찰한 인원</p>
								<ol id="bidList">
								
								</ol>
							</div>
						</div>
						<div style="padding:10px; text-align:center;">
							<button style="background-color:black; color:white;"id="sendMsg" class="btn btn-lg">응찰하기</button>
						</div>
						
					</div>	
			</div>
			</div>
		</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>