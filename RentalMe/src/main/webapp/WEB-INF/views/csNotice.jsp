<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!Doctype html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/rentalme/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/rentalme/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="/rentalme/css/header.css">
	<script type="text/javascript" src="/rentalme/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/rentalme/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#noticeBar td:nth-child(2)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
				
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(1)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(3)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(1)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(3)").click(function(){
				location.replace("/rentalme/csInquiry");
			});
			$("#noticeBar td:nth-child(2)").click(function(){
				location.replace("/rentalme/csFAQ");
			});
		})
	</script>
	<style type="text/css">

	</style>
</head>
<body>
 <div class="row">
  <div>

	 <div class="container">
	 	<div class="col-md-12">
		<p class="navbar-text navbar-right"> 
		<a href="#" class="navbar-link">로그인</a> ㅣ
		<a href="#" class="navbar-link">회원가입</a></p>
		</div>
	 </div>
	  <div class="navtitle">
				  <div id="title" class="text-center">
				 
						<div id="subtitle">
							<!--<h4>자취생들을 위한</h4>-->
							<a href="#">Rental<br/>Me</a>
						</div> 
				  	
				  </div>
		</div>
	<div>
	</div>
  </div>
  </div>

<div class="menu" >
<div class="container-fluid">

	<div class="col-md-10 col-md-offset-1">
	<nav  id="topMenu"  > 
		<ul> 
			<li class="topMenuLi"> 
				<a class="menuLink" href="#">대형가전 렌탈</a> 
				<ul class="submenu"> 
					<li><a href="#">에어컨</a></li> 
					<li><a href="#">냉난방기</a></li> 
					<li><a href="#">냉장고</a></li>
					<li><a href="#">TV</a></li>
					<li><a href="#">세탁기</a></li>
					<li><a href="#">빨래건조기</a></li>
					<li><a href="#">정수기</a></li>
					<li><a href="#">공기청정기</a></li>
					<li><a href="#">복합기,프린터</a></li>
				</ul> 
			</li>
			<li class="topMenuLi"> 
				<a class="menuLink" href="#">소형가전 렌탈</a> 
				<ul class="submenu"> 
					<li><a href="#">커피머신</a></li> 
					<li><a href="#">제습기</a></li> 
					<li><a href="#">청소기</a></li>
					<li><a href="#">드라이어</a></li>
					<li><a href="#">빔프로젝터</a></li>
					<li><a href="#">컴퓨터,노트북</a></li>
					<li><a href="#">무선스피커</a></li>
					<li><a href="#">비데</a></li>
					<li><a href="#">면도기</a></li>
				</ul> 
			</li> 
			<li class="topMenuLi"> 
				<a class="menuLink" href="#">주방가전 렌탈</a> 
				<ul class="submenu"> 
					<li><a href="#">음식물 처리기</a></li> 
					<li><a href="#">제빙기</a></li> 
					<li><a href="#">전자레인지</a></li>
					<li><a href="#">에어프라이어</a></li>
					<li><a href="#">오븐</a></li>
				</ul> 
			</li>
			<li class="topMenuLi"> 
				<a class="menuLink" href="#">가구 렌탈</a> 
				<ul class="submenu"> 
					<li><a href="#">침대</a></li> 
					<li><a href="#">매트리스</a></li> 
					<li><a href="#">쇼파</a></li> 
					<li><a href="#">책상</a></li>
				</ul> 
			</li> 
			<li class="topMenuLi"> 
				<a class="menuLink" href="#">기타 렌탈</a>
				<ul class="submenu"> 
					<li><a href="#">악기</a></li> 
					<li><a href="#">명품</a></li> 
					<li><a href="#">귀금속</a></li> 
				</ul>  
			</li>
			<li class="topMenuLi"> 
				<a class="menuLink" href="#">패키지 렌탈</a>
				<ul class="submenu"> 
					<li><a href="#">침실 패키지</a></li> 
					<li><a href="#">주방 패키지</a></li> 
					<li><a href="#">욕실 패키지</a></li>
					<li><a href="#">기타 패키지</a></li> 
				</ul>   
			</li><li style="font-family: nanumB; padding: 7px; font-size: 15pt;" >ㅣ</li>
			<li class="topMenuLi2"> 
				<a class="menuLink" href="#">중고거래</a>  
			</li> 
			<li class="topMenuLi2"> 
				<a class="menuLink" href="#">이벤트 경매</a>  
			</li> 
			<li class="topMenuLi"> 
				<a class="menuLink" href="#">고객센터</a>  
			</li> 
		</ul> 
		
	</nav>
	</div>
 </div>
</div>

<div class="hr">
	
</div>
<div id="noticeBar" class="col-md-10 col-md-offset-1">
	<table>
		<tr>
			<td>공지사항</td>
			<td><form action="">FAQ</form></td>
			<td><form action="csInquiry">1:1문의</form></td>
		</tr>
	</table>
	
</div>
<div id="content" class="col-md-10 col-md-offset-1">
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
			<c:forEach items='${alist}' var="bean">
				<tr>
					<td>${bean.num }</td>
					<td>${bean.sub }</td>
					<td>${bean.nalja }</td>
				</tr>
			</c:forEach>
	</table>
</div>

</body>
</html>





























