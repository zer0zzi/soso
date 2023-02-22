<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">
<div class="full-page-main">
	<div class="main-menu">
		<h2>
			<a href='${pageContext.request.contextPath}/community/fullList.do'>커뮤니티</a>
		</h2>
	</div>
	
	<!-- 서브 메뉴 시작 -->
	<div class="sub-menu">
		<ul>
			<li><a href='${pageContext.request.contextPath}/community/fullList.do'>전체게시판</a></li>
			<li><a href='${pageContext.request.contextPath}/community/freeList.do'>자유</a></li>
			<li><a href='${pageContext.request.contextPath}/community/promoList.do'>홍보</a></li>
			<li><a href='${pageContext.request.contextPath}/community/reviewList.do'>후기</a></li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<input type="button" value="글작성" onclick="location.href='freeWrite.do'">
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth==9}">
			<li>
				<input type="button" value="공지작성" onclick="location.href='freeWrite.do'">
			</li>
			</c:if>
		</ul>
	</div>
	<!-- 서브 메뉴 끝 -->
	
	<br>
	<p>
	
	<!-- 목록 영역 시작 -->
	<c:if test="${count==0}">
	<div class="full-result-display">작성된 게시글이 없습니다.</div>
	</c:if>
	<c:if test="${count>0}">
	<div class="free-fixed-1">
		<table>
			<tr class="title">
				<th>게시판타입</th>
				<th width="400">제목(댓글수)</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>댓글수</th>
				<th>좋아요수</th>
			</tr>
			<c:forEach var="free" items="${fullList}">
			<tr class="item">
				<td>${free.free_name}</td>
				<td>
					${free.free_title}
				</td>
				<td>
					<c:if test="${empty free.mem_nick}">${free.mem_id}</c:if>
					<c:if test="${!empty free.mem_nick}">${free.mem_nick}</c:if>
				</td>
				<td>${free.free_regdate}</td>
				<td>${free.free_hit}</td>
				<td>
					<c:if test="${free.f_replyCnt>0}">
						<span>(${free.f_replyCnt})</span>
					</c:if>
				</td>
				<td>
					<c:if test="${free.f_favCnt>0}">
						<span>(♥${free.f_favCnt})</span>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</c:if>
	<!-- 목록 영역 끝 -->
</div>