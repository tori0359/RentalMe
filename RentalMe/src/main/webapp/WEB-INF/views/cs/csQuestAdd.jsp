<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
    <form action="mp/userQuestList" method="post">
        <table class="table" id="daeContent">
            <tr>
                <td><label for="id" >아 이 디</label></td>
                <td>admin</td>
            </tr>
            <tr>
                <td><label for="category">분류</label></td>
                <td>
        <div>
        	<select style="height:26px;"  name="select">
        		<option value="">분류선택</option>
        		<option value="order">주문</option>
        		<option value="delivery">배송</option>
        		<option value="payment">결제</option>
        		<option value="exchange">교환/취소</option>
        		<option value="userinfo">회원정보</option>
        		<option value="guitar">기타</option>
        	</select>
        </div>
           </td>
            </tr>
            <tr>
                <td><label for="sub" >제목</label></td>
                <td><input type="text" name="sub"></td>
            </tr>
            <tr>
                <td><label for="id" >내용</label></td>
                <td><textarea name="conetent" style="resize:none;"></textarea></td>
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
