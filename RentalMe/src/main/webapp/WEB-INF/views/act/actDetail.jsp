<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

</style>
</head>
<body>
<div id="actContent">
	<div class="container">
		<div class="row">
					<!-- ********************* -->
					<!-- 상세 캐러셀 영역 시작 -->
					<!-- ********************* -->
					<div style="border:0px solid red; width:50%; margin-top:100px; margin-bottom:100px;"  class="product-slider col-md-4">
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
								<div class="col-md-3">
									<h4 id="optionSelect1">브랜드</h4>
									<h4 id="optionSelect1">제품코드</h4>
									<h4 id="optionSelect1">시작가</h4>
									<h4 id="optionSelect1">응찰단위</h4>
									<h4 id="optionSelect1">경매 시작 시간</h4>
									<h4 id="optionSelect1">경매 종료 시간</h4>
									<h4 id="optionSelect1">남은 시간</h4>
								</div>
								<div class="col-md-6">
									<h4 id="optionSelect1">${list1.brandNm }</h4>
									<h4 id="optionSelect1">${list1.gdsCd }</h4>
									<h4 id="optionSelect1">${list1.gdsStPrice }</h4>
									<h4 id="optionSelect1">${list1.unitPrice }</h4>
									<h4 id="optionSelect1">${list1.actStTime }</h4>
									<h4 id="optionSelect1">${list1.actEdTime }</h4>
									<h4 id="optionSelect1">남은시간 계산중...</h4>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>