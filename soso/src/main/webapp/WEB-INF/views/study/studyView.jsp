<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script src="${pageContext.request.contextPath}/js/study.fav.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/studyView.css">
<script type="text/javascript">			
			// Modal을 가져온다
			var modals = document.getElementsByClassName("modal");
			// Modal을 띄우는 클래스 이름을 가져온다.
			var btns = document.getElementsByClassName("btntt");
			// Modal을 닫는 close 클래스를 가져온다.
			var spanes = document.getElementsByClassName("close");
			var funcs = [];
			
			// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
			function Modal(num) {
				return function(){
					// 해당 클래스의 내용을 클릭하면 Modal을 띄운다.
					btns[num].onclick = function(){
						modals[num].style.display = "block";
						console.log(num);
					};
					
					// 닫기 버튼 클릭하면 Modal이 닫힌다.
					spanes[num].onclick = function() {
						modals[num].style.display = "none";
					};
				};
			}
			// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의한다.
			for(var i = 0; i< btns.length; i++){
				funcs[i] = Modal(i);
			}
			// 원하는 Modal 수만큼 funcs 함수를 호출한다.
			for(var j = 0; j< btns.length; j++){
				funcs[j]();
			}
			// Modal 영역 밖을 클릭하면 Modal을 닫는다.
			window.onclick = function(event) {
				if(event.target.className == "modal"){
					event.target.style.display = "none";	
				}
			};
		
		</script>
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
			주제 : ${study.stc_filter}<br>
			<c:if test="${!empty study.stc_way}">
			장소 : ${study.stc_way}<br>
			</c:if>
			모집인원 : ${study.stc_per}<br>
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
		<br>
		<span id="output_text"></span>
	</div>
	
	<!-- 모달창 -->
	<div class="modal-container">
		<!-- Modal창 호출 버튼 -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
			신청하기
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal=header">
						<h5 class="modal-title">신청하기
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</h5>
					</div>
					<div class="modal-body">
						<form action="signup.do" class="modal-body">
							<ul>
							<li>
							<b>신청스터디 :</b> ${study.stc_title}<br>
							<b>주제 :</b> ${study.stc_filter}<br>
							<b>마감기한 :</b> ${study.stc_period}<br>
							</li>
							</ul>
							<ul>
								<li>
									<label for="mem_id">신청자</label><br>
									<input type="text" value="${user.mem_id}" class="form-control" id="mem_id" name="mem_id" required>
								</li>
								<li><br></li>
								<li>
									<label for="signup_detail">신청사유 </label><br>
									<textarea class="form-control col-sm-5" rows="5" id="signup_detail" placeholder="Enter detail" name="signup_detail" required></textarea>
								</li>
							</ul>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal">신청하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<div class="align-center" id="clear">
		<a href="${pageContext.request.contextPath}/main/main.do">
		<i class="bi bi-house-door-fill"></i>메인페이지로</a>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->




