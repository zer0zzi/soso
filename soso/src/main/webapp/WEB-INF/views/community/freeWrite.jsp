<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">
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
			if($('#free_fixed1').val()=='1'){
				alert('공지는 3개 이상으로 작성할 수 없습니다.');
				return false;
			}
		});
	});
</script>
<!-- 글작성 영역 시작 -->
<div class="f-page-main">
	<div class="main-menu">
		<h2>
			<a href='#'>커뮤니티</a>
			 / 
			<a href='freeList.do'>자유게시판</a>
		</h2>
	</div>
	
	<div class="sub-header-write">
		<a href='freeList.do'>자유게시판</a> 
		<c:if test="${!empty user && user.mem_auth==9}">공지작성</c:if>
		<c:if test="${!empty user && user.mem_auth<9}">글작성</c:if>
	</div>
	
	<!-- 작성 폼 시작 -->
	<form:form action="freeWrite.do" id="freeWrite_form" modelAttribute="freeVO" enctype="multipart/form-data">
		<ul>
			<li>
				<label for="free_title">제목</label>
				<form:input path="free_title"/>
				<form:errors path="free_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="free_content">내용</label>
				<form:textarea path="free_content"/>
				<form:errors path="free_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="free_upload">업로드</label>
				<input type="file" name="free_upload" id="free_upload">
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
		<div class="align-center">
			<input type="button" value="취소" onclick="location.href='freeList.do'">
			<input type="submit" value="등록">
			<form:button>등록</form:button>
		</div>
	</form:form>
	<!-- 작성 폼 끝 -->
</div>
<!-- 글작성 영역 끝 -->