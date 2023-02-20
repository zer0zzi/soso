<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/group/layout_main.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="main">
<!-- 사이드바 -->
	<div id="main_sidebar">
		<tiles:insertAttribute name="sideBar" />
	</div>
	
<!-- 헤더영역 + 메인본문영역 -->
	<div class="header-body">
		<div id="main_header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="main_content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</div>
</body>
</html>




