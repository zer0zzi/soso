<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/register.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/confirmId.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/confirmPw.js"></script>
<div class="login-root">
	<div class="box-root flex-flex flex-direction--column"
		style="min-height: 100vh; flex-grow: 1;">
		<div class="loginbackground box-background--white padding-top--64" style="z-index: 1">
			<div class="loginbackground-gridContainer">
				<div class="box-root flex-flex" style="grid-area: top/start/8/end;">
					<div class="box-root"
						style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
					</div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 4/2/auto/5;">
					<div
						class="box-root box-divider--light-all-2 animationLeftRight tans3s"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 6/start/auto/2;">
					<div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 7/start/auto/4;">
					<div class="box-root box-background--blue animationLeftRight"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 8/4/auto/6;">
					<div
						class="box-root box-background--gray100 animationLeftRight tans3s"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 2/15/auto/end;">
					<div
						class="box-root box-background--cyan200 animationRightLeft tans4s"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 3/14/auto/end;">
					<div class="box-root box-background--blue animationRightLeft"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 4/17/auto/20;">
					<div
						class="box-root box-background--gray100 animationRightLeft tans4s"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 5/14/auto/17;">
					<div
						class="box-root box-divider--light-all-2 animationRightLeft tans3s"
						style="flex-grow: 1;"></div>
				</div>
			</div>
		</div>
		<div class="box-root flex-flex flex-direction--column"
			style="flex-grow: 1;">
			<div
				class="box-root padding-bottom--24 flex-flex flex-justifyContent--center">
				<h1 style="z-index: 2; background-color: transparent;">
				</h1>
			</div>
			<div class="formbg-outer">
				<div class="formbg">
					<div class="formbg-inner padding-horizontal--logo">
						<div class="align-center padding-top--24 padding-bottom--24">
							<a href="${pageContext.request.contextPath}/main/main.do" rel="dofollow">
								<%-- <img src="${pageContext.request.contextPath}/images/soon/logo2.png" style="width: 150px; height: 150px;"> --%>
							<span class="sign-title"><b>SOSO</b></span>
							</a>
						</div>
						<form:form action="registerUser.do" id="register_form"
							modelAttribute="memberVO">
							<form:errors element="div" cssClass="error-color" />
							<ul>
								<li><label for="mem_id" style="margin-bottom: 0em;">아이디</label>
									<form:input class="input-field" path="mem_id"
										autocomplete="off" /> <input class="action-button2"
									type="button" id="confirmId" value="중복확인">
									<div class="error-message" id="message_id"></div> <form:errors
										path="mem_id" cssClass="error-color" /></li>
								<li><label for="mem_name" style="margin-bottom: 0em;">이름</label>
									<form:input class="input-field" path="mem_name" />
									<div class="error-message">
										<form:errors path="mem_name" cssClass="error-color" />
									</div></li>
								<li><label for="mem_nick" style="margin-bottom: 0em;">닉네임</label>
									<form:input class="input-field" path="mem_nick" /></li>
								<li><label for="mem_pw" style="margin-bottom: 0em;">비밀번호</label>
									<form:password class="input-field" path="mem_pw" />
									<div class="error-message">
										<form:errors path="mem_pw" cssClass="error-color" />
									</div></li>
								<li><label for="confirm_passwd" style="margin-bottom: 0em;">비밀번호
										확인</label> <input class="input-field" type="password"
									id="confirm_passwd" />
									<div class="error-message" id="message_pw"></div></li>
								<li><label for="mem_phone" style="margin-bottom: 0em;">전화번호</label>
									<form:input path="mem_phone" class="phoneNumber input-field" />
									<div class="error-message">
										<form:errors path="mem_phone" cssClass="error-color" />
									</div></li>
								<li><label for="mem_email" style="margin-bottom: 0em;">이메일</label>
									<form:input class="input-field" path="mem_email" />
									<div class="error-message">
										<form:errors path="mem_email" cssClass="error-color" />
									</div></li>
								<li><label for="mem_zipcode" style="margin-bottom: 0em;">우편번호</label>
									<form:input class="input-field" path="mem_zipcode" /> <input
									class="action-button2" type="button"
									onclick="execDaumPostcode()" value="검색">
									<div class="error-message">
										<form:errors path="mem_zipcode" cssClass="error-color" />
									</div></li>
								<li><label for="mem_address1" style="margin-bottom: 0em;">주소</label>
									<form:input class="input-field" path="mem_address1" />
									<div class="error-message">
										<form:errors path="mem_address1" cssClass="error-color" />
									</div></li>
								<li><label for="mem_address2" style="margin-bottom: 0em;">상세
										주소</label> <form:input class="input-field" path="mem_address2" />
									<div class="error-message">
										<form:errors path="mem_address2" cssClass="error-color" />
									</div></li>
							</ul>
							<div class="align-center">
								<form:button class="action-button">완료</form:button>
								<input class="action-button margin-4" type="button" value="홈으로"
									onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 우편번호 검색 시작 -->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:9;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 전화번호 하이푼 자동부여 -->
<script type="text/javascript">
$(document).on("keyup", ".phoneNumber", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});
</script>

<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //(주의)address1에 참고항목이 보여지도록 수정
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //(수정) document.getElementById("address2").value = extraAddr;
                
                } 
                //(수정) else {
                //(수정)    document.getElementById("address2").value = '';
                //(수정) }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_zipcode').value = data.zonecode;
                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
                document.getElementById("mem_address1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("mem_address2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 우편번호 검색 끝 -->