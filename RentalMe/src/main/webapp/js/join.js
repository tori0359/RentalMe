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
	
	/*정보입력*/
	var regexId = 
		RegExp(/^[a-zA-Z0-9]{5,20}$/); //아이디 정규식(5~20자 영문소문자, 대문자 숫자 사용가능)
	var regexPw = 
		RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/); //비밀번호 정규식(8~20자 영문소문자,대문자,숫자,특수문자 사용가능)
	var regexHp =
		RegExp(/^[0-9]{10,11}$/); //연락처 정규식 (10~11자 숫자만 사용가능)
	var regexEmail = 
		RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); //이메일 정규식(영문+숫자@영문+숫자가 아닐경우)
	var flagId = false;
	var flagPw = false;
	var flagHp = false;
	
	//회원가입-정보입력 화면 초기화
	$('#id-success').hide();
	$('#id-danger').hide();
	$('#pw-success').hide();
    $('#pw-danger').hide();
    $('#pw-danger2').hide();
    $('#hp-danger').hide();
    $('#email-danger').hide();
    //$('#joinBtn').attr('disabled', true);
    
    /*유효성 검사*/
    
    //1. 아이디 - 중복체크 추가해야함
    //아이디가 아이디 입력란안에 있을 경우
    $('#id').focus(function(){
    	//아이디 메시지를 가려준다.
        $('#id-success').hide();
        $('#id-danger').hide();
    }).blur(function(){//아이디가 포커스 외부에 있을 경우
    	//아이디가 공백이 아닌경우
    	if($('#id').val()!=""){
    		
    	    if(flagId && flagPw && flagHp){
    			$('#joinBtn').attr('disabled', false);
    	    }
    		
    		if(regexId.test($('#id').val())){//아이디 정규식 체크에서 정상일경우 "아이디 사용가능" 메시지 출력
                $('#id-success').show();
                $('#id-danger').hide();
                flagId = true;
    		}else{//정규식체크에서 잘못되었을 경우 "5~20자 영문,숫자를 조합하여 입력해주세요." 메시지 출력
                $('#id-success').hide();
                $('#id-danger').show();
                flagId = false;
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
            if(flagId && flagPw && flagHp){
        		$('#joinBtn').attr('disabled', false);
            }
        	
        	//비밀번호, 비밀번호확인 정규식 체크
        	if(regexPw.test($('#pw').val()) || regexPw.test($('#pwf').val())){
	        	//비밀번호와 비밀번호확인의 값이 같을 경우 "비밀번호가 일치합니다." 메시지 출력
	            if($('#pw').val()==$('#pwf').val()){
	                $('#pw-success').show();
	                $('#pw-danger').hide();
	                $('#pw-danger2').hide();
	                flagPw = true;
	            } else {//비밀번호와 비밀번호확인의 값이 같지 않을 경우 "비밀번호가 다릅니다." 메시지 출력
	                $('#pw-success').hide();
	                $('#pw-danger').show();
	                $('#pw-danger2').hide();
	                flagPw = false;
	            }
        	}else{
        		//정규식 체크가 맞지 않는 경우 - "8~20자 영문+숫자+특수문자 조합하여 입력해주세요." 메시지 출력
                $('#pw-success').hide();
                $('#pw-danger').hide();
                $('#pw-danger2').show();
                flagPw =false;
        	}
        }
    });
    
    //3. 연락처
    $('#hp').focus(function(){
    	$('#hp-danger').hide();
    }).blur(function(){
    	//연락처가 공백이 아닌경우
    	if($('#hp').val()!=""){
    	    if(flagId && flagPw && flagHp){
    			$('#joinBtn').attr('disabled', false);
    	    }
    		
    		if(regexHp.test($('#hp').val())){//연락처 정규식 체크에서 정상일경우 패스
                $('#hp-danger').hide();
                flagHp = true;
    		}else{//정규식체크에서 잘못되었을 경우 "10~11자 숫자만 사용가능" 메시지 출력
                $('#hp-danger').show();
                flagHp = false;
    		}
    	}
    });
    
    //4. 이메일 
    $('#email').focus(function(){
//	    if(flagId && flagPw && flagHp){
//			$('#joinBtn').attr('disabled', false);
//	    }else{
//	    	$('#joinBtn').attr('disabled', true);
//	    } 
    	$('#email-danger').hide();
    }).blur(function(){
    	if($('#email').val()!=""){
    		if(regexEmail.test($('#email').val())){//이메일 정규식 체크에서 정상일경우 패스
    			$('#email-danger').hide();
    		}else{
    			$('#email-danger').show();
    		}
    	}
    });
    //인증코드받기 버튼 클릭한 경우
    $('#send_code').click(function(){
    	
        $('#myInput').modal();
    });
    
    //5. 생년월일
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
    }).datepicker('setDate', new Date());
});