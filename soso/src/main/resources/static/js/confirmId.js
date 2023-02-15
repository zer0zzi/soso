$(function(){
	let checkId = 0;
	
	$('#confirmId').click(function(){
		if($('#mem_id').val().trim()==''){
			$('#message_id').css('color','red').text('아이디를 입력해주세요.');
			$('#mem_id').val('').focus();
			return;
		}
		
		//서버와 통신
		$.ajax({
			url:'confirmId.do',
			type:'post',
			data:{mem_id:$('#mem_id').val()},
			dataType:'json',
			success:function(param){
				if(param.result=='idNotFound'){
					$('#message_id').css('color','#000').text('등록가능한 아이디입니다.');
					checkId = 1;
				}else if(param.result == 'idDuplicated'){
					$('#message_id').css('color','red').text('중복된 아이디입니다.');
					checkId = 0;
				}else if(param.result == 'notMatchPattern'){
					$('#message_id').css('color','red').text('영문, 숫자 4~12자로 입력');
					checkId = 0;
				}else{
					checkId = 0;
					alert('아이디 중복체크 오류');
				}
			},
			error:function(){
				checkId = 0;
				alert('네트워크 오류 발생');
			}
		});
	});
	
	$('#register_form #mem_id').keydown(function(){
		checkId = 0;
		$('#message_id').text('');
	});
	
	$('#register_form').submit(function(){
		if(checkId==0){
			$('#message_id').css('color','red').text('아이디 중복체크는 필수입니다.');
			if($('#mem_id').val().trim()==''){
				$('#mem_id').val('').focus();
			}
			return false;
		}
	});
});