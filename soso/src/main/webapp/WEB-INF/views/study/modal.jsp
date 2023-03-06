<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/js/study.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/study/studyView.css">
<!-- Modal -->
		<c:if test="${!empty user.mem_num}">
		<div class="modal fade" id="exampleModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">
							신청하기
						</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<form action="signup.do" class="modal-body">
							<ul>
								<li><b>신청스터디 :</b> ${study.stc_title}<br></li>
								<li><b>주제 :</b> ${study.stc_filter}<br></li>
								<li><b>마감기한 :</b> ${study.stc_period}<br></li>
								<li><label for="mem_id"><b>신청자 :</b> ${user.mem_id}</label></li>
								<li class="text-br">
									<label for="signup_detail">신청사유 </label><br>
									<textarea class="form-control col-sm-5" rows="5" id="signup_detail" placeholder="300자 이내로 신청사유를 적어주세요!" name="signup_detail" required></textarea>
								</li>
							</ul>
							<div id="modal_count">
								<span class="letter-count">300/300</span>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
						<span></span>
				        <span></span>
				        <span></span>
				        <span></span>
				        취소하기</button>
						<button type="button" class="btn btn-success" data-bs-dismiss="modal">
						<span></span>
				        <span></span>
				        <span></span>
				        <span></span>
				        신청하기</button>
					</div>
				</div>
			</div>
		</div>
		</c:if>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	