<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
	   		float:left;
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
	   		padding-top:30px;
	   		padding-botton:30px;
	   }
	   
	    .delete_btn1{
	   		background-color: #D8D8D8;
	   		color:black;
	   		height:30px;
	   		font-family: "nanumB";	
	   		font-weight: border;	
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
</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	<p id="title">나의 정보</p>
	<div>
       <p id="path">마이페이지> 나의정보</p>
     </div>
     <div id="infodiv">
     <div class="hr" style="height:3px; background-color: black;"></div>
     <table class="table">
     	<tr>
     		<th class="active" style="text-align: center">이름</th>
     		<td><input style="width:300px;" type="text" readonly="readonly" value="오남매"></td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">아이디</th>
     		<td><input style="width:300px;" type="text" readonly="readonly" value="gyshin"></td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">이메일</th>
     		<td><input style="width:300px;" type="text" readonly="readonly" value="gyshin@naver.com"></td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">비밀번호 변경</th>
     		<td>
     			<div>
     				<p>※ 최소 8자 ~ 최대 20자 이내로 입력합니다.</p>
     				<p>※ 반드시 영문,숫자가 1자리 이상 포함되어야 합니다.</p>
     				
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
				<input style="width:300px;" type="text" id="sample6_address" placeholder="주소">
				<button type="button" class="delete_btn1 btn" onclick="sample6_execDaumPostcode()">주소 검색</button><br>
				<input style="width:300px;" type="text" id="sample6_detailAddress" placeholder="상세주소">
     		</td>
     		
     	</tr>
     </table>
     </div>
     <div id="infobtn">
	     <button type="button" class="delete_btn2 btn">수정</button>
	     <button type="button" class="delete_btn2 btn">확인</button>
     </div>
       	
      
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>