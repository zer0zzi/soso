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
			if($('#changeInput').val().trim()==''){
				alert('참여한 스터디명을 선택하세요.');
				$('#changeInput').val('').focus();
				return false;
			}
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
			<a href='${pageContext.request.contextPath}/community/fullList.do'>커뮤니티</a>
			 / 
			<a href='reviewList.do'>후기게시판</a>
		</h2>
	</div>
	
	<div class="sub-header-write">
		<a href='reviewList.do'>후기게시판</a> 
		
		<select title="" onchange="if(this.value) location.href=(this.value);">
			<option value="freeWrite.do">자유</option>
			<option value="promoWrite.do">홍보</option>
			<option value="reviewWrite.do" selected>후기</option>
		</select>		
		
		<c:if test="${!empty user && user.mem_auth==9}">공지작성</c:if>
		<c:if test="${!empty user && user.mem_auth<9}">글작성</c:if>
	</div>
	
	<!-- 작성 폼 시작 -->
	<form:form action="reviewWrite.do" name="reviewWrite_form" id="reviewWrite_form" modelAttribute="reviewVO" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
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
				<!-- <input type="text" name="review_stc_name" id="1changeInput" placeholder="참여한 스터디를 선택해주세요." required> -->
				<form:input path="review_stc_name" id="changeInput" readonly="true"/>
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