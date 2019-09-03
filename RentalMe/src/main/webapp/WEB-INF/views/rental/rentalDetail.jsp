<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
.content {
	height: 30vh;
}
.content-inner {
	margin-left:200px;
	margin-right:200px;
}
#cip {
	font-weight: bolder;
    font-size: 35pt;
}
.content-inner-path {
	text-align: center;
}
.content-inner-menu {
	text-align: center;
}
.content-inner-menu-path {
	font-style: italic;
	text-align: right;
}
.content-inner-menu-path2 {
	font-style: italic;
	text-align: right;
}

/* ---------- 상세정보 영역 시작 -------- */
#gdsNmStyle { 
	font-weight: bolder;
}
#brandNmStyle {
	text-decoration:none;
	font-size: 1.8rem;
	color: #999;
}
#detailNm h3{
	font-size: 2.50rem;
    font-weight: bolder;
}

#detailValue h3{
	text-align: left;
    font-size: 2.50rem;
    font-weight: bolder;
    color: darkred;
}
#disPrice {
	border: 0;
	width: 125px;
	background-color : white;
}
.chargediv {
	display: inline;
}
#gradeGroup {
	display: inline;
}
	/* 별점 시작 */
	.star-rating { width:103px; }
	.star-rating,.star-rating span { display:inline-block; height:20px; overflow:hidden; background-image: url('/imgs/star8.jpg'); background-repeat: no-repeat; }
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; width:0%;}
	/* 별점 끝 */

/* ---------- 상세정보 영역 끝 -------- */

/* ---------- 옵션 영역 시작 ---------- */

/* ---------- 옵션 영역 끝 ---------- */

.content-inner-best {
	text-align: center;
}
.content-inner-best-path {
	font-weight: bolder;
	font-size: 20pt;
	color: blue;
}
.label label-default {
	font-size: 20pt;
}
#optionStyle{
	display: inline;
}
#starGrd {
	border: 0;
	width: 60px;
	font-weight: bolder;
	color: #FF00FF;
	background-color : white;
}
#starText {
	border: 0;
	width: 52px;
	background-color : white;
}
#starCnt {
	border: 0;
	font-size:13pt;
	font-weight: bolder;
	width: 100px;
	color: #1E90FF;
	background-color : white;
}

/* --------- BEST 영역 시작 --------- */
/* List style */

/* Mobile only */
@media (max-width: 767px) {
    .page-header { text-align: center; } 
}
@media (max-width: 479px) {
    .caption-box { word-break: break-all; }
    ul.thumbnails li { margin-bottom: 30px; }
}

/* ADD-ON */

