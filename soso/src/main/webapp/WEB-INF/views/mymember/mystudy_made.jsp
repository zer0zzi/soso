<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymember/mypage.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js"></script>
<script type="text/javascript">
$(function(){
	$('#study_modify').click(function(){
		$('#submit_study').show();
		$('#select_auth').show();
		$('#studymodify_form').show();
		$('#cancel').show();
		$('.study_div').hide();
		$(this).hide();  //수정 버튼 감추기
	});
	$(document).ready(function(){
		if(document.getElementById('tdtd') == null){
			document.getElementById('nomember').style.display = 'block'
		}
	});
});
</script>
<div class="mypage-main">
	<h2 id="0">[&nbsp;&nbsp;&nbsp;&nbsp;내가 만든 스터디 그룹&nbsp;&nbsp;&nbsp;&nbsp;]</h2>
	<div class="mypage-box-study">
		<c:if test="${!empty myStudyList}">
			<h3 style="display:flex;">스터디 그룹 소개<input type="button" id="study_modify" value="수정"></h3>
			<hr class="hr">
			<div class="study_div">
				<ul class="mypage-study-ul-l">
					<li>
						<c:if test = "${myStudyList[0].stc_uploadfile eq null}">
							<img src="${pageContext.request.contextPath}/images/zero/white.png" width="90" height="90">
						</c:if>
						<c:if test = "${myStudyList[0].stc_uploadfile ne null}">
							<img src="${pageContext.request.contextPath}/study/imageView.do?stc_num=${myStudyList[0].stc_num}&stc_type=2" width="90" height="90">
						</c:if>
					</li>
				</ul>
				<ul class="mypage-study-ul-r">
					<li id="click"><b>${myStudyList[0].stc_title}</b>
					<input type="button" id="바로가기" value="스터디룸 바로가기" onclick="location.href='${pageContext.request.contextPath}/group/groupMain.do?stc_num=${myStudyList[0].stc_num}'"></li>
					<li>${myStudyList[0].stc_content}</li>
				</ul>
			</div>
			<form action="studyupdate.do" id="studymodify_form" style="display:none;" method="post" enctype="multipart/form-data">
				<input type="hidden" name="stc_num" id="stc_num" value="${myStudyList[0].stc_num}">
				<ul class="mypage-study-ul-l">
					<li>
						<c:if test = "${empty myStudyList[0].stc_uploadfile}">
							<img src="${pageContext.request.contextPath}/images/zero/white.png" width="100" height="100">
						</c:if>
						<c:if test = "${!empty myStudyList[0].stc_uploadfile}">
							<img src="${pageContext.request.contextPath}/study/imageView.do?stc_num=${myStudyList[0].stc_num}&stc_type=2" width="90" height="90">
						</c:if>
					</li>
				</ul>
				<ul class="mypage-study-ul-r">
					<li><input type="text" name="stc_title" value="${myStudyList[0].stc_title}"/></li>
					<li><textarea name="stc_content">${myStudyList[0].stc_content}</textarea></li>
				</ul>
				<br>
				<div class="align-center">
					<button type="submit" id="submit_study" style="display:none;" value="완료" >완료</button>
					<input type="button" id="cancel" style="display:none;" onClick="window.location.reload()" value="취소">
				</div>
			</form>
			<h3 id="1">스터디 신청 현황</h3>
			<div>
				<table class="study_table">
					<tr>
						<th id="s">이름</th>
						<th id="s">학구열 점수 🔥</th>
						<th id="s">신청사유</th>
						<th id="s"></th>
						<th id="hidden"></th>
					</tr>
					<c:forEach var="study" items="${myStudyList}">
						<c:if test="${study.signup_status eq '0'}">
							<tr>
								<td id="s">${study.mem_name}</td>
								<td id="score">${study.mem_score}점</td>
								<td id="sr">${study.signup_detail}</td>
								<td id="b">
									<input type="button" value="수락" onclick="location.href='accept.do?stc_num=${study.stc_num}&mem_num=${study.mem_num}'">
									<input type="button" value="거절" onclick="location.href='refuse.do?stc_num=${study.stc_num}&mem_num=${study.mem_num}'">
								</td>
								<td id="hidden">${study.mem_num}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<h3 id="1">스터디원 목록</h3>
			<div class="member">
				<c:forEach var="study" items="${myStudyList}">
					<c:if test="${study.signup_status eq '1'}">
						<div id="tdtd">
							<b>${study.mem_name}</b>&nbsp;팀원<br>
							<p id="score">${study.mem_score}점</p>
							<input type="button" id="scoreplus" value="칭찬" onclick="location.href='scoreplus.do?mem_num=${study.mem_num}'">
							<input type="button" id="scoreminus" value="격려" onclick="location.href='scoreminus.do?mem_num=${study.mem_num}'">
						</div>
					</c:if>
				</c:forEach>
				</div>
				<p id="nomember">스터디원이 없습니다.</p>
		</c:if>
		<c:if test="${empty myStudyList}">
			<div class="none">
				<p>만든 스터디 그룹이 없습니다.</p>
				<input type="button" value="마이페이지로" onclick="location.href='${pageContext.request.contextPath}/mymember/myPage.do'">
			</div>	
		</c:if>
	</div>
</div>