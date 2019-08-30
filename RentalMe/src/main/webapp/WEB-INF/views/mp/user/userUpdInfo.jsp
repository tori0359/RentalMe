<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
		#title{
	   		font-size: 15pt;
	   		font-weight: bolder;
	   		font-family: "nanumB";
	   		margin: 60px 0 50px 0;
	   }
	 
	   .delete_btn2{
	   		background-color: #4d4d4d;
	   		color:white;
	   		height:30px;
	   		font-family: "nanumB";
	   		font-weight: border;	
	   		width:90px;	
	   }
	   
	   .btn:hover,
	   .btn:focus{
	   		background-color: #D8D8D8;
	   }
	   
	   #infobtn{
	  		width:360px;
	  		height:30px;
	   		margin:0px auto;
	   		float:right;
	   }
	   
	   #infodiv{
	   		padding-bottom:30px;
	   }
	   
	    .delete_btn1{
	   		background-color: #D8D8D8;
	   		color:black;
	   		height:30px;
	   		font-family: "nanumB";	
	   		font-weight: border;	
	   }
	   #info{
      	width:93%;
      	margin: 20px auto;
      	border:7px solid #E6E6E6;
      	padding: 15px;
      }
      
      #info p{
      	line-height:20px;
      	font-family:"nanumB";
      }
      .titlediv{
            height:40px;
      }
</style>
<script type="text/javascript">

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    window.onload=function(){
    	$('#update').click(function(){
			alert("수정되었습니다!");
       	});

     }
</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	
	<div class="titlediv">
       <p id="title">나의 정보</p>
     </div>
     <form action="/mp/updInfo" method="post">
     <div id="infodiv">
     <div class="hr" style="height:3px; background-color: black;"></div>
     <div id="info">
     <p>
	     <c:if test="${empty userVo.userNM}">
	     	${userVo.userNM} 님의 개인정보입니다.
	     </c:if>
	     <c:if test="${!empty userVo.userNM }">
	     	${userVo.userNM} 님의 개인정보입니다.
	     </c:if>
     </p>
     </div>
     <table class="table">
     	<tr>
     		<th class="active" style="text-align: center">이름</th>
     		<td><p>※ 마이페이지에서 이름으로 보고싶다면 이름을 설정해주세요.</p>
     		<input style="width:300px;" type="text" name="userNM" value="${userVo.userNM}" placeholder="이름을 입력해주세요">
     		</td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">아이디</th>
     		<td><input style="width:300px;" type="text" readonly="readonly" value="${loginUserId}">
     		<input type="hidden" name="mbNo" value="${loginMbNo}"/>
     		</td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">이메일</th>
     		<td><input style="width:300px;" type="text" readonly="readonly" name="email" value="${userVo.email}"></td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">비밀번호 변경</th>
     		<td>
     			<div>
     				<p>※ 최소 8자 ~ 최대 20자 이내로 입력합니다.</p>
     				<p>※ 반드시 영문,숫자,특수문자가 1자리 이상 포함되어야 합니다.</p>
     				
     			</div>
	     		<div>
	     			<label for="pw">현재 비밀번호</label>
	     			<input style="margin-left:32px;" type="text" name="pw" id="pw">
	     		</div>
	     		<div>
	     			<label for="newpw">신규 비밀번호</label>
	     			<input style="margin-left:32px;" type="text" name="newpw" id="newpw">
	     		</div>
	     		<div>
	     			<label for="newpwre">신규 비밀번호 확인</label>
	     			<input type="text" name="newpwre" id="newpwre">
	     		</div>
     		</td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">배송지</th>
     		<td>
				<input style="width:300px;" type="text" id="sample6_address" name="addr" value="${userVo.addr}">
				<button type="button" class="delete_btn1 btn" onclick="sample6_execDaumPostcode()">주소 검색</button><br>
				<input style="width:300px;" type="text" id="sample6_detailAddress" name="addrDetail" value="${userVo.addrDetail}">
     		</td>
     		
     	</tr>
     </table>
     </div>
     <div id="infobtn">
	     <button type="submit" id="update" class="delete_btn2 btn">확인</button>
     </div>
     </form>
      
      
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>