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
	            <form action="/used/mng" class="form-horizontal" enctype="multipart/form-data" method="post">
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
                    <input type="hidden" name="GDS_LCLASS_CD" value="20">
                    <div class="form-group">
                    	<label for="category" class="col-sm-2 control-label">카테고리</label>
                        <select class="form-control" id="category" name="GDS_MCLASS_CD" style="width:200px">
						  <option value="10">대형가전</option>
						  <option value="20">소형가전</option>
						  <option value="30">주방가전</option>
						  <option value="40">가구</option>
						  <option value="50">기타</option>
						</select>
                    </div>
                   	<label class="col-sm-2 control-label">소그룹</label><br>
                    <div class="form-group" id="radiog">
                    	<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="11"> 에어컨
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="12"> 냉낭반기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="13"> 냉장고
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="14"> TV
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="15"> 세탁기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="16"> 빨래건조기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="17"> 정수기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="18"> 공기청정기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="19"> 복합기/프린터
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="21"> 커피머신
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="22"> 제습기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="23"> 청소기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="24"> 드라이어
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="25"> 빔프로젝터
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="26"> 컴퓨터/노트북
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="27"> 무선스피커
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="28"> 비데
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="29"> 면도기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="31"> 음식물처리기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="32"> 제빙기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="33"> 전자레인지
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="34"> 에어프라이어
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="35"> 오븐
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="41"> 침대(매트리스+프레임)
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="42"> 매트리스
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="43"> 쇼파
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="44"> 책상
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="51"> 악기
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="52"> 명품
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="53"> 귀금속
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="61"> 침실패키지
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="62"> 주방패키지
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="63"> 욕실패키지
						</label>
						<label class="radio-inline">
						<input type="radio" name="GDS_SCLASS_CD" id="inlineRadio1" value="64"> 기타패키지
						</label>
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
                    <label for="USED_GDS_PRICE" class="col-sm-2 control-label">가격</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="USED_GDS_PRICE" id="price" placeholder="숫자로만 입력">
                    </div>
                  </div>
                  <textarea class="form-control" id="explain" name="CONTENT" rows="5" placeholder="설명"></textarea>
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