<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<style type="text/css">
	 textarea{
            width:80%;
            height:250px;
     }
     #text{
     	width:80%;
     }
     #csContent{
     		margin-top:100px;
        	height:900px;
     }
     #daeButton{
     	text-align:right;
     	padding:8px 180px 8px 8px;
     }
     h2{
     	padding:0px 0px 35px 20px;
     }
     #daeContent tr>td:nth-child(1){
     	width:250px;
     	text-align:center;
     }
     #selected{
     	display:visible;
     }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#faq").click(function(){
			console.log("dd");
		})
		$("#cancel").click(function(){
			history.back();
		})
	});
</script>
</head>
<body>

<div id="csContent">
<form action="/mp/mng/csNoticeAdd" method="post">
		<h2>공지/FAQ등록</h2>
        <table class="table" id="daeContent">
            <tr>
                <td><label for="" >작 성 자</label></td>
                <td>관 리 자</td>
            </tr>
            <tr>
                <td><label for="">분류</label></td>
                <td>
			        	<select style="height:26px;" name="csGbCd" id="se">
			        		<option value="10" id="notic" >공지사항</option>
			        		<option value="20" id="faq">FAQ</option>
			        	</select>
          		</td>
            </tr>
            <tr id="selected">
            	<td><label for="">FAQ분류</label></td>
          		  <td>
			        	<select style="height:26px; width:85px;" name="csClassGbCd">
			        		<option value="" selected="selected">FAQ항목</option>
			        		<option value="1">주문</option>
			        		<option value="2">배송</option>
			        		<option value="3">결제</option>
			        		<option value="4">교환취소</option>
			        		<option value="5">회원정보</option>
			        		<option value="6">기타</option>
			        	</select>
			      </td>
            </tr>
            <tr>
                <td><label for="sub" >제목</label></td>
                <td><input type="text" name="sub" id="text"></td>
            </tr>
            <tr>
                <td><label for="id" >내용</label></td>
                <td><textarea name="content" style="resize:none;"></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td id="daeButton" >
                   <input type="submit" value="등록"/>
                   <input id="cancel" type="reset" value="취소">
                </td>
            </tr>
        </table>
</form>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>