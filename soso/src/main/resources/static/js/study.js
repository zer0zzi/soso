$(function(){
	// Modal을 가져온다
	var modals = document.getElementsByClassName("modal");
	// Modal을 띄우는 클래스 이름을 가져온다.
	var btns = document.getElementsByClassName("btntt");
	// Modal을 닫는 close 클래스를 가져온다.
	var spanes = document.getElementsByClassName("close");
	var funcs = [];
	
	// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
	function Modal(num) {
		return function(){
			// 해당 클래스의 내용을 클릭하면 Modal을 띄운다.
			btns[num].onclick = function(){
				modals[num].style.display = "block";
				console.log(num);
			};
			
			// 닫기 버튼 클릭하면 Modal이 닫힌다.
			spanes[num].onclick = function() {
				modals[num].style.display = "none";
			};
		};
	}
	// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의한다.
	for(var i = 0; i< btns.length; i++){
		funcs[i] = Modal(i);
	}
	// 원하는 Modal 수만큼 funcs 함수를 호출한다.
	for(var j = 0; j< btns.length; j++){
		funcs[j]();
	}
	// Modal 영역 밖을 클릭하면 Modal을 닫는다.
	window.onclick = function(event) {
		if(event.target.className == "modal"){
			event.target.style.display = "none";	
		}
	};
		
	//모달창 외부 버튼 클릭 이벤트
	$('.btn-light').click(function(){
		$.ajax({
			url:'signLogin.do',
			type:'post',
			data:{stc_num:$('.btn-light').attr('data-num')},
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 신청하세요!');
					location.href='../member/login.do';
				}else if(param.result == 'aleadySigned'){
					alert('이미 신청한 스터디입니다.');
					location.href='../mymember/myPage.do';
				}else if(param.result == 'first'){
					//폼 초기화
					initForm();
					//등록된 데이터가 표시될 수 있도록 
					//목록 갱신
					selectList(1);
				}else{
					alert('기타 네트워크 오류 발생');
					return false;
				}
			},
			error:function(){
				alert('신청에 네트워크 오류 발생');
			}
		});
	});
	
	//댓글 작성 폼 초기화
	function initForm(){
		$('textarea').val('');
		$('#modal_count .letter-count').text('300/300');
	}
	
	//textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','textarea',function(){
		//입력한 글자수 구하기
		let inputLength = $(this).val().length;
		
		if(inputLength>300){//300자를 넘어선 경우
			$(this).val($(this).val().substring(0,300));
		}else{//300자 이하인 경우
			//남은 글자수 구하기
			let remain = 300 - inputLength;
			remain += '/300';
			if($(this).attr('id') == 'signup_detail'){
				//등록 폼 글자수
				$('#modal_count .letter-count').text(remain);
			}
		}
		
	});
	
	
	//모달창 내부 버튼 클릭 이벤트
	$('.btn-success').click(function(){
		$.ajax({
			url:'signup.do',
			type:'post',
			data:{stc_num:$('.btn-light').attr('data-num'),
				  signup_detail:$('#signup_detail').val()},
			dataType:'json',
			success:function(param){
				if(param.result == 'success'){
					alert('신청 성공');
					location.href='../main/main.do';
				}else if(param.result == 'aleadySigned'){
					alert('이미 신청한 스터디입니다.');
					location.href='../mymember/myPage.do';
				}else{
					alert('신청에 오류 발생');
				}
			},
			error:function(){
				alert('신청에 네트워크 오류 발생');
			}
		});
	});
	
});




