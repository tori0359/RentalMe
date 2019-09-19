<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
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
			<c:forEach items="${mylist}" var="bean">
				<tr align="center">
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
				<div id="paginationBox">
						<ul class="pagination">
							<c:if test="${paging.prev}">
								<li class="page-item">
									<a class="page-link" onClick="prevEvent('${pathPaging}','${paging.page}', '${paging.range}', '${paging.rangeSize}')">
										&lt;
									</a>
								</li>
							</c:if>
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
								<li class="page-item <c:out value="${paging.page == idx ? 'active' : ''}"/> " >
									<a class="page-link" onClick="pageChange('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
										${idx} 
									</a>
								</li>
							</c:forEach>
							<c:if test="${paging.next}">
								<li class="page-item">
									<a class="page-link" onClick="nextEvent('${pathPaging}','${paging.range}', '${paging.range}', '${paging.rangeSize}')" >
										&gt;
									</a>
								</li>
							</c:if>
						</ul>
					</div>
	</div>
			
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>