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
	#daeContent td:nth-child(odd){
		width:20%;
		vertical-align:middle;
	}
	#daeContent td:nth-child(even){
		width:30%;
		vertical-align:middle;
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
	tr>td:nth-child(2){
		
	}
	tr>td:nth-child(3){
		text-align:center;
	}
	#biddingUnit{
		width:80px;
	}
	p{
		font-size:4px;
	}
			#used_main_img{
                border: 0.2px solid gray;
                width: 385px;
                height: 170px;
                margin-top:10px;
                float:left;
            }
            #used_sub_img_group{
                width: 400px;
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
            #goodsBtn{
            	background:white;
            	text-align:left;
            }
            #goodsTable{
            	text-align:left;
            }
            #listname{
            	cursor:pointer;
            	color:black;
            }
            #listname:hover{
            	text-decoration: none;
            	font-weight: bolder;
            }
            #firSelect{
            	height:28px;
            }
            #secSelect{
            	height:28px;
            }
            
            
</style>
<script type="text/javascript">

		window.onload=function(){
			$('#cancel').click(function(){
				window.history.back();
		    })
		    
		}
		//selectbox
		function selectMcGoods(gdsMclassCd){
			console.log("getget함수 호출");
			console.log(gdsMclassCd);
			 	$.ajax({
					url:'searchSelect',
					type:'GET',
					dataType:'json',
					data:{param:gdsMclassCd},
				//	console.log(param);
				success:function(result){
	               //select box 초기화
	               $('#secSelect').find('option').remove().end().append('<option value="">상품을 선택</option>');
	               //option 추가
	               $.each(result, function(i){
		               console.log(result[i]);

		               //대형가전
		               if(result[i]=='에어컨'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+11+'">'+result[i]+'</option>');}
		               if(result[i]=='냉난방기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+12+'">'+result[i]+'</option>');}
		               if(result[i]=='냉장고'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+13+'">'+result[i]+'</option>');}
		               if(result[i]=='TV'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+14+'">'+result[i]+'</option>');}
		               if(result[i]=='세탁기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+15+'">'+result[i]+'</option>');}
		               if(result[i]=='빨래건조기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+16+'">'+result[i]+'</option>');}
		               if(result[i]=='정수기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+17+'">'+result[i]+'</option>');}
		               if(result[i]=='공기청정기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+18+'">'+result[i]+'</option>');}
		               if(result[i]=='복합기/프린터'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+19+'">'+result[i]+'</option>');}

						//소형가전
		               if(result[i]=='커피머신'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+21+'">'+result[i]+'</option>');}
		               if(result[i]=='제습기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+22+'">'+result[i]+'</option>');}
		               if(result[i]=='청소기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+23+'">'+result[i]+'</option>');}
		               if(result[i]=='드라이어'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+24+'">'+result[i]+'</option>');}
		               if(result[i]=='빔프로젝터'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+25+'">'+result[i]+'</option>');}
		               if(result[i]=='컴퓨터/노트북'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+26+'">'+result[i]+'</option>');}
		               if(result[i]=='무선스피커'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+27+'">'+result[i]+'</option>');}
		               if(result[i]=='비데'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+28+'">'+result[i]+'</option>');}
		               if(result[i]=='면도기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+29+'">'+result[i]+'</option>');}

					//주방
		               if(result[i]=='음식물처리기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+31+'">'+result[i]+'</option>');}
		               if(result[i]=='제빙기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+32+'">'+result[i]+'</option>');}
		               if(result[i]=='전자레인지'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+33+'">'+result[i]+'</option>');}
		               if(result[i]=='에어프라이어'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+34+'">'+result[i]+'</option>');}
		               if(result[i]=='오븐'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+35+'">'+result[i]+'</option>');}

					//가구
		               if(result[i]=='침대(매트리스+프레임)'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+41+'">'+result[i]+'</option>');}
		               if(result[i]=='침대'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+42+'">'+result[i]+'</option>');}
		               if(result[i]=='쇼파'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+43+'">'+result[i]+'</option>');}
		               if(result[i]=='책상'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+44+'">'+result[i]+'</option>');}

					//기타
			         if(result[i]=='악기'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+51+'">'+result[i]+'</option>');}
		               if(result[i]=='명품'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+52+'">'+result[i]+'</option>');}
		               if(result[i]=='귀금속'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+53+'">'+result[i]+'</option>');}

					//패키지
		               if(result[i]=='침실패키지'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+61+'">'+result[i]+'</option>');}
		               if(result[i]=='주방패키지'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+62+'">'+result[i]+'</option>');}
		               if(result[i]=='욕실패키지'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+63+'">'+result[i]+'</option>');}
		               if(result[i]=='기타패키지'){
	                  $('#secSelect').append('<option name="gdsSclassCd" value="'+64+'">'+result[i]+'</option>');}
		                  
	               });
	              
	            },
	            erro:function(jqXHR, textStatus, errorThrown){
	               alert('오류가 발생했습니다');
	            }
				})
		}

		function selectScGoods(gdsSclassCd){
			console.log("들어옴"+$("#secSelect option:selected").val());
			$.ajax({
				url:'searchScSelect',
				type:'GET',
				data:{'param':$("#secSelect option:selected").val(),'param2':$("#firSelect option:selected").val()},
				success:function(result){
					$('#ajax').find('td').remove();
					//$('#ajax').append('<td><label>상품코드</label></td><td><input type="text" name="gdsCd" readonly=readonly value="'+"10"+$("#secSelect option:selected").val()+result+'""/></td>');
					$('#ajax').append('<td><label>상품코드</label></td><td><input type="text" name="gdsCd" readonly="readonly" value="'+result+'"/></td>');
					//document.getElementById('gdsCd').setAttribute('value',result);
					//console.log('ff');

					
				}

			})
		}
	     
	      

		  //이미지 등록
	        var cnt=0;
            var sel_files = [];
	        $(function(){ 
                $("#imgfile").on("change", handleImgsFilesSelect);
                
                //가격: 숫자만 입력
                $("#price").on("keyup", function() { 
                    $(this).val($(this).val().replace(/[^0-9]/g,"")); 
                }).on("focusout", function(){
                    $(this).val($(this).val().replace(/[^0-9]/g,""));
                });
                
                $('#submit_btn').click(function(){
                    if($('#sub').val()=="" || $('#price').val()=="" || $('#explain').val()==""){
                        alert('꼭 써주세요');
                        return false;
                    }
                });
            });
            

	        
        function handleImgsFilesSelect(e) {
        	var imgCnt = document.getElementById("imgfile");
        	if(imgCnt.files.length>12){
        		alert('13개 이상 선택할 수 없습니다.');
        		$('#imgfile').val("");
        		$('img').remove();
        		return false;
        	}
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            $('img').remove();
            cnt=0;
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    var main_img_html = "<img width='385' height='170' src=\"" + e.target.result + "\" />";
                    var img_html = "<img width='60' height='60' src=\"" + e.target.result + "\" />";
                    if(cnt==0){
                        $("#used_main_img").append(main_img_html);
                    }else if(cnt==1){
                        $("#sub_img1").append(img_html);
                    }else if(cnt==2){
                        $("#sub_img2").append(img_html);
                    }else if(cnt==3){
                        $("#sub_img3").append(img_html);
                    }else if(cnt==4){
                        $("#sub_img4").append(img_html);
                    }else if(cnt==5){
                        $("#sub_img5").append(img_html);
                    }else if(cnt==6){
                        $("#sub_img6").append(img_html);
                    }else if(cnt==7){
                        $("#sub_img7").append(img_html);
                    }else if(cnt==8){
                        $("#sub_img8").append(img_html);
                    }else if(cnt==9){
                        $("#sub_img9").append(img_html);
                    }else if(cnt==10){
                        $("#sub_img10").append(img_html);
                    }else if(cnt==11){
                        $("#sub_img11").append(img_html);
                    }else{
                        alert("최대 12개까지 가능합니다");
                        cnt--;
                    }
                    cnt++;
                    
                    
                }
                reader.readAsDataURL(f);
            });
        } 	
       
		
