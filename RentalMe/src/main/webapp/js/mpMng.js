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
			alert('삭제된 제품입니다.');
		}
	});
	
	
});