		var path = "${pageContext.request.contextPath}";

/*		$(document).ready(function() {
			var msg = "${msg}";
			if (msg != "") {
				alert(msg);
			}
		});*/

		function fnSubmit() {
	
			var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

			if ($("#mem_name").val() == null || $("#mem_name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#mem_name").focus();

				return false;
			}

			if ($("#mem_phone").val() == null || $("#mem_phone").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#mem_phone").focus();

				return false;
			}	

			if (!tel_rule.test($("#mem_phone").val())) {
				alert("전화번호 형식에 맞게 입력해주세요.");
				return false;
			}

			if (confirm("아이디를 찾으시겠습니까?")) {

				$("#createForm").submit();

				return false;
			}
		}
$(document).on("keyup", ".phoneNumber", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});
