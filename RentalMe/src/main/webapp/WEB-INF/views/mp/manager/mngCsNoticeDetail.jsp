<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
	<title>RentalMe - 공지사항 상세보기</title>
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
			$("#cancel").click(function(){
					window.history.back();
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
            /*background:white;
            border-radius:5px;
            outline:none; */
        } 
       
        
        textarea{
            width:100%;
            height:250px;
        }
        #content{
        	height:600px;
        }
        #content tr>td:nth-child(1){
        	text-align:center;
        }
        #comment{
        	font-size:2em;
        	font-style: italic;
        	font-weight: bold;
        	border-bottom:1px solid;
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
						<h2 class="pageheader-title">공지사항 상세보기</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">고객센터관리</a></li>
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">공지사항</a></li>
									<li class="breadcrumb-item active" aria-current="page">공지사항 상세보기</li>
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
					<form action="/mp/mng/csNoticeUpdatePage">
						<div class="card">
							<h5 class="card-header"></h5>
							<div id="content">
								<div class="col-md-10 col-md-offset-1">
									<div id="comment">Notice-Content</div>
									
										<table class="table" id="daeContent">
											<tr>
												<td><label for="id">작 성 자</label></td>
												<td>관리자</td>
											</tr>
											<tr>
												<td><label for="id">글 번 호</label></td>
												<td><input type="hidden" name="noticNo"
													value="${adetail.noticNo}">${adetail.noticNo}</td>
												<td><input type="hidden" name="csGbCd"
													value="${adetail.csGbCd}"></td>
											</tr>
											<tr>
												<td><label>작성일</label></td>
												<td>${adetail.regDt}</td>
											</tr>
											<tr>
												<td><label>제목</label></td>
												<td><input type="hidden" value="${adetail.sub}">${adetail.sub}</td>
											</tr>
											<tr>
												<td style="height: 120px; vertical-align: middle;"><label>내용</label></td>
												<td style="vertical-align: middle;"><input
													type="hidden" value="${adetail.content}">${adetail.content}</td>
											</tr>
										</table>
								</div>
							</div>
						</div>
						<input class="btn btn-primary btn-lg" id="cancel" type="reset" value="뒤로" style="float:right;margin-left: 5px;" />
						<input class="btn btn-primary btn-lg" id="updae" type="submit" value="수정" style="float:right;"  />
					</form>
					
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