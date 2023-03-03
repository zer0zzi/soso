$(function(){
	let currentPage;
	let count;
	let rowCount;
	
	// 초기 데이터(목록) 설정
	selectList(1);
	// 다음 댓글 보기 버튼 클릭시 데이터 추가
	$('.paging-button input').click(function(){
		selectList(currentPage + 1);
	});
	// 댓글 작성 폼 초기화
	function initForm(){
		$('textarea').val('');
		$('#fre_first .letter-count').text('0/500');
	} // end of initForm
	
	// 댓글 등록
	$('#fre_form').submit(function(event){
		// 기본 이벤트 제거
		event.preventDefault();
		
		if($('#fre_content').val().trim()==''){
			alert('댓글을 작성하지 않았습니다.');
			$('#fre_content').val('').focus();
			return false;
		}
		
		let form_data = $(this).serialize();
		$.ajax({
			url:'writeFreeReply.do',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 작성할 수 있습니다.');
				}else if(param.result=='success'){
					// 폼 초기화
					initForm();
					// 등록된 데이터가 표시될 수 있도록 목록 갱신
					selectList(1);
				}
			},
			error:function(){
				alert('네트워크 오류 발생!');
			}
		});
	}); // end of 댓글 등록 submit
	
	// 댓글 목록
	function selectList(pageNum){
		currentPage = pageNum;
		
		// 로딩 이미지 노출
		$('#loading').show();
		
		$.ajax({
			url:'listFreeReply.do',
			type:'post',
			data:{pageNum:pageNum, free_num:$('#free_num').val()},
			dataType:'json',
			success:function(param){
				// 로딩 이미지 감추기
				$('#loading').hide();
				count = param.count;
				rowCount = param.rowCount;
				
				if(pageNum==1){
					// 처음 호출시 해당 ID의 div의 내부 내용물 제거
					$('#f_output').empty();
				}
				
				// 댓글 목록 작업
				$(param.freeList).each(function(index, item){
					let output = '<div class="item">';
					output += '<ul class="detail-info">';
					output += '<li>'; // 프로필 사진 처리
					output += '<img src="../member/viewProfile.do?mem_num=' + item.mem_num + '" width="40" height="40" class="my-photo">';
					output += '</li>';
					output += '<li>';
					if(item.mem_nick){ // 존재하면 true
						output += item.mem_nick + '<br>';
					}else{
						output += item.mem_id + '<br>';
					}
					if(item.fre_modifydate){
						output += '<span class="modify-date">최근 수정일 : ' + item.fre_modifydate + '</span>';
					}else{
						output += '<span class="modify-date">등록일 : ' + item.fre_regdate + '</span>';
					}
					output += '</li>';
					output += '</ul>'; // end of .detail-info
					output += '<div class="sub-item">';
					output += '<p>' + item.fre_content.replace(/\r\n/g,'<br>') + '</p>'; // //g 안에서 넣으면 모든 \r\n을 찾으라는 뜻
					/*output += ' <input type="button" data-num="' + item.pre_num + '" value="댓글" class="re-btn">';*/
					if(param.user_num==item.mem_num){
						output += ' <input type="button" data-num="' + item.fre_num + '" value="수정" class="re-modify-btn">';
						output += ' <input type="button" data-num="' + item.fre_num + '" value="삭제" class="re-delete-btn">';
					}
					output += '<hr size="1" noshade>';
					output += '</div>'; // sub의 div
					output += '</div>'; // item의 div
					
					// 문서 객체에 추가
					$('#f_output').append(output);
				});
				
				// paging button 처리
				if(currentPage>=Math.ceil(count/rowCount)){
					// 다음 페이지가 없으면
					$('.paging-button').hide();
				}else{
					// 다음 페이지가 존재
					$('.paging-button').show();
				}
			},
			error:function(){
				// 로딩 이미지 감추기
				$('#loading').hide();
				alert('네트워크 오류 발생');
			}
		});
	}
	
	// textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','textarea',function(){
		// 입력한 글자수 구하기
		let inputLength = $(this).val().length;
		
		if(inputLength>500){ // 500자를 초과한 경우 잘라낸다.
			$(this).val($(this).val().substring(0,500));
		}else{ // 500자 이하인 경우
			// 남은 글자수 구하기
			let remain = inputLength;
			remain += '/500';
			if($(this).attr('id')=='fre_content'){
				// 등록 폼 글자수
				$('#fre_first .letter-count').text(remain);
			}else{
				// 수정 폼 글자수
				$('#fmre_first .letter-count').text(remain);
			}
		}
	}); // end of 글자수 체크
	
	// 수정폼에서 취소 버튼 클릭시 수정폼 초기화
	$(document).on('click','.re-reset',function(){
		initModifyForm();
	});
	//댓글 수정 폼 초기화
	function initModifyForm(){
		$('.sub-item').show();
		$('#fmre_form').remove();
	} // end of initModifyForm 수정폼 초기화
	// 댓글 수정 버튼 클릭시 수정폼 노출
	$(document).on('click','.re-modify-btn',function(){
		// 댓글 글번호
		let fre_num = $(this).attr('data-num');
		// 댓글 내용
		let fre_content = $(this).parent().find('p').html().replace(/<br>/g,'\r\n'); // br을 \r\n으로 대치
		
		// 댓글수정폼 UI
		let modifyUI = '<form id="fmre_form">';
		modifyUI += '<input type="hidden" name="fre_num" id="mre_num" value="' + fre_num + '">';
		modifyUI += '<textarea rows="3" cols="50" name="fre_content" id="mre_content" class="rep-content">' + fre_content + '</textarea>';
		modifyUI += '<div id="fmre_second" class="align-right">';
		modifyUI += ' <input type="submit" value="수정" class="re-modify-btn">';
		modifyUI += ' <input type="button" value="취소" class="re-reset re-reply-delete-btn">';
		modifyUI += '</div>';
		modifyUI += '<div id="fmre_first"><span class="letter-count">0/500</span></div>';
		modifyUI += '<hr size="1" noshade width="96%">';
		modifyUI += '</form>';
		
		// 이전에 이미 수정하는 댓글이 있을 경우 수정버튼을 클릭하면 숨김 sub-item을 환원시키고 수정폼을 초기화한다.
		initModifyForm();
		// 지금 클릭해서 수정하고자 하는 데이터는 감추기 : 수정버튼을 감싸고 있는 div = sub-item
		$(this).parent().hide(); // 단수
		
		// 수정폼을 수정하고자 하는 데이터가 있는 div에 노출
		$(this).parents('.item').append(modifyUI); // 복수(모든 부모)
		
		// 입력한 글자수 셋팅
		let inputLength = $('#mre_content').val().length;
		let remain = inputLength;
		remain += '/500';
		
		// 문서 객체에 반영
		$('#fmre_first .letter-count').text(remain); // 후손선택자이기에 공백 필수
	}); // end of 수정폼 노출
	
	
	// 댓글 수정 처리
	$(document).on('submit','#fmre_form',function(event){
		// 기본 이벤트 제거
		event.preventDefault();
		
		if($('#mre_content').val().trim()==''){
			alert('내용을 입력하세요!');
			$('#mre_content').val('').focus();
			return false;
		}
		
		// 폼에 입력한 데이터 반환
		let form_data = $(this).serialize();
		
		// 서버와 통신
		$.ajax({
			url:'updateFreeReply.do',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 수정할 수 있습니다.');
				}else if(param.result=='success'){
					// 수정 데이터 p 태그에 표시
					$('#fmre_form').parent().find('p').html($('#mre_content').val().replace(/</g,'&lt;')
																				  .replace(/>/g,'&gt;')
																				  .replace(/\r\n/g,'<br>')
																				  .replace(/\r/g,'<br>')
																				  .replace(/\n/g,'<br>'));
					// 최근 수정일 표시
					$('#fmre_form').parent().find('.modify-date').text('최근 수정일 : 5초 미만');
					
					// 수정폼 초기화
					initModifyForm();
				}else if(param.result=='wrongAccess'){
					alert('타인의 댓글은 수정할 수 없습니다.');
				}else{
					alert('댓글 수정시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}); // end of 댓글 수정 처리
	
	// 댓글 삭제
	$(document).on('click','.re-delete-btn',function(){
		// 댓글 번호
		let fre_num = $(this).attr('data-num');
		
		let choice = confirm('댓글을 삭제할까요?');
		
		if(choice){
			// 서버와 통신
			$.ajax({
				url:'deleteFreeReply.do',
				type:'post',
				data:{fre_num:fre_num},
				dataType:'json',
				success:function(param){
					if(param.result=='logout'){
						alert('로그인해야 삭제할 수 있습니다.');
					}else if(param.result=='success'){
						//alert('삭제 완료!');
						selectList(1);
					}else if(param.result=='wrongAccess'){
						alert('타인의 댓글을 삭제할 수 없습니다.');
					}else{
						alert('댓글 삭제시 오류 발생');
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		}
	}); // end of 댓글 삭제
	
}); // end of all function