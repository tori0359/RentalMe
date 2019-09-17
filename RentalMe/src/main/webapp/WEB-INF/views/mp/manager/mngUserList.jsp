<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자관리 - 사용자관리</title>
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
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMngUser.js"></script>
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
                            <h2 class="pageheader-title">사용자 관리</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">사용자관리</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">사용자관리</li>
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
                            <h5 class="card-header">사용자 목록</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>
                                                <th>회원번호		</th>
                                                <th>아이디			</th>
                                                <th>이름			</th>
                                                <th>성별			</th>
                                                <th>핸드폰			</th>
                                                <th>이메일			</th>
                                                <th>가입일자		</th>
                                                <th>최근 접속일자	</th>
                                                <th>상태			</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<c:forEach items="${userInfo }" var="info">
												<tr>
													<td>${info.mbNo }</td>
													<td>${info.userId }</td>
													<td>${info.userNM }</td>
													<td>${info.genderGbCd }</td>
													<td>${info.hp }</td>
													<td>${info.email }</td>
													<td>${info.joinDt }</td>
													<td>${info.chgDt }</td>
													<td>
														<input type="button" id="${info.mbNo }" onclick="userDatail(this.id)" class="userDetail btn btn-info btn-sm"   value="상세정보"/>
														<input type="button" id="${info.mbNo }" onclick="userLeave(this.id)"  class="userLeave btn btn-danger btn-sm"  value="탈퇴">
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
            <!-- ============================================================== -->
            <!-- start footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            Copyright © 2019 RentalMe. All rights reserved. Dashboard by <a href="#">RentalMe</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- end wrapper  -->
		<!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->	
   
    <!-- ============================================================== -->
    <!-- start modal  -->
    <!-- ============================================================== -->	
	<div id="mngUserDatail" class="modal fade" tabindex="-1" role="dialog">
	    <!-- ============================================================== -->
	    <!-- start modal dialog  -->
	    <!-- ============================================================== -->	
		<div class="modal-dialog" role="document">
		    <!-- ============================================================== -->
		    <!-- start modal content  -->
		    <!-- ============================================================== -->	
			<div class="modal-content">
			    <!-- ============================================================== -->
			    <!-- start modal header  -->
			    <!-- ============================================================== -->	
				<div class="modal-header">
					<h4 class="modal-title">사용자 정보</h4>
 					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
 						<span aria-hidden="true">&times;</span>
 					</button>
				</div>
			    <!-- ============================================================== -->
			    <!-- end modal header  -->
			    <!-- ============================================================== -->
			    
			    <!-- ============================================================== -->
			    <!-- start modal body  -->
			    <!-- ============================================================== -->	
				<div class="modal-body">
			        <div class="row">
			          <div class="col-md-3">회원번호</div>
			          <div class="col-sm-9" id="mbNo"></div>
			        </div>
			        <div class="row">
			          <div class="col-md-3" style="margin : 5px 0px 4px 0px">구분</div>
			          <div class="col-sm-9">
					  	<label class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" name="levelGbCd" value="1"/> 
							<span class="custom-control-label">회원</span>　
					  	</label>
					  	<label class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" name="levelGbCd" value="2"/>
							<span class="custom-control-label">관리자</span>　
					  	</label>
			          </div>
			        </div>
			        <div class="row">
			          <div class="col-md-3">아이디</div>
			          <div class="col-md-6 col-md-offset-3" id="userId"></div>
			        </div>
			        <div class="row">
			          <div class="col-md-3">이름</div>
			          <div class="col-sm-9" id="userNm"></div>
			        </div>
			        <div class="row">
			          <div class="col-md-3">생년월일</div>
			          <div class="col-sm-9" id="birthDay"></div>
			        </div>
			        <div class="row">
			          <div class="col-md-3" style="margin : 5px 0px 4px 0px">성별</div>
			          <div class="col-sm-9">
					  	<label class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" name="genderGbCd" value="1"/> 
							<span class="custom-control-label">남자</span>　
					  	</label>
					  	<label class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" name="genderGbCd" value="2"/>
							<span class="custom-control-label">여자</span>　
					  	</label>
			          </div>
			         </div>
			         <div class="row">
			         	<div class="col-md-3">핸드폰</div>
			          	<div class="col-sm-9" id="hp"></div>
			         </div>
			         <div class="row">
			            <div class="col-md-3" style="margin : 5px 0px 4px 0px">수신동의</div>
			            <div class="col-sm-9">
	                      <label class="custom-control custom-checkbox custom-control-inline">
	                          <input type="checkbox" class="custom-control-input" name="hpYn">
	                          <span class="custom-control-label"></span>
	                      </label>
			         </div>
			         </div>
					<div class="row">
						<div class="col-md-3">이메일</div>
						<div class="col-sm-9" id="email"></div>
					</div>
					<div class="row">
					  	<div class="col-md-3" style="margin : 5px 0px 4px 0px">수신동의</div>
					  	<div class="col-sm-9">
				            <label class="custom-control custom-checkbox custom-control-inline">
				                <input type="checkbox" class="custom-control-input" name="emailYn">
				                <span class="custom-control-label"></span>
				            </label>
					  	</div>
					</div>
					<div class="row">
						<div class="col-md-3">주소</div>
						<div class="col-sm-9" id="addr"></div>
					</div>
					<div class="row">
						<div class="col-md-3">상세주소</div>
						<div class="col-sm-9"></div>
					</div>
					<div class="row">
						<div class="col-md-3" style="margin : 5px 0px 4px 0px">회원상태</div>			
						<div class="col-sm-9">
						  	<label class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" name="userStsCd" value="1"/> 
								<span class="custom-control-label">정상</span>　
						  	</label>
						  	<label class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" name="userStsCd" value="2"/>
								<span class="custom-control-label">정지</span>　
						  	</label>
						  	<label class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" name="userStsCd" value="3"/>
								<span class="custom-control-label">삭제</span>　
						  	</label>
						</div>
					</div>
				</div>
			    <!-- ============================================================== -->
			    <!-- end modal body  -->
			    <!-- ============================================================== -->
			    	
			    <!-- ============================================================== -->
			    <!-- start modal footer  -->
			    <!-- ============================================================== -->	
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			    <!-- ============================================================== -->
			    <!-- end modal footer  -->
			    <!-- ============================================================== -->	
			</div>
		    <!-- ============================================================== -->
		    <!-- end modal content  -->
		    <!-- ============================================================== -->	
		</div>
	    <!-- ============================================================== -->
	    <!-- end modal dialog  -->
	    <!-- ============================================================== -->	
	</div>
    <!-- ============================================================== -->
    <!-- end modal  -->
    <!-- ============================================================== -->	  
</body>
</html>