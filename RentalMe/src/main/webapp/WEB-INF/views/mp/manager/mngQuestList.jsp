<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RentalMe - 상담 리스트</title>
	<jsp:include page="../../template/main.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
	<style type="text/css">
		.updateGo{
			width: 90px;
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMngQuest.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/dtProperties.js"></script>
</head>
<body>
<div>
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
                            <h2 class="pageheader-title">상담관리</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">고객센터관리</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">상담관리</li>
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
                            <h5 class="card-header">상담 목록</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="dt" class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
												<th>상담번호</th>
												<th>상담일자</th>
												<th>상품코드</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th>처리상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
										<c:forEach items="${alist}" var="bean">
											<tr id="maincontent">
												<td>${bean.questNo }</td>
												<td>${bean.questDt }</td>
												<td>${bean.gdsCd }</td>
												<td>${bean.questNm }</td>
												<td>${bean.hp }</td>
												<td>${bean.email }</td>
												<td>
												<input type="hidden"  class="itNo" value="${bean.questNo }">
												<c:if test="${bean.questStsCd eq 1}">
													<button class="btn btn-danger updateGo">미처리</button>
												</c:if>
												<c:if test="${bean.questStsCd eq 2}">
													<button class="btn btn-default disabled">처리완료</button>
												</c:if>
												</td>
											</tr>
										</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div> 
                        </div>   
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







