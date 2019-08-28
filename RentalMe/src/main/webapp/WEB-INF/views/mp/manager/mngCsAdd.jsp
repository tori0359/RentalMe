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
            width:100%;
            height:250px;
     }
     #csContent{
     		margin-top:100px;
        	height:900px;
     }
     #daeButton{
     	text-align:right;
     }
     h2{
     	padding:0px 0px 35px 20px;
     }
		
</style>

</head>
<body>
<div id="csContent">
<form action="/mp/mng/csNoticeAdd" method="post">
		<h2>공지/FAQ등록</h2>
        <table class="table" id="daeContent">
            <tr>
                <td><label for="id" >작 성 자</label></td>
                <td>관 리 자</td>
            </tr>
            <tr>
                <td><label for="category">분류</label></td>
                <td>
			        <div>
			        	<select style="height:26px;" name="csGbCd">
			        		<option value="10">공지사항</option>
			        		<option value="20">FAQ</option>
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