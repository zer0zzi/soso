<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member/search_id.js"></script>
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
			</div>
			<div class="formbg-outer">
				<div class="formbg">
					<div class="formbg-inner padding-horizontal--logo">
						<div class="align-center padding-bottom--24">
					<a href="${pageContext.request.contextPath}/main/main.do"
						rel="dofollow"><img src="${pageContext.request.contextPath}/images/soon/logo2.png" style="width:150px; height:150px;"></a>
					</div>
						<form id="createForm" action="${path}/member/search_result_id.do" method="post">
							<div class="form-group field padding-bottom--24">
								<div class="grid--50-50">
									<label for="mem_name">이름</label>
								</div>
								<input type="text" class="form-control form-control-user" id="mem_name" name="mem_name" placeholder="이름을 입력하세요.">
							</div>
							<div class="form-group field padding-bottom--24">
								<label for="mem_phone">전화번호</label>
								<input type="email" class="phoneNumber" id="mem_phone" name="mem_phone" placeholder="핸드폰번호를 입력하세요.">
							</div>
							<div
								class="field field-checkbox padding-bottom--24 flex-flex align-center">
							</div>
							<div class="field padding-bottom--24 align-center">
								<a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="search-id-btn" style="color: white;"> 아이디찾기 </a>
								<!-- <input type="submit" name="submit" value="로그인" onclick="fnSubmit(); return false;"> -->
							</div>
							
							<div class="align-center">
								<a href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
