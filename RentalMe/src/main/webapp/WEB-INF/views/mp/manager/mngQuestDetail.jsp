<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>RentalMe - 1:1문의 상세보기</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMng.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtProperties.js"></script>
	
<script type="text/javascript">
	 	$(document).ready(function(){
			$("#back").click(function(){
					window.history.back();
			})
			$("#list").click(function(){
					location.href="/mp/mng/InqList";
			})
		})
	</script>
<style type="text/css">
        #daeContent{
        	margin-top:70px;
        }
       
        #daeContent tr>td:nth-child(1){
            width:15%;
        }
        #daeContent tr>td:nth-child(2){
            width:85%;
        }
        #daeButton input{
            float:right;
            margin:5px 10px 5px 10px;
        }
       
        #daeButton>button:nth-child(1){
        
        }
        textarea{
            width:100%;
            height:250px;
        }
        #content{
        	height:600px;
        }
        #answer{
        	margin-top:20px;
        	margin-right:10px;
        	padding-top:-20px;
        	margin-bottom:-55px;
        	
        }
        #answer button{
        	border-radius:5px;
        	background:white;
        	color:red;
        	border-radius:5px;
        	
        }
        #comment{
        	font-size:2em;
        	font-style: italic;
        	font-weight: bold;
        	border-bottom:1px solid;
        	
        }
        #replyed{
        	font-size:18px;
        	font-weight:lighter;
        }
	</style>
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
						<h2 class="pageheader-title">1:1문의 상세보기</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">고객센터관리</a></li>
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">1:1문의관리</a></li>
									<li class="breadcrumb-item active" aria-current="page">1:1문의관리 상세보기</li>
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
						<h5 class="card-header"></h5>
						<div id="content">
							<div class="col-md-10 col-md-offset-1">
								<div id="comment">Inquiries</div>
								<table class="table" id="daeContent">
									<tr>
										<td align="center"><label for="id">글 번 호</label></td>
										<td style="text-align:left;"><input type="hidden" name="mbNo" value="${bean.mbNo}"><input
											type="hidden" name="pquestNo" value="${bean.pquestNo}">${bean.pquestNo}</td>

									</tr>
									<tr>
										<td align="center"><label>분류</label></td>
										<c:if test="${bean.csClassGbCd eq '1'}">
											<td style="text-align:left;">주문</td>
										</c:if>
										<c:if test="${bean.csClassGbCd eq '2'}">
											<td style="text-align:left;">배송</td>
										</c:if>
										<c:if test="${bean.csClassGbCd eq '3'}">
											<td style="text-align:left;">결제</td>
										</c:if>
										<c:if test="${bean.csClassGbCd eq '4'}">
											<td style="text-align:left;">교환취소</td>
										</c:if>
										<c:if test="${bean.csClassGbCd eq '5'}">
											<td style="text-align:left;" >회원정보</td>
										</c:if>
										<c:if test="${bean.csClassGbCd eq'6'}">
											<td style="text-align:left;">기타</td>
										</c:if>
									</tr>
									<tr>
										<td align="center"><label>제목</label></td>
										<td style="text-align:left;">${bean.sub}</td>
									</tr>
									<tr>
										<td style="padding-top: 70px;" align="center"><label>내용</label></td>
										<td style="height: 150px; padding-top: 70px; text-align:left;">${bean.content}</td>
									</tr>
								</table>
								<br />
								<div>
									<c:if test="${reply.replyContent ne null }">
									</c:if>
									<div id="comment">Comment</div>
									<c:if test="${levelGbCd=='2'}">
										<c:if test="${bean.questStsCd=='1'}">
											<form action="/mp/mng/csInqReply" method="get">
												<div class="col-md-10 col-md-offset-1">
													<br /> <br /> <br /> <input
														style="width: 100%; margin-top: -10px;" type="text"
														class="form-control" id="repleContentInput"
														name="replyContent" placeholder="답글을 달아주세요(엔터로 입력)" />
												</div>
												<input type="hidden" name="pquestNo"
													value="${bean.pquestNo}" /> <input type="hidden"
													name="mbNo" value="${bean.mbNo}" />
											</form>
										</c:if>
									</c:if>

									<div id="replyed" class="col-md-offset-2">
										<br /> <br /> <span></span><span style="font-weight: bold;">${reply.replyContent}</span><span></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="daeButton">
						<c:if test="${levelGbCd=='1'}">
							<input class="btn btn-primary" type="reset" id="back" value="뒤로">
						</c:if>
						<c:if test="${levelGbCd=='2'}">
							<input class="btn btn-primary" type="reset" id="list"
								value="목록으로">
						</c:if>
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