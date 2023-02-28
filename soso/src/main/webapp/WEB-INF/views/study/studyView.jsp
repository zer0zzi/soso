<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script src="${pageContext.request.contextPath}/js/study.fav.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/study/studyView.css">
<div class="page-main">
	<h2>${study.stc_title}</h2>
	<ul class="detail-info">
		<li>
			<c:if test="${!empty study.mem_photo_name}">
			<img src="imageView.do?stc_num=${study.stc_num}&stc_type=1" width="40" height="40" class="my-mem_photo">
			</c:if>
			<c:if test="${empty study.mem_photo_name}">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-mem_photo">
			</c:if>
		</li>
		<li>
			<c:if test="${empty study.mem_nick}">${study.mem_id}</c:if>
			<c:if test="${!empty study.mem_nick}">${study.mem_nick}</c:if>
			<br>
			<c:if test="${!empty study.stc_modify_date}">
			최근 수정일 : ${study.stc_modify_date}
			</c:if>
			<c:if test="${empty study.stc_modify_date}">
			작성일 : ${study.stc_date}
			</c:if>
			조회 : ${study.hit}
		</li>
	</ul>
	<hr size="1" width="100%">
	<ul class="detail-info">
		<li>
			<c:if test="${!empty study.stc_period > SYSDATE || study.stc_state=='모집완료'}">
			<h3><b>모집마감</b></h3><br>
			</c:if>
			주제 : ${study.stc_filter}<br>
			<c:if test="${!empty study.stc_way}">
			장소 : ${study.stc_way}<br>
			</c:if>
			모집인원 : ${study.stc_per}명<br>
			<c:if test="${!empty study.stc_period}">
			마감기한 : ${study.stc_period}<br>
			</c:if>
			연락처 : ${study.mem_email}<br>
		</li>
	</ul>
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(study.stc_filename,'.jpg') || 
	              fn:endsWith(study.stc_filename,'.JPG') ||
				  fn:endsWith(study.stc_filename,'.jpeg') ||
				  fn:endsWith(study.stc_filename,'.JPEG') ||
				  fn:endsWith(study.stc_filename,'.gif') ||
				  fn:endsWith(study.stc_filename,'.GIF') ||
				  fn:endsWith(study.stc_filename,'.png') ||
				  fn:endsWith(study.stc_filename,'.PNG')}">
	<div class="align-center">
		<img src="imageView.do?stc_num=${study.stc_num}&stc_type=2" class="detail-img">
	</div>	
	</c:if>
	<p>
		${study.stc_content}
	</p>
	<c:if test="${!empty study.stc_filename}">
	<ul>
		<li>
			첨부파일 : <a href="file.do?stc_num=${study.stc_num}">${study.stc_filename}</a>
		</li>	
	</ul>
	</c:if>
	<hr size="1" width="100%">
	<div>
		<%-- 관심등록 --%>
		<img id="output_fav" data-num="${study.stc_num}"
		 src="${pageContext.request.contextPath}/images/fav01.gif" width="40">
		<span id="output_fcount"></span>
		<br>
		<span id="output_text"></span>
	</div>
	
	<!-- 모달창 -->
	<div class="modal-container">
		<!-- Modal창 호출 버튼 -->
		
		<jsp:include page="../study/modal.jsp"/>
		<button type="button" class="btn btn-primary" data-num="${study.stc_num}" data-bs-toggle="modal" data-bs-target="#exampleModal" 
			<c:if test="${!empty study.stc_period > SYSDATE || study.stc_state=='모집완료'}"> disabled="disabled"</c:if>>
			신청하기
		</button>
	</div>
	<div class="align-center" id="clear">
		<a href="${pageContext.request.contextPath}/main/main.do">
		<i class="bi bi-house-door-fill"></i>메인페이지로</a>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->




