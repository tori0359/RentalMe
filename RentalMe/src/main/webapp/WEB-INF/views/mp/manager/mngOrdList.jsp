<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentalMe - ${sub }관리 리스트</title>
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
   
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/dtProperties.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMngOrd.js"></script>
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
                            <h2 class="pageheader-title">${sub }관리</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">주문관리</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">${sub }관리</li>
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
                            <h5 class="card-header">${sub }목록</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="dt" class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
								                <th>주문번호</th>
								                <th>주문일</th>
								                <th>주문구분</th>
								                <th>회원번호</th>
								                <th>회원명</th>
								                <th>주문금액</th>
								                <th>주문상태</th>
								                <c:if test="${sub eq '주문'}">
								                	<th>상세보기</th>
								                </c:if>
                                            </tr>
                                        </thead>
	                                    <tbody>
											<c:forEach items="${alist}" var="bean" varStatus="status">
												<tr>
													<td style="vertical-align: middle;">${bean.odrNo}</td>
													<td style="vertical-align: middle;">${bean.odrDt}</td>
													<td style="vertical-align: middle;">
														<c:if test="${bean.odrGbCd eq '10'}">
		                									렌탈
		                								</c:if> 
		                								<c:if test="${bean.odrGbCd eq '20'}">
		                									경매
		                								</c:if>
	                								</td>
													<td style="vertical-align: middle;">${bean.mbNo}</td>
													<td style="vertical-align: middle;">${bean.userNm }</td>
													<td style="vertical-align: middle;">
														<fmt:formatNumber value="${bean.totOdrAmt}" pattern="#,###.##" />원
													</td>
													<td class="stscdtxt" style="vertical-align: middle;">
														<c:if test="${bean.odrStsGbCd eq 'DW'}">
															<!-- 입금대기 -->
															<button id="odrBtn${status.index }" style="opacity: 1.0;"
																type="button" class="btn btn-success"
																style="font-size: 9pt;" data-toggle="modal"
																data-target="#myModal" data-odr-no="${bean.odrNo}">입금확인</button>
														</c:if> 
														<c:if test="${bean.odrStsGbCd eq 'OC'}">
															<button id="disabled" style="opacity: 0.3; background: #151515; color: white;"  type="button"
																class="btn btn-default" style="font-size: 9pt;"
																disabled="disabled">주문확정</button>
														</c:if> 
														<c:if test="${bean.odrStsGbCd eq 'PC'}">
															<button id="disabled" style="opacity: 0.3; background: #151515; color: white;" type="button"
																class="btn btn-default" style="font-size: 9pt;"
																disabled="disabled">구매확정</button>
														</c:if> 
														<c:if test="${bean.odrStsGbCd eq 'RW'}">
															<button id="odrBtn${status.index }" style="opacity: 1.0;"
																type="button" class="btn btn-warning"
																style="font-size: 9pt;" data-toggle="modal"
																data-target="#myModal2" data-odr-no="${bean.odrNo}">반품확인</button>
														</c:if> 
														<c:if test="${bean.odrStsGbCd eq 'RC'}">
															<button id="disabled"
																style="opacity: 0.3; background: #151515; color: white;"
																type="button" class="btn" style="font-size: 9pt;"
																disabled="disabled">반품완료</button>
														</c:if>
													</td>
													<c:if test="${sub eq '주문'}">
													<td style="vertical-align: middle;">
														<a style="background: #151515; color: white;" type="button"
															class="btn" style="font-size: 9pt;"
															href="/mp/mng/detail/${bean.odrNo }">상세보기</a>
													</td>
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
      
      
      <!-- 입금확인 모달 -->
      <form id="target" action="/mp/mng/decision" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">입금확인</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
				    </div>
					<div class="modal-body">
						<input type="hidden" class="custom-control-input" name="crudGbCd" value="crudGbCd"/>
				    	<input type="hidden" class="custom-control-input" name="odrGbCd" value="odrGbCd"/>
				    	<input type="hidden" class="custom-control-input" name="odrNo" value="odrNo"/>
				    	입금완료 하시겠습니까?
					</div>
				    <div class="modal-footer">
				    	<button type="submit" id="questSubmit" class="btn btn-success">완료</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				    </div>
				</div>
		    </div>
		</div>
		</form>
		<!-- 모달 끝 -->
		<!-- 반품확인 모달 -->
        <form id="target" action="/mp/mng/cart/decision" method="post">
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel2">반품확인</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				    </div>
					<div class="modal-body">
				    	<input type="hidden" name="crudGbCd" value="crudGbCd"/>
				    	<input type="hidden" name="odrGbCd" value="odrGbCd"/>
				    	<input type="hidden" name="odrNo" value="odrNo"/>
				    	반품완료 하시겠습니까?
					</div>
				    <div class="modal-footer">
				    	<button type="submit" id="questSubmit" class="btn btn-warning">완료</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				    </div>
				</div>
		    </div>
		</div>
		</form>
		<!-- 모달 끝 -->
</body>
</html>