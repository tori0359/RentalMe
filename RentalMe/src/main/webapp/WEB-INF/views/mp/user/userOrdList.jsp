<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#title2{
      font-size: 15pt;
      font-weight: bolder;
      font-family: "nanumB";
      margin: 60px 0 50px 0;
}
    
#choosedel{
      font-family: "nanumR";
      width:55px;
      height:30px;
      float:right;
      color:black;
      font-weight:600;
}


.ordtable>thead>tr>th{
    text-align:center;
    font-family: "nunumB";
 }
      
.ordtable>tbody>tr>td{
    vertical-align: middle;
    text-align: center;
    display: table-cell;
    line-height:30px;
    font-family: "nunumB";
 }
 .ordtable>tbody>tr>td:nth-child(1){
 	text-align:left;
 }
      
.ordimg{
      width:100px;
}

 .delete_btn1{
      background-color: #D8D8D8;
      color:black;
      height:30px;
      font-family: "nanumB";   
      font-weight: border;   
}

.delete_btn2{
      background-color: #4d4d4d;
      color:white;
      height:30px;
      font-family: "nanumB";
      font-weight: border;      
}

.btn:hover,
.btn:focus{
      background-color: #D8D8D8;
}

.cartresult{
      height:100px;
      width: 230px;
      float:right;
}

.cartresult>p{
      font-weight:bolder;
      font-size: 15pt;
      font-family: "nanumB";
      line-height: 100px;
}
    
.cartbtn{
      width:180px;
      height:50px;
      float:right;
      margin-top:25px;
}
.titlediv{
      height:40px;
}
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{
   background-position:0 0;
   color:red;
}
.satis h4{
   font-family:"nanumEB";
}
.satis p{
   font-family:"nanumB";
}
#red{
   color:red;
}
span em.warning{
  color:#f00;
  fontweight: bold;
}
#info{
	width:93%;
	margin: 20px auto;
	border:7px solid #E6E6E6;
	padding: 15px;
}

