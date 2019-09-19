//상세정보
function userDatail(mbNo){
	$.ajax({
		type : 'POST',
		url  : 'UserDetail',
		data : {'mbNo' : mbNo},
		dataType : 'json',
		success: function(data) {
			var userInfo = data;
			
			//1. 정보 세팅
			$('#mbNo').text(userInfo.mbNo);														//회원번호
			if(userInfo.levelGbCd == '1'){														//구분
				$('input:radio[name=levelGbCd][value=1]').prop('checked', 'checked');
				$('input:radio[name=levelGbCd][value=2]').prop('checked', false);
			}else{
				$('input:radio[name=levelGbCd][value=1]').prop('checked', false);
				$('input:radio[name=levelGbCd][value=2]').prop('checked', 'checked');
			}
			$('#userId').text(userInfo.userId);													//아이디
			$('#userNm').text(userInfo.userNM);													//이름
			$('#birthDay').text(userInfo.birthDay);												//생년월일
			if(userInfo.genderGbCd == '1'){														//성별
				$('input:radio[name=genderGbCd][value=1]').prop('checked', 'checked');
				$('input:radio[name=genderGbCd][value=2]').prop('checked', false);
			}else{
				$('input:radio[name=genderGbCd][value=1]').prop('checked', false);
				$('input:radio[name=genderGbCd][value=2]').prop('checked', 'checked');
			}
			$('#hp').text(userInfo.hp);															//핸드폰
			if(userInfo.hpYn == 'Y'){															//핸드폰 수신여부
				$('input:checkbox[name=hpYn]').prop('checked', 'checked');
			}else{
				$('input:checkbox[name=hpYn]').prop('checked', false);
			}
			$('#email').text(userInfo.email);													//이메일
			if(userInfo.emailYn == 'Y'){														//이메일 수신여부
				$('input:checkbox[name=emailYn]').prop('checked', 'checked');
			}else{
				$('input:checkbox[name=emailYn]').prop('checked', false);
			}
			$('#addrDetail').text(userInfo.addrDetail);											//상세주소
			if(userInfo.userStsCd == '1'){														//회원상태 선택
				$('input:radio[name=userStsCd][value=1]').prop('checked', 'checked');
				$('input:radio[name=userStsCd][value=2]').prop('checked', false);
				$('input:radio[name=userStsCd][value=3]').prop('checked', false);
			}else if(userInfo.userStsCd == '2'){
				$('input:radio[name=userStsCd][value=1]').prop('checked', false);
				$('input:radio[name=userStsCd][value=2]').prop('checked', 'checked');
				$('input:radio[name=userStsCd][value=3]').prop('checked', false);				
			}else{
				$('input:radio[name=userStsCd][value=1]').prop('checked', false);
				$('input:radio[name=userStsCd][value=2]').prop('checked', false);
				$('input:radio[name=userStsCd][value=3]').prop('checked', 'checked');

			}
			
			//2. 모달을 연다
			$('#mngUserDatail').modal('show');
			
			//3. 모달을 열고 난 후 이벤트 처리
			if(userInfo.userNM == null){														//이름 값이 널인 경우 공백 처리
				$('#userNm').empty();
			}
			if(userInfo.zipCode == null){
				$('#addr').text(userInfo.addr);													//우편코드가 널인 경우 공백처리
			}else{
				$('#addr').text('('+userInfo.zipCode+')'+userInfo.addr);						
			}
			
			if(userInfo.addr == null){															//기본주소가 널인 경우
				$('#addr').empty();
			}
			
			if(userInfo.addrDetail == null){													//상세주소가 널인 경우
				$('#addrDetail').empty();
			}
			

				
			
		},
		error:function(request, status, error){
			alert("code="+request.status+", message="+request.responseText+", error="+error)
		}
  	 });
	
	
}
//탈퇴하기 버튼을 눌렀을 때
function userLeave(mbNo){
	 $.ajax({
 		type : 'POST',
 		url  : 'userLeave',
 		data : {'mbNo' : mbNo},
 		dataType : 'json',
 		success: function(data) {
 			var msg = data;
 			if(msg == 'success'){
 				alert('정상적으로 탈퇴되었습니다.')
 				location.reload();
 			}
 		},
 		error:function(){
 			alert('예상치 못한 오류로 인해 회원탈퇴가 취소되었습니다.');
 		}
   	 });
}
/*
//탈퇴하기 버튼을 눌렀을 때
function userLeave(mbNo){
    ezBSAlert({
        type: "confirm",
        headerText: '회원탈퇴',
        messageText: "정말 탈퇴 처리 하시겠습니까?",
        alertType: "danger"
      }).done(function (result) {
       if(result){				//탈퇴하기 확인
      	 $.ajax({
    		type : 'POST',
    		url  : 'userLeave',
    		data : {'mbNo' : mbNo},
    		dataType : 'json',
    		success: function(data) {
    			var msg = data;
    			if(msg == 'success'){
    			    ezBSAlert({
    			        type: "alert",
    			        headerText: '회원탈퇴',
    			        messageText: "정상적으로 탈퇴처리 되었습니다.",
    			        alertType: "success"
    			      });
    			}else{
    			    ezBSAlert({
    			        type: "alert",
    			        headerText: '회원탈퇴',
    			        messageText: "예상치 못한 오류로 인해 회원탈퇴가 취소되었습니다.",
    			        alertType: "danger"
    			      }); 				
    			}
    		},
    		error:function(request, status, error){
    			alert("code="+request.status+", message="+request.responseText+", error="+error)
    		}
      	 });
       }
      });	
}


function ezBSAlert (options) {
	var deferredObject = $.Deferred();
	var defaults = {
		type: "alert", //alert, prompt,confirm 
		modalSize: 'modal-sm', //modal-sm, modal-lg
		okButtonText: 'Ok',
		cancelButtonText: 'Cancel',
		yesButtonText: 'Yes',
		noButtonText: 'No',
		headerText: 'Attention',
		messageText: 'Message',
		alertType: 'default', //default, primary, success, info, warning, danger
		inputFieldType: 'text', //could ask for number,email,etc
	}
	$.extend(defaults, options);
  
	var _show = function(){
		var headClass = "navbar-default";
		switch (defaults.alertType) {
			case "primary":
				headClass = "alert-primary";
				break;
			case "success":
				headClass = "alert-success";
				break;
			case "info":
				headClass = "alert-info";
				break;
			case "warning":
				headClass = "alert-warning";
				break;
			case "danger":
				headClass = "alert-danger";
				break;
        }
		$('BODY').append(
			'<div id="ezAlerts" class="modal fade">' +
			'<div class="modal-dialog" class="' + defaults.modalSize + '">' +
			'<div class="modal-content">' +
			'<div id="ezAlerts-header" class="modal-header ' + headClass + '">' +
			'<button id="close-button" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>' +
			'<h4 id="ezAlerts-title" class="modal-title">Modal title</h4>' +
			'</div>' +
			'<div id="ezAlerts-body" class="modal-body">' +
			'<div id="ezAlerts-message" ></div>' +
			'</div>' +
			'<div id="ezAlerts-footer" class="modal-footer">' +
			'</div>' +
			'</div>' +
			'</div>' +
			'</div>'
		);

		$('.modal-header').css({
			'padding': '15px 15px',
			'-webkit-border-top-left-radius': '5px',
			'-webkit-border-top-right-radius': '5px',
			'-moz-border-radius-topleft': '5px',
			'-moz-border-radius-topright': '5px',
			'border-top-left-radius': '5px',
			'border-top-right-radius': '5px'
		});
    
		$('#ezAlerts-title').text(defaults.headerText);
		$('#ezAlerts-message').html(defaults.messageText);

		var keyb = "false", backd = "static";
		var calbackParam = "";
		switch (defaults.type) {
			case 'alert':
				keyb = "true";
				backd = "true";
				$('#ezAlerts-footer').html('<button class="btn btn-' + defaults.alertType + '">' + defaults.okButtonText + '</button>').on('click', ".btn", function () {
					calbackParam = true;
					$('#ezAlerts').modal('hide');
				});
				break;
			case 'confirm':
				var btnhtml = '<button id="ezok-btn" class="btn btn-primary">' + defaults.yesButtonText + '</button>';
				if (defaults.noButtonText && defaults.noButtonText.length > 0) {
					btnhtml += '<button id="ezclose-btn" class="btn btn-default">' + defaults.noButtonText + '</button>';
				}
				$('#ezAlerts-footer').html(btnhtml).on('click', 'button', function (e) {
						if (e.target.id === 'ezok-btn') {
							calbackParam = true;
							$('#ezAlerts').modal('hide');
						} else if (e.target.id === 'ezclose-btn') {
							calbackParam = false;
							$('#ezAlerts').modal('hide');
						}
					});
				break;
			case 'prompt':
				$('#ezAlerts-message').html(defaults.messageText + '<br /><br /><div class="form-group"><input type="' + defaults.inputFieldType + '" class="form-control" id="prompt" /></div>');
				$('#ezAlerts-footer').html('<button class="btn btn-primary">' + defaults.okButtonText + '</button>').on('click', ".btn", function () {
					calbackParam = $('#prompt').val();
					$('#ezAlerts').modal('hide');
				});
				break;
		}
   
		$('#ezAlerts').modal({ 
          show: false, 
          backdrop: backd, 
          keyboard: keyb 
        }).on('hidden.bs.modal', function (e) {
			$('#ezAlerts').remove();
			deferredObject.resolve(calbackParam);
		}).on('shown.bs.modal', function (e) {
			if ($('#prompt').length > 0) {
				$('#prompt').focus();
			}
		}).modal('show');
	}
    
  _show();  
  return deferredObject.promise();    
}
*/
