<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.name{
	width:300px;
	height:100px;
}

.name>div>h2{
	font-family:"nanumEB";
	text-align: center;
	line-height: 80px;
}

.name div{
	display: inline-block;
}

.name>div:nth-child(2){
	margin-left:10px;
}

.name>div>p{
	font-family:"nanumB";
	font-size:13pt;
	text-align: center;
}


.deposit>h2{
	font-family:"nanumEB";
}

.deposit>p{
	font-family:"nanumEB";
}

.select{
	width:100px;
	height: 100px;
	border:1px solid red;
}

.select>div>p{
	font-family:"nanumEB";
	font-size:15pt;
	text-align:center;
}

.charge{
	width: 150px;
	height: 50px;
	background-color: darkgrey;
}

.charge>p{
	font-family: "nanumB";
	color:white;
}
.chargetable{
	margin-top: 50px;
}

.charge_btn{
	background-color: #D8D8D8;
	color:black;
	height:30px;
	font-family: "nanumB";	
   	font-weight: border;	
}

.chargediv{
	width:200px;
	height:100px;
	float: right;
}


</style>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
<div style="margin-top:100px;" class="jumbotron">
  <div class="container">
	  <div class="row">
	  	<div class="name col-md-2 col-md-offset-3">
		  	<div><h2>오남매</h2></div>
		  	<div><p>님</p></div>
	  	</div>
	  <div class="deposit col-md-3 col-md-offset-2">
		  <h2>현재 예치금</h2>
		  <h2>5,000 원</h2>
	  </div>
	  </div>
  </div>
</div>
<ul class="nav nav-tabs nav-justified">
  <li role="presentation" ><a href="#">예치금 사용내역</a></li>
  <li role="presentation" class="active"><a href="#">예치금 충전</a></li>
  <li role="presentation"><a href="#">예치금 환불</a></li>
</ul>
<div class="col-md-12">
	<table class="chargetable table">
       		<tr>
       			<th class="active" style="text-align:center;">입금인</th>
       			<td><input type="text"></td>
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">현재 예치금</th>
       			<td>5,000원</td>
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">입금 금액(원)</th>
       			<td><input type="text"></td>
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">결제수단</th>
       			<td><input type="radio" name="pay" vale="계좌이체">계좌이체 &nbsp;
       			<input type="radio" name="pay" vale="신용카드">신용카드</td>
       		</tr>
       	</table>
       	<div class="chargediv">
       		<button style="width:150px;" type="button" class="btn btn-default">충천하기</button>
       	</div>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>