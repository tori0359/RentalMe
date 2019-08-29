<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
	#uptext{
		height:130px;
	}
	#upmenu{
		text-align:center;
	}
	
</style>
</head>
<body>
<div id="content" class="col-md-10 col-md-offset-1">
<div  id="uptext"align="center"><h1>내 문의 보기</h1></div>
	<div>
	나의활동>내 문의 보기
	</div>
	
	<table class="table table-hover">
		<tr align="center">
			<td>번호</td>
			<td>제목</td>
			<td>등록일</td>
			<td>답변유무</td>
		</tr>
			<!-- <form action="" method="get"> -->
			<c:forEach items="${mylist }" var="bean">
				<tr align="center">
						<td><input type="hidden" name="num" value=""/>${bean.pquestNo}</td>
						<td><a href="${pageContext.request.contextPath}/cs/csNoticeDetail?noticNo=${bean.noticNo}&csGbCd=${bean.csGbCd}">${bean.sub }</a></td>
						<td>${bean.regDt}</td>
						<td>Y</td>
				</tr>
			</c:forEach>
			<!-- </form> -->
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
			
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>