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
#menu-btn11 {

}

/* ---------- 소메뉴 영역 시작 -------- */

/* ---------- 소메뉴 영역 끝 -------- */

/* ---------- 옵션 영역 시작 ---------- */
#option-menu {
	width: 200px;
	background-color: #FFFFAA;
}
#option-price-search {
	width: 400px;
	text-align: right;
	border-left: none;
}
#priceSearchSt {
	width: 100px;
	text-align: right;
}
#priceSearchEd {
	width: 100px;
	text-align: right;
}
#contentSearch {

}
#option-select {
	text-align: center;
}
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

/* --------- BEST 영역 시작 --------- */
/* List style */
ul.thumbnails { 
	list-style: none; 
	margin: 0px 0px 0px 0px;
	padding: 0;
}
li.col-sm-3 {
	padding: 2px 2px 2px 2px;
}
li.col-sm-3:hover {
	border-style: solid;
}
.caption-box h4 {
    font-size: 1.50rem;
    color: #444;
    }
.caption-box h5 {
	text-align: center;
    font-size: 2.00rem;
    color: darkred;
    }
.caption-box p {
	text-decoration:none;
	font-size: 1.25rem;
	color: #999;
}
.caption-box a:link{
	color:#007cd0;
	text-decoration:none;
}
.caption-box a:visited{
	color:#007cd0;
	text-decoration:none;
}
.caption-box a:active{
	color:#007cd0;
	text-decoration:none;
}
.caption-box a:hover{
	color:#007cd0;
	text-decoration:none;
}
.caption-box {
	text-align: left;
}
.btn.btn-mini {
	font-size: 0.63rem;
}

/* Control box */
.control-box {
	width: 100%;
}
.carousel-control {

/* 	background: #666 !important;
	border: 0px;
	border-radius: 0px;
	display: inline-block;
	font-size: 34px;
	font-weight: 200;
	line-height: 18px;
	opacity: 0.5;
	padding: 120px 10px; */

	margin: 120px -55px 0px -55px;
	height: 30px;
	width: 30px;
}

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

</style>
<script type="text/javascript">

	window.onload = function () {
		alert("안쪽 처음");

		// 소메뉴 셋팅
		var sMenu = ${menu};
		menu = sMenu;
		$('#menuBtn'+sMenu).attr('class','btn btn-primary');

		// 옵션 브랜드 셋팅
		var sBrandNm = "${brandNm}";
		$('#optionBrand'+sBrandNm).attr('class', 'label label-primary');

		// 옵션 가격 셋팅(최소)
		var sPriceMin = "${priceMin}";
		$('#optionPriceMin'+sPriceMin).attr('class', 'label label-primary');

		// 옵션 가격 셋팅(절반)
		var sPriceHalf = "${priceHalf}";
		$('#optionPriceHalf'+sPriceHalf).attr('class', 'label label-primary');

		// 옵션 가격 셋팅(최대)
		var sPriceMax = "${priceMax}";
		$('#optionPriceMax'+sPriceMax).attr('class', 'label label-primary');

		// 상품 상태 셋팅
		var sSts = "${sts}";
		$('#optionSts'+sSts).attr('class', 'label label-primary');
		
		// 상품 정렬
		var sSort = "1";
		$('#sort-btn'+sSort).attr('class','active');
		
		alert("안쪽 끝");
	}

	alert("바깥쪽");

	// JSON 방식 서버사이드 list객체 받기
	/*
	<c:forEach items="${path}" var="info">
		//var json = new Object();
		//json.gubunCd = "${info.gubunCd}";
		//json.gdsMclassNm = "${info.gdsMclassNm}";
		//result.push(json);
		menu1 = ${info.gubunCd}
		
	</c:forEach>
	*/

	var menu;
	var brandNm;
	var priceMin;
	var priceHalf;
	var priceMax;
	
	// 소메뉴 선택
	function menuBtnClick(menu) {
		var loc = "/rental/Appli/lg/";
		loc = loc+menu;
		location.href = loc;
	}

	// 브랜드 선택
	function optionBrandBtnClick(brandNm) {
		alert(brandNm);
		alert(menu);
		var loc = "/rental/Appli/lg/";
		loc = loc+menu+"?";
		loc = loc+"brandNm="+brandNm;
		alert(loc);
		location.href = loc
	}

	// 최소가격 선택
	function optionPriceMinBtnClick(price) {
		alert(price);
	}

	// 최대가격 선택
	function optionPriceHalfBtnClick(price) {
		alert(price);
	}

	// 절반가격 선택
	function optionPriceMaxBtnClick(price) {
		alert(price);
	}

	// 상태 선택
	function optionStsBtnClick(sts) {
		alert(sts);
	}
	

	// 정렬
	function sortBtn(num) {
		alert("눌러뜸" + num);
	}
	
