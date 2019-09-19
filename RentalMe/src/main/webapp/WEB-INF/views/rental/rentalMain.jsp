<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<style type="text/css">
	.maincar{
		height: 500px;	
	}
	
	.carousel-inner{
		height:500px;
	}
	#event{
		background-color: #F1C528;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#event a {
		line-height: 50px; 
		font-size: 15pt; 
		font-family:"nanumEB";
		color: black;
	}
	#event a:hover{
		text-decoration: none;
		
	}
	#best{
		/* border-top:4px solid grey; */
		text-align:center;
		margin-top:20px;
		border: 0px solid green;
	}
	#best h3{
		font-family:"nanumEB";
		font-size:19pt;
	}
	.bestitem{
		margin-top: 40px;
		border: 0px solid green;
	}
	.bestitem img{
		width: 250px;
		padding-right:10px;
	}
	.ordlist{
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		height:30px;
		background-color: #F1C528;
	}
	.ordlist p{
		line-height: 30px;
		font-family: "nanumB";
		font-weight:bolder;
		margin-left:10px;
		font-size:10pt;
	}
	.eventlist{
		margin-top: 40px;
		padding-top:10px;
		height:165px;
		background:#fff; 
		margin-right:0;
	}
	.eventlist img{
		height:140px;
	}
	/* 실시간 접수현황 carousel*/
	.none{ 
		display:none
	}
	
	#ticker{ 
		float:left;width:100px;
	}
	
	.block { 
		padding:0 5px; 
		height:105px; 
		overflow:hidden; 
		width:100%; 
		font-family:"nanumB"; 
		font-size:12px;
		float:left; 
		border: 1px solid #E6E6E6;
	}
	
	.block ul,
	.block li { margin:0; padding:0; list-style:none;}
	.block li p { display:block; height:15px; line-height:15px; color:#555;}
	.block li img{ width:30px;}
	/* 실시간 접수현황 끝*/

	.new{
		background-color: #151515;
		color:white;
		width:35px;
		font-family:"nanumEB";
		text-align: center;
		margin-right:8px;
	}
	#banner p {
		font-family: "nanumEB";
		font-size:14pt;
	}
	#banner a {
		color: orange;
	}
	#banner a:hover{
		color: orange;
		text-decoration:none;
		background-color:black;
	}
	#auctionimg {
		width:170px;
	}
	#brandNm {
		padding:20px 10px 0 10px;
		font-family:"nanumB";
		font-size: 10pt;
		color: #A4A4A4;
		font-weight:bolder;
	}
	#goodsNm{
		padding:0 10px 0 10px;
		font-family:"nanumB";
		font-weight:bolder;
	}
	#goodsNm a{
		color:black;
		text-decoration:none;
	}
	#price{
		padding:0 10px 0 10px;
		font-family:"nanumEB";
		font-weight:bolder;
		font-size:13pt;
	}
	.bestitem:hover{
		transform:scale(1.1);             /*  default */
		-webkit-transform:scale(1.1);  /*  크롬 */
		-moz-transform:scale(1.1);     /* FireFox */
		-o-transform:scale(1.1);  
	}
	#adimg{
		margin-top:40px;
	}
	.csText{
		font-family:"nanumB";
		font-size: 9pt;
		margin-left:4px;
		padding: 1px;
		line-height:9px;
		color:black;
	}
	.csText:hover{
		text-decoration:none;
		font-weight: bolder;
		color:black;
	}
</style>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script type="text/javascript">
			$(document).ready(function(){
				$('.carousel').carousel({
					  interval: 2000
					})
				});

			//실시간 접수 현황 세로 carousel
			jQuery(function($)
					{
					    var ticker = function()
					    {
					        timer = setTimeout(function(){
					            $('#ticker li:first').animate( {marginTop: '-25px'}, 300, function()
					            {
					                $(this).detach().appendTo('ul#ticker').removeAttr('style');
					            });
					            ticker();
					        }, 1500);         
					      };

					  //마우스를 올렸을 때 기능 정지
					  var tickerover = function()
					  {
					    $('#ticker').mouseover(function(){
					      clearTimeout(timer);
					    });
					    $('#ticker').mouseout(function(){
					      ticker();
					    });  
					  };
					  tickerover();
					  //끝
					    ticker();
					    
					});
			
		//best상품 carousel
	
		$(document).ready(function() {
			 
			  $(".owl-carousel").owlCarousel({
			 
			      autoPlay: 2000, 
			 
			      items : 5,
			      itemsDesktop : [1199,3],
			      itemsDesktopSmall : [979,3]
			 
			  });
			 
			});
				
