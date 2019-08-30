 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

      #wrap{
            min-height:100%;
            position:relative;
         }
         
      .contentDiv{
         padding-bottom: 200px;
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
            background-color: #2E2E2E;
        }
        
        .mpTable>thead>tr>th{
            -moz-border-radius: 15px 15px 0 0;
            -webkit-border-radius: 15px 15px 0 0;
            border-radius: 15px 15px 0 0;
         font-family: "nanumR";
         text-align: center;
        }
        
        .mpTable>tbody tr{
            height:30px;
            margin: 10px;
            background-color: #F1F0EE;
        }
        
        
        .mpTable>tbody tr:hover {
           font-size: 11pt;
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
        
      .mpdiv{
         position: relative;
         z-index:1;
         margin:100px 0 100px 0;
      }
   
      .row{
         margin: 0px;
      
        }
</style>
<jsp:include page="./header.jsp"></jsp:include>
</head>
<body>
<div id="wrap">
<div class="contentDiv">
   <div id="mp" class="row">
      <div style="margin-right:0" class="mpdiv col-md-2 col-md-offset-1">
       <table class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">마이페이지</th>
           </tr>
           </thead>
           <tr>
                <td class="text-center"><a href="/mp/">주문내역</a></td>
           </tr>
           <tr>
                <td class="text-center"><a href="/mp/cart">장바구니</a></td>
           </tr>
            <tr>
                <td class="text-center"><a href="/mp/deposit">예치금</a></td>
           </tr>
            <tr>
                <td class="text-center"><a href="/mp/updInfo">나의정보</a></td>
           </tr>
       </table>
        <table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">중고거래</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">나의 중고상점</a></td>
           </tr>
           <tr>
                <td class="text-center"><a href="/mp/wish">찜한상품</a></td>
           </tr>
       </table>
      <table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">이벤트 경매</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="/mp/auctList">경매내역</a></td>
           </tr>
       </table>
       <table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">나의활동</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">신고</a></td>
           </tr>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="/mp/mp/quest">1:1문의</a></td>
           </tr>
       </table>
       </div>
      <div id="mpContent" class="col-md-8">
  
     

</body>
</html>