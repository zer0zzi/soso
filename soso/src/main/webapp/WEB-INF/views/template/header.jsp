<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 상단 시작 -->
<h2 class="align-center">SpringPage</h2>
<div class="align-right">
	<c:if test="${!empty user && user.mem_auth == 2}">
	<a href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a>
	<a href="${pageContext.request.contextPath}/community/freeList.do">커뮤니티</a>
	<a href="${pageContext.request.contextPath}/study/studyView.do?stc_num=1">스터디상세-비가입자</a>
	<a href="${pageContext.request.contextPath}/group/groupMain.do?stc_num=1">스터디상세-가입자</a>
	<a href="${pageContext.request.contextPath}/talk/talkList.do">톡방</a>
	</c:if>
	
	<c:if test="${!empty user}">
	<img src="${pageContext.request.contextPath}/member/photoView.do" width="25" height="25" class="my-photo">
	</c:if>
	<c:if test="${!empty user && !empty user.mem_nick}">
	[<span class="user_name">${user.mem_nick}</span>]
	</c:if>
	<c:if test="${!empty user && empty user.mem_nick}">
	[<span class="user_name">${user.mem_id}</span>]
	</c:if>
	
	<c:if test="${!empty user}">
	<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
	</c:if>
	
	<c:if test="${empty user}">
	<a href="${pageContext.request.contextPath}/community/freeList.do">커뮤니티</a>
	<a href="${pageContext.request.contextPath}/study/studyView.do">스터디상세-비가입자</a>
	<a href="${pageContext.request.contextPath}/group/groupMain.do?stc_num=1">스터디상세-가입자</a>
	<a href="${pageContext.request.contextPath}/talk/talkList.do">톡방</a>
	<a href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
	<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
	</c:if>
	
	<c:if test="${empty user || user.mem_auth < 9}">
	<a href="${pageContext.request.contextPath}/main/main.do">홈으로</a>
	</c:if>
	
	<c:if test="${!empty user && user.mem_auth == 9}">
	<a href="${pageContext.request.contextPath}/main/admin.do">관리자메인</a>
	</c:if>
	
	
</div>
<!-- 상단 끝 -->




