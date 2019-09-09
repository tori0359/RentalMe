$(function() {
	/*약관동의*/
	var chk = 0;
	$('#check_all').click(function() {

		if (chk == 0) {
			$('input[type=checkbox]').prop("checked", "checked");
			chk = 1;
		} else {
			$('input[type=checkbox]').removeProp('checked');
			chk = 0;
		}
		if ($('input[name=isOk]:checked').length == 2) {
			$('#join_next_btn').attr('disabled', false);
		} else {
			$('#join_next_btn').attr('disabled', true);
		}
	});
	$('#isOk1').click(function() {
		if (chk == 0) {
		} else {
			$('#check_all').removeProp('checked');
			chk = 0;
		}
		if ($('input[name=isOk]:checked').length == 2) {
			$('#join_next_btn').attr('disabled', false);
		} else {
			$('#join_next_btn').attr('disabled', true);
		}
	});

	$('#isOk2').click(function() {
		if (chk == 0) {
		} else {
			$('#check_all').removeProp('checked');
			chk = 0;
		}
		if ($('input[name=isOk]:checked').length == 2) {
			$('#join_next_btn').attr('disabled', false);
		} else {
			$('#join_next_btn').attr('disabled', true);
		}
	});
	$('#join_next_btn').click(function() {
		location.href = 'info';
	});
	
	/*회원가입 - 정보입력*/
	var regexId = 
		RegExp(/^[a-zA-Z0-9]{5,20}$/); //아이디 정규식(5~20자 영문소문자, 대문자 숫자 사용가능)
	var regexPw = 
		RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/); //비밀번호 정규식(8~20자 영문소문자,대문자,숫자,특수문자 사용가능)
	var regexHp =
		RegExp(/^[0-9]{10,11}$/); //연락처 정규식 (10~11자 숫자만 사용가능)
	var regexEmail = 
		RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); //이메일 정규식(영문+숫자@영문+숫자가 아닐경우)
		
	//회원가입-정보입력 화면 초기화
	$('#id-success').hide();
	$('#id-danger').hide();
	$('#idCheck-danger').hide();
	$('#pw-success').hide();
    $('#pw-danger').hide();
    $('#pw-danger2').hide();
    $('#hp-danger').hide();
    $('#email-danger').hide();
    $('#emailCode-success').hide();
    $('#emailCode-danger').hide();
    
    /*유효성 검사*/
    //1. 아이디 
    //아이디가 아이디 입력란안에 있을 경우
    $('#id').focus(function(){
    	//아이디 메시지를 가려준다.
        $('#id-success').hide();
        $('#id-danger').hide();
        $('#idCheck-danger').hide();
        
        
    }).blur(function(){//아이디가 포커스 외부에 있을 경우
    	
    	//아이디가 공백이 아닌경우
    	if($('#id').val()!=""){
    		if(regexId.test($('#id').val())){//아이디 정규식 체크에서 정상일경우 "아이디 사용가능" 메시지 출력
    			
            	//아이디 중복체크
            	var userId = $('form div input[name=userId]').val();
            	var allData = {"userId":userId}
            	$.ajax({
            		url: 'checkId',
            		type:'GET',
            		data:allData,
            		success:function(data){
            			if(data == 'dupl'){
	            			$('#id-success').hide();
	                        $('#id-danger').hide();
	                        $('#idCheck-danger').show();
	                        return false;
            			}else if(data=='notDupl'){
	            			$('#id-success').show();
	                        $('#id-danger').hide();
	                        $('#idCheck-danger').hide();       
	                        
            			}
            		},
            		error:function(request, status, error){
            			alert("code="+request.status+", message="+request.responseText+", error="+error)
            		}
            	});
    		}else{//정규식체크에서 잘못되었을 경우 "5~20자 영문,숫자를 조합하여 입력해주세요." 메시지 출력
                $('#id-success').hide();
                $('#idCheck-danger').hide();
                $('#id-danger').show();
                return false;
    		}
    	}
    });
    
    //2. 비밀번호
    //비밀번호, 비밀번호확인 포커스가 비밀번호 입력란 안에 있을 경우
    $('#pw,#pwf').focus(function(){
    	//비밀번호 메시지를 가려준다.
        $('#pw-success').hide();
        $('#pw-danger').hide();
        $('#pw-danger2').hide();
        
    }).blur(function(){//비밀번호, 비밀번호확인 포커스가 외부에 있을 경우
    	//비밀번호 또는 비밀번호 확인의 값이 공백이 아닐경우
        if($('#pw').val()!="" || $('#pwf').val()!=""){
        	//비밀번호, 비밀번호확인 정규식 체크
        	if(regexPw.test($('#pw').val()) || regexPw.test($('#pwf').val())){
	        	//비밀번호와 비밀번호확인의 값이 같을 경우 "비밀번호가 일치합니다." 메시지 출력
	            if($('#pw').val()==$('#pwf').val()){
	                $('#pw-success').show();
	                $('#pw-danger').hide();
	                $('#pw-danger2').hide();
	                
	            } else {//비밀번호와 비밀번호확인의 값이 같지 않을 경우 "비밀번호가 다릅니다." 메시지 출력
	                $('#pw-success').hide();
	                $('#pw-danger').show();
	                $('#pw-danger2').hide();
	                return false;
	            }
        	}else{
        		//정규식 체크가 맞지 않는 경우 - "8~20자 영문+숫자+특수문자 조합하여 입력해주세요." 메시지 출력
                $('#pw-success').hide();
                $('#pw-danger').hide();
                $('#pw-danger2').show();
                return false;
        	}
        }
    });
    
    //3. 연락처
    $('#hp').focus(function(){
    	$('#hp-danger').hide();
    }).blur(function(){
    	//연락처가 공백이 아닌경우
    	if($('#hp').val()!=""){    		
    		if(regexHp.test($('#hp').val())){//연락처 정규식 체크에서 정상일경우 패스
                $('#hp-danger').hide();
                
    		}else{//정규식체크에서 잘못되었을 경우 "10~11자 숫자만 사용가능" 메시지 출력
                $('#hp-danger').show();
                return false;
    		}
    	}
    });
    
    //3-1. 핸드폰인증
    $('#hpSend').click(function(){
		if(regexHp.test($('#hp').val())){//연락처 정규식 체크에서 정상일경우 패스
            $('#hp-danger').hide();
        
            alert('입력하신 번호로 인증번호가 발송되었습니다.');
            var hp = $('#hp').val();	//입력한 핸드폰번호
            
            //서버로 전송한다.
            $.ajax({
            	url: 'hpCodeSend',
        		type:'POST',
        		data:{'hp' : hp},
        		success:function(data){
        			alert('성공');
        		},
        		error:function(request, status, error){
        			alert("code="+request.status+", message="+request.responseText+", error="+error)
        		}           	
            	
            });
		}else{//정규식체크에서 잘못되었을 경우 "10~11자 숫자만 사용가능" 메시지 출력
            $('#hp-danger').show();
            return false;
		}
    	
    });
    
    //4. 이메일 
    $('#email').focus(function(){
    	$('#email-danger').hide();
    }).blur(function(){
    	if($('#email').val()!=""){
    		if(regexEmail.test($('#email').val())){//이메일 정규식 체크에서 정상일경우 패스
    			$('#email-danger').hide();    			
    		}else{
    			$('#email-danger').show();
    			return false;
    		}
    	}else{
    		return false;
    	}
    });
    
    //이메일 인증코드받기 버튼 클릭한 경우
    $('#emailSend').click(function(){
    	if($('#email').val()!=""){
    		if(regexEmail.test($('#email').val())){//이메일 정규식 체크에서 정상일경우 패스
    			$('#email-danger').hide();    			
    		}else{
    			$('#email-danger').show();
    			return false;
    		}
    	}else{
    		alert('이메일을 입력해주세요')
    		return false;
    	}
    	
    	alert("인증메일이 발송되었습니다.");
    	var email = $('#email').val();
    	var dataOne = {"email":email}
    	
    	$.ajax({
    		url: 'emailCodeSend',
    		type:'GET',
    		data:dataOne,
    		success:function(data){
    			var codeValue = data;
    			var emailCode = $('#emailCode').val(codeValue);
    		},
    		error:function(request, status, error){
    			alert("code="+request.status+", message="+request.responseText+", error="+error)
    		}
        });        
    });
    
    //입력한 인증코드와 서버에서 받은 인증코드와 비교하여 메시지 표시
	$('#emailKey').focus(function(){
		$('#emailCode-success').hide();
		$('#emailCode-danger').hide();
	}).blur(function(){
		if($('#emailKey').val()!=""){
			var inputCode = $('#emailKey').val();
			var emailCode = $('#emailCode').val();
			if(inputCode == emailCode){
				$('#emailCode-success').show();
				$('#emailCode-danger').hide();
			}else{
				$('#emailCode-success').hide();
				$('#emailCode-danger').show();
				return false;
			}
		}
	});
    
    //6. 생년월일
    //선언한 TextBox에 DatePicker 위젯을 적용
    $('#birth').datepicker({	
        changeMonth: true,
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        dateFormat: "yy-mm-dd",
    });
    //.datepicker('setDate', new Date()); 오늘날짜로 세팅을 하고 싶을 때 사용
});

