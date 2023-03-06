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
				<a class="p-l-10" href="${pageContext.request.contextPath}/group/groupMain.do?stc_num=1">STUDY DETAIL</a>  <!-- 마이페이지 이동 생기면 없앨것 -->
				<a class="p-l-10" href="${pageContext.request.contextPath}/community/fullList.do">COMMUNITY</a>
				<a class="p-l-10 p-r-10" href="${pageContext.request.contextPath}/talk/talkList.do">TALK</a>
			</c:if>
			<c:if test="${!empty user}">
				<img src="${pageContext.request.contextPath}/member/photoView.do" width="25" height="25" class="my-photo">
			</c:if>
			<c:if test="${!empty user && user.mem_auth == 2}">
				<a href="${pageContext.request.contextPath}/member/myPage.do">MYPAGE</a>
			</c:if>
			<c:if test="${!empty user}">
				<a class="p-l-10" href="${pageContext.request.contextPath}/member/logout.do">LOGOUT</a>
			</c:if>
			
			
			<!-- 비회원 -->
			<c:if test="${empty user}">
				<a class="p-l-10" href="${pageContext.request.contextPath}/community/fullList.do">COMMUNITY</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/member/registerUser.do">SIGN UP</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/member/login.do">LOGIN</a>
			</c:if>
			<c:if test="${!empty user && user.mem_auth == 9}">
				<a class="p-l-10" href="${pageContext.request.contextPath}/community/fullList.do">COMMUNITY</a>
				<a class="p-l-10" href="${pageContext.request.contextPath}/main/admin.do">MASTER MAIN</a>
			</c:if>
		</div>
		
	</div>
<!-- 상단 끝 -->
</body>
</html>




