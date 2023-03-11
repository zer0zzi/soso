<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymember/mypage.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js"></script>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
		if(document.getElementById('tdtd') == null){
			document.getElementById('nomember').style.display = 'block'
		}
	});
});
</script>
<div class="mypage-main">
	<h2 id="0">[&nbsp;&nbsp;&nbsp;&nbsp;내가 가입한 스터디 그룹&nbsp;&nbsp;&nbsp;&nbsp;]</h2>
	<div class="mypage-box-study">
		<c:if test="${!empty myStudyList}">
			<h3>스터디 그룹 소개</h3><hr class="hr">
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
			<h3 id="1">스터디원 평가</h3>
			<div class="member">
				<c:forEach var="study" items="${myStudyList}">
					<div id="tdtd">
						<b>${study.mem_name}</b>&nbsp;팀원<br>
						<p id="score">${study.mem_score}점</p>
						<input type="button" id="scoreplus" value="칭찬" onclick="location.href='scoreplus.do?mem_num=${study.mem_num}'">
						<input type="button" id="scoreminus" value="격려" onclick="location.href='scoreminus.do?mem_num=${study.mem_num}'">
					</div>
				</c:forEach>
				</div>
				<p id="nomember">스터디원이 없습니다.</p>
			<%-- <div>
				<table>
					<tr>
						<c:forEach var="study" items="${myStudyList}">
							<td id="tdtd">
								<b>${study.mem_name}</b>&nbsp;팀원<br>
								<p id="score">${study.mem_score}점</p>
								<input type="button" id="scoreplus" value="칭찬" onclick="location.href='scoreplus.do?mem_num=${study.mem_num}'">
								<input type="button" id="scoreminus" value="격려" onclick="location.href='scoreminus.do?mem_num=${study.mem_num}'">
							</td>
							<c:if test="${study.rownum%3==0}">
								</tr><tr>
							</c:if>
						</c:forEach>
					</tr>
				</table>
			</div> --%>
		</c:if>
		<c:if test="${empty myStudyList}">
			<div class="none">
				<p>가입한 스터디 그룹이 없습니다.</p>
				<input type="button" value="마이페이지로" onclick="location.href='${pageContext.request.contextPath}/mymember/myPage.do'">
			</div>
		</c:if>
	</div>
</div>