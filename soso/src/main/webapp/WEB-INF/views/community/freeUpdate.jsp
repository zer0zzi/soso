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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">
<!-- 자유 글수정 시작 -->
<div class="f-page-main">
	<div class="main-menu">
		<h2>
			<a href='#'>커뮤니티</a>
			 / 
			<a href='freeList.do'>자유게시판</a>
		</h2>
	</div>
	
	<div class="sub-header-update">
		<a href='freeList.do'>자유게시판</a> 글수정
	</div>
	
	<form:form action="freeUpdate.do" id="freeUpdate_form" modelAttribute="freeVO" enctype="multipart/form-data">
		<form:hidden path="free_num"/> <!-- 한 건의 데이터를 업데이트 하기 위해서 필요하다. -->
		<ul>
			<li>
				<label for="free_title">제목</label>
				<form:input path="free_title"/>
				<form:errors path="free_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="review_content">본문</label>
			</li>
			<li>
				<form:textarea path="free_content"/>
				<form:errors path="free_content" cssClass="error-color"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#free_content' ),{
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
				<label for="free_upload">업로드</label>
				<input type="file" name="free_upload" id="free_upload">
				<c:if test="${!empty freeVO.free_filename}">
				<div id="free_file_detail">
					(${freeVO.free_filename})파일이 등록되어 있습니다.
					<input type="button" value="파일삭제" id="free_file_del">
				</div>
				<script type="text/javascript">
					$(function(){
						$('#free_file_del').click(function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'deleteFreeFile.do',
									data:{free_num:${freeVO.free_num}},
									type:'post',
									dataType:'json',
									success:function(param){
										if(param.result=='logout'){
											alert('로그인 후 사용하세요.');
										}else if(param.result=='success'){
											$('#free_file_detail').hide(); // 안 보여지게 가린다.
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
			<input type="button" value="상세" onclick="location.href='freeDetail.do?free_num=${freeVO.free_num}'">
			<input type="button" value="목록" onclick="location.href='freeList.do'">
		</div>
	</form:form>
</div>
<!-- 자유 글수정 끝 -->