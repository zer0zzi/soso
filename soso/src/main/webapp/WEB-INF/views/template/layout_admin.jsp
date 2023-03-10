<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/member_main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body id="main">
	<div id="main_header">
		<tiles:insertAttribute name="header" />
	</div>
	<%-- 	<div class="side-height">
		<div id="page_nav">
			<tiles:insertAttribute name="nav"/>
		</div>
		<div id="page_body">
			<tiles:insertAttribute name="body"/>
		</div>
	</div> --%>
	<div class="main-menu">
		<div class="top-page-main">
		<h2>
			<a class="main-menu-text">관리자</a>
		</h2>
		</div>
	</div>
	<div id="main_body">
		<tiles:insertAttribute name="body" />
	</div>
	<div id="main_footer" class="page_clear">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>




