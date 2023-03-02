<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 중앙 컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mymember/mypage.css">
<div class="mypage-main">
	<h2>${member.mem_name}님의 마이페이지</h2>
	<%-- <div class="mypage-left">
		<h3>내 프로필 <input type="button" value="회원정보수정" onclick="location.href='update.do'"></h3>
			<div class="mypage-box">
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
	</div> --%>
	<div class="mypage-left">
		<h3>내 프로필 <input type="button" value="회원정보수정" onclick="location.href='update.do'"></h3>
			<div class="mypage-box">
				<ul class="mypage-ul">
					<li>
						<img src="${pageContext.request.contextPath}/member/photoView.do" width="100" height="100" class="my-photo">
					</li>
					<li id="click" onclick="location.href='update.do'"><b>${member.mem_name}</b>님&nbsp;></li>
					<li><input type="button" value="로그아웃" onclick="location.href='logout.do'"></li>
				</ul>
				<ul class="mypage-ul">
					<li><b>나의 학구열 🔥</b></li>
					<li id="score"><b>${member.mem_score}</b></li>
				</ul>
			</div>
	</div>
	<div class="mypage-right">
		<h3>내 할 일 <input type="button" value="+" onclick="location.href='update.do'"></h3>
			<div class="mypage-box">
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
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->



