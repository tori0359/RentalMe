<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	

	});
</script>
<style type="text/css">
	#btn00{
		text-align:right;
	}
	#uptext{
		height:130px;
	}
	#head>th:nth-child(n){
		text-align:center;
	}
	#maincontent td:nth-child(n){
		text-align:center;
	}
	#headMenu>a{
		text-decoration:none;
		color:gray;
	}
	#headMenu>a:hover{
		color:blue;
	}
</style>
<title>Insert title here</title>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>

<!-- 관리자 공지게시판 리스트 -->
<h1>대형가전 리스트</h1>
<div id="content" class="col-md-10 col-md-offset-1">
<div align="right" id="headMenu">
<a href="${pageContext.request.contextPath}/mp/mng/goodsList">[전체상품]</a>&nbsp
<a href="${pageContext.request.contextPath}/mp/mng/Appli/lg">[대형가전]</a>&nbsp
<a href="${pageContext.request.contextPath}/mp/mng/Appli/sm">[소형가전]</a>&nbsp
<a href="${pageContext.request.contextPath}/mp/mng/Appli/furn">[가구]</a>&nbsp
<a href="${pageContext.request.contextPath}/mp/mng/Appli/rest">[기타]</a>&nbsp
<a href="${pageContext.request.contextPath}/mp/mng/Appli/pkg">[패키지]</a>
</div>
	<table class="table table-hover">
		<tr id="head">
			<th>상품코드</th>
			<th>상품상태</th>
			<th>상품분류</th>
			<th>상품명</th>
			<th>브랜드명</th>
			<th>모델명</th>
			<th>삭제여부</th>
		</tr>
			<c:forEach items="${rlist}" var="bean">
				<tr id="maincontent">
						<c:if test="${bean.gdsMclassCd eq '20'}">
							<td>${bean.gdsCd}</td>
							<c:if test="${bean.gdsLclassCd eq '10'}">
								<td>새상품</td>
							</c:if>
							<c:if test="${bean.gdsLclassCd eq '20'}">
								<td style="color:gray;">*중고</td>
							</c:if>
							<td>소형가전</td>
							<td>${bean.gdsNm}</td>
							<td>${bean.brandNm}</td>
							<td>${bean.modelNm}</td>
							<c:if test="${bean.delYn  eq 'N'}">
								<td style="color:red;">N</td>
							</c:if>
							<c:if test="${bean.delYn  eq 'Y'}">
								<td style="color:blue;">Y</td>
							</c:if>
						</c:if>
				</tr>
			</c:forEach>
	</table>
	<div align="center" style="width:100%">
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
									<a class="page-link" style="cursor:pointer" onClick="pageChange('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
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
				<div id="btn00"><a href="/mp/mng/csAdd"><input type="button" id="btn00" value="등록"></a></div>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>







