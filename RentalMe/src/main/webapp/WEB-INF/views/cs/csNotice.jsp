<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!Doctype html>
<html>
<head>
    <meta charset="UTF-8">
	<jsp:include page="../template/header.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#noticeBar td:nth-child(2)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
				
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(1)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(3)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(1)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(3)").click(function(){
				location.replace("/cs/csInquiry");
			});
			$("#noticeBar td:nth-child(2)").click(function(){
				location.replace("/cs/csFAQ");
			});
		})
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
	<style type="text/css">
		#noticeBar{
			height:230px;
		}
		#noticeBar table{
			margin-top: 80px;
			font-size:20px;
		}
		#noticeBar td:nth-child(1){
			border-bottom-left-radius: 10px;
			border-top-left-radius: 10px;
			color:white;
			background:black;
			width:34%;
			text-align: center;
		}
		#noticeBar td:nth-child(2){
			background:white;
			border-left:0.1px solid;
			border-right:0.1px solid;
			width:33%;
			text-align: center;
		}
		#noticeBar td:nth-child(3){
			border-bottom-right-radius: 10px;
			border-top-right-radius: 10px;
			background:white;
			width:33%;
			text-align: center;
		}
		#noticeBar>table{
			width:100%;
			height:50px;
		}
		th:nth-child(1){
			width:20%;
		}
		th:nth-child(2){
			width:40%;
		}
		th:nth-child(3){
			width:20%;
		}
		th:nth-child(4){
			width:20%;
		}
		#csContent{
			height:800px;
		}
		#mainTable{
			height:900px;
		}
		#firTable tr>td{
			cursor:pointer;
		}
		#aSub{
			text-decoration:none;
			color:black;
		}
		#aSub:hover{
			color:red;
			font-weight: bold;
		}
		th{
			text-align:center;
		}
	</style>
</head>
<body>
<div id="csContent">

<div class="hr">
</div>
<div id="noticeBar" class="col-md-10 col-md-offset-1">
	<table id="firTable">
		<tr>
			<td class="pulse">공지사항</td>
			<td>FAQ</td>
			<td>1:1문의</td>
		</tr>
	</table>
</div>
<div id="content" class="col-md-10 col-md-offset-1">
	<div>
	<table class="table table-hover" >
		<tr>
			<th style="height:40px;">번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
			<c:forEach items="${alist}" var="bean">
				<tr>
					<td style="height:40px;" align="center">${bean.noticNo }</td>
					<td align="left" ><a id="aSub" href="csNoticeDetail?noticNo=${bean.noticNo}&csGbCd=${bean.csGbCd}">${bean.sub }</a></td>
					<td style="text-align:center;">관리자</td>
					<td align="center">${bean.regDt }</td>
				</tr>
			</c:forEach>
	</table>
	</div>
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
</div>

</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>





























