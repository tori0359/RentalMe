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
	$('#pw-success').hide();
    $('#pw-danger').hide();
    
    $('#pw,#pwf').focusin(function(){
        $('#pw-success').hide();
        $('#pw-danger').hide();
    });
    
    $('#pw,#pwf').blur(function(){
        if($('#pw').val()!="" || $('#pwf').val()!=""){
            if($('#pw').val()==$('#pwf').val()){
                $('#pw-success').show();
                $('#pw-danger').hide();
            } else {
                $('#pw-success').hide();
                $('#pw-danger').show();
            }
        }
    });
    
    $('#send_code').click(function(){
        $('#myInput').modal();
    });
    
});