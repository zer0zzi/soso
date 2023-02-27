<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymember/mypage.css">
<div class="mypage-main">
	<h2>회원상세정보 <input type="button" value="회원정보수정" onclick="location.href='update.do'"></h2>
	<ul>
		<li>이름 : ${member.mem_name}</li>
		<li>별명 : ${member.mem_nick}</li>
		<li>전화번호 : ${member.mem_phone}</li>
		<li>이메일 : ${member.mem_email}</li>
		<li>우편번호 : ${member.mem_zipcode}</li>
		<li>주소 : ${member.mem_address1} ${member.mem_address2}</li>
		<li>가입날짜 : ${member.mem_reg}</li>
		<c:if test="${!empty member.mem_modify}">
		<li>정보 수정일 : ${member.mem_modify}</li>
		</c:if>
	</ul>       
</div>
<!-- 중앙 컨텐츠 끝 -->



