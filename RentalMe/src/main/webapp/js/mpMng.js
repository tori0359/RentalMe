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
		
		
		
	});
	
	
});