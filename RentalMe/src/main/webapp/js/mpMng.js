$(function(){
//	$("textarea").keydown(function(){
//       var numChar = $(this).val().length;
//       var maxNum = 200;
//       var charRemain = numChar;
//       $("span > em").text(charRemain);
//       if(charRemain > 200){
//         alert("200자 이하로 작성해주세요.");
//         $("span > em").addClass("warning");
//         $(".submit").prop("disabled", true);
//       } else {
//         $(".submit").prop("disabled", false);
//       }
//	});
	
	for(var i=0; i<$('.delYn').length; i++){
		if($('.delYn').eq(i).text()=='Y'){
			$('.delYn').eq(i).css('color','blue');
			$('.delYn').eq(i).parent().attr('onclick', '').unbind('click');
		}else if($('.delYn').eq(i).text()=='N'){
			$('.delYn').eq(i).css('color','red');
		}
	}
	
	$('.usedTableTrClick').click(function(){
		if($(this).find('.delYn').text()=='Y'){
			Swal.fire({
				  position: 'top-middle',
				  type: 'error',
				  title: '삭제된 제품입니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
		}
	});
	
	$('#chkResult').click(function(){
		if($(":checkbox[name=declNo]:checked").length==0){
			Swal.fire({
				  position: 'top-middle',
				  type: 'warning',
				  title: '처리완료 할 데이터를 선택 해주시기 바랍니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
			return false;
		}
		
		//1. 체크된 값을 배열 형태로 담는다.
		var checkedDeclList = $(":checkbox[name=declNo]:checked");
		var checkedDeclArray = [];
		
		//2. 체크된값을 배열에 담는다.
		checkedDeclList.each(function(i){
			checkedDeclArray.push(checkedDeclList[i].value);
		});
		
		
		$.ajax({
			type : 'POST',
			url  : '/mp/mng/decl/update',
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify(checkedDeclArray),	//3.배열을 json형태로 변환하여 서버로 보낸다.
			success: function(data) {
				Swal.fire({
					  position: 'top-middle',
					  type: 'success',
					  title: '정상적으로 처리되었습니다.',
					  showConfirmButton: false,
					  timer: 1500
					});
				setTimeout('location.reload()',1500); 
			},
			error:function(request, status, error){
				alert("code="+request.status+", message="+request.responseText+", error="+error)
			}			
		});
	});
	
	
});