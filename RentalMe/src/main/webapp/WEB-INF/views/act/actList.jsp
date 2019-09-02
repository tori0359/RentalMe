<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#actContent{
		height:1000px;
	}
	#actMenuBar{
		text-align:center;
	}
	#actMenuBar td{
		width:200px;
		height:80px;
	}
	#actMenuBar td:hover{
		background:black;
		color:white;
	}
</style>
</head>
<body>
<div id="actContent" class="col-md-10 col-md-offset-1">
<h1>이벤트 경매</h1>
	<div class="col-md-10 col-md-offset-1" align="center">
	<table id="actMenuBar">
		<tr>
			<td>경매 진행중</td>
			<td>경매 종료</td>
		</tr>
	</table>
	<table>
	
	
	</table>
	</div>
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>