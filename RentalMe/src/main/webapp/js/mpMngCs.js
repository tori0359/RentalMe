//공지사항 삭제하기 버튼을 눌렀을 때
function delNotice(noticNo){
	 Swal.fire({
		  title: '정말 삭제 하시겠습니까?',
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		    if (result.value) {
				    
		   	 $.ajax({
		  		type : 'POST',
		  		url  : 'noticeDelete',
		  		data : {'noticNo' : noticNo},
		  		dataType : 'json',
		  		success: function(data) {
		  			var msg = data;
		  			console.log(data);
		  			if(msg == 'success'){
		 				Swal.fire({
		 					  position: 'top-middle',
		 					  type: 'success',
		 					  title: '정상적으로 삭제되었습니다..',
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
		 				  title: '예상치 못한 오류로 인해 삭제가 취소되었습니다.',
		 				  showConfirmButton: false,
		 				  timer: 1500
		 				});
		 			setTimeout('location.reload()',1500); 
		  		}
		    });		    	
		    }
		});	
}

function delFaq(faqNo){
	 Swal.fire({
		  title: '정말 삭제 하시겠습니까?',
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		    if (result.value) {
				    
		   	 $.ajax({
		  		type : 'POST',
		  		url  : 'faqDelete',
		  		data : {'faqNo' : faqNo},
		  		dataType : 'json',
		  		success: function(data) {
		  			var msg = data;
		  			console.log(data);
		  			if(msg == 'success'){
		 				Swal.fire({
		 					  position: 'top-middle',
		 					  type: 'success',
		 					  title: '정상적으로 삭제되었습니다..',
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
		 				  title: '예상치 못한 오류로 인해 삭제가 취소되었습니다.',
		 				  showConfirmButton: false,
		 				  timer: 1500
		 				});
		 			setTimeout('location.reload()',1500); 
		  		}
		    });		    	
		    }
		});		
}
