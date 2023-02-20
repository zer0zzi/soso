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
			<a href='promoList.do'>홍보라운지</a>
		</h2>
	</div>
	
	<div class="sub-header-update">
		<a href='promoList.do'>홍보라운지</a> 글수정
	</div>
	
	<form:form action="promoUpdate.do" id="promoUpdate_form" modelAttribute="promoVO" enctype="multipart/form-data">
		<form:hidden path="promo_num"/>
		<ul>
			<li>
				<label for="promo_title">제목</label>
				<form:input path="promo_title"/>
				<form:errors path="promo_title" cssClass="error-color"/>
			</li>
			<li>
				<label>모집 여부</label>
				<c:if test="${!empty user && user.mem_auth==9}">
				<form:hidden path="promo_status" value="0"/>
				</c:if>
				<c:if test="${!empty user && user.mem_auth<9}">
				<form:radiobutton path="promo_status" value="1" id="status1" checked="checked"/>모집중
				<form:radiobutton path="promo_status" value="2" id="status2" onclick="return(false);"/>모집완료
				</c:if>
			</li>
			<li>
				<label for="promo_content">본문</label>
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
				<c:if test="${!empty promoVO.promo_filename}">
				<div id="promo_file_detail">
					(${promoVO.promo_filename})파일이 등록되어 있습니다.
					<input type="button" value="파일삭제" id="promo_file_del">
				</div>
				<script type="text/javascript">
					$(function(){
						$('#promo_file_del').click(function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'promoFile.do',
									data:{promo_num:${promoVO.promo_num}},
									type:'post',
									dataType:'json',
									success:function(param){
										if(param.result=='logout'){
											alert('로그인 후 사용하세요.');
										}else if(param.result=='success'){
											$('#promo_file_detail').hide(); // 안 보여지게 가린다.
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
			<input type="button" value="상세" onclick="location.href='promoDetail.do?promo_num=${promoVO.promo_num}'">
			<input type="button" value="목록" onclick="location.href='promoList.do'">
		</div>
	</form:form>
</div>
<!-- 자유 글수정 끝 -->