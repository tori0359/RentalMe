<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/header.jsp"></jsp:include>
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
</head>
<body>
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
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>