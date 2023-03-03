<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

</style>
<!-- 커뮤니티 메인 메뉴 시작 -->
<div class="main-menu">
	<div class="top-page-main">
	<h2>
		<a href='${pageContext.request.contextPath}/community/fullList.do' class="main-menu-text">Community</a>
	</h2>
	</div>
</div>
<!-- 커뮤니티 메인 메뉴 끝 -->
<div class="clear"></div>

<!-- semi-nav 시작 -->
<div class="community-page-main">
	<!-- 서브 메뉴 시작 -->
	<div class="sub-menu-left">
		<ul>
			<li><a href='${pageContext.request.contextPath}/community/fullList.do'>전체게시판</a></li>
			<li><a href='${pageContext.request.contextPath}/community/freeList.do'>자유</a></li>
			<li><a style="color:#969CE4" href='${pageContext.request.contextPath}/community/promoList.do'>홍보</a></li>
			<li><a href='${pageContext.request.contextPath}/community/reviewList.do'>후기</a></li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<input type="button" value="글작성" onclick="location.href='promoWrite.do'" class="insert-btn">
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth==9}">
			<li>
				<input type="button" value="공지작성" onclick="location.href='promoWrite.do'" class="insert-btn">
			</li>
			</c:if>
		</ul>
	</div>
	<!-- 서브 메뉴 끝 -->
	
	<!-- 정렬 영역 시작 -->
	<div class="sub-menu-right">
		<form>
		<ul>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}" placeholder="search">
			</li>
			<li>
				<div class="search-option">
					<select class="search-select" name="keyfield" id="keyfield">
						<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>전체</option>
						<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>제목</option>
						<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>내용</option>
						<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>작성자</option>
					</select>
				</div>
			</li>
			<li style="display:none;">
				<input type="submit" value="검색">
			</li>
			<li>
				<div class="sort-option">
					<select class="sort-select" onchange="if(this.value) location.href=(this.value)">
						<option value="promoList.do?sort=last" selected <c:if test="${param.sort=='last'}">selected</c:if>>최신순</option>
						<option value="promoList.do?sort=promo-ing" <c:if test="${param.sort=='promo-ing'}">selected</c:if>>모집중</option>
						<option value="promoList.do?sort=hit" <c:if test="${param.sort=='hit'}">selected</c:if>>조회순</option>
						<option value="promoList.do?sort=reply" <c:if test="${param.sort=='reply'}">selected</c:if>>댓글순</option>
						<option value="promoList.do?sort=fav" <c:if test="${param.sort=='fav'}">selected</c:if>>추천순</option>
					</select>
				</div>
			</li>
			<li>
				<input class="list-btn" type="button" value="목록" onclick="location.href='promoList.do'">
			</li>
		</ul>
		</form>
	</div>
	<!-- 정렬 영역 끝 -->
</div>
<!-- semi-nav 끝 -->
<div class="clear"></div>