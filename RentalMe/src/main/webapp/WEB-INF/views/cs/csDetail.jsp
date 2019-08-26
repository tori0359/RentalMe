<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript">
	 	$(document).ready(function(){
			$("#cancel").click(function(){
					window.history.back();
				})
			
		})
	</script>
<style type="text/css">
        #daeContent{
        	margin-top:100px;
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
        #content{
        	height:600px;
        }
	</style>
</head>
<body>
<div id="content">
	<div class="col-md-10 col-md-offset-1"> 
        <table class="table" id="daeContent">
            <tr>
                <td><label for="id" >아 이 디</label></td>
                <td>관리자</td>
            </tr>
            <tr>
                <td><label for="category">분류</label></td>
                <td>${list.csClassGbCd}</td>
            </tr>
            <tr>
                <td><label for="sub" >제목</label></td>
                <td>${list.sub }</td>
            </tr>
            <tr>
                <td><label for="id" >내용</label></td>
                <td>${list.content}</td>
            </tr>
            <tr>
                <td></td>
                <td id="daeButton" >
                  <input id="cancel" type="reset" value="취소">
                </td>
            </tr>
        </table>
	</div>
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>