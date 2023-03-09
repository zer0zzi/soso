<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/member/register.css">
</head>
<body style="overflow-y:hidden">
	<div class="login-root" style="margin-top: 8em">
		<div class="box-root flex-flex flex-direction--column"
			style="min-height: 100vh; flex-grow: 1;">
			<div class="loginbackground box-background--white padding-top--64"
				style="z-index: 1">
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
						<div class="box-root box-background--blue800"
							style="flex-grow: 1;"></div>
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
					<h1 style="z-index: 2; background-color: transparent;"></h1>
				</div>
				<div class="formbg-outer">
					<div class="formbg">
						<div class="formbg-inner padding-horizontal--logo">
							<div
								class="align-center text-center padding-top--24 padding-bottom--24">
								<a href="${pageContext.request.contextPath}/main/main.do"
									rel="dofollow"> <%-- <img src="${pageContext.request.contextPath}/images/soon/logo2.png" style="width: 150px; height: 150px;"> --%>
									<span class="sign-title"><b>SOSO</b></span>
								</a>
							</div>
							<div class="page-one">
								<div class="result-display">
									<div class="align-center text-center">
										<c:if test="${!empty accessMsg}">
				${accessMsg}
			</c:if>
										<c:if test="${empty accessMsg}">
				잘못된 접속입니다.
			</c:if>
										<p>
											<c:if test="${!empty accessUrl}">
												<input type="button" value="${accessBtn}"
													onclick="location.href='${accessUrl}'">
											</c:if>
											<c:if test="${empty accessUrl}">
												<div class="align-center padding-top--48">
													<input class="action-button margin-4" type="button"
														value="로그인"
														onclick="location.href='${pageContext.request.contextPath}/member/login.do'">
													<input class="action-button margin-4" type="button"
														value="홈으로"
														onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
												</div>
											</c:if>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>