::-moz-selection { background: #ff5e99; color: #FFFFFF; }

a, a:focus, a:active, a:hover, object, embed { outline: none; }
:-moz-any-link:focus { outline: none; }
input::-moz-focus-inner { border: 0; }
/* --------- BEST 영역 끝 --------- */

/* --------- 상세 캐러셀 시작 --------- */
.product-slider { 
	 padding: 0px 5px 5px 5px; 
}

.product-slider #carousel { border: 1px solid; border-color:#cecece; }

.product-slider #thumbcarousel { margin: 12px 0 0; padding: 0 0px; }

.product-slider #thumbcarousel .item { text-align: center; }

.product-slider #thumbcarousel .item .thumb { border: 1px solid #cecece; width: %; margin: 0 2%; display: inline-block; vertical-align: middle; cursor: pointer; max-width: 75px; }

.product-slider #thumbcarousel .item .thumb:hover { border: 3px solid; border-color: black; }

.product-slider .item img { width: 100%; height: auto; }

.carousel-control { color: #0284b8; text-align: center; text-shadow: none; font-size: 30px; width: 30px; height: 30px; line-height: 20px; top: 23%; }

.carousel-control:hover, .carousel-control:focus, .carousel-control:active { color: #333; }

.carousel-caption, .carousel-control .fa { font: normal normal normal 30px/26px FontAwesome; }
.carousel-control { background-color: rgba(0, 0, 0, 0); bottom: auto; font-size: 20px; left: 0; position: absolute; top: 30%; width: auto; }

.carousel-control.right, .carousel-control.left { background-color: rgba(0, 0, 0, 0); background-image: none; }

/* --------- 상세 캐러셀 끝 ----------- */

</style>
<script type="text/javascript">

	window.onload = function () {
		//alert("안쪽 처음");
		
		// 점수 평균 퍼센트
		$('#starPercent').width(vTotGrdAvgPercent);

		// 점수 평균
		$('#starGrd').val("("+vTotGrdAvg+")");
		
		//alert("안쪽마지막");
	}

	//alert("바깥쪽");
	
	/**************************/
	/**** 전역변수 선언시작 ***/
	/**************************/
	var vGdsPrice = "";		// 렌탈가격 개월수에 따른 가걱변동 
	var vGdsPriceTemp = "";	// 렌탈가격 개월수에 따른 가걱변동 임시변수
	<c:forEach items="${list1}" var="list1">
		vGdsPrice = "${list1.gdsPrice}";
		vGdsPriceTemp = "${list1.gdsPrice}";
	</c:forEach>

	var vCnt;				// 리뷰 갯수
	var vTotGrdSum;			// 점수 합계
	var vTotGrdAvg;			// 점수 평균
	<c:forEach items="${grade}" var="grade">
		vCnt = "${grade.cnt}";
		vTotGrdSum = "${grade.totGrdSum}";
		vTotGrdAvg = "${grade.totGrdAvg}";
	</c:forEach>
	var vTotGrdAvgPercent =  (vTotGrdAvg*20) + ((vTotGrdAvg*20)*0.0003)*100;		// 점수 평균 퍼센트화
	/**************************/
	/**** 전역변수 선언끝 *****/
	/**************************/
	
	// 계약기간 변동에 따른 할인가격
	function chgAgreeTermBox() {
		var gdsPriceTemp = vGdsPrice;
		var boxSelect = document.getElementById("agreeTermBox");
		var boxValue = boxSelect.options[boxSelect.selectedIndex].value;
		if(boxValue == 6) {
			vGdsPriceTemp = gdsPriceTemp;
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		}
		else if(boxValue == 12) {
			vGdsPriceTemp = gdsPriceTemp;
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		}
		else if(boxValue == 18) {
			gdsPriceTemp = String((gdsPriceTemp*0.95));	
			vGdsPriceTemp = gdsPriceTemp;
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		} else if(boxValue == 24) {
			gdsPriceTemp = String((gdsPriceTemp*0.95));	
			vGdsPriceTemp = gdsPriceTemp;
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		} else if(boxValue == 30) {
			gdsPriceTemp = String((gdsPriceTemp*0.90));
			vGdsPriceTemp = gdsPriceTemp;
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		} else if(boxValue == 36) {
			gdsPriceTemp = String((gdsPriceTemp*0.90));
			vGdsPriceTemp = gdsPriceTemp;
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		}
	}
	
</script>
<jsp:include page=".././template/header.jsp"></jsp:include>
</head>
<body>
	<div class="content">
	<br>
		<div class="content-inner">
			<!--  이후 메뉴경로(19.09.02) -->
			<div class="content-inner-menu-path2">
				<c:forEach items="${path }" var="path">
					<h4>홈 &nbsp; > &nbsp; ${path.gdsMclassNm }
						<c:if test="${not empty path.gdsSclassNm}">
							 &nbsp; > &nbsp; ${ path.gdsSclassNm }
						</c:if>
					</h4>
				</c:forEach>
			</div>
			<div>
				<div class="row">
					<!-- ********************* -->
					<!-- 상세 캐러셀 영역 시작 -->
					<!-- ********************* -->
					<div style="border:0px solid red;" class="product-slider col-md-5">
						<div id="carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<img src="/imgs/sample1.jpg">
								</div>
								<div class="item"> <img src="/imgs/sample2.jpg"> </div>
								<div class="item"> <img src="/imgs/sample3.jpg"> </div>
								<div class="item"> <img src="/imgs/sample4.jpg"> </div>
							</div>
						</div>
						<div class="clearfix">
							<div id="thumbcarousel" class="carousel slide" data-interval="false">
								<div class="carousel-inner">
									<div class="item active">
										<div data-target="#carousel" data-slide-to="0" class="thumb"><img src="/imgs/sample1.jpg"></div>
										<div data-target="#carousel" data-slide-to="1" class="thumb"><img src="/imgs/sample2.jpg"></div>
										<div data-target="#carousel" data-slide-to="2" class="thumb"><img src="/imgs/sample3.jpg"></div>
										<div data-target="#carousel" data-slide-to="3" class="thumb"><img src="/imgs/sample4.jpg"></div>
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
					<div style="border:0px solid blue;" class="col-md-7">
						<c:forEach items="${list1 }" var="list1">
						<div style="border:0px solid pink">
							<h4 id="brandNmStyle">${list1.brandNm }</h4>
							<h2 id="gdsNmStyle">${list1.gdsNm }</h2>
							<h4 id="gradeGroup">
								<span class='star-rating'>
									<span id="starPercent"></span>
								</span>
							</h4>
							<h4 id="gradeGroup">
								<input type="text" id="starGrd" disabled value="0">
							</h4>
							<h4 id="gradeGroup">
								<input type="text" id="starText" disabled value="상품평">
							</h4>
							<h4 id="gradeGroup">
								<input type="text" id="starCnt" disabled value="(23)">
							</h4>
						</div><p>
						<div style="border:1px solid gray"></div>
						<div class="row" style="border:0px solid orange;">
							<div id="detailNm" class="col-md-3" style="border:0px solid black;">
								<div><h3>렌탈가격(월)</h3><h6><br></h6></div>
								<h4>계약기간</h4><h6><br></h6>
								<h4>배송비</h4><h6><br></h6>
								<h4>설치비</h4><h6><br></h6>
								<h4>AS조건</h4><h6><br></h6>
								<h4>모델명</h4><h6><br></h6>
								<h4>제품코드</h4><h6><br></h6>
								<h4>수량</h4>
							</div>
							<div id="detailValue" class="col-md-9" style="border:0px solid pink;">
								<fmt:setLocale value="ko_KR"></fmt:setLocale>
								<div><h3><input type="text" id="disPrice" disabled value="<fmt:formatNumber value="${list1.gdsPrice }" pattern="#,###" />원"></h3><br></div>
								<div class="box box-primary">
									<select id="agreeTermBox" onchange="chgAgreeTermBox()">
										<option value="${list1.agreeTerm }">&nbsp;${list1.agreeTerm }개월(기본)</option>
										<option value="${list1.agreeTerm*2 }">${list1.agreeTerm*2 }개월</option>
										<option value="${list1.agreeTerm*3 }">${list1.agreeTerm*3 }개월</option>
										<option value="${list1.agreeTerm*4 }">${list1.agreeTerm*4 }개월</option>
										<option value="${list1.agreeTerm*5 }">${list1.agreeTerm*5 }개월</option>
										<option value="${list1.agreeTerm*6 }">${list1.agreeTerm*6 }개월</option>
									</select>
								</div><br>
								<h4>${list1.deliverCost }</h4><h6><br></h6>
								<h4>${list1.instalCost }</h4><h6><br></h6>
								<h4>${list1.asCondition }</h4><h6><br></h6>
								<h4>${list1.modelNm }</h4><h6><br></h6>
								<h4>${list1.gdsCd }</h4><h6><br></h6>
								<div class="box box-primary">
									<select>
										<option>&nbsp;1대&nbsp;&nbsp;</option>
										<option>2대</option>
										<option>3대</option>
										<option>4대</option>
										<option>5대</option>
										<option>6대</option>
										<option>7대</option>
										<option>8대</option>
										<option>9대</option>
										<option>10대</option>
									</select>
								</div><br>
							</div>
							<div class="row" style="border:0px solid orange;" align="center">
								<div class="chargediv">
						       		<button style="width:150px;" id="charge_button" type="submit" class="btn btn-info">상담예약</button>
						       	</div>&nbsp;&nbsp;&nbsp;&nbsp;
						       	<div class="chargediv">
						       		<button style="width:150px;" id="charge_button" type="submit" class="btn btn-success">장바구니</button>
						       	</div>&nbsp;&nbsp;&nbsp;&nbsp;
						       	<div class="chargediv">
						       		<button style="width:150px;" id="charge_button" type="submit" class="btn btn-danger">결제하기</button>
						       	</div>&nbsp;&nbsp;&nbsp;&nbsp;
							</div><br>
						</div>
						</c:forEach>
					</div>
					<!-- ***************** -->
					<!-- 상세 정보 영역 끝 -->
					<!-- ***************** -->
				</div>
				<!-- ******************* -->
				<!-- 상세 하단 영역 시작 -->
				<!-- ******************* -->	
				<div style="border:1px solid green;">
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
					asdasd<p>
				</div>
				<!-- ***************** -->
				<!-- 상세 하단 영역 끝 -->
				<!-- ***************** -->		
			</div>
		</div>
		<jsp:include page=".././template/footer.jsp"></jsp:include>	
	</div>
</body>

</html>