#info p{
	line-height:20px;
	font-family:"nanumB";
}
.tdtext{
	margin:40px 0;
}
.tdtext1{
	margin-top:10px ;
}
.tdtext2{
	margin-top:0px ;
}
#cartConfirm {
	font-size: 15pt;
	font-weight: bolder;
}
   
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
      //점수출력 초기화
      $('#0').hide();
      $('#1').hide();
      $('#2').hide();
      $('#3').hide();
      $('#4').hide();
      
      $('.starRev span').click(function(e){

         $(this).parent().children('span').removeClass('on');
         $(this).addClass('on').prevAll('span').addClass('on');

         //클릭된 요소가 몇번째인지 알아내기
         var index=($('.starR').index($(this)));
        
         if(index=='0'){
            $('#0').show();
            $('#1').hide();
            $('#2').hide();
            $('#3').hide();
            $('#4').hide();
            
          document.getElementById("grade").value = '1';

         }else if(index=='1'){
            $('#1').show();
            $('#0').hide();
            $('#2').hide();
            $('#3').hide();
            $('#4').hide();

            document.getElementById("grade").value = '2';
            
         }else if(index=='2'){
            $('#2').show();
            $('#0').hide();
            $('#1').hide();
            $('#3').hide();
            $('#4').hide();

            document.getElementById("grade").value = '3';
            
         }else if(index=='3'){
            $('#3').show();
            $('#1').hide();
            $('#2').hide();
            $('#0').hide();
            $('#4').hide();

            document.getElementById("grade").value = '4';
            
         }else if(index=='4'){
            $('#4').show();
            $('#1').hide();
            $('#2').hide();
            $('#3').hide();
            $('#0').hide();

            document.getElementById("grade").value = '5';
         }
      });

      $("textarea").keydown(function(){
           var numChar = $(this).val().length;
           var maxNum = 200;
           var charRemain = numChar;
           $("span > em").text(charRemain);
           if(charRemain > 200){
             alert("200자 이하로 작성해주세요.");
             $("span > em").addClass("warning");
             $(".submit").prop("disabled", true);
           } else {
             $(".submit").prop("disabled", false);
           }
         });

       $('#myModal').on('shown.bs.modal', function (e) {
           var gdsNm2 = $(e.relatedTarget).data('gds-nm');
           var userId2 = $(e.relatedTarget).data('user-id');
           var gdsCd2 = $(e.relatedTarget).data('gds-cd');
           var odrNo = $(e.relatedTarget).data('odr-no');
           
           $(e.currentTarget).find('div[name="gdsNm"]').text(gdsNm2);
           $(e.currentTarget).find('input[name="gdsNm"]').val(gdsNm2);
           
           $(e.currentTarget).find('div[name="userId"]').text(userId2);
           $(e.currentTarget).find('input[name="userId"]').val(userId2);
           
           $(e.currentTarget).find('div[name="gdsCd"]').text(gdsCd2);
           $(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd2);

           $(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
       });

       // 구매 모달
       $('#myModal2').on('shown.bs.modal', function (e) {
			var odrNo = $(e.relatedTarget).data('odr-no');
			$(e.currentTarget).find('input[name="crudGbCd"]').val("UUPC");
			$(e.currentTarget).find('input[name="odrGbCd"]').val("10");
			$(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
			//$(e.currentTarget).find('input[name="odrStsGbCd"]').val("PC");
       });

       // 반품 모달
       $('#myModal3').on('shown.bs.modal', function (e) {
    	    var odrNo = $(e.relatedTarget).data('odr-no');
			$(e.currentTarget).find('input[name="crudGbCd"]').val("UURW");
			$(e.currentTarget).find('input[name="odrGbCd"]').val("10");
			$(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
    	   //$(e.currentTarget).find('input[name="odrStsGbCd"]').val("RW");
      });

       $('#review').click(function(){
    	   alert("후기가 등록되었습니다!");
       }); 

       $(".gubun1").each(function(){
    	   var rows1 = $(".gubun1:contains('"+$(this).text()+"')");
			if(rows1.length > 1) {
					rows1.eq(0).attr("rowspan", rows1.length);
					rows1.not(":eq(0)").remove();
			}
       })

      $(".gubun2").each(function(){
    	   var rows2 = $(".gubun2:contains('"+$(this).text()+"')");
			if(rows2.length > 1) {
					//vCnt -= 1;
					rows2.eq(0).attr("rowspan", rows2.length);
					rows2.not(":eq(0)").remove();
			}
       })

       // 주문상태 value값에 따른 동적처리변환
       for(var i=0; i<vCnt; i++) {
           //alert($("#odrNo"+i).text()); //현재 선택한 버튼의 주문번호
           var odrStsGbCd = $("#odrBtn"+i).val();
           //alert("i = " + i + "..." + odrStsGbCd);
           if(odrStsGbCd == "DW") {
        	   $("#odrBtn"+i).val("입금대기");
        	   $("#odrBtn"+i).css({opacity:0.5});
        	   $('#odrBtn'+i).attr('class','btn btn-success');
        	   $("#odrBtn"+i).attr('disabled', true);
        	   $("#odrBtnS"+i).hide();
           } else if(odrStsGbCd == "OC") {
        	   $("#odrBtn"+i).val("구매");
        	   $("#odrBtn"+i).css({opacity:1.0});
        	   $("#odrBtnS"+i).val("반품");
        	   $("#odrBtn"+i).css({opacity:1.0});
		   } else if(odrStsGbCd == "PC") {
        	   $("#odrBtn"+i).val("구매확정");
        	   $("#odrBtn"+i).css({opacity:0.5});
        	   $('#odrBtn'+i).attr('class','btn btn-primary');
        	   $("#odrBtn"+i).attr('disabled', true);
        	   $("#odrBtnS"+i).hide();
		   } else if(odrStsGbCd == "RW") {
        	   $("#odrBtn"+i).val("반품대기");
        	   $("#odrBtn"+i).css({opacity:0.5});
        	   $('#odrBtn'+i).attr('class','btn btn-warning');
        	   $("#odrBtn"+i).attr('disabled', true);
        	   $("#odrBtnS"+i).hide();
		   } else if(odrStsGbCd == "RC"){
        	   $("#odrBtn"+i).val("반품확정");
        	   $("#odrBtn"+i).css({opacity:0.5});
        	   $('#odrBtn'+i).attr('class','btn btn-danger');
        	   $("#odrBtn"+i).attr('disabled', true);
        	   $("#odrBtnS"+i).hide();
		   }
       }
		
		// 장바구니 조회
		function btnCart() {
			//$("#odrNoModal").val("zzzzz");
			var sUserId = "${loginUserId}";
			// 세션체크
			if((sUserId == "") || (sUserId == null)) {
				location.href = "/login";
			}
		}
       
    } 
	/**************************/
	/**** 전역변수 선언시작 ***/
	/**************************/
	<c:set var="alistLength" value="${fn:length(alist)}"></c:set>
	var vCnt = "${alistLength}";	// 주문내역 총 리스트수

	/**************************/
	/**** 전역변수 선언끝 *****/
	/**************************/
</script>
<script>

</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
   <div>
   <div class="titlediv">
       <p id="title2">주문 내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <div id="info">
     <p>
     	<input type="hidden" value="${loginMbNo}">
	     <c:if test="${empty userVo.userNM}">
	     	${loginUserId} 님이 렌탈미에서 주문한 내역입니다.
	     </c:if>
	     <c:if test="${!empty userVo.userNM }">
	     	${userVo.userNM} 님이 렌탈미에서 주문한 내역입니다.
	     </c:if>
     </p>
     </div>
          <table class="ordtable table">
          <thead>
             <tr class="active">
             	<th>주문번호</th>
                <th>상품명/선택사항</th>
                <th>주문일</th>
                <th>수량</th>
                <th>렌탈기간</th>
                <th>상품금액</th>
                <th>주문상태</th>
                <th>상품후기</th>
             </tr>
          </thead>
          <tbody>
          <c:forEach items="${alist}" var="bean" varStatus="status">
             <tr>
                <td class="gubun1" style="vertical-align:middle;"><p class="tdtext" style="text-align:center; ">${bean.odrNo}</p></td>
                <td style="text-align:left; vertical-align:middle;">
	                <a style="text-decoration:none; color:black;"href="/rental/Appli/lg/${fn:substring(bean.gdsCd,4,6) }/detail/${bean.gdsCd}">
	                <img class="ordimg" src="../${bean.RImg1}"/><textarea rows="2" cols="30" style="vertical-align:middle; border:0; cursor:pointer; resize: none;" readonly="readonly" >${bean.gdsNm }</textarea>
	                <input type=hidden value="${bean.gdsCd}"/></a>
                </td>
                <td style="vertical-align:middle;"><p class="tdtext">${bean.odrDt}</p></td>
                <td style="vertical-align:middle;"><p class="tdtext">${bean.odrQty}</p></td>
                <td style="vertical-align:middle;"><p class="tdtext">${bean.agreeTerm}개월</p></td>
                <td style="vertical-align:middle;"><p class="tdtext"><fmt:formatNumber value="${bean.gdsPrice}" pattern="#,###.##"/>원</p></td>
                <td class="gubun2" style="vertical-align:middle;">
                	<p class="tdtext1" style="text-align:center;">
                		<input type="button" id="odrBtn${status.index }" type="button" class="btn btn-primary" type="button" class="btn" style="font-size: 10pt;" data-toggle="modal" data-target="#myModal2" data-odr-no="${bean.odrNo}" value="${bean.odrStsGbCd }">
                		<input type="button" id="odrBtnS${status.index }" type="button" class="btn btn-danger" type="button" class="btn" style="font-size: 10pt;" data-toggle="modal" data-target="#myModal3" data-odr-no="${bean.odrNo}" value="${bean.odrStsGbCd }">
               		</p>
               		<p class="tdtext2" id="odrNo${status.index }" style="text-align:center; color:white; display: none;">
               			${bean.odrNo}
               		</p>
                </td>
                <!-- 이전 주문상태 사용 안함, display:none 처리 -->
                <td style="vertical-align:middle; display:none;"><p class="tdtext">
                   <c:if test= "${bean.odrStsGbCd eq 'DW'}">
                      입금대기
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'OC'}">
                      주문확정
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'PC'}">
                   	  구매확정
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'RW'}">
                      반품대기
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'RC'}">
                      반품확정
                   </c:if>
                   </p>
                </td>
                <td style="vertical-align:middle;"><p class="tdtext">
                 <c:choose>
                  	<c:when test="${bean.cnt == 0}">
                		<button id="reviewbtn" style="background:#151515; color:white;" type="button" class="btn" style="font-size: 9pt;" data-toggle="modal" data-target="#myModal" data-gds-nm="${bean.gdsNm}" data-gds-cd="${bean.gdsCd}" data-odr-no="${bean.odrNo}">후기쓰기</button>
              		</c:when>
                	<c:otherwise>
               			<button id="disabled" style="opacity:0.3; background:#151515; color:white;" type="button" class="btn" style="font-size: 9pt;" disabled="disabled">등록완료</button>
                	</c:otherwise>
                </c:choose>
                </p>
                </td>
             </tr>
          </c:forEach>
          </tbody>
          </table>
       </div>
      <div class="hr"></div>
     <!-- Modal -->
	<form action="/mp/review" class="form-horizontal" method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">후기 쓰기</h4>
	      </div>
	      
	      <div class="modal-body">
	      	<div class="row">
	      		<div class="col-md-5">
		        	<label>상품명</label> <div name="gdsNm"></div>
		        	<input type="hidden" name="gdsNm" value="gdsNm"/>
		        	<input type="hidden" name="gdsCd" value="gdsCd"/>
		        </div>
		        <div class="col-md-4 col-md-offset-3">
		      		<label>글쓴이 </label>
			      	 <c:if test="${empty userVo.userNM}">
				     	<div>${loginUserId}</div>
				     </c:if>
				     <c:if test="${!empty userVo.userNM }">
				     	<div>${userVo.userNM}</div>
				     </c:if>
			     
		        	<input type="hidden" name="grade" id="grade"/>
		        	<input type="hidden" name="odrNo" id="odrNo"/>
		      	</div>
	      	</div>
	          <br>
	          <div class="hr"></div>
	          <br>
	          <label>후기</label><br>
	      <div class="starRev">
	        <span class="starR on"></span>
	        <span class="starR"></span>
	        <span class="starR"></span>
	        <span class="starR"></span>
	        <span class="starR"></span>
	      </div>
	      <br>
	      <div class="satis" id="0"><h4>만족도 1점을 주셨네요.</h4><p>어떤 점이 아쉬웠나요?</p></div>
	      <div class="satis" id="1"><h4>만족도 2점을 주셨네요.</h4><p>어떤 점이 아쉬웠나요?</p></div>
	      <div class="satis" id="2"><h4>만족도 3점을 주셨네요.</h4><p>어떤 점이 좋았나요?</p></div>
	      <div class="satis" id="3"><h4>만족도 4점을 주셨네요.</h4><p>어떤 점이 좋았나요?</p></div>
	      <div class="satis" id="4"><h4>만족도 5점을 주셨네요.</h4><p>어떤 점이 좋았나요?</p></div>
	      <textarea name="content" style="width:100%; height:200px;"  placeholder="후기를 입력해주세요."></textarea>
	      <span style="float:right;"><em>0</em>/ 200</span>
	          
	      </div>
	     
	      <div class="modal-footer">
	        <button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button style="background:black;" id="review" type="submit" class="btn btn-default submit" >저장</button>
	      </div>
	   </div>
	    </div>
	    </div>
	</form>
	<!-- modal 끝 -->
	<!-- 구매 모달 -->
	<form id="target" action="/mp/decision" method="post">
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel2">구매확정</h4>
			    </div>
				<div class="modal-body">
			    	<input type="hidden" name="crudGbCd" value="crudGbCd"/>
			    	<input type="hidden" name="odrGbCd" value="odrGbCd"/>
			    	<input type="hidden" name="odrNo" value="odrNo"/>
				</div>
				<div class="form-group">
			    	<label for="name" id="cartConfirm">&nbsp;&nbsp;&nbsp;구매확정 하시겠습니까?</label>
				</div>
			    <div class="modal-footer">
			    	<button type="submit" id="questSubmit" class="btn btn-primary">확정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			    </div>
			</div>
	    </div>
	</div>
	</form>
	<!-- 모달 끝 -->
	<!-- 반품 모달 -->
	<form id="target" action="/mp/decision" method="post">
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel2">반품요청</h4>
			    </div>
				<div class="modal-body">
			    	<input type="hidden" name="crudGbCd" value="crudGbCd"/>
			    	<input type="hidden" name="odrGbCd" value="odrGbCd"/>
			    	<input type="hidden" name="odrNo" value="odrNo"/>
				</div>
				<div class="form-group">
			    	<label for="name" id="cartConfirm">&nbsp;&nbsp;&nbsp;반품요청 하시겠습니까?</label>
				</div>
			    <div class="modal-footer">
			    	<button type="submit" id="questSubmit" class="btn btn-danger">요청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			    </div>
			</div>
	    </div>
	</div>
	</form>
	<!-- 모달 끝 -->
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>