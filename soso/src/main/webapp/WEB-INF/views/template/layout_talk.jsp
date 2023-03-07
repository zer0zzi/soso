<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body id="main">
   <div id="main_header">
      <tiles:insertAttribute name="header"/>
   </div>
   <div class="main-menu">
		<div class="top-page-main">
		<h2>
			<a class="main-menu-text">Talk</a>
		</h2>
		</div>
	</div>
   <div class="main_content" style="width: 1024px; margin: 0 auto; margin-top: 35px;">
      <div id="main_list" style="float: left; width: 34%;">
      <tiles:insertAttribute name="list"/>
      </div>
      <div id="main_body" style="float: right; width: 65%;">
         <tiles:insertAttribute name="body"/>
      </div>
   </div>
   <div id="main_footer" style="clear: both;">
      <tiles:insertAttribute name="footer"/>
   </div>
</body>
</html>