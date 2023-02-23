$(function(){
   let message_socket;//웹소켓 식별자
   //채팅방 채팅 멤버 저장 배열
   let member_list = [$('#user').attr('data-id')];
   
   //웹소켓 연결
   function alarm_connect(){
    	message_socket = new WebSocket("ws://localhost:8001/message-ws.do");
		message_socket.onopen=function(evt){
			//채팅 페이지에 진입하면 채팅 메시지 발송
			if($('#talkDetail').length == 1){
				 message_socket.send("msg:");
			}
			console.log("채팅페이지 접속");
		};
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		message_socket.onmessage=function(evt){
			let data = evt.data;
			if($('#talkDetail').length == 1 && data.substring(0,4) == 'msg:'){
				selectMsg();
			}
		};
		message_socket.onclose=function(evt){
			//소켓이 종료된 후 부과적인 작업이 있을 경우 명시
			console.log('채팅 종료');
		}
   }
   alarm_connect();
   
   //=======채팅회원검색=======//
   $('#member_search').keyup(function(){
      if($('#member_search').val().trim()==''){
         $('#search_area').empty();
         return;
      }
      
      $.ajax({
         url:'memberSearchAjax.do',
         type:'post',
         data:{id:$('#member_search').val()},
         dataType:'json',
         success:function(param){
            if(param.result == 'logout'){
               $('#member_search').attr('disabled',true);
               $('#member_search').val('로그인해야 회원검색이 가능합니다.');
            }else if(param.result == 'success'){
               $('#search_area').empty();
               $(param.member).each(function(index,item){
                  if(!member_list.includes(item.mem_id)){
                     //채팅회원배열에 포함되어있지 않은 id만 표시
                     let output = '';
                     output += '<li data-num="'+item.mem_num+'">';
                     output += item.mem_id;
                     output += '</li>';
                     $('#search_area').append(output);
                  }
               });
            }else{
               alert('채팅회원검색 시 오류 발생');
            }
         },
         error:function(){
            alert('네트워크 오류 발생');
         }
      });
   });
   
   //검색된 회원 선택하기
   $(document).on('click','#search_area li',function(){
      let mem_id = $(this).text();//선택한 id
      let mem_num = $(this).attr('data-num');//선택한 회원번호
      //선택한 id를 배열에 저장
      member_list.push(mem_id);
      //선택한 id를 화면에 표시
      let choice_id = '<span class="member-span" data-id="'+mem_id+'">';
      choice_id += '<input type="hidden" name="members" value="'+mem_num+'">';
      choice_id += mem_id + '<sup>&times;</sup></span>';
      $('#talk_member').append(choice_id);
      //초기화
      $('#member_search').val('');
      $('#search_area').empty();
      
      if($('#name_checked').is(':checked')){
         //이름자동 생성
         makeTalkroom_name();
      }
   });
   
   //선택한 ID 삭제
   $(document).on('click','.member-span',function(){
      let mem_id = $(this).attr('data-id');
      //배열에서 ID 삭제
      member_list.splice(member_list.indexOf(mem_id),1);
      //화면상에서 span 태그 제거 
      $(this).remove();
      
      if($('#name_checked').is(':checked')){
         //이름 자동 생성
         makeTalkroom_name();
      }
      if($('#talk_member span').length == 0){
         $('#name_span').text('');
         $('#talkroom_name').val('');
      }
   });
   
   //채팅방 이름 생성 제어하기
   $('#name_checked').click(function(){
      if($('#name_checked').is(':checked')){//채팅방 이름 자동 생성
         $('#talkroom_name').attr('type','hidden');
         if(member_list.length>1){
            makeTalkroom_name();
         }
      }else{// 채팅방 이름 수동생성
         $('#talkroom_name').attr('type','text');
         $('#name_span').text('');//채팅방 이름 표시 텍스트 초기화
      }
   });
   
   //채팅방 이름 생성
   function makeTalkroom_name(){
      let name = '';
      $.each(member_list,function(index,item){
         if(index>0) name += ',';
         name += item;
      });
      if(name.length>55){
         name = name.substring(0,55) + '...';
      }
      $('#talkroom_name').val(name);
      $('#name_span').text(name);
   }
   
   //채팅방 생성 전송
   $('#talk_form').submit(function(){
      if(member_list.length<=1){
         //이미 배열에 현재 로그인한 유저가 기본 등록되어 있어서
         //로그인한 유저 포함 최소 2명이 되어야 채팅 가능
         alert('채팅에 참여할 회원을 검색하세요!');
         $('#member_search').focus();
         return false;
      }
   });
   
   //=========채팅 데이터 읽기==========//
   function selectMsg(){
      $.ajax({
         url:'../talk/talkDetailAjax.do',
         type:'post',
         data:{talkroom_num:$('#talkroom_num').val()},
         dataType:'json',
         success:function(param){
            if(param.result == 'logout'){
               alert('로그인 후 사용하세요');
			   message_socket.close();
            }else if(param.result == 'success'){
               $('#chatting_message').empty();
               
               //채팅 날짜 표시
               let chat_date='';
               $(param.list).each(function(index,item){
                  let output = '';
                  //날짜 추출
                  if(chat_date != item.chat_date.split(' ')[0]){
                     chat_date = item.chat_date.split(' ')[0];
                     output += '<div class="date-position"><span>'+chat_date+'</span></div>';
                  }
                  
                  if(item.message.indexOf('@{exit}@')>=0){
                     //탈퇴 메세지 처리
                     output += '<div class="exit-message">';
                     output += item.message.substring(0,item.message.indexOf('@{exit}@'));
                     output += '</div>';
                  }else{
                     //일반 메시지 처리
                     if(item.mem_num == $('#mem_num').val()){
                        //본인 메세지
                        output += '<div class="from-position">';
                        output += '<div>';   
                     }else{
                        //타인 메세지
                        output += '<div class="to-position">';
                        output += '<div class="space-photo">';
                        output += '<img src="../member/viewProfile.do?mem_num='+item.mem_num+'" width="40" height="40" class="my-photo">';
                        output += '</div><div class="space-message">';
                        output += item.mem_id;
                     }
                     output += '<div class="item">';
                     output += '<sapn>' + item.message.replace(/\r\n/g,'<br>').replace(/\r/,'<br>').replace(/\n/,'<br>') + '</span>';
                     //안 읽은 사람 수 & 시간 표시
                     output += '<div class="chatdate-right">'+'<span class="chatread-count">('+item.read_count+')</span>' + item.chat_date.split(' ')[1] + '</div>';
                     output += '</div>';
                     output += '</div><div class="space-clear"></div>';
                     output += '</div>';
                   }
                  
                  //문서 객체에 추가
                  $('#chatting_message').append(output);
                  //스크롤을 하단에 위치시킴
                  $('#chatting_message').scrollTop($('#chatting_message')[0].scrollHeight);
                  
               });
               
            }else{
               alert('채팅 메시지 읽기 오류 발생');
			   message_socket.close();
            }
         },
         error:function(){
            alert('네트워크 오류 발생');
			message_socket.close();
         }
      });
   }
   
   //===========메시지 입력 후 enter 이벤트 처리=============//
   $('#message').keydown(function(event){
      if(event.keyCode == 13 && !event.shiftKey){
         $('#detail_form').trigger('submit');
      }
   });
   
   //=============채팅 등록==================//
   $('#detail_form').submit(function(event){
      //기본이벤트 제거
      event.preventDefault();
      
      if($('#message').val().trim()==''){
         alert('메세지를 입력하세요!');
         $('#message').val('').focus();
         return false;
      }
      
      //글자수 체크
      if($('#message').val().length>1333){
         alert('메시지는 1333자까지만 입력 가능합니다.');
         return false;
      }
      
      let form_data = $(this).serialize();
      
      //서버와 통신
      $.ajax({
         url:'../talk/writeTalk.do',
         type:'post',
         data:form_data,
         dataType:'json',
         success:function(param){
            if(param.result == 'logout'){
               alert('로그인해야 작성할 수 있습니다.');
			   message_socket.close();	
            }else if(param.result == 'success'){
               //폼 초기화
               $('#message').val('').focus();
			   //메시지가 저장되었다고 소켓에 신호를 보냄
			   message_socket.send('msg:');
            }else{
               alert('메시지 등록 오류');
               message_socket.close();
            }
         },
         error:function(){
            alert('네트워크 오류!');
		    message_socket.close();
         }
      });
   });
   
	//=========채팅방 나가기==========//
	$('#delete_talkroom').click(function(){
		let choice = confirm('채팅방을 나가길 원하시나요?');
		if(!choice){
			return;
		}
		
		$.ajax({
			url:'../talk/deleteTalkRoomMember.do',
			type:'post',
			data:{talkroom_num:$('#talkroom_num').val(),mem_num:$('#mem_num').val()},
			dataType:'json',
			success:function(param){
	           if(param.result == 'logout'){
	              alert('로그인해야 작성할 수 있습니다.');
				  message_socket.close();
	           }else if(param.result == 'success'){
				  alert('정상적으로 채팅방을 나갔습니다');
	              location.href='../talk/talkList.do';
	           }else{
	              alert('채팅방 나가기 오류');
				  message_socket.close();
	           }
	        },
	        error:function(){
	            alert('네트워크 오류!');
			    message_socket.close();
	        }
		});
		
	});

});





