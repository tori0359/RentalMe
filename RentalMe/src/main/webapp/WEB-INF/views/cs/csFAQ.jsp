<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<html>
<head>
<jsp:include page="../template/headerRe.jsp"></jsp:include>
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
				location.replace("/rentalme/cs/csNotice");
			});
			$("#noticeBar td:nth-child(3)").click(function(){
				location.replace("/rentalme/cs/csInquiry");
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
		#csContent{
			height:800px;
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
<div class="hr">
	
	
</div>
<div id="csContent">
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
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>


























