</script>
<jsp:include page=".././template/header.jsp"></jsp:include>
</head>
<body>
	
	<div class="content">
	<br>
		<div class="content-inner">
			<div class="content-inner-path" id="cip">
				<c:forEach items="${path }" var="path">
					<br>${path.gdsMclassNm }<br>
				</c:forEach>
			</div>
			<div class="content-inner-menu" id="cim">
				<div class="content-inner-menu-path">
					<c:forEach items="${path }" var="path">
						<br>
						<h4>홈 &nbsp; > &nbsp; ${path.gdsMclassNm }
							<c:if test="${not empty path.gdsSclassNm}">
								 &nbsp; > &nbsp; ${ path.gdsSclassNm }
							</c:if>
						</h4>
					</c:forEach>
				</div>
				<!-- **************** -->
				<!-- 소메뉴 영역 시작 -->
				<!-- **************** -->
				<c:set var="list1Length" value="${fn:length(list1)}"></c:set>
				<c:set var="list1Q" value="${list1Length/5 }"></c:set>
				<c:set var="list1R" value="${list1Length%5 }"></c:set>
				<c:set var="roopCnt" value="1"></c:set>
				<c:set var="list1QR" value="${5 - list1R }"></c:set>
				
				<!-- 임시 test용 
				<c:out value="${list1Length }"></c:out>
				<c:out value="${list1Q }"></c:out>
				<c:out value="${list1R }"></c:out>	
				<c:out value="${list1QR }"></c:out>						
				 -->
				
				<!-- 소메뉴 list 반복문 -->						
				<c:forEach items="${list1}" var="list1Row" begin="0" end="${list1Length }" step="5" varStatus="status1Row">
					<div class="btn-group btn-group-justified" role="group">
					<c:if test="${roopCnt == 1 }">
						<c:set var="roopCnt" value="${roopCnt+1 }"></c:set>
					</c:if>
					<c:if test="${status1Row.count <= 2 }">
						<c:forEach items="${list1}" var="list1Co1" begin="0" end="10" varStatus="status1Col">
							<c:if test="${status1Row.count == 1 && status1Col.count <= 5}">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default" id="menuBtn${list1Co1.gdsSclassCd }" onclick="menuBtnClick(${list1Co1.gdsSclassCd });"><h4>${list1Co1.gdsSclassNm }</h4></button>
								</div>
							</c:if>
							<c:if test="${status1Row.count == 2 && status1Col.count >=6 }">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default" id="menuBtn${list1Co1.gdsSclassCd }" onclick="menuBtnClick(${list1Co1.gdsSclassCd });"><h4>${list1Co1.gdsSclassNm }</h4></button>
								</div>
							</c:if>
							<c:if test="${list1Q < 1 && status1Col.count == list1Length }">
								<c:forEach items="${list1 }" var="list1Blank" begin="0" end="${list1QR - 1 }">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-default" id="menuBtn${list1Co1.gdsSclassCd }" onclick="menuBtnClick(${list1Co1.gdsSclassCd });"><h4><br></h4></button>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${list1Q > 1 && list1Q < 2 && status1Row.count == 2 && status1Col.count == list1Length }">
								<c:forEach items="${list1 }" var="list1Blank" begin="0" end="${list1QR - 1 }">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-default" id="menuBtn${list1Co1.gdsSclassCd }" onclick="menuBtnClick(${list1Co1.gdsSclassCd });" }><h4><br></h4></button>
									</div>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>
					</div>
				</c:forEach>
				<!-- ************** -->
				<!-- 소메뉴 영역 끝 -->
				<!-- ************** -->
			</div>
			<br>
			<div class="content-inner-option">
				<table class="table table-bordered">
					<tr class="active">option111</tr>
					<!-- ************** -->
					<!-- 옵션 영역 시작 -->
					<!-- ************** -->
					<tr>
						<th class="active" id="option-menu">브랜드</th>
						<td colspan="2">
							<c:forEach items="${list2}" var="list2" varStatus="status">
								<span class="label label-default" id="optionBrand${list2.brandNm }" onClick="optionBrandBtnClick('${list2.brandNm }');">${list2.brandNm }</span>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th class="active" id="option-price">가격</th>
						<td>
							<c:forEach items="${list3}" var="list3">
								<span class="label label-default" id="optionPriceMin${list3.priceMin }" onClick="optionPriceMinBtnClick('${list3.priceMin}');">~ <fmt:setLocale value="ko_KR"></fmt:setLocale>
									<fmt:formatNumber type="currency" value="${list3.priceMin}"></fmt:formatNumber>
								</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="label label-default" id="optionPriceHalf${list3.priceMin }to${list3.priceMax}" onClick="optionPriceHalfBtnClick('${list3.priceMin}to${list3.priceMax }');"><fmt:setLocale value="ko_KR"></fmt:setLocale>
									<fmt:formatNumber type="currency" value="${list3.priceMin}" />
											 ~ <fmt:formatNumber type="currency" value="${list3.priceMax}"></fmt:formatNumber>
								</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="label label-default" id="optionPriceMax${list3.priceMax }" onClick="optionPriceMaxBtnClick('${list3.priceMax}');"><fmt:setLocale value="ko_KR"/>
									<fmt:formatNumber type="currency" value="${list3.priceMax}" /> ~
								</span>
							</c:forEach>
						</td>
						<td id="option-price-search">
							<form class="form-inline">
								<div class="form-group">
									<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
									<div class="input-group">
										<div class="input-group-addon">직접입력</div>
										<input type="text" class="form-control" id="priceSearchSt" placeholder="0">
									</div>
									~
									<div class="input-group">
										<input type="text" class="form-control" id="priceSearchEd" placeholder="0">
									</div>
								</div>
								<button type="submit" class="btn btn-success">검색</button>
							</form>
						</td>
					</tr>
					<tr>
						<th class="active" id="option-status">상태</th>
							<td>
								<span class="label label-default" id="optionStsN" onClick="optionStsBtnClick('N');">새상품</span>
								<span class="label label-default" id="optionStsU" onClick="optionStsBtnClick('U');">중고상품</span>
							</td>
					</tr>
					<tr>
						<th class="active" id="option-result">결과 내 검색</th>
						<td colspan="2">
							<form class="form-inline">
								<div class="form-group">
									<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
									<div class="input-group">
										<input type="text" class="form-control" id="contentSearch" placeholder="결과 내 검색">
									</div>
								</div>
								<button type="submit" class="btn btn-success">검색</button>
							</form>							
						</td>
					</tr>
					<tr>
						<th id="option-select">전체해제</th>
						<td colspan="2">
							<a href="#">선택1</a>
							<a href="#">선택2</a>
							<a href="#">선택3</a>
							<a href="#">선택4</a>
							<a href="#">선택5</a>									
						</td>
					</tr>
					<!-- ************ -->
					<!-- 옵션 영역 끝 -->
					<!-- ************ -->
				</table>
			</div>
			<br>
			<!-- 중메뉴선택이냐 소메뉴선택이냐에 따라 BEST 캐러셀 표시여부 조건-->
			<c:forEach items="${path }" var="path1">
			<c:if test="${empty path1.gdsSclassNm}">
			<div class="content-inner-best">
				<h1>BEST 인기상품</h1>
				<div class="content-inner-best-path">
					<c:forEach items="${path }" var="path2">
						${path2.gdsMclassNm }
					</c:forEach>
				</div>
				<br>
				<!-- ********************* -->
				<!-- BEST 캐러셀 영역 시작 -->
				<!-- ********************* -->
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div id="myCarousel" class="row carousel slide" data-ride="carousel">
								<!-- Wrapper for slides -->
								<div class="carousel-inner">
									<!-- /Slide1 -->
									<div class="item active">
										<ul class="thumbnails">
										<c:forEach items="${list4 }" var="list4" end="3">	
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src=${list4.img1 } alt=""></a>
												</div>
												<div class="caption-box">
													<a href="#">
														<p>${list4.brandNm }</p>
														<h4>${list4.gdsNm }</h4>
														<h4>모델명 : ${list4.modelNm }</h4>
														<fmt:setLocale value="ko_KR"></fmt:setLocale>
														<h5><fmt:formatNumber type="currency" value="${list4.gdsPrice }"></fmt:formatNumber>(월)</h5>
													</a>
												</div>
											</li>
											</c:forEach>
										</ul>
									</div>
									<!-- /Slide2 -->
									<c:if test="${fn:length(list4) > 4}" >
									<div class="item">
										<ul class="thumbnails">
											<c:forEach items="${list4 }" var="list4" begin="4" end="7">
											<li class="col-sm-3">
											
												<div class="thumbnail">
													<a href="#"><img src=${list4.img1 } alt=""></a>
												</div>
												<div class="caption-box">
													<a href="#">
														<p>${list4.brandNm }</p>
														<h4>${list4.gdsNm }</h4>
														<h4>모델명 : ${list4.modelNm }</h4>
														<fmt:setLocale value="ko_KR"></fmt:setLocale>
														<h5><fmt:formatNumber type="currency" value="${list4.gdsPrice }"></fmt:formatNumber>(월)</h5>
													</a>
												</div>
											</li>
											</c:forEach>
										</ul>
									</div>
									</c:if>
								</div>
								
								<!-- /Wrapper for slides .carousel-inner -->
								
								<!-- Control box -->
								<div class="control-box">
									<a data-slide="prev" href="#myCarousel"
										class="carousel-control left">‹</a> <a data-slide="next"
										href="#myCarousel" class="carousel-control right">›</a>
								</div>
								<!-- /.control-box -->
							</div>
							<!-- /#myCarousel -->
						</div>
						<!-- /.col-sm-12 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container -->
				<!-- ******************* -->
				<!-- BEST 캐러셀 영역 끝 -->
				<!-- ******************* -->
			</div>
			</c:if>
			</c:forEach>
			<div class="content-inner-sort">
			<br><br><br>
				<!-- ******************* -->
				<!-- 정렬 메뉴 영역 시작 -->
				<!-- ******************* -->
				<ul class="nav nav-tabs nav-justified">
				  <li role="presentation" id="sort-btn1" onClick="sortBtn(1);"><a href="#">인기순</a></li>
				  <li role="presentation" id="sort-btn1" onClick="sortBtn(2);"><a href="#">최신순</a></li>
				  <li role="presentation" id="sort-btn1" onClick="sortBtn(3);"><a href="#">낮은가격순</a></li>
				  <li role="presentation" id="sort-btn1" onClick="sortBtn(4);"><a href="#">높은가격순</a></li>
				  <li role="presentation" id="sort-btn1" onClick="sortBtn(5);"><a href="#">판매량순</a></li>
				  <li role="presentation" id="sort-btn1" onClick="sortBtn(6);"><a href="#">리뷰 많은순</a></li>
				</ul>
				<!-- ***************** -->
				<!-- 정렬 메뉴 영역 끝 -->
				<!-- ***************** -->
			</div>
			<div class="content-inner-list">
			<br>
				<!-- **************** -->
				<!-- 리스트 영역 시작 -->
				<!-- **************** -->
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div id="myCarousel" class="row carousel slide" data-ride="carousel">
								<!-- /list1 row -->
								<div>
									<ul class="thumbnails">
										<c:forEach items="${list5 }" var="list5">
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src=${list5.img1 } alt=""></a>
											</div>
											<div class="caption-box">
												<a href="#">
													<p>${list5.brandNm }</p>
													<h4>${list5.gdsNm }</h4>
													<h4>모델명 : ${list5.modelNm }</h4>
													<fmt:setLocale value="ko_KR"></fmt:setLocale>
													<h5><fmt:formatNumber type="currency" value="${list5.gdsPrice }"></fmt:formatNumber>(월)</h5>
													<br>
												</a>
											</div>
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<!-- /#myCarousel -->
						</div>
						<!-- /.col-sm-12 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- ************** -->
				<!-- 리스트 영역 끝 -->
				<!-- ************** -->
			</div>
		</div>
		<jsp:include page=".././template/footer.jsp"></jsp:include>	
	</div>
</body>

</html>