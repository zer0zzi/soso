<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		});
	});
</script>
<style> /* 밑으로 드랍다운 했을 때, option 텍스트가 안 보이게 설정 */
	select option[value=""][disabled]{
	display:none;
	}
</style>
<!-- 홍보 글수정 시작 -->
<div class="community-page-main-write">

	<span class="full-insert-title">
	<a href='promoList.do' style="color:white"><b>
		홍보게시판
		<%-- <c:if test="${!empty user && user.mem_auth==9}">&nbsp;공지작성</c:if>
		<c:if test="${!empty user && user.mem_auth<9}">&nbsp;글작성</c:if> --%>
	</b></a>
	</span>
	
	<!-- 작성 폼 시작 -->
	<div class="full-insert">
	<form:form action="promoUpdate.do" id="promoUpdate_form" modelAttribute="promoVO" enctype="multipart/form-data">
		<form:hidden path="promo_num"/>
		<input type="hidden" name="promo_name" value="홍보">
		<ul>
			<li>
				<label>닉네임 (아이디)</label>
				<c:if test="${!empty user.mem_nick}">
				</c:if>
				<input type="text" value="${user.mem_nick} ( ${user.mem_id} )" class="insert-id" readonly/>
			</li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<label>스터디명</label>
				<select id="studyNum" class="studyNum" name="studyNum" required>
					<option value="" disabled selected>참여 스터디</option>
						<c:forEach var="study" items="${studyList}">
						<option value="${study.stc_num}" <c:if test="${study.stc_num==promoVO.studyNum}">selected</c:if>>
							${study.stc_title}
						</option>
						</c:forEach>
				</select>
				<span style="color:gray">&nbsp;참여 스터디가 모집중이 아니라면 홍보글을 수정할 수 없습니다.</span><br>
			</li>
			</c:if>
			<li>
				<label for="promo_title">제목</label>
				<form:input path="promo_title" class="insert-title"/>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<form:errors path="promo_title" cssClass="error-color"/>
			</li>
			<li>
				<c:if test="${!empty user && user.mem_auth==9}">
				<form:hidden path="promo_status" value="0"/>
				</c:if>
			</li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<label>모집 여부</label>
				<c:if test="${!empty user && user.mem_auth<9}">
				<form:radiobutton path="promo_status" value="1" id="status1" checked="checked"/>모집중
				<form:radiobutton path="promo_status" value="2" id="status2"/>모집완료
				</c:if>
			</li>
			</c:if>
			<li>
				<label for="promo_content">본문</label>
				<form:textarea path="promo_content" class="insert-content"/>
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
		<div class="align-left">
			<form:button class="insert-btn">수정</form:button>
			<input type="button" value="상세" onclick="location.href='promoDetail.do?promo_num=${promoVO.promo_num}'" class="detail-btn">
			<input type="button" value="목록" onclick="location.href='promoList.do'" class="list-btn">
		</div>
	</form:form>
	</div>
</div>
<!-- 홍보 글수정 끝 -->