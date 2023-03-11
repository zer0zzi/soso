$(function(){
	//===MyPage 프로필사진 등록 및 수정===//
	//수정 버튼 이벤트 처리
	$('#photo_btn').click(function(){
		$('#photo_choice').show();
		$(this).hide();
	});//end of click
	
	//처음 화면에 보여지는 이미지 읽기
	let photo_path = $('.my-photo').attr('src');
	let my_photo; //업로드하고자 선택한 이미지 저장
	$('#upload').change(function(){
		my_photo = this.files[0];
		if(!my_photo){
			$('.my-photo').attr('src',photo_path);
			return;
		}
		
		if(my_photo.size > 1024*1024){
			alert(Math.round(my_photo.size/1024) 
			   + 'kbytes(1024kbytes까지만 업로드 가능)');
			$('.my-photo').attr('src',photo_path);
			$(this).val('');
			return;			
		}
		
		//이미지 미리보기 처리
		let reader = new FileReader();
		reader.readAsDataURL(my_photo);
		
		reader.onload=function(){
			$('.my-photo').attr('src',reader.result);
		};
	});//end of change
	
	//서버에 데이터 전송
	$('#photo_submit').click(function(){
		if($('#upload').val()==''){
			alert('파일을 선택하세요!');
			$('#upload').focus();
			return;
		}
		//파일 전송
		let form_data = new FormData();
		form_data.append('upload', my_photo);
		$.ajax({
			url:'../mymember/updateMyPhoto.do',
			data:form_data,
			type:'post',
			dataType:'json',
			contentType:false,
			enctype:'multipart/form-data',
			processData:false,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 사용하세요!');
				}else if(param.result == 'success'){
					alert('프로필 사진이 수정되었습니다.');
					//교체된 이미지 저장
					photo_path = $('.my-photo').attr('src');
					$('#upload').val('');
					$('#photo_choice').hide();
					$('#photo_btn').show();
				}else{
					alert('파일 전송 오류');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});//end of click - ajax
	
	//취소 버튼 처리
	$('#photo_reset').click(function(){
		$('.my-photo').attr('src',photo_path);
		$('#upload').val('');
		$('#photo_choice').hide();
		$('#photo_btn').show();
	});
	
	//===비밀번호 변경 체크===//
	$('#passwd').keyup(function(){
		if($('#confirm_passwd').val()!='' && 
		    $('#confirm_passwd').val()!=$(this).val()){
			$('#message_id').text('비밀번호 불일치')
			                .css('color','red');
		}else if($('#confirm_passwd').val()!='' &&
		     $('#confirm_passwd').val()==$(this).val()){
			 $('#message_id').text('비밀번호 일치')
		                     .css('color','#000');
		}
	});
	
	$('#confirm_passwd').keyup(function(){
		if($('#mem_pw').val()!='' && 
		    $('#mem_pw').val()!=$(this).val()){
			$('#message_id').text('비밀번호 불일치')
			                .css('color','red');
		}else if($('#mem_pw').val()!='' &&
		     $('#mem_pw').val()==$(this).val()){
			 $('#message_id').text('비밀번호 일치')
		                     .css('color','#000');
		}
	});
	
	$('#change_form').submit(function(){
		if($('#now_passwd').val().trim()==''){
			alert('현재 비밀번호를 입력하세요!');
			$('#now_passwd').val('').focus();
			return false;
		}
		if($('#mem_pw').val().trim()==''){
			alert('새비밀번호를 입력하세요!');
			$('#mem_pw').val('').focus();
			return false;
		}
		if($('#confirm_passwd').val().trim()==''){
			alert('비밀번호 확인을 입력하세요!');
			$('#confirm_passwd').val('').focus();
			return false;
		}
		if($('#mem_pw').val()!=$('#confirm_passwd').val()){
			$('#message_id').text('비밀번호 불일치')
			                .css('color','red');
            return false;
		}
	});
	
//	$('#scoreplus').click(function(){
//	  $.ajax({
//	      url:'scoreplus.do',
//	      type:'post',
//	      data:{mem_num:$('#scoreplus').attr('data-num')},
//	      dataType: "json",
//	      success:function(response){
//			  if(response.result == 'success'){
//				  
//			  }
//	        // 요청이 성공했을 경우 좋아요/싫어요 개수 레이블 업데이트
//	        $('#like_count'+ pk).html("count : "+ response.like_count);
//	        $('#dislike_count'+ pk).html("count : "+ response.dislike_count);
//	      },
//	      error:function(){
//	        alert('칭찬 네트워크 오류');
//	      }
//	  });
//	});

	// 싫어요 버튼 처리
	// 버튼 클릭 > ajax통신 (dislike url로 전달) > views의 dislike 메소드에서 리턴하는 값 전달받기 > 성공시 콜백 호출
//	$('.dislike').click(function(){
//	  var pk = $(this).attr('name') // 클릭한 요소의 attribute 중 name의 값을 가져온다.
//	  $.ajax({
//	      url: "{% url 'pledge:pledge_dislike' pledge.pk %}", // 통신할 url을 지정한다.
//	      data: {'csrfmiddlewaretoken': '{{ csrf_token }}'}, // 서버로 데이터를 전송할 때 이 옵션을 사용한다.
//	      dataType: "json", // 서버측에서 전송한 데이터를 어떤 형식의 데이터로서 해석할 것인가를 지정한다. 없으면 알아서 판단한다.
//	
//	      success: function(response){
//	        // 요청이 성공했을 경우 좋아요/싫어요 개수 레이블 업데이트
//	        $('#like_count'+ pk).html("count : "+ response.like_count);
//	        $('#dislike_count'+ pk).html("count : "+ response.dislike_count);
//	      },
//	      error:function(error){
//	        // 요청이 실패했을 경우
//	        alert(error)
//	      }
//	  });
//	});
	
});


