<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            #modalSelect1{
            	height:25px;
            	width:100px;
            }
            #modalSelect2{
            	height:25px;
            	width:100px;
            }
            #modalBtn{
            	color:black;
            	background:white;
            	border-radius:2px;
            }
            #classifi{
            	width:150px;
            }
            #goods{
            	width:150px;
            }
            
            #left{
            	float:left;
            	
            }
            #left2{
            	float:left;
            	margin-left:50px;
            	margin-top:2px;
            	max-height:133px;
            	width:350px;
            	overflow-y:auto;
            }
            #end{
            	margin-top:200px;
            }
            #goodscode{
            	margin-left:50px;
            }
            
</style>
<script type="text/javascript">
	     
	      function goodsSelect(classifi){
	         $.ajax({
	            url:'searchCode',
	            type:'POST',
	            dataType:'json',
	            data : {param:classifi},
	            success:function(result){
//	                alert(result);
	               //select box 초기화
	               $('#goods').find('option').remove().end().append('<option value="">상품을 선택</option>');
	               //option 추가
	               $.each(result, function(i){
		               console.log(result[i]);
		               if(result[i]=='에어컨'){
	                  $('#goods').append('<option name="goods" value="'+11+'">'+result[i]+'</option>');}
		               if(result[i]=='냉난방기'){
	                  $('#goods').append('<option name="goods" value="'+12+'">'+result[i]+'</option>');}
		               if(result[i]=='냉장고'){
	                  $('#goods').append('<option name="goods" value="'+13+'">'+result[i]+'</option>');}
		               if(result[i]=='TV'){
	                  $('#goods').append('<option name="goods" value="'+14+'">'+result[i]+'</option>');}
		               if(result[i]=='세탁기'){
	                  $('#goods').append('<option name="goods" value="'+15+'">'+result[i]+'</option>');}
		               if(result[i]=='빨래건조기'){
	                  $('#goods').append('<option name="goods" value="'+16+'">'+result[i]+'</option>');}
		               if(result[i]=='정수기'){
	                  $('#goods').append('<option name="goods" value="'+17+'">'+result[i]+'</option>');}
		               if(result[i]=='공기청정기'){
	                  $('#goods').append('<option name="goods" value="'+18+'">'+result[i]+'</option>');}
		               if(result[i]=='복합기/프린터'){
	                  $('#goods').append('<option name="goods" value="'+19+'">'+result[i]+'</option>');}
		               if(result[i]=='커피머신'){
	                  $('#goods').append('<option name="goods" value="'+21+'">'+result[i]+'</option>');}
		               if(result[i]=='제습기'){
	                  $('#goods').append('<option name="goods" value="'+22+'">'+result[i]+'</option>');}
		               if(result[i]=='드라이어'){
	                  $('#goods').append('<option name="goods" value="'+23+'">'+result[i]+'</option>');}
		               if(result[i]=='빔프로젝터'){
	                  $('#goods').append('<option name="goods" value="'+24+'">'+result[i]+'</option>');}
		               if(result[i]=='컴퓨터/노트북'){
	                  $('#goods').append('<option name="goods" value="'+25+'">'+result[i]+'</option>');}
		               if(result[i]=='무선스피커'){
	                  $('#goods').append('<option name="goods" value="'+26+'">'+result[i]+'</option>');}
		               if(result[i]=='비데'){
	                  $('#goods').append('<option name="goods" value="'+27+'">'+result[i]+'</option>');}
		               if(result[i]=='면도기'){
	                  $('#goods').append('<option name="goods" value="'+28+'">'+result[i]+'</option>');}
		               if(result[i]=='음식물처리기'){
	                  $('#goods').append('<option name="goods" value="'+29+'">'+result[i]+'</option>');}
		               if(result[i]=='제빙기'){
	                  $('#goods').append('<option name="goods" value="'+31+'">'+result[i]+'</option>');}
		               if(result[i]=='전자레인지'){
	                  $('#goods').append('<option name="goods" value="'+32+'">'+result[i]+'</option>');}
		               if(result[i]=='에어프라이어'){
	                  $('#goods').append('<option name="goods" value="'+33+'">'+result[i]+'</option>');}
		               if(result[i]=='오븐'){
	                  $('#goods').append('<option name="goods" value="'+34+'">'+result[i]+'</option>');}
		               if(result[i]=='오븐'){
	                  $('#goods').append('<option name="goods" value="'+35+'">'+result[i]+'</option>');}
		               if(result[i]=='침대(매트리스+프레임)'){
	                  $('#goods').append('<option name="goods" value="'+41+'">'+result[i]+'</option>');}
		               if(result[i]=='침대'){
	                  $('#goods').append('<option name="goods" value="'+42+'">'+result[i]+'</option>');}
		               if(result[i]=='쇼파'){
	                  $('#goods').append('<option name="goods" value="'+43+'">'+result[i]+'</option>');}
		               if(result[i]=='책상'){
	                  $('#goods').append('<option name="goods" value="'+44+'">'+result[i]+'</option>');}
		               if(result[i]=='악기'){
	                  $('#goods').append('<option name="goods" value="'+51+'">'+result[i]+'</option>');}
		               if(result[i]=='명품'){
	                  $('#goods').append('<option name="goods" value="'+52+'">'+result[i]+'</option>');}
		               if(result[i]=='귀금속'){
	                  $('#goods').append('<option name="goods" value="'+53+'">'+result[i]+'</option>');}
		               if(result[i]=='침실패키지'){
	                  $('#goods').append('<option name="goods" value="'+61+'">'+result[i]+'</option>');}
		               if(result[i]=='주방패키지'){
	                  $('#goods').append('<option name="goods" value="'+62+'">'+result[i]+'</option>');}
		               if(result[i]=='욕실패키지'){
	                  $('#goods').append('<option name="goods" value="'+63+'">'+result[i]+'</option>');}
		               if(result[i]=='기타패키지'){
	                  $('#goods').append('<option name="goods" value="'+64+'">'+result[i]+'</option>');}
		                  
	               });
	              
	            },
	            erro:function(jqXHR, textStatus, errorThrown){
	               alert('오류가 발생했습니다');
	               
	            }
	            
	         });
	      }



	      window.onload=function(){
	         $('#modalBtn').click(function(){
		         
			       $.ajax({
					url:'searchList',
					type:'GET',
					data:{'param':$("#goods option:selected").val()},
					
					success:function(result){

						
						var goodsList=result;
						console.log(goodsList);
						$('#goodsTable').find('tr').remove().end().append('<tr><td></td></tr>')
						$.each(goodsList,function(index,goods){
							$('#goodsTable').append('<tr><td>'+goods.gdsCd+'</td></tr>');
						});
					},
					erro:function(jqXHR,testStatus,errorThrown){
						alert('오류가 발생했습니다');
					}
			     }); 
		  });   


		  }

