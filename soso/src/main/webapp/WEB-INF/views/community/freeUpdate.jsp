<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script type="text/javascript">
	$(function(){
		$('#freeWrite_form').submit(function(){
			if($('#free_title').val().trim()==''){
				alert('제목을 입력하지 않았습니다.');
				$('#free_title').val('').focus();
				return false;
			}
			if($('#free_content').val().trim()==''){
				alert('내용을 입력하지 않았습니다.');
				$('#free_content').val('').focus();
				return false;
			}
		});
	});
</script>
<!-- 자유 글수정 시작 -->
<div class="community-page-main-write">

	<span class="full-insert-title">
	<a href='freeList.do' style="color:white"><b>
		자유게시판
		<%-- <c:if test="${!empty user && user.mem_auth==9}">&nbsp;공지작성</c:if>
		<c:if test="${!empty user && user.mem_auth<9}">&nbsp;글작성</c:if> --%>
	</b></a>
	</span>
	
	<!-- 작성 폼 시작 -->
	<div class="full-insert">
	<form:form action="freeUpdate.do" id="freeUpdate_form" modelAttribute="freeVO" enctype="multipart/form-data">
		<input type="hidden" name="free_name" value="자유">
		<form:hidden path="free_num"/> <!-- 한 건의 데이터를 업데이트 하기 위해서 필요하다. -->
		<ul>
			<li>
				<label>닉네임 (아이디)</label>
				<c:if test="${!empty user.mem_nick}">
				</c:if>
				<input type="text" value="${user.mem_nick} ( ${user.mem_id} )" class="insert-id" readonly/>
			</li>
			<li>
				<label for="free_title">제목</label>
				<form:input path="free_title" class="insert-title"/>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<form:errors path="free_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="free_content">본문</label>
				<form:textarea path="free_content" class="insert-content"/>
				<form:errors path="free_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload">업로드</label>
				<input type="file" name="upload" id="upload">
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
			<c:if test="${!empty user && user.mem_auth==9}">
			<li style="display:none;">
					<label for="free_fixed">상단 고정</label>
					<input type="number" name="free_fixed" id="free_fixed1" value="1" readonly/>
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li style="display:none;">
					<label for="free_fixed">일반 게시글</label>
					<input type="hidden" name="free_fixed" id="free_fixed2" value="2" readonly/>
			</li>
			</c:if>
		</ul>
		<div class="align-left">
			<form:button class="insert-btn">수정</form:button>
			<input type="button" value="상세" onclick="location.href='freeDetail.do?free_num=${freeVO.free_num}'" class="detail-btn">
			<input type="button" value="목록" onclick="location.href='freeList.do'" class="list-btn">
		</div>
	</form:form>
	</div>
</div>
<!-- 자유 글수정 끝 -->