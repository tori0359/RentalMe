 $(function(){
    $('#pw_find').hide();
    $('#id_email_find').hide();
    $('#pw_email_find').hide();
    $('#pw_tab').click(function(){
        $('#id_tab').prop('disabled', false);
        $('#pw_tab').prop('disabled', true);
        $('#id_find_btn').hide();
        $('#pw_find_btn').show();
        $('#id_find').hide();
        $('#pw_find').show();
    });
    $('#id_tab').click(function(){
        $('#pw_tab').prop('disabled', false);
        $('#id_tab').prop('disabled', true);
        $('#id_find_btn').show();
        $('#pw_find_btn').hide();
        $('#pw_find').hide();
        $('#id_find').show();
    });
    
    $('#find_cellphone').click(function(){
        $('#id_email_find').hide();
        $('#id_cellphone_find').show();
        $('#pw_cellphone_find').show();
        $('#pw_email_find').hide();
    });
    $('#find_email').click(function(){
        $('#id_email_find').show();
        $('#id_cellphone_find').hide();
        $('#pw_cellphone_find').hide();
        $('#pw_email_find').show();
    });                
    $('#id_find_btn').click(function(){
        $('#id_pw_find').modal('hide');
    });
    $('#pw_find_btn').click(function(){
        $('#id_pw_find').modal('hide');
    });
});