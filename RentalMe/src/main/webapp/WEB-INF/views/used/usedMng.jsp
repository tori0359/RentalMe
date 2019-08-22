<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/used.css" >
<jsp:include page="../template/headerRe.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/used.js"></script>
</head>
<body>
<!-- 상품번호,회원번호,등록일자,상품대분류코드,중분류,소분류,상품구분코드, 
	브랜드명, 모델명, 중고상품가격, 제목, 내용, 중고상품결과상태, 삭제여부, 이미지1,2,3,4
	
-->
	<div id="usedMng">
	    <h2 id="usedMng_title">
	        <div id="top">물품등록</div>
	    </h2>
	    
	    <div id="usedMng_frame">
            <div id="usedMng_content">
	            <h4>이미지등록</h4>
	            <p>* 상품이미지는 640x640에 최적화 되어 있습니다.<br/>
	           - 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br/>
	           - 사진을 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br/>
	           - 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br/>
	           최대 지원 사이즈인 640x640으로 리사이즈 해서 올려주세요<br/>
	           (개당 이미지 최대 10M)
	            </p>
	            <form action="#" class="form-horizontal" enctype="multipart/form-data" method="post">
                    <div id="used_imgUpload">
                        <label for="imgfile" id="imgfile_label">이미지 업로드</label>
                        <input type="file" id="imgfile" multiple accept=".jpg,.jpeg,.png,.gif,.bmp">
                    </div>
                    <br/>
                    <div id="used_main_img">

                    </div><br/>
                    <div id="used_sub_img_group">
                        <div class="used_sub_img" id="sub_img1">

                        </div>
                        <div class="used_sub_img" id="sub_img2">

                        </div>
                        <div class="used_sub_img" id="sub_img3">

                        </div>
                    </div>
                    <div class="form-group">
                    	<label for="category" class="col-sm-2 control-label">카테고리</label>
                        <select class="form-control" id="category" name="GDS_MCLASS_CD" style="width:200px">
						  <option>대형가전</option>
						  <option>소형가전</option>
						  <option>주방가전</option>
						  <option>가구</option>
						  <option>기타</option>
						</select>
                    </div>
                    <div class="form-group">
                    	<label for="status" class="col-sm-2 control-label">상태</label>
                        <select class="form-control" id="status" name="status" style="width:200px">
						  <option>중고</option>
						  <option>중고&#43;하자</option>
						  <option>새물품&#40;미사용&#41;</option>
						  <option>새것&#43;하자</option>
						</select>
                    </div>
                  <div class="form-group">
                    <label for="BRAND_NM" class="col-sm-2 control-label">브랜드명</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="BRAND_NM" id="sub" placeholder="브랜드명">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="MODEL_NM" class="col-sm-2 control-label">모델명</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="MODEL_NM" id="sub" placeholder="모델명">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="SUB" class="col-sm-2 control-label">제목</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="SUB" id="sub" placeholder="제목">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="price" class="col-sm-2 control-label">가격</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="price" id="price" placeholder="숫자로만 입력">
                    </div>
                  </div>
                  <textarea class="form-control" id="explain" name="content" rows="5" placeholder="설명"></textarea>
                  <br>
                  
                  <div class="form-group">
                    <div class="col-sm-offset-11">
                      <button type="submit" id="submit_btn" class="btn btn-default">물품 등록</button>
                    </div>
                  </div>
                </form>
	        </div>
	    </div>
    </div>
	
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>