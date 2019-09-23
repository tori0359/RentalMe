<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>RentalMe - FAQ 리스트</title>
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
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMngCs.js"></script>
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
						<h2 class="pageheader-title">고객센터관리</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">고객센터관리</a></li>
									<li class="breadcrumb-item active" aria-current="page">FAQ</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end pageheader -->
			<!-- ============================================================== -->
            <div align="right" id="headMenu">
				<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/csNoticeList">[공지사항]</a>
				<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/csFaqList">[FAQ]</a>
			</div>
			<div class="row">
				<!-- ============================================================== -->
				<!-- start table  -->
				<!-- ============================================================== -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<h5 class="card-header">FAQ 목록</h5>
						<div class="card-body">
							<div class="table-responsive">
								<table id="dt" class="table table-striped table-bordered first">
									<thead>
										<tr>
											<th>번호</th>
											<th>분류</th>
											<th>제목</th>
											<th>등록일</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${blist}" var="bean">
											<tr>
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
												<td><a href="${pageContext.request.contextPath}/cs/csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}" style="text-decoration:none">${bean.sub}</a></td>
												<td>${bean.regDt}</td>
												<td>
													<input id="${bean.faqNo }" class="btn btn-danger btn-sm" onclick="delFaq(this.id)" value="삭제"/>
												</td>
											</tr>
										</c:forEach>										
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="btn00"><a href="/mp/mng/csAdd"><input type="button" class="btn btn-primary btn-sm" id="btn00" value="등록"></a></div>
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






