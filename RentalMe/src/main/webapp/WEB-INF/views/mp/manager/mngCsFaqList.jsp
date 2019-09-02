<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
	$(document).ready(function(){
	

	});
</script>
<style type="text/css">
	#btn00{
		text-align:right;
	}
	
</style>
<title>Insert title here</title>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>
<c:choose>
<c:when test="${id eq 'minminad' }">
<!-- 관리자 공지게시판 리스트 -->
<h1>공지/FAQ</h1>
<div id="content" class="col-md-10 col-md-offset-1">
<div align="right"><a href="${pageContext.request.contextPath}/mp/mng/csNoticeList">[공지사항]</a>&nbsp&nbsp&nbsp<a href="${pageContext.request.contextPath}/mp/mng/csFaqList">[FAQ]</a></div>
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>등록일</th>
			<th></th>
		</tr>
			<c:forEach items="${blist}" var="bean">
				<tr>
				<form action="${pageContext.request.contextPath}/mp/mng/faqDelete" method="post">
					<td><input type="hidden" name="num" value="${bean.faqNo}"/>${bean.faqNo}</td>
					<td>FAQ</td>
					<td><a href="${pageContext.request.contextPath}/cs/csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}">${bean.sub}</a></td>
					<td>${bean.regDt}</td>
					<td><input type="submit" value="삭제"/></td>
				</form>
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
				<div id="btn00"><a href="/mp/mng/csAdd"><input type="button" id="btn00" value="등록"></a></div>
</div>
</c:when>
<c:otherwise>
<h1>관리자 전용</h1>
</c:otherwise>
</c:choose>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>







