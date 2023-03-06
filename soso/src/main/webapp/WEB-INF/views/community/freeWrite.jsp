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
			if($('#free_title').val().size()>100){
				alert('100자까지 입력 가능합니다.');
				$('#free_title').val('').focus();
			}
		});
	});
</script>
<!-- 글작성 영역 시작 -->
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
	<form:form action="freeWrite.do" id="freeWrite_form" modelAttribute="freeVO" enctype="multipart/form-data">
		<input type="hidden" name="free_name" value="자유">
		<ul>
			<li>
				<label>닉네임 (아이디)</label>
				<c:if test="${!empty user.mem_nick}">
				</c:if>
				<input type="text" value="${user.mem_nick} ( ${user.mem_id} )" class="insert-id" readonly/>
			</li>
			<li>
				<label>게시판 타입</label>
				<select title="" onchange="if(this.value) location.href=(this.value);">
					<option value="freeWrite.do" selected>자유게시판</option>
					<option value="promoWrite.do">홍보게시판</option>
					<option value="reviewWrite.do">후기게시판</option>
				</select>
			</li>
			<li>
				<label for="free_title">제목</label>
				<form:input path="free_title" class="insert-title" minlength="0" maxlegnth="100"/>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
			<input type="submit" value="등록" class="insert-btn">
			<input type="button" value="취소" onclick="location.href='freeList.do'" class="delete-btn">
		</div>
	</form:form>
	</div>
	<!-- 작성 폼 끝 -->
</div>
<div class="clear"></div>
<!-- 글작성 영역 끝 -->