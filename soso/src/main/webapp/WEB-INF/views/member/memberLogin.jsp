<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">
<div class="login-root">
	<div class="box-root flex-flex flex-direction--column"
		style="min-height: 100vh; flex-grow: 1;">
		<div class="loginbackground box-background--white padding-top--64" style="z-index: 1">
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
				<h1 style="z-index: 2; background-color: transparent;">
				</h1>
			</div>
			<div class="formbg-outer">
				<div class="formbg">
					<div class="formbg-inner padding-horizontal--logo">
						<div class="align-center padding-bottom--24">
							<a href="${pageContext.request.contextPath}/main/main.do"
								rel="dofollow">
								<img src="${pageContext.request.contextPath}/images/soon/logo2.png" style="width: 150px; height: 150px;">
								</a>
						</div>
						<!-- 로고? <span ></span> -->
						<form:form action="login.do" id="stripe-login"
							modelAttribute="memberVO">
							<form:errors element="div" cssClass="error-color" />
							<div class="field padding-bottom--24">
								<div class="grid--50-50">
									<label for="mem_id">아이디</label>
								</div>
								<form:input path="mem_id" name="mem_id" placeholder="아이디를 입력하세요." autocomplete="on"/>
								<form:errors path="mem_id" cssClass="error-color"/>
							</div>
							<div class="field padding-bottom--24">
								<label for="mem_pw">비밀번호</label>
								<form:password path="mem_pw" name="password" placeholder="비밀번호를 입력하세요."/>
								<form:errors path="mem_pw" cssClass="error-color"/>
							</div>
							<div
								class="field field-checkbox padding-bottom--24 flex-flex align-center">
								<label for="checkbox"> <input type="checkbox"
									name="mem_auto" id="mem_auto"> 로그인유지
								</label>
							</div>
							<div class="field padding-bottom--24">
								<input type="submit" name="submit" value="로그인">
							</div>
							<div class="align-center">
								<a href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
								 | 
								<a href="${pageContext.request.contextPath}/member/search_id.do">아이디찾기</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

