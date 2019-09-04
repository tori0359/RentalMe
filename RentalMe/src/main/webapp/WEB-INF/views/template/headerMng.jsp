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
            background-color: #4d4d4d;
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
        
	   .mpdiv{
		   position: relative;
		   z-index:1;
		   margin-top:100px;
		   margin-bottom: 100px;
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
      <div class="mpdiv col-md-2">
       <table class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">주문관리</th>
           </tr>
           </thead>
           <tr>
                <td class="text-center"><a href="${pageContext.request.contextPath }/mp/mng/list">주문관리</a></td>
           </tr>
           <tr>
                <td class="text-center"><a href="${pageContext.request.contextPath }/mp/mng/cart">반품관리</a></td>
           </tr>
           <tr>
                <td class="text-center"><a href="${pageContext.request.contextPath }/mp/mng/deposit">예치금관리</a></td>
           </tr>
       </table>
        <table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">상품관리</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">렌탈상품 관리</a></td>
           </tr>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">경매상품 관리</a></td>
           </tr>
       </table>
		<table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">중고거래관리</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="${pageContext.request.contextPath }/mp/mng/used">중고거래 관리</a></td>
           </tr>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="./decl">신고접수 관리</a></td>
           </tr>
       </table>
       <table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">고객센터관리</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">공지사항/FAQ관리</a></td>
           </tr>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">1:1문의 관리</a></td>
           </tr>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">상담예약 관리</a></td>
           </tr>
       </table>
        <table style="margin-top:30px; " class="mpTable">
           <thead>
            <tr class="active">
                <th style="color:white;"class="text-center">사용자관리</th>
           </tr>
           </thead>
           <tr>
                <td style="padding: 8px 0 8px 0" class="text-center"><a href="#">사용자관리</a></td>
           </tr>
       </table>
       </div>
		<div id="mpContent" class="col-md-9">
  
     

</body>
</html>