<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RentalMe - 신고접수관리 리스트</title>
	<jsp:include page="../../template/main.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
	<style type="text/css">
		.deleteform,.deleteform2,.deleteno{
			display: inline-block;
		}
	</style>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/dtProperties.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMng.js"></script>
	
	
	<script>
		$(function(){
			for(var i=0; i<$('.clearnot').length; i++){
				if($('.clearnot').eq(i).text().indexOf('처리완료') != -1){
					$('.clearnot').eq(i).next().find('button').attr('disabled','disabled');
				}
			}
			for(var i=0; i<$('.ugn').length; i++){
				if($('.ugn').eq(i).text()==""){
					$('.ugn').eq(i).parent().find('.deleteform').hide();
				}
				if($('.srn').eq(i).text()==""){
					$('.srn').eq(i).parent().find('.deleteform2').hide();
				}
				
			}
		});
	</script>
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
						<h2 class="pageheader-title">신고접수관리</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">중고거래관리</a></li>
									<li class="breadcrumb-item active" aria-current="page">신고접수관리</li>
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
							<h5 class="card-header">신고접수 목록</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table id="dt" class="table table-striped table-bordered first">
										<thead>
											<tr>
												<th>신고번호</th>
												<th>신고구분</th>
												<th>중고상품번호</th>
												<th>중고상품댓글번호</th>
												<th>상점번호</th>
												<th>상점후기번호</th>
												<th>신고날짜</th>
												<th>신고상태</th>
												<th>처리구분</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${alist }" var="bean">
												<tr class="usedTableTrClick">
													<td id="${bean.declNo }">${bean.declNo }</td>
													<td>
														<c:if test="${bean.usedReGbCd eq 'R1'}">
															댓글
														</c:if> <c:if test="${bean.usedReGbCd eq 'R2'}">
															답글
														</c:if> <c:if test="${bean.usedReGbCd eq 'R3'}">
															후기
														</c:if>
													</td>
													<td><a href="/used/detail/${bean.usedGdsNo }">${bean.usedGdsNo }</a></td>
													<td class="ugn">${bean.usedGdsComtNo }</td>
													<td><a href="/used/store/${bean.storeNo }">${bean.storeNo }</a></td>
													<td class="srn">${bean.storeReviewNo }</td>
													<td>${bean.chgDt }</td>
													<td class="clearnot">
														<c:if test="${bean.declResStsCd eq '1'}">
															처리완료
														</c:if> <c:if test="${bean.declResStsCd eq '2'}">
															미완료
														</c:if>
													</td>
													<td class="deleteTd">
													<form class="deleteno" action="/mp/mng/decl/deleteno" method="POST">
														<input type="hidden" name="declNo" value="${bean.declNo }">
														<button class="btn btn-info noDelBtn">미삭제</button>
													</form>
													<form class="deleteform" action="/mp/mng/decl/delete" method="POST">
														<input type="hidden" name="declNo" value="${bean.declNo }">
														<input type="hidden" name="usedGdsNo" value="${bean.usedGdsNo }">
														<input type="hidden" name="usedGdsComtNo" value="${bean.usedGdsComtNo }">
														<button class="btn btn-danger delBtn">삭제</button>
													</form>
													<form class="deleteform2" action="/mp/mng/decl/delete2" method="POST">
														<input type="hidden" name="declNo" value="${bean.declNo }">
														<input type="hidden" name="storeNo" value="${bean.storeNo }">
														<input type="hidden" name="storeReviewNo" value="${bean.storeReviewNo }">
														<button class="btn btn-danger delBtn">삭제</button>
													</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<input type="button" id="chkResult" class="btn btn-success btn-sm" value="처리완료" >
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