</script>
</head>
<body>
<div id="carousel-example-generic" class="maincar carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="">
    <div class="item active">
      <img class="mainimg" src="imgs/main1.png" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img class="mainimg" src="imgs/main2.png" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-2 col-md-offset-5" id="best">
				<h3>BEST ITEM</h3>
		</div>
		
	</div>
	<div style="width:100%;">
			<div class="owl-carousel owl-theme owl-img-responsive">
			<c:forEach items="${bestitem}" var="best">
				<div class="item" id="bestlist">
					<a href="/rental/Appli/lg/${best.gdsSclassCd}/detail/${best.gdsCd }"><img class="bestitem" style="height:200px;" src="${best.RImg1}"/></a>
					<div id="brandNm">${best.brandNm}</div>
					<p id="goodsNm"><a href="#">${best.gdsNm}</a></p>
					<p id="price">￦ 월<fmt:formatNumber pattern="#,###.##">${best.gdsPrice}</fmt:formatNumber></p>
					<input type="hidden" name="gdsCd" value="${best.gdsCd}">
					<input type="hidden" name="gdsSclassCd" value="${best.gdsSclassCd}">
					<input type="hidden" name="gdsMclassCd" value="${best.gdsMclassCd}">
				</div>
			</c:forEach>
			</div>
			
			
				
	</div>
</div>

<div style="background-color:#FAF1E2; height:240px; margin-top:30px;">
<div class="container">
	<div class="row">
		<div class="col-md-3 eventlist" >
			<div class="ordlist"><p>&nbsp;렌탈미 실시간 접수 현황</p></div>
			<div style="height:100px; margin-top:10px;">
				<div class="block">
				    <ul id="ticker">
				    <c:forEach items="${ordlist}" var="bean">
				        <li><div class="new" style="display:inline-block;">NEW </div><div style="display:inline-block;"><p>${bean.userId }</p></div></li>

				   </c:forEach>

				    </ul>
				</div>
			
			</div>
		</div>
		
		<div class="col-md-3 eventlist" style="margin-top:40px; margin-left:15px;">
			<div style="background-color:lightgrey;"class="ordlist"><p>&nbsp;공지사항</p></div>
			<div style="margin-top:10px; height:100px; border:1px solid #E6E6E6;">
				<c:forEach items="${cs}" var="cs">
					<a class="csText" href="/cs/csNotice">※&nbsp;${cs.sub}</a><br>
					
				</c:forEach>
			
			</div>
		</div>
		
		<div class="col-md-5 eventlist" style="border:1px solid #E6E6E6; display:inline-block; height:165px; margin-left:15px;">
			<div style="border:0px solid red; display:inline-block;" >
				<img id="auctionimg" src="imgs/auction.png"/>
			</div>
			<div id="banner" style="border:0px solid blue; display:inline-block;"> 
				<!-- <img id="auctionimg" src="imgs/event2.jpg"/> -->
					<p><span style="font-size:10pt; color:grey; font-family:'nanumB'; ">렌탈미에서만 진행하는</span> <br>땡 잡았다! <br><a href="${pageContext.request.contextPath}/act/">이벤트 경매 바로가기</a></p> 
			</div>
		
		</div>
			
	</div>
</div>
</div>
<div class="container-fluid" style="margin:0px auto; text-align:center;">
	<div style="display:inline-block;">
		<img id="adimg" src="/imgs/ad.png"/>
	</div>
	<div style="display:inline-block;">
		<img id="adimg" src="/imgs/goods.PNG"/>
	</div>


</div>
</body>

<jsp:include page="../template/footer.jsp"></jsp:include>
</html>