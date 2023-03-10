<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 상단 시작 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer/header.css">
</head>
 <body style="overflow-x: hidden;">
	<div class="header-div">
		<div class="header-left">
			<a href="${pageContext.request.contextPath}/main/main.do">
				<img src="${pageContext.request.contextPath}/image_bundle/soso_logo.png" width="135px" height="95px">
			</a>
		</div>
		<div class="header-right">
		<!-- 회원 -->
			<c:if test="${!empty user && user.mem_auth == 2}">
				<a class="p-l-10" href="${pageContext.request.contextPath}/group/groupMain.do?stc_num=224">그룹상세</a>  <!-- 마이페이지 이동 생기면 없앨것 -->
				<a class="p-l-10" href="${pageContext.request.contextPath}/main/main.do">홈</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/community/fullList.do">커뮤니티</a>
				<a class="p-l-10 p-r-10" href="${pageContext.request.contextPath}/talk/talkList.do">채팅방</a>
			</c:if>
			<c:if test="${!empty user}">
				<a><img src="${pageContext.request.contextPath}/member/photoView.do" width="25" height="25" class="my-photo"></a>
			</c:if>
			<c:if test="${!empty user && user.mem_auth == 2}">
				<a href="${pageContext.request.contextPath}/mymember/myPage.do">마이페이지</a>
			</c:if>
			<c:if test="${!empty user}">
				<a class="p-l-10" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
			</c:if>
			
			
			<!-- 비회원 -->
			<c:if test="${empty user}">
			<a class="p-l-10" href="${pageContext.request.contextPath}/main/main.do">홈</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/community/fullList.do">커뮤니티</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/member/login.do">로그인</a>
			</c:if>
			<!-- 관리자 -->
			<c:if test="${!empty user && user.mem_auth == 9}">
				<a class="p-l-10" href="${pageContext.request.contextPath}/main/main.do">홈</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/community/fullList.do">커뮤니티</a>
				<a class="p-l-10 p-r-10" href="${pageContext.request.contextPath}/talk/talkList.do">채팅방</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/main/admin.do">관리자페이지</a>
			</c:if>
		</div>
		
	</div>
<!-- 상단 끝 -->
</body>
</html>




