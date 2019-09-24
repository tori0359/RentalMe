<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>RentalMe - 공지사항 수정하기</title>
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
    
    <script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtProperties.js"></script>
	<style type="text/css">
		 
	     #text{
	     	width:80%;
	     }
	     #csContent{
	     		margin-top:100px;
	     }
	     #daeButton{
	     	text-align:right;
	     	padding:8px 180px 8px 8px;
	     }
	     #daeContent tr>td:nth-child(1){
	     	width:250px;
	     	text-align:center;
	     }
	     #selected{
	     	display:visible;
	     }
	    .ck-editor__editable {
	  			  min-height: 250px;
		}
		.ck.ck-editor {
		    max-width: 690px;
		}
	</style>
	<script type="text/javascript">
		window.onload=function(){
			$("#cancel").click(function(){
				history.back();
			})
		};
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
						<h2 class="pageheader-title">공지사항 수정</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">고객센터관리</a></li>
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">공지사항</a></li>
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">공지사항 상세보기</a></li>
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
					<form action="/mp/mng/csNoticeUpdate" method="post">
						<div class="card">
							<h5 class="card-header"></h5>
							<div id="csContent">
								<table class="table" id="daeContent">
									<tr>
										<td><label for="">작 성 자</label></td>
										<td>관 리 자</td>
									</tr>
									<tr>
										<td><label>글 번 호</label></td>
										<td><input type="hidden" value="${detail.noticNo}"
											name="noticNo">${detail.noticNo}</td>
									</tr>
									<tr>
										<td><label>분류</label></td>
										<td><input type="hidden" name="csGbCd"
											value="${detail.csGbCd}"> 공지사항</td>
									</tr>
									<tr>
										<td style="vertical-align: middle;"><label>제목</label></td>
										<td><input type="text" name="sub" value="${detail.sub}"
											id="text" class="form-control"></td>
									</tr>
									<tr>
										<td><label>내용</label></td>
										<td><textarea id="editor" name="content" class="form-control"
												style="resize: none"></textarea> 
												<script>
												   		 ClassicEditor
												        .create( document.querySelector( '#editor' ),{removePlugins: [ 'ImageUpload' ]
												      }).catch( error => {
												            console.error( error );
												        } );
												 </script></td>
									</tr>
								</table>
							</div>
						</div>
						<input class="btn btn-primary" type="submit" value="수정" style="float:right;margin-left: 5px;"/> 
						<input class="btn btn-default" id="cancel" type="reset" value="취소" style="float:right;"/>
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