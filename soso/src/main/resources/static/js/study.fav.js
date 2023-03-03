$(function(){
	//관심등록 읽기
	//관심등록 여부와 선택한 총개수 표시
	function selectFav(stc_num){
		$.ajax({
			url:'getFav.do',
			type:'post',
			data:{stc_num:stc_num},
			dataType:'json',
			success:function(param){
				displayFav(param);
			},
			error:function(){
				alert('관심등록 읽어오기에 네트워크 오류');
			}
		});
	}
	
	//관심 등록
	$('#output_fav').click(function(){
		$.ajax({
			url:'writeFav.do',
			type:'post',
			data:{stc_num:$('#output_fav').attr('data-num')},
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 좋아요를 눌러주세요!');
				}else if(param.result == 'success'){
					displayFav(param);
				}else{
					alert('등록시 오류 발생');
				}
			},
			error:function(){
				alert('관심등록에 네트워크 오류 발생');
			}
		});
	});
	
	//관심 표시, 관심 개수 표시 공통 함수
	function displayFav(param){
		let output;
		if(param.status == 'yesFav'){
			output = '../images/fav02.gif';
		}else{
			output = '../images/fav01.gif';
		}
		
		//문서 객체에 추가
		$('#output_fav').attr('src',output);
		$('#output_fcount').text(param.count);
	}
	
	//초기 데이터 표시
	selectFav($('#output_fav').attr('data-num'));
});




