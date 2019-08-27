<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content {
		height: 800px;
	}
</style>
<jsp:include page="./template/header.jsp"></jsp:include>
</head>
<body>
	<div class="content">
		<h1>메인페이지</h1>
		<form action="/used">
			<input type="hidden" name="gdsLclassCd" value="20">
			<input type="hidden" name="gdsMclassCd" value="10">
			<input type="hidden" name="modelNm" value="">			
			<input type="hidden" name="align" value="1">			
			<button type="submit">중고거래</button>
		</form>
	</div>
</body>
<jsp:include page="./template/footer.jsp"></jsp:include>
</html>