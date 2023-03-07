<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymember/mypage.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js"></script>
<div class="mypage-main">
	<h2 id="0">[&nbsp;&nbsp;&nbsp;&nbsp;내가 만든 스터디 그룹&nbsp;&nbsp;&nbsp;&nbsp;]</h2>
	<div class="mypage-box-study">
		<h3>스터디 그룹 소개</h3><hr class="hr">
		<div class="study_div">
			<ul class="mypage-study-ul-l">
				<li>
					<c:if test = "${empty myStudyList[0].stc_uploadfile}">
						<img src="${pageContext.request.contextPath}/images/zero/white.png" width="90" height="90">
					</c:if>
					<c:if test = "${!empty myStudyList[0].stc_uploadfile}">
						${myStudyList[0].stc_uploadfile}
					</c:if>
				</li>
			</ul>
			<ul class="mypage-study-ul-r">
				<li id="click" onclick="location.href='${pageContext.request.contextPath}/group/groupMain.do?stc_num=${myStudyList[0].stc_num}'"><b>${myStudyList[0].stc_title}</b></li>
				<li>${myStudyList[0].stc_content}</li>
			</ul>
			<%-- <form:form action="studyupdate.do" id="modify_form" modelAttribute="myStudyList">
				<form:errors element="div" cssClass="error-color"/> 
					<ul class="mypage-study-ul-l">
						<li>
							<c:if test = "${empty myStudyList[0].stc_uploadfile}">
								<img src="${pageContext.request.contextPath}/images/zero/white.png" width="90" height="90">
							</c:if>
							<c:if test = "${!empty myStudyList[0].stc_uploadfile}">
								${myStudyList[0].stc_uploadfile}
							</c:if>
						</li>
					</ul>
					<ul class="mypage-study-ul-r">
						<li id="click" onclick="location.href='${pageContext.request.contextPath}/group/groupMain.do?stc_num=${myStudyList[0].stc_num}'"><b>${myStudyList[0].stc_title}</b></li>
						<li>${myStudyList[0].stc_content}</li>
					</ul>
					<div class="align-center">
						<form:button>수정</form:button>
						<input type="button" value="My페이지" onclick="location.href='myPage.do'">
						<input type="button" value="회원탈퇴" onclick="location.href='${pageContext.request.contextPath}/mymember/delete.do'">
					</div>
			</form:form> --%>
		</div>
		<div class="align-center">
			<input type="button" id="click" value="수정" onclick="location.href='update.do'">
		</div>
		<h3>스터디원 목록</h3>
		<div>
			<table>
				<tr>
					<c:forEach var="study" items="${myStudyList}">
						<c:if test="${study.signup_status eq '1'}">
							<td id="tdtd">
								<b>${study.mem_name}</b>&nbsp;팀원<br>
								<p id="score">${study.mem_score}점</p>
								<input type="button" value="칭찬">
								<input type="button" value="격려">
							</td>
							<%-- <c:if test="${study.rownum%3==0}">
								</tr><tr>
							</c:if> --%>
						</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>
</div>