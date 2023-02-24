$(function(){
	//===비밀번호 변경 체크===//
	$('#mem_pw').keyup(function(){
		if($('#confirm_passwd').val()!='' && $('#confirm_passwd').val()!=$(this).val()){
			$('#message_pw').text('비밀번호 불일치').css('color','red');			
		}else if($('#confirm_passwd').val()!='' && $('#confirm_passwd').val()==$(this).val()){
			$('#message_pw').text('비밀번호 일치').css('color','#000');
		}
	});
	
	$('#confirm_passwd').keyup(function(){
		if($('#mem_pw').val()!='' && $('#mem_pw').val()!=$(this).val()){
			$('#message_pw').text('비밀번호 불일치').css('color','red');			
		}else if($('#mem_pw').val()!='' && $('#mem_pw').val()==$(this).val()){
			$('#message_pw').text('비밀번호 일치').css('color','#000');
		}
	});
	
	$('#register_form').submit(function(){
		if($('#mem_pw').val()!=$('#confirm_passwd').val()){
			$('#message_pw').text('비밀번호가 일치하지 않습니다.').css('color','red');
			return false;
		}
			
	});
});












