<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
      #title{
            font-size: 18pt;
            font-weight: bolder;
            text-align: center;
            font-family: "nanumB";
            margin: 50px;
      }
      #path{
            font-weight: bolder;
            font-family: "nanumB";
            float:left;
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
        }
        
        .ordtable>tbody>tr>td{
           vertical-align: middle;
           text-align: center;
           display: table-cell;
        }
        
      .ordimg{
            width:150px;
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
      .pathdiv{
            height:30px;
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
     
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    window.onload = function (){
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
           
           $(e.currentTarget).find('div[name="gdsNm"]').text(gdsNm2);
           $(e.currentTarget).find('input[name="gdsNm"]').val(gdsNm2);
           
           $(e.currentTarget).find('div[name="userId"]').text(userId2);
           $(e.currentTarget).find('input[name="userId"]').val(userId2);
           
           $(e.currentTarget).find('div[name="gdsCd"]').text(gdsCd2);
           $(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd2);
       });

       $('#review').click(function(){
    	   swal("Hello world!");
       }); 

   } 



   
   
   
</script>
<script>

</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
   <p id="title">주문내역</p>
   <div>
   <div class="pathdiv">
       <p id="path">마이페이지> 주문내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
          <table class="ordtable table">
          <thead>
             <tr class="active">
                <th>주문일</th>
                <th>상품명/선택사항</th>
                <th>수량</th>
                <th>렌탈기간</th>
                <th>상품금액</th>
                <th>주문상태</th>
                <th>상품후기</th>
         
             </tr>
          </thead>
          <tbody>
          
          <c:forEach items="${alist}" var="bean">
             <tr>  
             	
                <td>${bean.odrDt}</td>
                <td><!--  <img class="ordimg" src="imgs/bed1.jpg"/> -->${bean.gdsNm} 
                <input type=hidden value="${bean.gdsCd}"/>
                </td>
                <td>${bean.odrQty}</td>
                <td>${bean.agreeTem}개월</td>
                <td><fmt:formatNumber value="${bean.gdsPrice}" pattern="#,###.##"/>원</td>
                <td>
                   <c:if test= "${bean.odrStsGbCd eq 'DW'}">
                      입금대기
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'OC'}">
                      주문확정
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'RW'}">
                      반품대기
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'RC'}">
                      반품확정
                   </c:if>
                </td>
                <td><button type="button" class="btn" style="font-size: 9pt;" data-toggle="modal" data-target="#myModal" data-gds-nm="${bean.gdsNm}" data-user-id="jiyoung" data-gds-cd="${bean.gdsCd}">후기쓰기</button></td>
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
	      		<label>글쓴이 </label><div name="userId"></div>
	        	<input type="hidden" name="userId" value="userId"/>
	        	<input type="hidden" name="grade" id="grade"/>
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
        <button type="submit" class="btn btn-primary submit" id="review">저장</button>
      </div>
   </div>
    </div>
    </div>
</form>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>