<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymember/mypage.css">
<div class="mypage-main">
	<h2 id="0">[&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴&nbsp;&nbsp;&nbsp;&nbsp;]</h2>
	<form:form action="delete.do" id="delete_form" modelAttribute="memberVO">
		<form:errors element="div" cssClass="error-color"/> 
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<form:input path="mem_id"/>
						<form:errors path="mem_id" cssClass="error-color"/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<form:password path="mem_pw"/>
						<form:errors path="mem_pw" cssClass="error-color"/>
					</td>
				</tr>
			</table>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="MY페이지" onclick="location.href='myPage.do'">
		</div>                   
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->



