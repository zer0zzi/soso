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
	<h1 class="modal-header"><b>&nbsp;${study.stc_title}</b></h1>
	<ul class="detail-info">
		<li>
			<c:if test="${!empty study.mem_photo_name}">
			<img src="imageView.do?stc_num=${study.stc_num}&stc_type=1" width="40" height="40" class="my-photo">
			</c:if>
			<c:if test="${empty study.mem_photo_name}">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
			</c:if>
		</li>
		<li>
			&nbsp;
			<c:if test="${empty study.mem_nick}">${study.mem_id}</c:if>
			<c:if test="${!empty study.mem_nick}">${study.mem_nick}</c:if>
		</li>
		<li>&nbsp;·&nbsp;</li>
		<li>
			<c:if test="${!empty study.stc_modify_date}">
			최근 수정일 : ${study.stc_modify_date}
			</c:if>
			<c:if test="${empty study.stc_modify_date}">
			${study.stc_date}
			</c:if>
		</li>
		<li class="text-right">
			${study.hit} views
		</li>
		<li class="text-clear">
		</li>
	</ul>
	<hr size="1" width="100%">
	<ul class="detail-information">
		<c:if test="${!empty study.stc_period > SYSDATE || study.stc_state=='모집완료'}">
		<li class="text-br">
			<h3><b>모집마감</b></h3>
		</li>
		</c:if>
		<li class="text-br">
			<span class="text-grey"><b>주제 구분</b></span>
			
			<c:if test="${study.stc_filter=='프로그래밍'}">
				<label class="text-black"><span class="std-filter1">${study.stc_filter}</span></label>
			</c:if>
			<c:if test="${study.stc_filter=='데이터사이언스'}">
				<label class="text-black"><span class="std-filter2">${study.stc_filter}</span></label>
			</c:if>
			<c:if test="${study.stc_filter=='디자인'}">
				<label class="text-black"><span class="std-filter3">${study.stc_filter}</span></label>
			</c:if>
			<c:if test="${study.stc_filter=='영상'}">
				<label class="text-black"><span class="std-filter4">${study.stc_filter}</span></label>
			</c:if>
			<c:if test="${study.stc_filter=='어학'}">
				<label class="text-black"><span class="std-filter5">${study.stc_filter}</span></label>
			</c:if>
			<c:if test="${study.stc_filter=='마케팅'}">
				<label class="text-black"><span class="std-filter6">${study.stc_filter}</span></label>
			</c:if>
				
		</li>
		<li class="text-br">
			<c:if test="${!empty study.stc_way}">
			<span class="text-grey">모임 장소</span>
			<span class="text-black">${study.stc_way}</span>
			</c:if>
		</li>
		<li class="text-br">
			<span class="text-grey">모집 인원</span>
			<span class="text-black">${study.stc_per}명</span>
		</li>
		<li class="text-br">
			<c:if test="${!empty study.stc_period}">
			<span class="text-grey">마감 기한</span>
			<span class="text-black">${study.stc_period}</span>
			</c:if>
		</li>
		<li class="text-br">
			<span class="text-grey">연락 주소</span>
			<span class="text-black">${study.mem_email}</span>
		</li>
	</ul>
	<h3><b>스터디 소개</b></h3>
	<hr size="1" width="100%">
	<div class="study-content">
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
		</div><br>			
		</c:if>
		<p>
			${study.stc_content}
		</p>
	</div>
	<c:if test="${!empty study.stc_filename}">
	<ul>
		<li>
			첨부파일 : <a href="file.do?stc_num=${study.stc_num}">${study.stc_filename}</a>
		</li>	
	</ul>
	</c:if>
	<hr size="1" width="100%">
	
	<!-- 관심등록 -->
	<br>
	<img class="jb-title" id="output_fav" data-num="${study.stc_num}"
	 src="${pageContext.request.contextPath}/images/like01.png" width="30">
	<div class="jb-text">
		<c:if test="${studyFav.mem_num == user.mem_num}">
			이미 관심등록한 스터디입니다.
		</c:if>
		<c:if test="${studyFav.mem_num != user.mem_num}">
			이 스터디를 관심 등록/해제 하시겠습니까?
		</c:if>
	</div>
	<span id="output_fcount"></span>
	<!-- 모달창 -->
	<div class="modal-container" style="float:right;">
		<!-- Modal창 호출 버튼 -->
		<jsp:include page="../study/modal.jsp"/>
		<button type="button" class="btn btn-primary" data-num="${study.stc_num}" data-bs-toggle="modal" data-bs-target="#exampleModal" 
			<c:if test="${!empty study.stc_period > SYSDATE || study.stc_state=='모집완료' || user.mem_auth == 9}"> disabled="disabled"</c:if>>
			<span></span>
	        <span></span>
	        <span></span>
	        <span></span>
			<b>신청하기</b>
		</button>
	</div>
	<div class="align-center text-claer" id="main-button">
		<br>
		<a href="${pageContext.request.contextPath}/main/main.do">
		<i class="bi bi-house-door-fill"></i>메인페이지로</a>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->




