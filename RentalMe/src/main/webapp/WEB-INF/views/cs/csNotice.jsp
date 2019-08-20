<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!Doctype html>
<html>
<head>
    <meta charset="UTF-8">
	<jsp:include page="../template/headerRe.jsp"></jsp:include>
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
				location.replace("/rentalme/cs/csInquiry");
			});
			$("#noticeBar td:nth-child(2)").click(function(){
				location.replace("/rentalme/cs/csFAQ");
			});
		})
	</script>
	<style type="text/css">
		#noticeBar table{
			margin-top: 80px;
			font-size:20px;
		}
		#noticeBar td:nth-child(1){
			border-bottom-left-radius: 10px;
			border-top-left-radius: 10px;
			color:white;
			background:black;
			width:34%;
			text-align: center;
		}
		#noticeBar td:nth-child(2){
			background:white;
			border-left:0.1px solid;
			border-right:0.1px solid;
			width:33%;
			text-align: center;
		}
		#noticeBar td:nth-child(3){
			border-bottom-right-radius: 10px;
			border-top-right-radius: 10px;
			background:white;
			width:33%;
			text-align: center;
		}
		#noticeBar>table{
			width:100%;
			height:50px;
		}
		#content>table>tr>th:nth-child(1){
			width:20%;
			background:blue;
		}
		#content>table>tr>th:nth-child(2){
			width:60%;
		}
		#content>table>tr>th:nth-child(3){
			width:20%;
		}
		#csContent{
			height:800px;
		}
	</style>
</head>
<body>
<div id="csContent">

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

</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>





























