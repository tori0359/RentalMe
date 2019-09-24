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
   <script type="text/javascript">

   function csselect(csGbCd){
            console.log(csGbCd);
         $.ajax({
            url:'csList',
            type:'GET',
            data:{'param':$("#select option:selected").val()},
            success:function(result){
               var sel=result;
               if(sel==20){
               $("#selected").find('td').remove().end().append('<td><label>FAQ분류</label></td>')
                     .append('<td><select class=\"form-control\" style=\"height:35px; width:118px;\" name=\"csClassGbCd\"><option selected=\"selected\">FAQ항목</option><option value=\"1\">주문</option><option value=\"2\">배송</option><option value=\"3\">결제</option><option value=\"4\">교환취소</option><option value=\"5\">회원정보</option><option value=\"6\">기타</option></select></td>')
                  
               }else{
                  $("#selected").find('td').remove().end();
               }
            },
            erro:function(jqXHR,testStatus,errorThrown){
               alert('오류가 발생했습니다');
            }

         });
      }
   window.onload=function(){
      $("#faq").click(function(){
         console.log("dd");
      })
      $("#cancel").click(function(){
         history.back();
      })
         
      
   };
</script>
<style>
.ck-editor__editable {
             min-height: 400px;
   }
   .ck.ck-editor {
       max-width: 900px;
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

						<div class="page-breadcrumb">
							<h2 class="pageheader-title">고객센터관리</h2>
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">게시글 관리</a></li>
									<li class="breadcrumb-item"><a href="#"
										class="breadcrumb-link">고객센터관리</a></li>
									<li class="breadcrumb-item active" aria-current="page">공지/FAQ
										등록</li>
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
						<h5 class="card-header">공지/FAQ 등록</h5>
						<div class="card-body">
							<div class="container-fluid  dashboard-content">
								<!-- ============================================================== -->
								<!-- start pageheader -->
								<!-- ============================================================== -->
								<div class="row">
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

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
											<div class="card-body">
												<form action="/mp/mng/csNoticeAdd" method="post">
													<div id="daeContent">
														<table style="height: 500px; width: 90%;" class="table">
															<tr>
																<td><label>작 성 자</label></td>
																<td style="text-align: left;">관 리 자</td>
															</tr>
															<tr>
																<td><label>분류</label></td>
																<td><select style="height: 35px; width: 118px;"
																	name="csGbCd" id="select"
																	onchange="csselect(this.value);" class="form-control">
																		<option>선택하세요</option>
																		<option value="10" id="notic">공지사항</option>
																		<option value="20" id="faq">FAQ</option>
																</select></td>
															</tr>
															<tr id="selected">
															</tr>
															<tr>
																<td><label>제목</label></td>
																<td><input class="form-control" type="text"
																	name="sub" id="text"></td>
															</tr>
															<tr>
																<td><label>내용</label></td>
																<td><textarea id="editor" name="content"
																		style="resize: none; width: 100%; height: 250px;"
																		class="form-control"></textarea> 
																</td>
															</tr>
															<tr>
																<td></td>
																<td style="text-align: right;"><input type="submit"
																	class="btn btn-primary" value="등록" /> <input
																	id="cancel" class="btn btn-danger" type="reset"
																	value="취소"></td>
															</tr>
														</table>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>