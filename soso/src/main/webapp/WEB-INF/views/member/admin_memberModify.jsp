<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/admin.css">
<div class="page-main">
<div class="form-modi">
	<h2>회원권환수정</h2>
	<form:form action="admin_update.do" id="modify_form" modelAttribute="memberVO">
		<form:hidden path="mem_num"/>
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li class="modi-li">
				<label>회원권한</label>
				<c:if test="${memberVO.mem_auth < 3}">
				<form:radiobutton path="mem_auth" value="1"/>정지
				<form:radiobutton path="mem_auth" value="2"/>일반
				</c:if>
				<c:if test="${memberVO.mem_auth == 9}">관리</c:if>
			</li>
		</ul>
		<div class="align-center">
			<c:if test="${memberVO.mem_auth!=9}">
			<form:button class="modi-btn">전송</form:button>
			</c:if>
			<input class="modi-btn" type="button" value="회원목록" onclick="location.href='admin_list.do'">
		</div>
		<ul class="modi-detail">
			<li>
				<label>이름</label>
				${memberVO.mem_name}
			</li>
			
			<li>
				<label>전화번호</label>
				${memberVO.mem_phone}
			</li>
			<li>
				<label>이메일</label>
				${memberVO.mem_email}
			</li>
			<li>
				<label>우편번호</label>
				${memberVO.mem_zipcode}
			</li>
			<li>
				<label>주소</label>
				<p>
				${memberVO.mem_address1} ${memberVO.mem_address2}
				</p>
			</li>
		</ul>
	</form:form>
	</div>
</div>










