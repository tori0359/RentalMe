<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<style type="text/css">
	#head{
		padding-top:50px;
	}
	#contentTable{
		padding-top:60px;
	}
	#btn00{
		float:right;
	}
</style>
</head>
<body>
<div id="head"><h2>이벤트 경매</h2></div>
<div id="contentTable" class="col-md-10 col-md-offset-1">
	<table class="table table-hover">
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
			<td>등록일</td>
			<td></td>
		</tr>
			<c:forEach items="${actList}" var="bean">
				<tr>
					<td><input type="hidden" name="num" value="${bean.gdsCd}"/>${bean.gdsCd}</td>
					<td><a href="#">${bean.gdsNm}</a></td>
					<td>${bean.regDt}</td>
					<td></td>
				</tr>
			</c:forEach>
	</table>
	<div align="center" width="100%">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
					</li>
					    <li><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					 <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
	</div>
				<div id="btn00"><a href="/mp/mng/actInsertPage"><input type="button" id="btn00" value="등록"></a></div>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>