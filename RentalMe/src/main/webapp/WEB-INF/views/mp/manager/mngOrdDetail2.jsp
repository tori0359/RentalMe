<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RentalMe - 주문상세</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/dtProperties.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMng.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.pagination').remove();
			$('.dataTables_info').remove();
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
						<h2 class="pageheader-title">주문상세</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link"></a></li>
									<li class="breadcrumb-item active" aria-current="page"></li>
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
			<div class="titlediv">
		       <p id="title"><span>&nbsp;&nbsp;&nbsp;&nbsp;결제번호:${ordNo }</span></p>
		     </div>
				<!-- ============================================================== -->
				<!-- start table  -->
				<!-- ============================================================== -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">주문상세</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>주문상품</th>
												<th>개당금액</th>
												<th>수량</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${alist }" var="bean">
									     	<tr>
									     		<td>${bean.gdsNm }</td>
									     		<td><fmt:formatNumber value="${bean.gdsPrice }" pattern="#,###.##"/>원</td>
									     		<td>${bean.odrQty }</td>
									     		<td><fmt:formatNumber value="${bean.odrAmt }" pattern="#,###.##"/>원 </td> 
									     	</tr>
									     	<c:set var="total" value="${total +bean.odrAmt }"/>
									     	</c:forEach>
									     	<tr>
									     		<td></td>
									     		<td></td>     		
									     		<th>총합</th>
									     		<th><fmt:formatNumber value="${total }" pattern="#,###.##"/>원</th> 
									     	</tr>
										</tbody>
									</table>
									<div>
										배송정보
									</div>
									<table class="table table-bordered">
							             <tr>
							             	<th>이름</th>
							             	<td>${info.userNM }</td>
							             </tr>
							             <tr>
							             	<th>전화번호</th>
							             	<td>${info.hp }</td>
							             </tr>
							             <tr>
							             	<th>주소</th>
							             	<td>${info.addr }<br/>${info.addrDetail }</td>
							             </tr>
							          </table>
								</div>
							</div>
						</div>
						<a href="/mp/mng/list" class="btn btn-success btn-sm">목록으로</a>
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