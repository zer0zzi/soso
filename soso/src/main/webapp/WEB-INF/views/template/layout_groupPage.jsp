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
	<div id="main_header">
		<tiles:insertAttribute name="header" />
	</div>

	<div class="header-body">
		<div id="main_sidebar">
			<tiles:insertAttribute name="sideBar" />
		</div>
		<div id="main_content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	
	<div id="main_footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
</html>