</script>
</head>
<body>
<div class="col-md-8 col-md-offset-2" id="actContent">
		<h2>경매상품등록</h2>
        <table class="table" id="daeContent">
            <tr>
                <td><label>작 성 자</label></td>
                <td style="width:center">관 리 자</td>
                <td></td>
                <td></td>
            </tr>
        
	<form action="/mp/mng/rentalInsert" enctype="multipart/form-data" method="post">
            <tr>
            	<td><label>상품-대분류</label></td>
            	<td style="width:center">
	            	<input type="hidden" value="10" name="gdsLclassCd">렌탈상품
            	</td>
            	<td></td>
            	<td></td>
            </tr>
	        <tr>
	            <td><label>상품-중분류</label></td>
	            <td>
	            <select style="width:75%;height:40px;" class="form-control" id="firSelect" name="gdsMclassCd" onchange="selectMcGoods(this.value);">
	            	<option selected="selected" value="">대분류상품</option>
	            	<option value="10">대형가전</option>	
	            	<option value="20">소형가전</option>	
	            	<option value="30">주방가전</option>	
	            	<option value="40">가구</option>	
	            	<option value="50">기타</option>	
	            	<option value="60">패키지</option>	
	            </select><td><label>상품-소분류</label></td>
	            <td>
	            <select style="width:75%;height:40px;" class="form-control" id="secSelect" name="gdsSclassCd" onchange="selectScGoods(this.value);">
	            	<option selected="selected" value="">소분류상품</option>
	            </select>
	            </td>
	        </tr>
	        <tr>
	            <td><label>상품명</label></td>
	            <td><input style="width:75%;height:40px;" class="form-control" type="text" name="gdsNm" id="gdsNm"></td>
	            <td><label>브랜드명</label></td>
	            <td><input style="width:75%;height:40px;" class="form-control" type="text" name="brandNm" id="brandNm"></td>
	        </tr>
	        <tr>
	        	<td><label>모델명</label></td>
	            <td><input style="width:75%;height:40px;" class="form-control" type="text" name="modelNm" id="gdsNm"></td>
	            <td></td><td></td>
	        </tr>
	     <!--    <tr id="ajax">
	        	<td><label>상품코드</label></td>
	        	<td><input type="text" id="gdsCd" name="gdsCd"/></td>
	        </tr> -->
	        <tr>
	        	<td><label>상품 가격</label></td><td><input style="width:75%;height:40px;" type="text" class="form-control" name="prdPrice"></td><td><label>렌탈 기간</label></td>
	        	<td>
	        	<select style="width:75%;height:40px;" class="form-control" name="prdContDate" style="height:28px;">
	        			<option value="3">3개월</option>
	        			<option value="6">6개월</option>
	        			<option value="9">9개월</option>
	        			<option value="12">12개월</option>
	        			<option value="15">15개월</option>
	        			<option value="18">18개월</option>
	        			<option value="21">21개월</option>
	        			<option value="24">24개월</option>
	        			<option value="27">27개월</option>
	        			<option value="30">30개월</option>
	        	</select>
	        	</td>
	        </tr>
	        <tr>
	        	<td><label>배송비용</label></td>
	        	<td><input style="width:75%;height:40px;" class="form-control" type="text" name="prdDeliveryCost" value="5000"/></td>
	        	<td><label>설치비용</label></td>
	        	<td>
	        		<input style="width:75%;height:40px;" class="form-control" type="text" value="무료" name="prdInstCost"/>
	        	</td>
	        </tr>
	        <tr>
	        	<td><label>AS조건</label></td>
	        	<td><input style="width:75%;height:40px;" type="text" name="prdAsContent" class="form-control" value="렌탈기간 내 무상 AS"/></td>
	        	<td><label>상품상태</label></td>
	        	<td style="vertical-align:middle;">
	        		새상품<input style="width:40px;" type="checkbox" checked="checked" name="gdsGbCd" value="N">중고상품&nbsp&nbsp<input style="width:40px;" type="checkbox" name="gdsGbCd" value="U">
	            </td>
	        </tr>
	        <tr>
	        </tr>
             <tr>
	             <td  style="vertical-align:middle;"><label>이미지 업로드</label></td>
	             <td colspan="3">
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
                   		<br/><br/><br/><br/><br/><br/><br/><br/>
	                        <div class="used_sub_img" id="sub_img1">
									
	                        </div>
	                        <div class="used_sub_img" id="sub_img2">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img3">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img4">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img5">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img6">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img7">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img8">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img9">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img10">
	
	                        </div>
	                        <div class="used_sub_img" id="sub_img11">
	
	                        </div>
	                	</div>
	             </td>
             </tr>
            <tr>
            	<td></td>
            	<td></td>
            	<td style="text-align:right;">
            	</td>
                <td>
                   <input class="btn btn-primary" type="submit" value="등록"/>
                   <input id="cancel" class="btn btn-danger" type="reset" value="취소">
                </td>
            </tr>
	</form>
        </table>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>