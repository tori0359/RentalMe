<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>RentalMe - 경매상품관리 리스트</title>
	<jsp:include page="../../template/main.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
	
	<script src="http://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="http://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/datatables/js/data-table.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="http://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="http://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="http://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <script src="http://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
    <script src="http://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
    <script src="http://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMngAct.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtProperties.js"></script>
</head>
<body>
	<!-- ============================================================== -->
	<!-- start wrapper  -->
	<!-- ============================================================== -->
	<div class="dashboard-wrapper">
		<div class="container-fluid  dashboard-content">
			<!-- ============================================================== -->
			<!-- start pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="page-header">
						<h2 class="pageheader-title">상품관리</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">상품관리</a></li>
									<li class="breadcrumb-item active" aria-current="page">경매상품관리</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<!-- ============================================================== -->
				<!-- start table  -->
				<!-- ============================================================== -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<h5 class="card-header">경매상품관리 목록</h5>
						<div class="card-body">
							<div class="table-responsive">
								<table id="dt" class="table table-striped table-bordered first">
									<thead>
										<tr>
											<th style="text-align:center; padding: 10px 30px">
												<input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll();"/>
											</th>
											<th style="text-align:center">상품코드</th>
											<th style="text-align:center">상품명</th>
											<th style="text-align:center">등록일</th>
											<th style="text-align:center">경매여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${actList}" var="bean">
											<tr>
												<td style="text-align:center"><input type="checkbox" class="chBox" name="chBox" data-actNum="${bean.gdsCd}">
							       				</td>
												<td style="text-align:center"><input type="hidden" name="num" value="${bean.gdsCd}"/>${bean.gdsCd}</td>
												<td><a href="/act/admin/${bean.gdsCd }">${bean.gdsNm}</a></td>
												<td style="text-align:center">${bean.regDt}</td>
												<c:choose>
													<c:when test="${bean.actStsCd eq '1'}">
														<td id="yetyet" style="text-align:center">대기</td>
													</c:when>
													<c:when test="${bean.actStsCd eq '2'}">
														<td id="inging" style="text-align:center">진행중</td>
													</c:when>
													<c:otherwise>
														<td id="endend" style="text-align:center">경매완료</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<input id="choosedel" type="button" class="btn btn-success btn-sm" value="선택삭제" >
					<a href="/mp/mng/actInsertPage" type="button" id="btn00" class="btn btn-info btn-sm">등록</a>
				</div>
				<!-- ============================================================== -->
				<!-- end table  -->
				<!-- ============================================================== -->
			</div>
		</div>
		<jsp:include page="../../template/footerAdmin.jsp"></jsp:include>
	</div>
	<!-- ============================================================== -->
	<!-- end wrapper  -->
	<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- end main wrapper  -->
	<!-- ============================================================== -->
</body>
</html>