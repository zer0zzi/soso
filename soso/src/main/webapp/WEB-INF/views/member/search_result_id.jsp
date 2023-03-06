<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/member/login.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>
	var path = "${pageContext.request.contextPath}";
	$(document).ready(function() {
	});
</script>
<div class="login-root">
	<div class="box-root flex-flex flex-direction--column"
		style="min-height: 100vh; flex-grow: 1;">
		<div class="loginbackground box-background--white padding-top--64">
			<div class="loginbackground-gridContainer">
				<div class="box-root flex-flex" style="grid-area: top/start/8/end;">
					<div class="box-root"
						style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
					</div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 4/2/auto/5;">
					<div
						class="box-root box-divider--light-all-2 animationLeftRight tans3s"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 6/start/auto/2;">
					<div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 7/start/auto/4;">
					<div class="box-root box-background--blue animationLeftRight"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 8/4/auto/6;">
					<div
						class="box-root box-background--gray100 animationLeftRight tans3s"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 2/15/auto/end;">
					<div
						class="box-root box-background--cyan200 animationRightLeft tans4s"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 3/14/auto/end;">
					<div class="box-root box-background--blue animationRightLeft"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 4/17/auto/20;">
					<div
						class="box-root box-background--gray100 animationRightLeft tans4s"
						style="flex-grow: 1;"></div>
				</div>
				<div class="box-root flex-flex" style="grid-area: 5/14/auto/17;">
					<div
						class="box-root box-divider--light-all-2 animationRightLeft tans3s"
						style="flex-grow: 1;"></div>
				</div>
			</div>
		</div>
		<div class="box-root flex-flex flex-direction--column"
			style="flex-grow: 1;">
			<div
				class="box-root padding-bottom--24 flex-flex flex-justifyContent--center">
			</div>
			<div class="formbg-outer">
				<div class="formbg">
					<div class="formbg-inner padding-horizontal--logo">
						<div class="align-center padding-bottom--24">
					<a href="${pageContext.request.contextPath}/main/main.do"
						rel="dofollow"><img src="${pageContext.request.contextPath}/images/soon/logo2.png" style="width:150px; height:150px;"></a>
					</div>
						<div class="form-group field padding-bottom--24">
							<div class="align-center">
							<c:choose>
								<c:when test="${empty memberVO}">
									<p class="mb-4">조회결과가 없습니다.</p>
								</c:when>
								<c:otherwise>
									<div class="mb-4">회원님의 아이디는 [ ${memberVO.mem_id} ] 입니다.</div>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
						<div
							class="field field-checkbox padding-bottom--24 flex-flex align-center">
						</div>
						<div class="field padding-bottom--24 align-center">
							<a href="${path}/member/login.do" class="search-id-btn" style="color: white;"> 로그인</a>
						</div>

						<div class="field">
								<a class="ssolink"
									href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

