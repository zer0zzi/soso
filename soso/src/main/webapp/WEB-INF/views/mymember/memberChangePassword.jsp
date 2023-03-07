<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymember/mypage.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/confirmPw.js"></script>
<div class="mypage-main">
	<h2 id="0">[&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 변경&nbsp;&nbsp;&nbsp;&nbsp;]</h2>
	<!-- <h3 id="0">비밀번호 변경</h3> -->
	<form:form action="changePassword.do" id="change_form" modelAttribute="memberVO">
		<form:errors element="div" cssClass="error-color"/>
			<table>
				<tr>
					<td>현재 비밀번호</td>
					<td>
						<form:password path="now_passwd"/>
						<form:errors path="now_passwd" cssClass="error-color"/>
					</td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td>
						<form:password path="mem_pw"/>
						<form:errors path="mem_pw" cssClass="error-color"/>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" id="confirm_passwd"/>
						<span id="message_pw"></span>
					</td>
				</tr>
			</table>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="My페이지" onclick="location.href='myPage.do'">
		</div>                            
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->



