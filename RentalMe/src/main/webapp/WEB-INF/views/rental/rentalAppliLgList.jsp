<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.content-inner-path {

}
.content-inner-menu {
	text-align: center;
}

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

<jsp:include page=".././template/headerRe.jsp"></jsp:include>
</head>
<body>
	<div class="content">
	<br>
		<div class="content-inner">
			<div class="content-inner-path">
				<h1>$PATH경로</h1>
			</div>
			<div class="content-inner-menu">
				<h1>$PATH대형가전렌탈</h1>
				<!-- **************** -->
				<!-- 소메뉴 영역 시작 -->
				<!-- **************** -->
				<div class="btn-group btn-group-justified" role="group"aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$에어컨</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$냉난방기</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$냉장고</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$4</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$5</button>
					</div>
				</div>
				<div class="btn-group btn-group-justified" role="group"aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$6</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$7</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$8</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$9</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$10</button>
					</div>
				</div>
				<div class="btn-group btn-group-justified" role="group"aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$11</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$12</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$13</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$14</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">$15</button>
					</div>
				</div>
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
							<a href="#">$에어컨</a>
							<a href="#">$냉난방기</a>
							<a href="#">$DTV</a>
							<a href="#">$세탁기...</a>
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
				<h1>$에어컨</h1>
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
													<a href="#"><img src="../../imgs/sample1.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨1</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../imgs/sample2.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨2</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../imgs/sample3.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨3</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../imgs/sample4.jpg" alt=""></a>
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
													<a href="#"><img src="../../imgs/sample5.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨5</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../imgs/sample6.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨6</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../imgs/sample7.jpg" alt=""></a>
												</div>
												<div class="caption-box">
													<h4>에어컨7</h4>
													<p>블라블라~</p>
													<a class="btn btn-success btn-mini" href="#">상세보기</a>
												</div>
											</li>
											<li class="col-sm-3">
												<div class="thumbnail">
													<a href="#"><img src="../../imgs/sample8.jpg" alt=""></a>
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
			<br><br>
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
												<a href="#"><img src="../../imgs/sample1.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨1</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../imgs/sample2.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨2</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../imgs/sample3.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨3</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../imgs/sample4.jpg" alt=""></a>
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
												<a href="#"><img src="../../imgs/sample5.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨5</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../imgs/sample6.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨6</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../imgs/sample7.jpg" alt=""></a>
											</div>
											<div class="caption-box">
												<h4>에어컨7</h4>
												<p>블라블라~</p>
												<a class="btn btn-success btn-mini" href="#">상세보기</a>
											</div>
										</li>
										<li class="col-sm-3">
											<div class="thumbnail">
												<a href="#"><img src="../../imgs/sample8.jpg" alt=""></a>
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
			</div>
		</div>
		<jsp:include page=".././template/footer.jsp"></jsp:include>	
	</div>
</body>

</html>