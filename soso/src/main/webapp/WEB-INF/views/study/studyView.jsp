<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script src="${pageContext.request.contextPath}/js/study.fav.js"></script>
<div class="page-main">
	<h2>${study.stc_title}</h2>
	<ul class="detail-info">
		<li>
			<c:if test="${!empty study.mem_photo_name}">
			<img src="imageView.do?stc_num=${study.stc_num}&study_type=1" width="40" height="40" class="my-mem_photo">
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
			주제 : ${study.stc_filter}
			<c:if test="${!empty study.stc_way}">
			지역 : ${study.stc_way}
			</c:if>
			모집인원 : ${study.stc_per}
			<c:if test="${!empty study.stc_period}">
			마감기한 : ${study.stc_period}
			</c:if>
			연락처 : ${member.mem_email}
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
		<img src="imageView.do?stc_num=${study.stc_num}&study_type=2" class="detail-img">
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
	</div>
	
	<!-- <div class="align-right">
		 신청하기
		Modal창 호출 버튼
		<button type="button" class="btn btn-primary"
							data-bs-toggle="modal"
							data-bs-target="#exampleModal">
			Launch demo modal
		</button>
		
		Modal
		<div class="modal fade" id="exampleModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal=header">
						<h5 class="modal-title">Modal-title</h5>
						<button type="button" class="btn-close"
								data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						모달창의 내용이 보여집니다.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary"
								data-bs-dismiss="modal">Save change</button>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<div class="align-center">
		<input type="button" value="메인페이지"
		           onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->




