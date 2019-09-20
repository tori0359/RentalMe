<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RentalMe - 경매상품관리 등록</title>
	<jsp:include page="../../template/main.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/buttons.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/select.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mpMngActModal.css">
	<!-- 라이브러리 로드 순서는 아래와 같다. cdnjs 저장소에서 라이브러리를 로드하였다. -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
    
	
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/actImg.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMngActAdd.js"></script>
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
						
						<div class="page-breadcrumb">
						<h2 class="pageheader-title">상품관리</h2>
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">상품관리</a></li>
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">경매상품관리</a></li>
									<li class="breadcrumb-item active" aria-current="page">경매상품관리 등록</li>
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
	            <!-- validation form -->
	            <!-- ============================================================== -->
	            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	                <div class="card">
	                    <h5 class="card-header">경매상품 등록</h5>
	                    <div class="card-body">
	                        <form>
	                            <div class="form-group">
	                                <label for="inputText3" class="col-form-label">작성자</label>
	                                <input id="inputText3" type="text" class="form-control form-control-sm" value="관리자" disabled>
	                            </div>
	                            <div class="form-group">
	                                <label for="inputText3" class="col-form-label">상품선택</label>
	                                <input id="inputText3" type="button" class="form-control btn btn-primary btn-sm" role="button" data-toggle="modal" data-target="#myModal" value="검색">
	                            </div>
	                        </form>
                            <form action="/mp/mng/actInsert" enctype="multipart/form-data" method="post">
	                            <div class="form-group">
	                                <label for="input-select">상품구분</label>
	                                <select class="form-control" id="input-select" name="gdsGbCd">
										<option value="n">새상품</option>
										<option value="u">중고상품</option>
	                                </select>
	                            </div>
	                            <div class="form-group">
	                                <label for="gdsCd" class="col-form-label">상품코드</label>
	                                <input id="gdsCd"  type="text" name="gdsCd" class="form-control form-control-sm" readonly>
	                            </div>
	                            <div class="form-group">
	                                <label for="modelNm" class="col-form-label">모델명</label>
	                                <input id="modelNm"  type="text" name="modelNm" class="form-control form-control-sm" readonly>
	                            </div>
	                            <div class="form-group">
	                                <label for="gdsNm" class="col-form-label">상품명</label>
	                                <input id="gdsNm"  type="text" name="gdsNm" class="form-control form-control-sm" readonly>
	                            </div>
	                            <div class="form-group">
	                                <label for="brandNm" class="col-form-label">브랜드명</label>
	                                <input id="brandNm"  type="text" name="brandNm" class="form-control form-control-sm" readonly>
	                            </div>
	                            <div class="form-group">
	                                <label for="gdsCdDetail" class="col-form-label">상세코드</label>
	                                <input id="gdsCdDetail"  type="text" name="gdsCdDetail" class="form-control form-control-sm" readonly>
	                                <input type="hidden" value="30" name="GdsLclassCd"> <!-- 대분류코드 : 경매 -->
	                                <input type="hidden" value="80" name="GdsMclassCd"> <!-- 중분류코드 : 이벤트경매 -->
	                            </div>
	                            <div class="form-group">
	                                <label for="actStTime" class="col-form-label">시작시간</label>
	                                <input id="actStTime"  type="datetime-local" name="actStTime" class="form-control form-control-sm">
	                            </div>
	                            <div class="form-group">
	                                <label for="actStTime" class="col-form-label">상세설명</label>
	                                <textarea style="resize: none;" name="content" class="form-control "></textarea>
	                            </div>
	                            <div class="form-group">
									<input type="submit" value="등록" class="btn btn-primary btn-sm" style="float: right;"/>
	                            </div>
							</form>
	                    </div>
	                </div>
	                
	            </div>
	            <!-- ============================================================== -->
	            <!-- end validation form -->
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
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">상품 검색</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modalData">
					<div id="left" style="float: left">
						<label>대분류</label> <select id="classifi" name="classifi"
							onchange="goodsSelect(this.value);" class="form-control">
							<option value="">선택하세요</option>
							<option value="10">대형가전</option>
							<option value="20">중형가전</option>
							<option value="30">소형가전</option>
							<option value="40">가구</option>
							<option value="50">기타</option>
							<option value="60">패키지</option>
						</select> <br> <label>제품분류</label>
						<select class="form-control" id="goods">
							<option value="">선택하세요</option>
						</select><br>
						<div>
							<button type="button" id="modalBtn" class="btn btn-primary btn-sm">검색</button>
						</div>
					</div>
					<label id="goodscode">상품코드</label>
					<div id="left2">
						<table id="goodsTable">
							<tr>
								<td>--상품--</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer" id="end">
						<button type="button" class="btn btn-default" id="selectOne">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>