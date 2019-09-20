<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../template/header.jsp"></jsp:include>
<script type="text/javascript">
	 	$(document).ready(function(){
			$("#cancel").click(function(){
					window.history.back();
				})
		})
</script>
<style type="text/css">
        #daeContent{
        	margin-top:70px;
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
        #answer{
        	margin-top:20px;
        	margin-right:10px;
        	padding-top:-20px;
        	margin-bottom:-55px;
        	
        }
        #answer button{
        	border-radius:5px;
        	background:white;
        	color:red;
        	border-radius:5px;
        	
        }
	</style>
</head>
<body>
<div class="container">
<div id="content" class="row">
	<div class="col-md-10 col-md-offset-1"> 
		<c:if test="${id == 'minminad' }">
			<c:if test="${bean.questStsCd eq '1' }">
	        	<form action="/mp/mng/answer"><div id="answer" align="right"><input type="hidden" name="pquestNo" value="${bean.pquestNo}"/><button>답변처리</button></div></form>
			</c:if>
		</c:if>
		<p style="margin-top:40px; font-family:nanumEB; font-size:18pt;">1:1문의 상세보기</p>
			<form action="/mp/mp/QuestDelete" method="get">
        <table class="table" id="daeContent" style="border-top:4px solid black; margin-top:0px;">
           <%--  <tr>
                <td><label for="id" >작 성 자</label></td>
                <td><input type="hidden" name="mbNo" value="${bean.mbNo }">일반회원</td>
            </tr> --%>
            <tr>
                <td class="active" align="center"><label for="id" >글 번 호</label></td>
                <td><input type="hidden" name="mbNo" value="${bean.mbNo }"><input type="hidden" name="pquestNo" value="${bean.pquestNo}">${bean.pquestNo}</td>
               
            </tr>
            <tr>
                <td class="active" align="center"><label>분류</label></td>
                <c:if test="${bean.csClassGbCd eq '1'}">
                <td>주문</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq '2'}">
                <td>배송</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq '3'}">
                <td>결제</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq '4'}">
                <td>교환취소</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq '5'}">
                <td>회원정보</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq'6'}">
                <td>기타</td>
                </c:if>
            </tr>
            <tr>
                <td class="active" align="center"><label>제목</label></td>
                <td>${bean.sub}</td>
            </tr>
            <tr>
                <td class="active" style="padding-top:10px;" align="center"><label>내용</label></td>
                <td style="height:150px; padding-top:70px;">${bean.content}</td>
            </tr>
            <tr>
                <td></td>
                <td id="daeButton" >
                  <input class="btn btn-default" id="cancel" type="reset" value="뒤로">
                </td>
            </tr>
        </table>
			</form>
	</div>
</div>
</div>
</body>
<jsp:include page="../../template/footer.jsp"></jsp:include>
</html>