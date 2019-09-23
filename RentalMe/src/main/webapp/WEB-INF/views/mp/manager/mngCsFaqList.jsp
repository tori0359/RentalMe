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
	
</script>
<style type="text/css">
	#btn00{
		text-align:right;
	}
	#notcH{
		text-decoration:none;
		color:red;
	}
	#faqH{
		text-decoration:none;
		color:blue;
	}
	#span2{
		color:blue;
	}
	#tableHead tr>th:nth-child(1){
		width:10%;
		text-align:center;
	}
	#tableHead tr>th:nth-child(2){
		width:10%;
		text-align:center;
	}
	#tableHead tr>th:nth-child(3){
		width:50%;
		text-align:center;
	}
	#tableHead tr>th:nth-child(4){
		width:20%;
		text-align:center;
	}
	#tableHead tr>th:nth-child(5){
		width:10%;
		text-align:center;
	}
	#aasub:hover{
	color:red;
	}
</style>
<title>Insert title here</title>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>
<c:choose>
<c:when test="${levelGbCd eq '2'}">
<!-- 관리자 공지게시판 리스트 -->
<h1><span id="span1">공지</span><span id="span2">/FAQ</span></h1>
<div id="content" class="col-md-10 col-md-offset-1">
<div align="right" id="text"><a id="notcH" href="${pageContext.request.contextPath}/mp/mng/csNoticeList">[공지사항]</a>&nbsp&nbsp&nbsp<a id="faqH" href="${pageContext.request.contextPath}/mp/mng/csFaqList">[FAQ]</a></div>
	<table id="tableHead" class="table table-hover">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>등록일</th>
			<th>삭제</th>
		</tr>
			<c:forEach items="${blist}" var="bean">
				<tr>
				<form action="${pageContext.request.contextPath}/mp/mng/faqDelete" method="post">
					<td style="text-align: center;"><input type="hidden" name="num" value="${bean.faqNo}"/>${bean.faqNo}</td>
					<c:if test="${bean.csClassGbCd eq '1'}">
						<td style="text-align: center;">주문</td>
					</c:if>
					<c:if test="${bean.csClassGbCd eq '2'}">
						<td style="text-align: center;">배송</td>
					</c:if>
					<c:if test="${bean.csClassGbCd eq '3'}">
						<td style="text-align: center;">결제</td>
					</c:if>
					<c:if test="${bean.csClassGbCd eq '4'}">
						<td style="text-align: center;">교환취소</td>
					</c:if>
					<c:if test="${bean.csClassGbCd eq '5'}">
						<td style="text-align: center;">회원정보</td>
					</c:if>
					<c:if test="${bean.csClassGbCd eq '6'}">
						<td style="text-align: center;">기타</td>
					</c:if>
					<td><a id="aasub" style="color:black; text-decoration:none;" href="${pageContext.request.contextPath}/cs/csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}" style="text-decoration:none">${bean.sub}</a></td>
					<td style="text-align: center;">${bean.regDt}</td>
					<td style="text-align: center;"><input class="btn btn-danger" type="submit" value="삭제"/></td>
				</form>
				</tr>
			</c:forEach>
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
									<a class="page-link" style="cursor: pointer;"onClick="pageChange('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
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
</c:when>
<c:otherwise>
<h1>관리자 전용</h1>
</c:otherwise>
</c:choose>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>







