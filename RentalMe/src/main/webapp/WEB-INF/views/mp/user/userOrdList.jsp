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
	   
	    .ordtable>thead>tr>th{
        	text-align:center;
        }
        
        .ordtable>tbody>tr>td{
        	
        	text-align:center;
        	line-height:150px;
        	border:1px solid red;
        	vertigal-align: center;
        }
        
	   .ordimg{
	   		width:150px;
	   }
	   
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
	   }
        
</style>
<jsp:include page="../../template/headerRe.jsp"></jsp:include>
</head>
<body>
<div id="wrap">
<div class="contentDiv">
   <div id="mp" class="row">
	<p id="title">주문내역</p>
      <div class="col-md-2">
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
       <div id="mpContent" class="col-md-9">
       <p id="path">마이페이지> 주문내역</p>
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th>주문일</th>
       			<th>상품명/선택사항</th>
       			<th>주문코드</th>
       			<th>렌탈기간</th>
       			<th>상품금액</th>
       			<th>상품후기</th>
       		</tr>
       	</thead>
       	<tbody>
       		<tr>  
       			<td>2019/06/27</td>
       			<td><img class="ordimg" src="imgs/bed1.jpg"/></td>
       			<td>B123</td>
       			<td>6개월</td>
       			<td>월30,000원 x 6</td>
       			<td><button type="button" class="btn btn-default">후기쓰기</button></td>
       		</tr>
       		<tr>
       			<td>2019/06/27</td>
       			<td><img class="ordimg" src="imgs/bed2.jpg"/></td>
       			<td>B123</td>
       			<td>6개월</td>
       			<td>월30,000원 x 6</td>
       			<td><button type="button" class="btn btn-default">후기쓰기</button></td>
       		</tr>
       	</tbody>
       	</table>
       </div>
  
      </div>
  </div>
</body>
<jsp:include page="../../template/footer.jsp"></jsp:include>
</html>