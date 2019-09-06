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
		font-size:5px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cancel").click(function(){
			window.history.back();
		})
	});
</script>
</head>
<body>
<div class="col-md-8 col-md-offset-2" id="actContent">
<form action="/mp/mng/csNoticeAdd" method="post">
		<h2>공지/FAQ등록</h2>
        <table class="table" id="daeContent">
            <tr>
                <td><label for="" >작 성 자</label></td>
                <td>관 리 자</td>
            </tr>
            <tr>
                <td><label for="">분류</label></td>
                <td>
			        	<select style="height:26px;" name="csGbCd" id="se">
			        		<option value="10" id="notic" >공지사항</option>
			        		<option value="20" id="faq">FAQ</option>
			        	</select>
          		</td>
            </tr>
            <tr>
                <td><label for="sub" >상품코드</label></td>
                <td><input type="text" name="gdsCd" id=""></td>
            </tr>
            <tr>
            	<td><label for="sub" >상품명</label></td>
                <td><input type="text" name="gdsNm" id=""></td>
            </tr>
            <tr>
            	<td><label>시작가</label></td>
            	<td><input type="text" name="gdsStPrice"></td>
            </tr>
            <tr>
            	<td><label>응찰단위</label></td>
            	<td>
            		<select id="biddingUnit">
            			<option value="3000" selected="selected">3000</option>
            			<option value="5000">5000</option>
            			<option value="10000">10000</option>
            			<option value="20000">20000</option>
            			<option value="50000">50000</option>
            		</select>
            	</td>
            </tr>
            <tr>
            	<td><label>시작시간</label></td>
            	<td><input id="startTime" type="datetime-local"/></td>
            </tr>
            <tr>
            	<td><label>종료시간</label></td>
            	<td><input id="endTime" type="datetime-local"/></td>
            </tr>
            <tr>
            	<td><label>제품설명</label></td>
            	<td><textarea style="resize:none;"></textarea></td>
            </tr>
             <tr> 
	             <td><label>이미지 등록</label></td>
	             <td>
		            <p>* 상품이미지는 640x640에 최적화 되어 있습니다.<br/>
		           - 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br/>
		           - 사진을 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br/>
		           - 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br/>
		           최대 지원 사이즈인 640x640으로 리사이즈 해서 올려주세요<br/>
		           (개당 이미지 최대 10M)
		            </p>
	             </td>
             </tr>
             <tr>
	             <td><label for="imgfile" id="imgfile_label">이미지 업로드</label></td>
	             <td>
	             		<div id="used_imgUpload">
	                        <input type="file" id="imgfile" multiple accept=".jpg,.jpeg,.png,.gif,.bmp">
	                    </div>
	             </td>
             </tr>
             <tr>
            	 <td>
                    <div id="used_main_img">

                    </div>
            	 </td>
                 <td>
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