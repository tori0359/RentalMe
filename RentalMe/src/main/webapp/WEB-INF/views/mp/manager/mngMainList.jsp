<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RentalMe - 렌탈상품관리 리스트</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMngRental.js"></script>
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
                            <h2 class="pageheader-title">렌탈상품관리</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">상품관리</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">렌탈상품관리</li>
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
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/goodsList">[전체상품]</a>
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/goodsList/10">[대형가전]</a>
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/goodsList/20">[소형가전]</a>
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/goodsList/30">[주방가전]</a>
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/goodsList/40">[가구]</a>
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/goodsList/50">[기타]</a>
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/mp/mng/goodsList/60">[패키지]</a>
				</div>
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- start table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">렌탈상품 리스트</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="dt" class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
												<th style="text-align:center; padding: 10px 30px">
													<input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll();"/>
												</th>
												<th>상품코드</th>
												<th>상품상태</th>
												<th>상품분류</th>
												<th>상품명</th>
												<th>브랜드명</th>
												<th>모델명</th>
												<th>삭제여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
										<c:forEach items="${rlist}" var="bean">
											<tr id="maincontent">
												<td style="text-align:center"><input type="checkbox" class="chBox" name="chBox" data-actNum="${bean.gdsCd}">
							       				</td>
												<td>${bean.gdsCd}</td>
												<c:if test="${bean.gdsLclassCd eq '10'}">
												<td>새상품</td>
												</c:if>
												<c:if test="${bean.gdsLclassCd eq '20'}">
												<td style="color:gray;">*중고</td>
												</c:if>
												<c:if test="${bean.gdsMclassCd eq '10'}">
												<td>대형가전</td>
												</c:if>
												<c:if test="${bean.gdsMclassCd eq '20'}">
												<td>소형가전</td>
												</c:if>
												<c:if test="${bean.gdsMclassCd eq '30'}">
												<td>주방가전</td>
												</c:if>
												<c:if test="${bean.gdsMclassCd eq '40'}">
												<td>가구</td>
												</c:if>
												<c:if test="${bean.gdsMclassCd eq '50'}">
												<td>기타</td>
												</c:if>
												<c:if test="${bean.gdsMclassCd eq '60'}">
												<td>패키지</td>
												</c:if>
												<td><a href="${pageContext.request.contextPath}/rental/Appli/lg/${bean.gdsSclassCd }/detail/${bean.gdsCd}">${bean.gdsNm}</a></td>
												<td>${bean.brandNm}</td>
												<td>${bean.modelNm}</td>
												<c:if test="${bean.delYn  eq 'N'}">
												<td id="delYn" style="color:red;">N</td>
												</c:if>
												<c:if test="${bean.delYn  eq 'Y'}">
												<td id="delYn" style="color:blue;">Y</td>
												</c:if>
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
                <c:if test="${not empty rlist}">
	                <input id="choosedel" type="button" class="btn btn-success btn-sm" value="선택삭제" >
	                <a href="${pageContext.request.contextPath}/mp/mng/rentalAddPage">
	                	<input class="btn btn-primary btn-sm" type="button" id="btn01" value="등록">
	                </a>
                </c:if>
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







