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
				$('input:radio[name=levelGbCd][value=2]').attr('disabled', 'disabled');
			}else{
				$('input:radio[name=levelGbCd][value=1]').prop('checked', false);
				$('input:radio[name=levelGbCd][value=1]').attr('disabled', 'disabled');
				$('input:radio[name=levelGbCd][value=2]').prop('checked', 'checked');
			}
			$('#userId').text(userInfo.userId);													//아이디
			$('#userNm').text(userInfo.userNM);													//이름
			$('#birthDay').text(userInfo.birthDay);												//생년월일
			if(userInfo.genderGbCd == '1'){														//성별
				$('input:radio[name=genderGbCd][value=1]').prop('checked', 'checked');
				$('input:radio[name=genderGbCd][value=2]').prop('checked', false);
				$('input:radio[name=genderGbCd][value=2]').attr('disabled', 'disabled');
			}else{
				$('input:radio[name=genderGbCd][value=1]').prop('checked', false);
				$('input:radio[name=genderGbCd][value=1]').attr('disabled', 'disabled');
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
				$('input:radio[name=userStsCd][value=2]').attr('disabled', 'disabled');
				$('input:radio[name=userStsCd][value=3]').prop('checked', false);
				$('input:radio[name=userStsCd][value=3]').attr('disabled', 'disabled');
			}else if(userInfo.userStsCd == '2'){
				$('input:radio[name=userStsCd][value=1]').prop('checked', false);
				$('input:radio[name=userStsCd][value=1]').attr('disabled', 'disabled');
				$('input:radio[name=userStsCd][value=2]').prop('checked', 'checked');
				$('input:radio[name=userStsCd][value=3]').prop('checked', false);	
				$('input:radio[name=userStsCd][value=3]').attr('disabled', 'disabled');
			}else{
				$('input:radio[name=userStsCd][value=1]').prop('checked', false);
				$('input:radio[name=userStsCd][value=1]').attr('disabled', 'disabled');
				$('input:radio[name=userStsCd][value=2]').prop('checked', false);
				$('input:radio[name=userStsCd][value=2]').attr('disabled', 'disabled');
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
	
	 Swal.fire({
		  title: '정말 탈퇴처리 하시겠습니까?',
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '탈퇴',
		  cancelButtonText: '취소'
		}).then((result) => {
		    if (result.value) {
				    
		   	 $.ajax({
		  		type : 'POST',
		  		url  : 'userLeave',
		  		data : {'mbNo' : mbNo},
		  		dataType : 'json',
		  		success: function(data) {
		  			var msg = data;
		  			if(msg == 'success'){
		 				Swal.fire({
		 					  position: 'top-middle',
		 					  type: 'success',
		 					  title: '탈퇴처리되었습니다.',
		 					  showConfirmButton: false,
		 					  timer: 1500
		 					});
		 				setTimeout('location.reload()',1500); 
		  			}
		  		},
		  		error:function(){
		 			Swal.fire({
		 				  position: 'top-middle',
		 				  type: 'error',
		 				  title: '예상치 못한 오류로 인해 탈퇴가 취소되었습니다.',
		 				  showConfirmButton: false,
		 				  timer: 1500
		 				});
		 			setTimeout('location.reload()',1500); 
		  		}
		    	 });		    	
		    }
		})

}

//계정초기화
function userInit(mbNo){
	 Swal.fire({
		  title: '계정 초기화를 하시겠습니까?',
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '초기화',
		  cancelButtonText: '취소'
		}).then((result) => {
		    if (result.value) {
				    
		   	 $.ajax({
		  		type : 'POST',
		  		url  : 'userInit',
		  		data : {'mbNo' : mbNo},
		  		dataType : 'json',
		  		success: function(data) {
		  			var msg = data;
		  			if(msg == 'success'){
		 				Swal.fire({
		 					  position: 'top-middle',
		 					  type: 'success',
		 					  title: '정상적으로 계정이 초기화되었습니다.',
		 					  showConfirmButton: false,
		 					  timer: 1500
		 					});
		 				setTimeout('location.reload()',1500); 
		  			}
		  		},
		  		error:function(){
		 			Swal.fire({
		 				  position: 'top-middle',
		 				  type: 'error',
		 				  title: '예상치 못한 오류로 인해 계정정지 해제가 취소되었습니다.',
		 				  showConfirmButton: false,
		 				  timer: 1500
		 				});
		 			setTimeout('location.reload()',1500); 
		  		}
		    	 });		    	
		    }
		})	
}