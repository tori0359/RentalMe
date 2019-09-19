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
	#notcH{
		text-decoration:none;
		color:red;
	}
	#faqH{
		text-decoration:none;
		color:blue;
	}
</style>
<title>Insert title here</title>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>
<c:choose>
<c:when test="${id eq 'minminad'}">
<!-- 관리자 공지게시판 리스트 -->
<h1>공지/FAQ</h1>
<div id="content" class="col-md-10 col-md-offset-1">
<div align="right"><a id="notcH" href="${pageContext.request.contextPath}/mp/mng/csNoticeList">[공지사항]</a>&nbsp&nbsp&nbsp<a id="faqH" href="${pageContext.request.contextPath}/mp/mng/csFaqList">[FAQ]</a></div>
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>등록일</th>
			<th></th>
		</tr>
			<c:forEach items="${alist}" var="bean">
				<tr>
					<form action="${pageContext.request.contextPath}/mp/mng/noticeDelete" method="post">
						<td><input type="hidden" name="num" value="${bean.noticNo}"/>${bean.noticNo}</td>
						<td>공지</td>
						<td><a style="text-decoration:none" href="${pageContext.request.contextPath}/cs/csNoticeDetail?noticNo=${bean.noticNo}&csGbCd=${bean.csGbCd}">${bean.sub}</a></td>
						<td>${bean.regDt}</td>
						<td><input type="submit" value="삭제"/></td>
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
									<a class="page-link" style="cursor: pointer;" onClick="pageChange('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
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







