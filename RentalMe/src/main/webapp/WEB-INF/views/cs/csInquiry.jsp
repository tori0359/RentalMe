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
			$("#noticeBar td:nth-child(1)").css("background","white").css("color","black");
			$("#noticeBar td:nth-child(3)").css("background","black").css("color","white");
			$("#noticeBar td:nth-child(1)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
				
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(3)").css("background","black").css("color","white");
			});
			
			$("#noticeBar td:nth-child(2)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(3)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(1)").click(function(){
				location.replace("/rentalme/cs/csNotice");
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
	</style>
	<jsp:include page="../template/headerRe.jsp"></jsp:include>
</head>
<body>
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
	
</div>
<div id="content" class="col-md-10 col-md-offset-2">
	<h1>1:1문의</h1>
	<br/><br/><br/><br/><br/><br/>
</div>
<div>
	
</div>
<div id="conetent1" class="col-md-6 col-md-offset-2">
	FAQ를 통해 충분한 답변을 얻지 못하셨다면 '문의하기'버튼을 클릭하세요<br/>
	1:1문의를 통해 상세히 답변드리겠습니다.
</div>
<div class="col-md-2">
	<button type="button" class="btn btn-default btn-lg">문의하기</button>
</div>


</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>





























