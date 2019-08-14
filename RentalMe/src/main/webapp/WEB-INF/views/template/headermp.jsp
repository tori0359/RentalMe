<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css">
   <jsp:include page="../template/header.jsp"></jsp:include>
   <style type="text/css">
      /*폰트설정*/
        @font-face {
            font-family: "altair";
            src: url("../fonts/altair.extrabold-italic.ttf") format("truetype");
            font-style: normal;
        }
      @font-face {
            font-family: "hanserif";
            src: url("../fonts/SourceHanSerifK-Medium.otf") format("opentype");
            font-style: normal;
        }
      @font-face {
            font-family: "NanumB";
            src: url("../fonts/NanumSquare_acR.ttf") format("truetype");
            font-style: normal;
        }
      @font-face {
            font-family: "NanumEB";
            src: url("../fonts/NanumSquare_acEB.ttf") format("truetype");
            font-style: normal;
        }
      
     
       #mp{
            margin: 50px 0px 10px 30px;
        }
        
       .mpTable{
            width: 160px;
            border-radius: 6px;
        }
        
        .mpTable>thead tr{
            height:35px;
            background-color: #4d4d4d;
        }
        
        .mpTable>thead>tr>th{
            -moz-border-radius: 15px 15px 0 0;
            -webkit-border-radius: 15px 15px 0 0;
            border-radius: 15px 15px 0 0;
			font-family: "nanumR";
        }
        
        .mpTable>tbody tr{
            height:30px;
            margin: 10px;
            background-color:#EBEBEA;
        }
        
        
        .mpTable>tbody tr:hover {
            background-color: lightgrey;
            -o-transition: all 0.2s ease-in-out;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
	   .mpTable>tbody>tr a{
		   color: black;
		   font-family: "nanumB";
		   display: block;
		   text-decoration: none;
	   }
	   
	   .mpTable>tbody>tr a:hover{
		   text-decoration: none;
		   
	   }
        
       .mpTable>tbody>tr:last-child td{
            -moz-border-radius: 0 0 15px 15px;
            -webkit-border-radius: 0 0 10px 15px;
            border-radius: 0 0 15px 15;            
        } 
	   #mpDiv{
		   position: relative;
		   z-index:1;
	   }
	   #mpContent{
		   /*border: 1px solid black;*/
		   height: 100%;
	   }
	   .row{
		   margin: 0px;
	   }
	
        @media screen and (max-width: 768px){
		   #mp{
		   		margin:0px auto;
		   		text-align: center;
		   }
		   .contentDiv{
		   		margin:0px auto;
		   }
   </style>
   <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
   <script type="text/javascript" src="../js/bootstrap.min.js"></script>

</head>
<body>
 <div class="contentDiv">
   <div id="mp" class="row">
      <div class="col-md-2 coll-md-offset-1">
       <table class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">마이페이지</th>
           </tr>
           </thead>
           <tr>
                <td class="text-center"><a href="#">주문내역</a></td>
           </tr>
           <tr>
                <td class="text-center"><a href="#">장바구니</a></td>
           </tr>
           <tr>
                <td class="text-center"><a href="#">찜한상품</a></td>
           </tr>
            <tr>
                <td class="text-center"><a href="#">예치금</a></td>
           </tr>
            <tr>
                <td class="text-center"><a href="#">내 정보 수정</a></td>
           </tr>
       </table>
        <table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">나의 활동</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">내 문의 보기</a></td>
           </tr>
       </table>
		<table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">중고거래</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">내 중고 상품</a></td>
           </tr>
       </table>
       <table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">경매</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">거래 내역</a></td>
           </tr>
       </table>
                   
                   
       </div>
       <div style="border: 1px solid red; margin-top:20px;" id="mpContent" class="col-md-8">
       
       	내용쓰는칸
       </div>
  
      </div>
  </div>

</body>
</html>