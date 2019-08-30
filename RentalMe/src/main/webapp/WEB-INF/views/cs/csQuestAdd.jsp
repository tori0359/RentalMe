<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
    <meta charset="UTF-8">
	<script type="text/javascript">
	 	$(document).ready(function(){
			$("#cancel").click(function(){
					window.history.back();
			});

		
		})
	</script>
	<%
		String userId=(String)session.getAttribute("userId");
	
	%>
	<style type="text/css">
        #dae{
            font-size:30pt;
        }
        #daeContent tr>td:nth-child(1){
            width:15%;
        }
        #daeContent tr>td:nth-child(2){
            width:85%;
        }
        #daeButton input{
            float:right;
            margin:5px 10px 5px 10px;
            background:white;
            border-radius:5px;
            outline:none;
        }
       
        #daeButton>button:nth-child(1){
        
        }
       
        textarea{
            width:100%;
            height:250px;
        }
        #text{
        	width:100%;
        }
        #csContent{
        	height:900px;
        }
        
	</style>
</head>
<body>
<div id="csContent">

<div id="dae" class="col-md-4 col-md-offset-2">
<br/><br/>
    1:1문의
    
<br/><br/>
</div>
<div class="col-md-8 col-md-offset-2">
    <form action="/cs/csInquiryAdd" method="post">
        <table class="table" id="daeContent">
            <tr>
                <td><label for="id" >아 이 디</label></td>
                <td><input type="hidden"/>${id}</td>
                <td><input type="hidden" name="csGbCd" value="30"/></td>
            </tr>
            <tr>
                <td><label for="category">분류</label></td>
                <td>
        <div>
        	<select style="height:26px;"  name="csClassGbCd">
        		<option value="" selected="selected">분류선택</option>
        		<option value="1">주문</option>
        		<option value="2">배송</option>
        		<option value="3">결제</option>
        		<option value="4">교환/취소</option>
        		<option value="5">회원정보</option>
        		<option value="6">기타</option>
        	</select>
        </div>
           </td>
            </tr>
            <tr>
                <td><label>제목</label></td>
                <td><input id="text" type="text" name="sub"></td>
            </tr>
            <tr>
                <td><label>내용</label></td>
                <td><textarea name="content" style="resize:none;"></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td id="daeButton" >
                   <input id="cancel" type="reset" value="취소">
                   <input type="submit" value="문의하기"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>
