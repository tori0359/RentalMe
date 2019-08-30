<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
	#uptext{
		height:130px;
	}
	#upmenu{
		text-align:center;
	}
	#ansNo{
		color:red;
	}
	#ansYe{
		color:blue;
	}
</style>
</head>
<body>
<div id="content" class="col-md-10 col-md-offset-1">
<div  id="uptext"align="center"><h1>1:1 문의 관리</h1></div>
	<div>
	나의활동>1:1문의 관리
	</div>
	
	<table class="table table-hover">
		<tr align="center">
			<td>회원번호</td>
			<td>번호</td>
			<td>제목</td>
			<td>등록일</td>
			<td>답변유무</td>
		</tr>
			<!-- <form action="" method="get"> -->
			<c:forEach items="${inqlist}" var="bean">
				<tr align="center">
						<td>${bean.mbNo}</td>
						<td><input type="hidden" name="num" value=""/>${bean.pquestNo}</td>
						<td><a href="${pageContext.request.contextPath}/mp/mp/questDetail?pquestNo=${bean.pquestNo}&mbNo=${bean.mbNo}">${bean.sub }</a></td>
						<td>${bean.regDt}</td>
						<c:if test="${bean.questStsCd eq '1'}">
							<td id="ansNo">N</td>
						</c:if>
						<c:if test="${bean.questStsCd eq '2'}">
							<td id="ansYe">Y</td>
						</c:if>
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