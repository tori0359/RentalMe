<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
	#uptext{
		height:100px;
		
	}
	#ansNo{
		color:red;
	}
	#ansYe{
		color:blue;
	}
	#aSub{
		text-decoration:none;
		color:black;
	}
	#aSub:hover{
		color:red;
	}
	#upMenu>th{
		text-align:center;
	}
</style>
</head>
<body>
<c:choose>
<c:when test="${levelGbCd eq '2'}">
<div id="content" class="col-md-10 col-md-offset-1">
<div  id="uptext">
<h1>1:1 문의 관리</h1>
		<div class="hr" style="height:3px; background-color: #2E2E2E;"></div>

</div>

	
	
	<table class="table table-hover">
		<tr id="upMenu">
			<th>회원번호</th>
			<th>번호</th>
			<th>제목</th>
			<th>등록일</th>
			<th>답변유무</th>
		</tr>
			<!-- <form action="" method="get"> -->
			<c:forEach items="${inqlist}" var="bean">
				<tr align="center">
						<td>${bean.mbNo}</td>
						<td><input type="hidden" name="num" value=""/>${bean.pquestNo}</td>
						<td style="text-align:left"><a id="aSub" href="${pageContext.request.contextPath}/mp/mp/questDetail?pquestNo=${bean.pquestNo}&mbNo=${bean.mbNo}">${bean.sub }</a></td>
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
</c:when>
<c:otherwise>
<h1>관리자 전용</h1>
</c:otherwise>
</c:choose>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>