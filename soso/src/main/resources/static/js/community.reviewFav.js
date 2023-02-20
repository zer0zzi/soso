$(function(){
	// 좋아요 읽기
	function selectReviewFav(review_num){
		$.ajax({
			url:'getReviewFav.do',
			type:'post',
			data:{review_num:review_num},
			dataType:'json',
			success:function(param){
				displayReviewFav(param);
			},
			error:function(){
				alert('네트워크 오류');
			}
		});
	}
	// 초기 데이터 표시
	selectReviewFav($('#v_output_fav').attr('data-num'));
	
	// 좋아요 표시, 좋아요 개수 표시 공통 함수
	function displayReviewFav(param){
		let output;
		if(param.status=='yesFav'){
			output = '../images/like02.png';
		}else { // (param.status=='noFav')
			output = '../images/like01.png';
		}
		
		// 문서 객체에 추가
		$('#v_output_fav').attr('src',output);
		$('#v_output_fcount').text(param.count);
	}
	
	// 좋아요 등록
	$('#v_output_fav').click(function(){
		$.ajax({
			url:'writeReviewFav.do',
			type:'post',
			data:{board_num:$('#v_output_fav').attr('data-num')},
			dataType:'json',
			success:function(param){
				if(param.result=='logout'){
					alert('로그인 후 좋아요를 눌러주세요!');
				}else if(param.result=='success'){
					displayReviewFav(param);
				}else{
					alert('등록시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
});