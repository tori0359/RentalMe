<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>RentalMe - 경매내역 리스트</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/mngActSpec.js"></script>
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
						<h2 class="pageheader-title">경매내역</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">경매관리</a></li>
									<li class="breadcrumb-item active" aria-current="page">경매내역</li>
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
						<h5 class="card-header">경매내역 목록</h5>
						<div class="card-body">
							<div class="table-responsive">
								<table id="dt" class="table table-striped table-bordered first">
									<thead>
										<tr>
											<th>경매번호</th>
											<th>경매상품명</th>
											<th>회원번호</th>
											<th>회원명</th>
											<th>낙찰가격</th>
											<th>낙찰일시</th>
											<th>낙찰상태</th>
											<th>낙찰취소</th>
											<th>주문상태/주문번호</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${alist }" var="bean">
										<tr>
											<td>${bean.gdsCd }</td>
											<td>
												${bean.gdsNm }
											</td>
											<td>${bean.mbNo }</td>
											<td>${bean.userNm }</td>
											<td>
												<fmt:formatNumber pattern="##,###.##">
													${bean.bidPrice}
												</fmt:formatNumber>원
								   				<input id="auctPrice" type="hidden" value="${bean.bidPrice}"/>
								   			</td>
											<td>
												${fn:substring(bean.bidTime,0,10)} ${fn:substring(bean.bidTime,11,19)}
								       		</td>
											<c:if test= "${bean.actBidStsCd == 1}">
												<td>낙찰</td>
												<td>
													<input type="hidden" name="gdsCd" value="${bean.gdsCd }">
													<c:choose>
														<c:when test="${bean.odrStsGbCd eq 'DW' || bean.odrStsGbCd eq 'AC'}">
															<button class="btn btn-default btn-sm" style="opacity: 0.7;" disabled="disabled" >취소</button>
														</c:when>
														<c:otherwise>
															<button class="btn btn-danger btn-sm" type="submit" style="font-size: 9pt;  margin-top:15px; margin-bottom:15px;"  data-toggle="modal" data-target="#myModal2" data-gds-cd="${bean.gdsCd }" data-mbno="${bean.mbNo }" data-st-price="${bean.gdsStPrice }" >취소</button>
														</c:otherwise>	
													</c:choose>
												</td>
												<td>
													<c:if test="${empty bean.odrStsGbCd }">
														<button id="odrBtn${status.index }" type="button" class="btn btn-default" style="font-size: 9pt;  margin-top:15px; margin-bottom:15px;  opacity:0.7" disabled="disabled" >주문대기</button>
													</c:if>
													<c:if test="${bean.odrStsGbCd eq 'DW' }">
														<button id="odrBtn${status.index }" type="button" class="btn btn-success" style="font-size: 9pt; margin-top:10px;"  data-toggle="modal" data-target="#myModal" data-gds-cd="${bean.gdsCd }" data-odr-no="${bean.odrNo }" >입금확인</button><br>
														<p class="tdtext2" id="odrNo${status.index }" style="text-align:center; color:red; margin-top:-5px; ">
									               			<br>${bean.odrNo} &nbsp;
									              		</p> 
													</c:if>
													<c:if test="${bean.odrStsGbCd eq 'AC' }">
														<button id="odrBtn${status.index }" type="button" class="btn btn-default" style="font-size: 9pt;  margin-top:10px;  opacity:0.7" disabled="disabled" >주문완료</button><br>
														<p class="tdtext2" id="odrNo${status.index }" style="text-align:center; color:red; margin-top:-5px; ">
									               			<br>${bean.odrNo} &nbsp;
									              		</p> 
													</c:if>
												</td>
											</c:if>			
											<c:if test= "${bean.actBidStsCd == 2}">
												<td>예비</td>
												<td></td>
											</c:if>
											<c:if test= "${bean.actBidStsCd == 3}">
												<td>종료</td>
												<td></td>
											</c:if>
										</tr>
										</c:forEach>	
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<c:if test="${not empty  actList}">
						<input id="choosedel" type="button" class="btn btn-success btn-sm" value="선택삭제" >
						<a href="/mp/mng/actInsertPage" type="button" id="btn00" class="btn btn-info btn-sm">등록</a>
					</c:if>
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
    <form id="target" action="/mp/mng/act/spec/decision" method="post">
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
			    	<input type="hidden" class="custom-control-input" name="gdsCd" value="gdsCd"/>
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
	<!-- 낙찰취소 모달 -->
    <form id="target" action="/mp/mng/act/spec/cancel" method="post">
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel2">낙찰취소</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			    </div>
				<div class="modal-body">
			    	<input type="hidden" class="custom-control-input" name="gdsCd" value="gdsCd"/>
			    	<input type="hidden" name="mbNo" value="mbNo">
					<input type="hidden" name="gdsStPrice" value="gdsStPrice">
			    	낙찰취소 하시겠습니까?
				</div>
			    <div class="modal-footer">
			    	<button type="submit" id="questSubmit" class="btn btn-success">취소승인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			    </div>
			</div>
	    </div>
	</div>
	</form>
	<!-- 모달 끝 -->
</body>
</html>