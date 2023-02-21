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
<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<!-- ckeditor 설정 끝 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css?after">
<script type="text/javascript">
	$(function(){
		$('#reviewWrite_form').submit(function(){
			if($('#review_title').val().trim()==''){
				alert('제목을 입력하지 않았습니다.');
				$('#review_title').val('').focus();
				return false;
			}
			if($('#review_content').val().trim()==''){
				alert('내용을 입력하지 않았습니다.');
				$('#review_content').val('').focus();
				return false;
			}
			/*
			if($('#free_fixed1').val()=='1'){
				alert('공지는 3개 이상으로 작성할 수 없습니다.');
				return false;
			}
			*/
		});
	});
</script>
<style> /* 밑으로 드랍다운 했을 때, option 텍스트가 안 보이게 설정 */
	select option[value=""][disabled]{
	display:none;
	}
</style>
<!-- 글작성 영역 시작 -->
<div class="v-page-main">
	<div class="main-menu">
		<h2>
			<a href='#'>커뮤니티</a>
			 / 
			<a href='reviewList.do'>후기게시판</a>
		</h2>
	</div>
	
	<div class="sub-header-write">
		<a href='reviewList.do'>후기게시판</a> 
		<c:if test="${!empty user && user.mem_auth==9}">공지작성</c:if>
		<c:if test="${!empty user && user.mem_auth<9}">글작성</c:if>
	</div>
	
	<!-- 작성 폼 시작 -->
	<form:form action="reviewWrite.do" name="reviewWrite_form" id="reviewWrite_form" modelAttribute="reviewVO" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label>스터디명</label>
				<select id="studyName" class="studyName">
					<option value="" disabled selected>참여 스터디</option>
					<c:forEach var="study" items="${studyList}">
						<option>${study.stc_title}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label for="review_title">제목</label>
				<form:input path="review_title"/>
				<form:errors path="review_title" cssClass="error-color"/>
			</li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li class="rate">
				<fieldset>
					<legend>평점</legend> <!-- ⭐ -->
					<input type="radio" name="review_rating" value="5" id="rate1"><label for="rate1">★</label>
     			    <input type="radio" name="review_rating" value="4" id="rate2"><label for="rate2">★</label>
       			 	<input type="radio" name="review_rating" value="3" id="rate3"><label for="rate3">★</label>
       				<input type="radio" name="review_rating" value="2" id="rate4"><label for="rate4">★</label>
        			<input type="radio" name="review_rating" value="1" id="rate5"><label for="rate5">★</label>
				</fieldset>
			</li>
			</c:if>
			<li>
				<label for="review_content">본문</label>
			</li>
			<li>
				<form:textarea path="review_content" id="review_content"/>
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
			</li>
			
			<c:if test="${!empty user && user.mem_auth==9}">
			<li style="display:none;">
					<label for="review_fixed">상단 고정</label>
					<input type="number" name="review_fixed" id="review_fixed1" value="1" readonly/>
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li style="display:none;">
					<label for="review_fixed">일반 게시글</label>
					<input type="number" name="review_fixed" id="review_fixed2" value="2" readonly/>
			</li>
			</c:if>
			
		</ul>
		<div class="align-center">
			<input type="button" value="취소" onclick="location.href='reviewList.do'">
			<input type="submit" value="등록">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->