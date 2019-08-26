<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    font-size: 0.94rem;
    color: #444;
    }
.caption-box p {
	font-size: 0.75rem;
	color: #999;
}
.caption-box {
	text-align: center;
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

	$('.btn .btn-default').on('click', function() {
		$(this).addClass('active');
	})

	function menu_btn_click(num) {

		if(num == 11) {
			alert("11번");
		} else if(num == 12) {
			alert("12번");
		} else {
			alert("기타");
		}
		
	}
</script>
<jsp:include page=".././template/header.jsp"></jsp:include>
</head>
<body>
	<div class="content">
	<br>
		<div class="content-inner">
			<div class="content-inner-path" id="cip">
				<c:forEach items="${path }" var="path1">
					<br>${path1.gdsMclassNm }<br>
				</c:forEach>
			</div>
			<div class="content-inner-menu" id="cim">
				<div class="content-inner-menu-path">
					<c:forEach items="${path }" var="path2">
						<br><h4>홈 &nbsp; > &nbsp; ${path2.gdsMclassNm } &nbsp; > &nbsp; ${path2.gdsSclassNm }</h4>
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
									<button type="button" class="btn btn-default" id="menu-btn${list1Co1.gdsSclassCd }" onclick="menu_btn_click(${list1Co1.gdsSclassCd });"><h4>${list1Co1.gdsSclassNm }</h4></button>
								</div>
							</c:if>
							<c:if test="${status1Row.count == 2 && status1Col.count >=6 }">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default" id="menu-btn${list1Co1.gdsSclassCd }" onclick="menu_btn_click(${list1Co1.gdsSclassCd });"><h4>${list1Co1.gdsSclassNm }</h4></button>
								</div>
							</c:if>
							<c:if test="${list1Q < 1 && status1Col.count == list1Length }">
								<c:forEach items="${list1 }" var="list1Blank" begin="0" end="${list1QR - 1 }">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-default" id="menu-btn${list1Co1.gdsSclassCd }" onclick="menu_btn_click(${list1Co1.gdsSclassCd });"><h4><br></h4></button>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${list1Q > 1 && list1Q < 2 && status1Row.count == 2 && status1Col.count == list1Length }">
								<c:forEach items="${list1 }" var="list1Blank" begin="0" end="${list1QR - 1 }">
									<div class="btn-group" role="group">
										<button type="button" class="btn btn-default" id="menu-btn${list1Co1.gdsSclassCd }" onclick="menu_btn_click(${list1Co1.gdsSclassCd });"><h4><br></h4></button>
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
							<c:forEach items="${list2}" var="bean2">
									<a href="#">${bean2.brandNm}</a>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th class="active" id="option-price">가격</th>
						<td>
							<a href="#">3만원이하</a>
							<a href="#">3만 ~ 5만원</a>
							<a href="#">5만원이상</a>
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
								<button type="submit" class="btn btn-primary">검색</button>
							</form>
						</td>
					</tr>
					<tr>
						<th class="active" id="option-status">상태</th>
						<td colspan="2">
							<a href="#">새상품</a>
							<a href="#">중고상품</a>
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
								<button type="submit" class="btn btn-primary">검색</button>
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
			<div class="content-inner-best">
				<h1>BEST 인기상품</h1>
				<div class="content-inner-best-path">
					<c:forEach items="${path }" var="path3">
						${path3.gdsSclassNm }
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
									<div class="item active">
										<ul class="thumbnails">
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../../../imgs/sample1.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨1</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../../imgs/sample2.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨2</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../../imgs/sample3.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨3</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../../imgs/sample4.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨4</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
										</ul>
									</div>
									<!-- /Slide1 -->
									<div class="item">
										<ul class="thumbnails">
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../../imgs/sample5.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨5</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../../imgs/sample6.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨6</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../../imgs/sample7.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨7</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../../imgs/sample8.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨8</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
										</ul>
									</div>
									<!-- /Slide2 -->
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
			<div class="content-inner-sort">
			<br><br><br>
				<!-- ******************* -->
				<!-- 정렬 메뉴 영역 시작 -->
				<!-- ******************* -->
				<ul class="nav nav nav-tabs nav-justified">
				  <li role="presentation" ><a href="#">인기순</a></li>
				  <li role="presentation" ><a href="#">최신순</a></li>
				  <li role="presentation" class="active"><a href="#">낮은가격순</a></li>
				  <li role="presentation" ><a href="#">높은가격순</a></li>
				  <li role="presentation" ><a href="#">판매량순</a></li>
				  <li role="presentation" ><a href="#">리뷰 많은순</a></li>
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
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../../imgs/sample1.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨1</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../../imgs/sample2.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨2</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../../imgs/sample3.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨3</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../../imgs/sample4.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨4</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
									</ul>
								</div>
								<!-- /list2 row -->
								<br>&nbsp;<br>&nbsp;
								<div>
									<ul class="thumbnails">
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../../imgs/sample5.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨5</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../../imgs/sample6.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨6</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../../imgs/sample7.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨7</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../../imgs/sample8.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨8</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
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
				<table>
				<c:forEach items="${list1}" var="bean1">
				<tr>
					<td>${bean1.gdsSclassCd}</td>
					<td>${bean1.gdsSclassNm}</td>
				</tr>
				</c:forEach>
				<tr>
					<td>-경계-</td>
				</tr>
				<c:forEach items="${list2}" var="bean2">
				<tr>
					<td>${bean2.brandNm}</td>
				</tr>
				</c:forEach>
				</table>
			</div>
		</div>
		<jsp:include page=".././template/footer.jsp"></jsp:include>	
	</div>
</body>

</html>