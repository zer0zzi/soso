<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">


<div class="community-page-main">	
	<!-- 목록 영역 시작 -->
	<c:if test="${count==0}">
	<div class="community-result-display">작성된 게시글이 없습니다.</div>
	</c:if>
	
	<c:if test="${count>0}">
	<div class="full-list">
		<c:forEach var="free" items="${fullList}">
		<table class="full-class">
			<tr class="full-item">
				<td>
					<a href="fullList.do"><span style="color:gray">Community&nbsp;/</span></a>
					<c:if test="${free.tblName=='자유'}">
					<a href="freeList.do">${free.tblName}</a>
					</c:if>
					<c:if test="${free.tblName=='홍보'}">
					<a href="promoList.do">${free.tblName}</a>
					</c:if>
					<c:if test="${free.tblName=='후기'}">
					<a href="reviewList.do">${free.tblName}</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>					
					<c:if test="${free.tblName=='자유'}">
					<a href="freeDetail.do?free_num=${free.free_num}" class="title-hover">${fn:replace(fn:replace(free.free_title,'<','&lt;'),'>','&gt;')}</a>
					</c:if>
					<c:if test="${free.tblName=='홍보'}">
					<a href="promoDetail.do?promo_num=${free.free_num}" class="title-hover">${fn:replace(fn:replace(free.free_title,'<','&lt;'),'>','&gt;')}</a>
					</c:if>
					<c:if test="${free.tblName=='후기'}">
					<a href="reviewDetail.do?review_num=${free.free_num}" class="title-hover">${fn:replace(fn:replace(free.free_title,'<','&lt;'),'>','&gt;')}</a>
					</c:if>
				</td>
			</tr>
			<tr class="full-item">
				<td>
					<span class="left">
					<c:if test="${!empty free.mem_photo_name}">
					<img src="${pageContext.request.contextPath}/member/viewProfile.do?mem_num=${free.mem_num}" width="25" height="25" class="my-photo">
					</c:if>
					</span>
					
					<span class="left-id list-margin">
					<c:if test="${empty free.mem_nick}">${free.mem_id}</c:if>
					<c:if test="${!empty free.mem_nick}">${free.mem_nick}</c:if>
					&nbsp;·&nbsp;${free.free_regdate}
					</span>
					
					<span class="right">
					👁‍🗨 ${free.free_hit}
					&nbsp;·&nbsp;
					💬 &nbsp; ${free.f_replyCnt}
					&nbsp;·&nbsp;
					💗 &nbsp; ${free.f_favCnt}
					</span>
					
				</td>
			</tr>
		</table>
		<p>
		</c:forEach>
	</div>
	</c:if>
	<!-- 목록 영역 끝 -->
	
	<!-- 페이징 영역 시작 -->
	<div class="community-paging">${page}</div>
	<!-- 페이징 영역 끝 -->
</div>