</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/actImg.js"></script>
</head>
<body>


<div class="col-md-8 col-md-offset-2" id="actContent">
		<h2>경매상품등록</h2>
        <table class="table" id="daeContent">
            <tr>
                <td width="100px"><label>작 성 자</label></td>
                <td>관 리 자</td>
            </tr>
            <tr>
            	<td><label>상품선택</label></td>
            	<td>
            		<button type="button" data-toggle="modal" data-target="#myModal">
				 		 찾기
					</button>
				
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
				      </div>
				      <div class="modal-body" id="modalData">
				      <div id="left">
						       <label>대분류</label>
								<select id="classifi" name="classifi"
		                           onchange="goodsSelect(this.value);" class="form-control">
		                           <option value="">선택하세요</option>
		                           <option value="10">대형가전</option>
		                           <option value="20">중형가전</option>
		                           <option value="30">소형가전</option>
		                           <option value="40">가구</option>
		                           <option value="50">기타</option>
		                           <option value="60">패키지</option>
		                        </select>
		                        <br>
		                        <label>제품분류</label>
		                        <!-- <select class="form-control" id="goods" name="goods" onchange="goods2Select(this.value);"> -->
		                        <select class="form-control" id="goods">
		                           <option value="">선택하세요</option>
		                        </select><br>
					       <div><button id="modalBtn" >검색</button></div>
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
				        <button type="button" class="btn btn-default">선택</button>
				        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				      </div>
				      </div>
				    </div>
				  </div>
				</div>
            	</td>
            </tr>
<div>
<form action="/mp/mng/actInsert" enctype="multipart/form-data" method="post">
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
			</form>
</div>
        </table>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>