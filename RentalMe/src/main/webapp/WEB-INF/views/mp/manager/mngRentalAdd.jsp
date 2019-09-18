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
            
            
            
</style>
<script type="text/javascript">
	     
	      window.onload=function(){
					$('#cancel').click(function(){
							window.history.back();
					})
				   
		  });

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
                    var main_img_html = "<img width='370' height='170' src=\"" + e.target.result + "\" />";
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
                <td width="120px"><label>작 성 자</label></td>
                <td>관 리 자</td>
            </tr>
        
	<form action="/mp/mng/rentalInsert" enctype="multipart/form-data" method="post">
            <tr>
            	<td><label>상품-대분류</label></td>
            	<td>
	            	<input type="hidden" value="10" name="gdsLclassCd">렌탈상품
            	</td>
            </tr>
	        <tr>
	            <td><label>상품-중분류</label></td>
	            <td>
	            <select name="gdsMclassCd">
	            	<option value="10">대형가전</option>	
	            	<option value="20">소형가전</option>	
	            	<option value="30">주방가전</option>	
	            	<option value="40">가구</option>	
	            	<option value="50">기타</option>	
	            	<option value="60">패키지</option>	
	            </select>&nbsp&nbsp&nbsp&nbsp&nbsp<label>상품-소분류</label>&nbsp&nbsp&nbsp&nbsp&nbsp
	            <select name="gdsSclassCd">
	            	<option value="11">에어컨</option>
	            	<option value="12">냉난방기</option>
	            	<option value="13">냉장고</option>
	            	<option value="14">TV</option>
	            	<option value="15">세탁기</option>
	            	<option value="16">빨래건조기</option>
	            	<option value="17">정수기</option>
	            	<option value="18">공기청정기</option>
	            	<option value="19">복합기/프린터</option>
	            	<option value="21">커피머신</option>
	            	<option value="22">제습기</option>
	            	<option value="23">청소기</option>
	            	<option value="24">드라이어</option>
	            	<option value="25">빔프로젝터</option>
	            	<option value="26">컴퓨터/노트북</option>
	            	<option value="27">무선스피커</option>
	            	<option value="28">비데</option>
	            	<option value="29">면도기</option>
	            	<option value="31">음식물처리기</option>
	            	<option value="32">제빙기</option>
	            	<option value="33">전자레인지</option>
	            	<option value="34">에어프라이어</option>
	            	<option value="35">오븐</option>
	            	<option value="41">침대(매트리스+프레임)</option>
	            	<option value="42">침대</option>
	            	<option value="43">쇼파</option>
	            	<option value="44">책상</option>
	            	<option value="51">악기</option>
	            	<option value="52">명품</option>
	            	<option value="53">귀금속</option>
	            	<option value="61">침실패키지</option>
	            	<option value="62">주방패키지</option>
	            	<option value="63">욕실패키지</option>
	            	<option value="64">기타패키지</option>
	            </select></td>
	        </tr>
	        <tr>
	            <td><label>상품명</label></td>
	            <td><input type="text" name="gdsNm" id="gdsNm">&nbsp&nbsp<label>브랜드명</label>&nbsp&nbsp<input type="text" name="brandNm" id="brandNm"></td>
	        </tr>
	        <tr>
	        	<td><label>모델명</label></td>
	            <td><input type="text" name="modelNm" id="gdsNm">&nbsp&nbsp<label>상품코드</label>&nbsp&nbsp<input type="text" name="gdsCd"/>
	        </tr>
	        <tr>
	        	<td><label>상품 가격</label></td><td><input type="text" name="prdPrice">&nbsp&nbsp<label>렌탈 기간</label>&nbsp
	        	<select name="prdContDate">
	        			<option value="3">3개월</option>
	        			<option value="6">6개월</option>
	        			<option value="9">9개월</option>
	        			<option value="12">12개월</option>
	        			<option value="24">24개월</option>
	        	</select>
	        	</td>
	        </tr>
	        <tr>
	        	<td><label>배송비용</label></td><td><input type="text" name="prdDeliveryCost"/>
	        	&nbsp&nbsp<label>설치비용</label>&nbsp&nbsp<input type="text" name="prdInstCost"/>
	        	</td>
	        </tr>
	        <tr>
	        	<td><label>AS조건</label></td>
	        	<td><input type="text" name="prdAsContent" value="렌탈기간 내 무상 AS"/>&nbsp&nbsp&nbsp&nbsp<label>상품상태</label>&nbsp&nbsp
	            <label>새상품</label>&nbsp&nbsp<input type="checkbox" name="gdsGbCd" value="N"><label>&nbsp&nbsp&nbsp&nbsp중고상품</label>&nbsp&nbsp<input type="checkbox" name="gdsGbCd" value="Y"></td>
	        </td>
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
                <td id="daeButton" >
                   <input type="submit" value="등록"/>
                   <input id="cancel" type="reset" value="취소">
                </td>
            </tr>
	</form>
        </table>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>