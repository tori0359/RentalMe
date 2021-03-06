<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
<style type="text/css">

/*폰트설정*/
@font-face {
	font-family: "altair";
	src:
		url("${pageContext.request.contextPath}/fonts/altair.extrabold-italic.ttf")
		format("truetype");
	font-style: normal;
}

@font-face {
	font-family: "hanserif";
	src:
		url("${pageContext.request.contextPath}/fonts/SourceHanSerifK-Medium.otf")
		format("opentype");
	font-style: normal;
}

@font-face { /*한글 보통 폰트*/
	font-family: "nanumR";
	src: url("${pageContext.request.contextPath}/fonts/NanumSquare_acL.ttf")
		format("truetype");
	font-style: normal;
}

@font-face { /*한글 진한 폰트*/
	font-family: "nanumB";
	src: url("${pageContext.request.contextPath}/fonts/NanumSquare_acR.ttf")
		format("truetype");
	font-style: normal;
}

@font-face { /*한글 더두꺼운 폰트*/
	font-family: "nanumEB";
	src:
		url("${pageContext.request.contextPath}/fonts/NanumSquare_acEB.ttf")
		format("truetype");
	font-style: normal;
}

#wrap {
	min-height: 100%;
	position: relative;
}

.navbar-default .navbar-nav>.open>a {
	color: black;
	background: white;
}

.hr {
	height: 1px;
	width: 100%;
	background-color: lightgrey;
}

#subtitle>a {
	font-family: "altair";
	color: white;
	font-size: 45pt;
	font-style: italic;
}

#subtitle>a:hover {
	text-decoration: none;
}

#subtitle>h4 {
	font-family: "hanserif";
	color: lightgrey;
}

.navbar-link:hover, .navbar-link:active {
	font-weight: bolder;
	text-decoration: none;
	color: white;
}

.navbar-link:visited, .navbar-link:link {
	text-decoration: none;
	color: white;
}
 #wrap{
            min-height:100%;
            position:relative;
         }
.navtitle {
	padding: 1px;
	background-color: black;
	width: 100%;
}

.menu {
	width: 100%;
	height: 45px;
	position: relative;
	z-index: 2;
}

.login {
	width: 100%;
	background-color: black;
}

.navbar-text>a {
	font-family: nanumB;
	color: black;
}

.dropdown-menu, .dropdown-menu a {
	font-size: 14px;
	font-weight: bold;
	font-family: "nanumB";
}

.dropdown.open .dropdown-menu {
	max-height: 400px;
	opacity: 1;
}

.nav a {
	font-family: "nanumB";
	font-weight: 600;
	font-size: 11pt;
	display: block;
}

.nav a:hover {
	font-weight: 900;
}

.navbar { /*메뉴바 흰색*/
	background-color: white;
}

.navbar-header {
	background-color: white;
}

.container-fluid {
	background-color: white;
}

.navbar .navbar-nav {
	display: inline-block;
	float: none;
}

.navbar .navbar-collapse {
	text-align: center;
}

.navbar-text a {
	color: white;
}

.navbar-text {
	color: white;
}

.dropdown:hover .dropdown-menu {
	/* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: auto;
}

.login {
	background: black;
	width: 100%;
}

.dropdown-menu>a:hover, .dropdown-menu>a:active {
	/* 중고거래 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: white;
	font-weight: bolder;
	background: #E7A602;
	text-decoration: none;
}

.dropdown-menu a { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d;
	background-color: white;
	margin-top: -1px;
}

.dropdown-menu>li a {
	text-align: center;
	height: 40px;
	line-height: 40px;
}

#content {
	font-family: "nanumB";
	font-size: 15px;
	color: black;
	/*border: 1px solid black;*/ /*나중에 주석처리 해야함*/
	padding-top: 50px;
	height: 100%;
	position: relative;
	z-index: 1;
}

#content>div {
	
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
	<div>
		<div class="login container-fluid">
			<div class="col-md-11">
				<p class="navbar-text navbar-right">
					<a href="#" class="navbar-link">로그인</a> ㅣ <a href="/join/signup"
						class="navbar-link">회원가입</a>
				</p>
			</div>
		</div>
		<div class="navtitle">
			<div id="title" class="text-center">
				<h1>
					<div id="subtitle">
						<!--<h4>자취생들을 위한</h4>-->
						<a href="#">Rental<br/>Me
						</a>
					</div>
				</h1>
			</div>
		</div>
		<div></div>
		<div class="menu">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a href="#" id="bigmenu"
								class="dropdown-toggle" data-toggle="dropdown">대형가전 렌탈</a>
								<ul class="dropdown-menu">
									<li><a href="/rental/Appli/lg/s11">에어컨</a></li>
									<li><a href="/rental/Appli/lg/s12">냉난방기</a></li>
									<li><a href="#">냉장고</a></li>
									<li><a href="#">TV</a></li>
									<li><a href="#">세탁기</a></li>
									<li><a href="#">빨래건조기</a></li>
									<li><a href="#">정수기</a></li>
									<li><a href="#">공기청정기</a></li>
									<li><a href="#">복합기,프린터</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								aria-haspopup="true" aria-expanded="false"
								data-toggle="dropdown">소형가전 렌탈</a>
								<ul class="dropdown-menu">
									<li><a href="#">커피머신</a></li>
									<li><a href="#">제습기</a></li>
									<li><a href="#">청소기</a></li>
									<li><a href="#">드라이어</a></li>
									<li><a href="#">빔프로젝터</a></li>
									<li><a href="#">컴퓨터,노트북</a></li>
									<li><a href="#">무선스피커</a></li>
									<li><a href="#">비데</a></li>
									<li><a href="#">면도기</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false"
								data-toggle="dropdown">주방가전 렌탈</a>
								<ul class="dropdown-menu">
									<li><a href="#">음식물 처리기</a></li>
									<li><a href="#">제빙기</a></li>
									<li><a href="#">전자레인지</a></li>
									<li><a href="#">에어프라이어</a></li>
									<li><a href="#">오븐</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false"
								data-toggle="dropdown">가구 렌탈</a>
								<ul class="dropdown-menu">
									<li><a href="#">침대</a></li>
									<li><a href="#">매트리스</a></li>
									<li><a href="#">쇼파</a></li>
									<li><a href="#">책상</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false"
								data-toggle="dropdown">기타 렌탈</a>
								<ul class="dropdown-menu">
									<li><a href="#">악기</a></li>
									<li><a href="#">명품</a></li>
									<li><a href="#">귀금속</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false"
								data-toggle="dropdown">패키지 렌탈</a>
								<ul class="dropdown-menu">
									<li><a href="#">침실 패키지</a></li>
									<li><a href="#">주방 패키지</a></li>
									<li><a href="#">욕실 패키지</a></li>
									<li><a href="#">기타 패키지</a></li>
								</ul></li>
							<li style="font-family: nanumB; padding: 12px; font-size: 13pt;"
								class="etc">ㅣ</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false"
								data-toggle="dropdown">중고거래</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false"
								data-toggle="dropdown">이벤트 경매</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false"
								data-toggle="dropdown">고객센터</a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
	</div>
	<div id="wrap">
</body>
</html> --%>