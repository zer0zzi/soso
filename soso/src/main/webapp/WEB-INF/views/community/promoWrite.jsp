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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script type="text/javascript">
	$(function(){
		$('#promoWrite_form').submit(function(){
			if($('#promo_title').val().trim()==''){
				alert('제목을 입력하지 않았습니다.');
				$('#promo_title').val('').focus();
				return false;
			}
			if($('#promo_content').val().trim()==''){
				alert('내용을 입력하지 않았습니다.');
				$('#promo_content').val('').focus();
				return false;
			}
			/*
			if($('#promo_fixed1').val()=='1'){
				alert('공지는 3개 이상으로 작성할 수 없습니다.');
				return false;
			}
			*/
		});
	});
</script>
<!-- 글작성 영역 시작 -->
<div class="p-page-main">
	<div class="main-menu">
		<h2>
			<a href='${pageContext.request.contextPath}/community/fullList.do'>커뮤니티</a>
			 / 
			<a href='promoList.do'>홍보라운지</a>
		</h2>
	</div>
	
	<div class="sub-header-write">
		<a href='promoList.do'>홍보라운지</a> 
		
		<select title="" onchange="if(this.value) location.href=(this.value);">
			<option value="freeWrite.do">자유</option>
			<option value="promoWrite.do" selected>홍보</option>
			<option value="reviewWrite.do">후기</option>
		</select>
		
		<c:if test="${!empty user && user.mem_auth==9}">공지작성</c:if>
		<c:if test="${!empty user && user.mem_auth<9}">글작성</c:if>
	</div>
	
	<!-- 작성 폼 시작 -->
	<form:form action="promoWrite.do" id="promoWrite_form" modelAttribute="promoVO" enctype="multipart/form-data">
		<input type="hidden" name="promo_name" value="홍보">
		<ul>
			<li>
				<label for="promo_title">제목</label>
				<form:input path="promo_title"/>
				<form:errors path="promo_title" cssClass="error-color"/>
			</li>
			<li>
				<c:if test="${!empty user && user.mem_auth==9}">
				<form:hidden path="promo_status" value="0"/>
				</c:if>
				<c:if test="${!empty user && user.mem_auth<9}">
				<label>모집 여부</label>
				<form:radiobutton path="promo_status" value="1" id="status1" checked="checked"/>모집중
				<form:radiobutton path="promo_status" value="2" id="status2" onclick="return(false);"/>모집완료
				</c:if>
			</li>
			<li>
				<label for="review_content">본문</label>
			</li>
			<li>
				<form:textarea path="promo_content"/>
				<form:errors path="promo_content" cssClass="error-color"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#promo_content' ),{
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
					<label for="promo_fixed">상단 고정</label>
					<input type="number" name="promo_fixed" id="promo_fixed1" value="1" readonly/>
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li style="display:none;">
					<label for="promo_fixed">일반 게시글</label>
					<input type="number" name="promo_fixed" id="promo_fixed2" value="2" readonly/>
			</li>
			</c:if>
			
		</ul>
		<div class="align-center">
			<input type="button" value="취소" onclick="location.href='promoList.do'">
			<input type="submit" value="등록">
		</div>
	</form:form>
	<!-- 작성 폼 끝 -->
</div>
<!-- 글작성 영역 끝 -->