<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mpMng.css" >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMng.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>
   <div>
   <div class="titlediv">
       <p id="title">예치금 상세 내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <div id="info">
     <p>
     	<input type="hidden" value="">
	     <%-- <c:if test="${empty userVo.userNM}">
	     	${userVo.userNM} 님이 렌탈미에서 주문한 내역입니다.
	     </c:if>
	     <c:if test="${!empty userVo.userNM }">
	     	${userVo.userNM} 님이 렌탈미에서 주문한 내역입니다.
	     </c:if> --%>
     </p>
     </div>
          <table class="ordtable table">
          <thead>
             <tr class="active">
                <th>예치금일련번호</th>
                <th>충전금액</th>
                <th>사용금액</th>
                <th>환불금액</th>
                <th>남은금액</th>
                <th>예치날짜</th>
             </tr>
          </thead>
          <tbody>
          <c:set var="totalmoney" value="0"/>
          <c:forEach items="${alist}" var="bean">
          	<c:set var="totalmoney" value="${totalmoney + bean.chargeDeposit - bean.useDeposit - bean.refundDeposit}"/>
          </c:forEach>
          <c:set var="total" value="${totalmoney }"/>
           <c:forEach items="${alist}" var="bean">
             <tr>  
                <td>${bean.depositSeq}</td>
                <td>${bean.chargeDeposit}</td>
                <td>${bean.useDeposit}</td>
                <td>${bean.refundDeposit }</td>
                <td><fmt:formatNumber value="${total }" pattern="#,###.##"/>원</td>
                <c:set var="total" value="${total - bean.chargeDeposit + bean.useDeposit + bean.refundDeposit}"/>
                <td>${bean.chgDt }</td>
             </tr>
          </c:forEach>
          </tbody>
          </table>
       </div>
      <div class="hr"></div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>