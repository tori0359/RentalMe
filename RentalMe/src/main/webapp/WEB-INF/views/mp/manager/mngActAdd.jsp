<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<meta charset="UTF-8">
<style type="text/css">
	#actContent{
		
	}
	h2{
		padding-top:50px;
		padding-bottom:50px;
	}
	#mpContent{
		padding-top:50px;
	}
	textarea{
		width:85%;
		height:120px;
	}
	tr>td:nth-child(1){
		text-align:center;
	}
	#biddingUnit{
		width:80px;
	}
	#daeButton{
		float:right;
		padding-right:110px;
	}
	p{
		font-size:4px;
	}
	#used_main_img{
                border: 0.2px solid gray;
                width: 370px;
                height: 170px;
                margin-top:10px;
                float:left;
            }
            #used_sub_img_group{
                width: 300px;
            }
            .used_sub_img{
                display: inline-block;
                border: 0.2px solid gray;
                width: 60px;
                height: 60px;
                margin:10px 5px 2px 0px;
                float:left;
            }
            .used_sub_img>img{
                position: absolute;
            }
            #imgfile{
            }
            #state{
            	width:110px;
            	height:25px;
            }
            
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cancel").click(function(){
			window.history.back();
		})
	});
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/actImg.js"></script>
</head>
<body>
<div class="col-md-8 col-md-offset-2" id="actContent">
<form action="/mp/mng/actInsert" enctype="multipart/form-data" method="post">
		<h2>경매상품등록</h2>
        <table class="table" id="daeContent">
            <tr>
                <td width="100px"><label>작 성 자</label></td>
                <td>관 리 자</td>
            </tr>
            <tr>
                <td><label>분류</label></td>
                <td>
			        	<select style="height:26px;" name=gdsSclassCd id="se">
			        		<option value="" selected="selected">분류선택</option>
			        		<option value="11" >에어컨</option>
			        		<option value="12" >냉난방기</option>
			        		<option value="13" >냉장고</option>
			        		<option value="14" >TV</option>
			        		<option value="15" >세탁기</option>
			        		<option value="16" >빨래건조기</option>
			        		<option value="17" >정수기</option>
			        		<option value="18" >공기청정기</option>
			        		<option value="19" >복합기/프린터</option>
			        		<option value="21" >커피머신</option>
			        		<option value="22" >제습기</option>
			        		<option value="23" >청소기</option>
			        		<option value="24" >드라이어</option>
			        		<option value="25" >빔프로젝터</option>
			        		<option value="26" >컴퓨터/노트북</option>
			        		<option value="27" >무선스피커</option>
			        		<option value="28" >비데</option>
			        		<option value="29" >면도기</option>
			        		<option value="31" >음식물처리기</option>
			        		<option value="32" >제빙기</option>
			        		<option value="33" >전자레인지</option>
			        		<option value="34" >에어프라이어</option>
			        		<option value="35" >오븐</option>
			        		<option value="41" >침대</option>
			        		<option value="42" >매트리스</option>
			        		<option value="43" >쇼파</option>
			        		<option value="44" >책상</option>
			        		<option value="51" >악기</option>
			        		<option value="52" >명품</option>
			        		<option value="53" >귀금속</option>
			        		<option value="n" >새상품</option>
			        	</select>
          		</td>
            </tr>
            <tr>
            	<td><label>상품구분</label></td>
            	<td>
            	<select id="state" name="gdsGbCd">
	            	<option value="n">새상품</option>
	            	<option value="u">중고상품</option>
            	</select>
            	</td>
            </tr>
            <tr>
                <td><label>상품코드</label></td>
                <td><input type="text" name="gdsCd" id=""/>&nbsp&nbsp모델명&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="modelNm"/></td>
            </tr>
            <tr>
            	<td><label>상품명</label></td>
                <td><input type="text" name="gdsNm" id="">&nbsp&nbsp브랜드명&nbsp&nbsp<input type="text" name="brandNm"></td>
            </tr>
            <tr>
            	<td><label>시작가</label></td>
            	<td><input type="text" name="gdsStPrice"/>&nbsp&nbsp상세코드&nbsp&nbsp<input type="text" name="gdsCdDetail"/></td>
            </tr>
            <tr>
            	<td><label>응찰단위</label></td>
            	<td>
            		<select id="biddingUnit" name="unitPrice">
            			<option value="3000">3000</option>
            			<option value="5000">5000</option>
            			<option value="10000" selected="selected">10000</option>
            			<option value="20000">20000</option>
            			<option value="50000">50000</option>
            		</select>&nbsp원<input type="hidden" value="30" name="GdsLclassCd"><input type="hidden" value="80" name="GdsMclassCd">
            	</td>
            </tr>
            <tr>
            	<td><label>시작시간</label></td>
            	<td><input id="startTime" type="datetime-local" name="actStTime"/></td>
            </tr>
            <tr>
            	<td><label>종료시간</label></td>
            	<td><input id="endTime" type="datetime-local" name="actEdTime"/></td>
            </tr>
            <tr>
            	<td><label>제품설명</label></td>
            	<td><textarea style="resize:none;" name="content"></textarea></td>
            </tr>
             <tr>
             </tr>
             <tr>
	             <td><label for="imgfile" id="imgfile_label">이미지 업로드</label></td>
	             <td>
	                <p>* 상품이미지는 640x640에 최적화 되어 있습니다.<br/>
			           - 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br/>
			           - 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.
			           최대 지원 사이즈인 640x640으로 리사이즈 해서 올려주세요<br/>
			           (개당 이미지 최대 10M)
		            </p>
	             		<div id="used_imgUpload">
	                        <input type="file" id="imgfile" name="imgfile" multiple="multiple" accept=".jpg,.jpeg,.png,.gif,.bmp">
	                    </div>
	                    <div id="used_main_img">
	                    
                   		</div>
                    <div id="used_sub_img_group">
	                        <div class="used_sub_img" id="sub_img1">
									
	                        </div>
	                        <div class="used_sub_img" id="sub_img2">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img3">
	
	                        </div>
	                </div>
	             </td>
             </tr>
            <tr>
            	<td></td>
                <td id="daeButton" >
                   <input type="submit" value="등록"/>
                   <input id="cancel" type="reset" value="취소">
                </td>
            </tr>
        </table>
</form>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>