//5. 주소
function addr_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; 		// 주소 변수
            var zonecode = ''; 	// 우편번호(2015년 8월 1일 이후부터 시행된 새 우편번호 사용, 구우편번호 사용x)
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                zonecode = data.zonecode;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
                zonecode = data.zonecode;
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
                document.getElementById("extraAddress").value = '';
            }

            // 도로명 주소 정보를 해당 필드에 넣는다.
            document.getElementById("addr").value = addr;
            // 우편번호를 해당 필드에 넣는다.
            document.getElementById("zipcode").value = zonecode;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addrDetail").focus();
            
            
        }
    }).open();
}

//회원가입
//회원가입 버튼 이벤트 (유효성 체크)
function joinCheck(){
	var frm = document.frm;
	
	if(frm.userId.value==""){
		alert("아이디를 입력 바랍니다.");
		frm.userId.focus();
		return false;
	}else if(frm.userPw.value == ""){
		alert("비밀번호를 입력 바랍니다.");
		frm.userPw.focus();
		return false;
	}else if(frm.pwf.value == ""){
		alert("비밀번호를 입력 바랍니다.");
		frm.pwf.focus();
		return false;
	}else if(frm.hp.value == ""){
		alert("휴대전화를 입력 바랍니다.");
		frm.hp.focus();
		return false;
	}else if(frm.email.value == ""){
		alert("이메일을 입력 바랍니다.");
		frm.email.focus();
		return false;
	}else if(frm.emailCode.value == ""){
		alert("인증코드를 입력 바랍니다.");
		frm.emailCode.focus();
		return false;
	}else if(frm.userNM.value == ""){
		alert("이름을 입력 바랍니다.");
		frm.userNM.focus();
		return false;
	}
	
	
	frm.submit();
	
}