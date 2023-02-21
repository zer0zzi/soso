<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메인 시작 -->
<div class="page-main">
	<div>
		<h3>STUDY</h3>
		
	<c:if test="${!empty user}">
	<div class="align-right">
		<input type="button" value="스터디모집" onclick="location.href='studyCreate.do'">
	</div>
	</c:if>
	
	</div>
</div>
<!-- 메인 끝 -->