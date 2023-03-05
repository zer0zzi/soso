<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/group/sideBar.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="p-4 pt-5 side-bar">
				<img src="${pageContext.request.contextPath}/member/photoView.do"
				class="img logo rounded-circle mb-5">
				<ul class="list-unstyled components mb-5">
					<li><a href="/group/groupMain.do?stc_num=1">GROUP MAIN</a></li>
					<li><a href="/group/notice_list.do?stc_num=1">NOTICE</a></li>
					<li><a href="/group/calendar_list.do?stc_num=1">CALENDAR</a></li>
					<li><a href="#">EVALUATE MEMBERS</a></li>
					<li><a href="#">MANAGE MEMBERS</a></li>
				</ul>

				<div class="footer">
					<p style="margin-top: 210px; font-size:14px;">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib.com</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>

			</div>
		</nav>
	</div>
</body>
</html>