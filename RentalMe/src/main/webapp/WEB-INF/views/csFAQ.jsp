<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#noticeBar td:nth-child(1)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
				
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(2)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(3)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(2)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(1)").click(function(){
				location.replace("/rentalme/");
			});
			$("#noticeBar td:nth-child(3)").click(function(){
				location.replace("/rentalme/csInquiry");
			});
			
		})
	</script>
	<style type="text/css">
		#noticeBar td:nth-child(2){
			background:black;
			color:white;
		}
		#noticeBar td:nth-child(1){
			background:white;
			color:black;
		}
		#content{
			margin-top: 0px;
			padding-top: 10px;
		}
		#noticeMenuBar button{
			
		}
		#noticeMenuBar td:nth-child(n){
			border:1px solid;
			border-color:beige;
			width:80px;
			height:30px;
			margin: 0px 5px 0px 5px;
			background:white;
			text-align: center;
			text-decoration:none;
		}
		#noticeMenuBar td:nth-child(n):hover{
			background:black;
			color:white;
		}
		#noticeMenuBar td:nth-child(1){
			background: black;
			color:white;
		}
	</style>
</head>
<body>
<div>
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
</div>

<div class="hr">
	
	
</div>
<div id="noticeBar" class="col-md-10 col-md-offset-1">
	<table>
		<tr>
			<td>공지사항</td>
			<td>FAQ</td>
			<td>1:1문의</td>
		</tr>
	</table>
	
<br/><br/><br/><br/><br/>
</div>
<div class="col-md-7 col-md-offset-1">
	<table id="noticeMenuBar">
		<tr>
			<td>전체보기</td>
			<td>주문</td>
			<td>배송</td>
			<td>결제</td>
			<td>교환취소</td>
			<td>회원정보</td>
			<td>기타</td>
		</tr>
	</table>
</div>
<div id="content" class="col-md-10 col-md-offset-1">
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
		</tr>
		<c:forEach items="${alist}" var="bean">
			<tr>
				<td>${bean.num }</td>
				<td>${bean.category }</td>
				<td>${bean.sub }</td>
			</tr>
		</c:forEach>
	
	</table>
</div>
</body>
</html>


























































