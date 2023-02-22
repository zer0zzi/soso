<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ckeditor 설정 시작 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.ck-editor__editable_inline{ /* _ 2개임 */
	min-height:250px;
}
</style>
<style> /* 밑으로 드랍다운 했을 때, option 텍스트가 안 보이게 설정 */
	select option[value=""][disabled]{
	display:none;
	}
</style>
<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<!-- ckeditor 설정 끝 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">
<!-- 후기 글수정 시작 -->
<div class="v-page-main">
	<div class="main-menu">
		<h2>
			<a href='${pageContext.request.contextPath}/community/fullList.do'>커뮤니티</a>
			 / 
			<a href='reviewList.do'>후기게시판</a>
		</h2>
	</div>
	
	<div class="sub-header-update">
		<a href='reviewList.do'>후기게시판</a> 글수정
	</div>
	
	<form:form action="reviewUpdate.do" id="reviewUpdate_form" modelAttribute="reviewVO" enctype="multipart/form-data">
		<form:hidden path="review_num"/>
		<input type="hidden" name="review_name" value="후기">
		<c:if test="${!empty user && user.mem_auth==9}">
		<input type="hidden" name="review_stc_name" id="changeInput" value="관리자">
		</c:if>
		<ul>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<label>스터디명</label>
				<select onchange="selectBoxChange(this.value)" id="studyName" class="studyName" name="studyName">
					<option value="" disabled selected>참여 스터디</option>
					<c:forEach var="study" items="${studyList}">
						<option>${study.stc_title}</option>
					</c:forEach>
				</select>
				<%-- <input type="text" name="review_stc_name" value="${review_stc_name}" id="1changeInput" required> --%>
				<form:input path="review_stc_name" id="changeInput"/>
				<script type="text/javascript">
					var selectBoxChange = function(value){
						console.log("값변경테스트 : " + value);
						$('#changeInput').val(value);
					}
				</script>
			</li>
			</c:if>
			
			<li>
				<label for="review_title">제목</label>
				<form:input path="review_title"/>
				<form:errors path="review_title" cssClass="error-color"/>
			</li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li class="rate">
				<fieldset>
					<legend>평점<small>*다시 선택해주세요.</small></legend> <!-- ⭐ -->
					<input type="radio" name="review_rating" value="5" id="rate1">
					<label for="rate1">⭐</label>
     			    <input type="radio" name="review_rating" value="4" id="rate2">
     			    <label for="rate2">⭐</label>
       			 	<input type="radio" name="review_rating" value="3" id="rate3">
       			 	<label for="rate3">⭐</label>
       				<input type="radio" name="review_rating" value="2" id="rate4">
       				<label for="rate4">⭐</label>
        			<input type="radio" name="review_rating" value="1" id="rate5">
        			<label for="rate5">⭐</label>
				</fieldset>
			</li>
			</c:if>
			<li>
				<label for="review_content">본문</label>
			</li>
			<li>
				<form:textarea path="review_content"/>
				<form:errors path="review_content" cssClass="error-color"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#review_content' ),{
		            	extraPlugins: [MyCustomUploadAdapterPlugin]
		            })
		            .then( editor => {
						window.editor = editor;
					} )
		            .catch( error => {
		                console.error( error );
		            } );
			    </script>
			</li>
			<li>
				<label for="upload">업로드</label>
				<input type="file" name="upload" id="upload">
				<c:if test="${!empty reviewVO.review_filename}">
				<div id="review_file_detail">
					(${reviewVO.review_filename})파일이 등록되어 있습니다.
					<input type="button" value="파일삭제" id="review_file_del">
				</div>
				<script type="text/javascript">
					$(function(){
						$('#review_file_del').click(function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'reviewFile.do',
									data:{review_num:${reviewVO.review_num}},
									type:'post',
									dataType:'json',
									success:function(param){
										if(param.result=='logout'){
											alert('로그인 후 사용하세요.');
										}else if(param.result=='success'){
											$('#review_file_detail').hide(); // 안 보여지게 가린다.
										}else{
											alert('파일 삭제 오류 발생');
										}
									},
									error:function(){
										alert('네트워크 오류 발생');
									}
								});
							}
						});
					});
				</script>
				</c:if>
			</li>
		</ul>
		<div class="align-center">
			<form:button>수정</form:button>
			<input type="button" value="상세" onclick="location.href='reviewDetail.do?review_num=${reviewVO.review_num}'">
			<input type="button" value="목록" onclick="location.href='reviewList.do'">
		</div>
	</form:form>
</div>
<!-- 자유 글수정 끝 -->