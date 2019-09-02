<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
      #title, #title2{
            font-size: 15pt;
            font-weight: bolder;
            font-family: "nanumB";
            margin: 60px 0 50px 0;
      }
      #title > span{
      		font-size: 5pt;
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
    	   alert("후기가 등록되었습니다!");
       }); 

   } 



   
   
   
</script>
<script>

</script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>
   <div>
   <div class="titlediv">
       <p id="title">주문 상세 내역<span>&nbsp;&nbsp;&nbsp;&nbsp;결제번호:${ordNo }</span></p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <table class="table">
     	<tr>
     		<th>주문상품</th>
     		<th>개당금액</th>
     		<th>수량</th>
     		<th>금액</th>
     	</tr>
     	<c:set var="total" value="0"/>
     	<c:forEach items="${alist }" var="bean">
     	<tr>
     		<td>${bean.gdsNm }</td>
     		<td><fmt:formatNumber value="${bean.gdsPrice }" pattern="#,###.##"/>원</td>
     		<td>${bean.odrQty }</td>
     		<td><fmt:formatNumber value="${bean.odrAmt }" pattern="#,###.##"/>원 </td> 
     	</tr>
     	<c:set var="total" value="${total +bean.odrAmt }"/>
     	</c:forEach>
     	<tr>
     		<td></td>
     		<td></td>     		
     		<th>총합</th>
     		<th><fmt:formatNumber value="${total }" pattern="#,###.##"/>원</th>     		
     		
     	</tr>
     </table>
     <div class="titlediv">
     	<p id="title2">받는사람</p>
     	</div>
     	<div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
          <table class="table">
             <tr>
             	<th>이름</th>
             	<td>${info.userNM }</td>
             </tr>
             <tr>
             	<th>전화번호</th>
             	<td>${info.hp }</td>
             </tr>
             <tr>
             	<th>주소</th>
             	<td>${info.addr }<br/>${info.addrDetail }</td>
             </tr>
          </table>
       </div>
       
      <div class="hr"></div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>