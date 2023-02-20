$(function(){
	// 초기 데이터 표시
	selectPromoFav($('#p_output_fav').attr('data-num'));
	
	// 좋아요 표시, 좋아요 개수 표시 공통 함수
	function displayPromoFav(param){
		let output;
		if(param.status=='yesFav'){
			output = '../images/like02.png';
		}else {
			output = '../images/like01.png';
		}
		
		// 문서 객체에 추가
		$('#p_output_fav').attr('src',output);
		$('#p_output_fcount').text(param.count);
	}
	
	// 좋아요 읽기 : 좋아요 선택 여부와 선택한 총개수 표시
	function selectPromoFav(promo_num){
		$.ajax({
			url:'getPromoFav.do',
			type:'post',
			data:{promo_num:promo_num},
			dataType:'json',
			success:function(param){
				displayPromoFav(param);
			},
			error:function(){
				alert('네트워크 오류');
			}
		});
	}
	
	
	// 좋아요 등록
	$('#p_output_fav').click(function(){
		$.ajax({
			url:'writePromoFav.do',
			type:'post',
			data:{free_num:$('#p_output_fav').attr('data-num')},
			dataType:'json',
			success:function(param){
				if(param.result=='logout'){
					alert('로그인 후 좋아요를 눌러주세요!');
				}else if(param.result=='success'){
					displayPromoFav(param);
				}else{
					alert('등록시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
}); // end of all function