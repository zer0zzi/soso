<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 커뮤니티 메인 메뉴 시작 -->
<div class="main-menu">
	<div class="top-page-main">
	<h2>
		<a href='${pageContext.request.contextPath}/community/fullList.do' class="main-menu-text">커뮤니티</a>
	</h2>
	</div>
</div>
<!-- 커뮤니티 메인 메뉴 끝 -->
<div class="clear"></div>

<!-- 서브 메뉴 시작 -->
<div class="community-page-main">
	<div class="sub-menu-left-detail">
		<ul>
			<li><a href='${pageContext.request.contextPath}/community/fullList.do'>전체게시판</a></li>
			<li><a href='${pageContext.request.contextPath}/community/freeList.do'>자유</a></li>
			<li><a style="color:#a5a6e9" href='${pageContext.request.contextPath}/community/promoList.do'>홍보</a></li>
			<li><a href='${pageContext.request.contextPath}/community/reviewList.do'>후기</a></li>
		</ul>
	</div>
</div>
<!-- 서브 메뉴 끝 -->
<div class="clear"></div>