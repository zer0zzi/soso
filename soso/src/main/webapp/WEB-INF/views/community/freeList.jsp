<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script type="text/javascript">
	// 검색 유효셩 체크
	$(function(){
		$('#f_search_form').submit(function(){
			if($('#keyword').val().trim()==''){
				alert('검색어 입력 후 검색이 가능합니다.');
				$('#keyword').val('').focus();
				return false;
			}
		});
	}); // end of 검색 유효성 체크
</script>
<div class="community-page-main">
	<!-- 목록 영역 시작 -->
	<c:if test="${count==0}">
	<div class="community-result-display">작성된 게시글이 없습니다.</div>
	</c:if>
	
	<c:if test="${count>0}">
	<div class="full-list free-fixed-1">
		<table>
			<tr class="title">
				<th>번호</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>free_fixed==1</th>
				<th>좋아요수</th>
			</tr>
			<c:forEach var="free" items="${freeList}">
			<input type="hidden" name="free_fixed" id="free_fixed" value="${free.free_fixed}">
			<c:if test="${free.free_fixed==1}">
			<tr class="item">
				<td>${free.free_num}</td>
				<td  style="text-align:left;">
					<a href="freeDetail.do?free_num=${free.free_num}">${free.free_title}</a>
				</td>
				<td>
					<c:if test="${empty free.mem_nick}">${free.mem_id}</c:if>
					<c:if test="${!empty free.mem_nick}">${free.mem_nick}</c:if>
				</td>
				<td>${free.free_regdate}</td>
				<td>${free.free_hit}</td>
				<td>${free.free_fixed}</td>
				<td>
					<c:if test="${free.f_favCnt>0}">
						<span>(♥${free.f_favCnt})</span>
					</c:if>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="full-list free-fixed-2">
		<table>
			<tr class="title">
				<th style="display:none;">게시판타입</th>
				<th>번호</th>
				<th width="400">제목[댓글수]</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>free_fixed==2</th>
				<th>좋아요수</th>
			</tr>
			<c:forEach var="free" items="${freeList}">
			<input type="hidden" name="free_fixed" id="free_fixed" value="${free.free_fixed}">
			<c:if test="${free.free_fixed==2}">
			<tr class="item">
				<td style="display:none;">${free.tblName}</td>
				<td>${free.free_num}</td>
				<td style="text-align:left;"><a href="freeDetail.do?free_num=${free.free_num}">${free.free_title}</a>&nbsp;[ ${free.f_replyCnt} ]</td>
				<td>
					<c:if test="${empty free.mem_nick}">${free.mem_id}</c:if>
					<c:if test="${!empty free.mem_nick}">${free.mem_nick}</c:if>
				</td>
				<td>${free.free_regdate}</td>
				<td>${free.free_hit}</td>
				<td>${free.free_fixed}</td>
				<td>
					<c:if test="${free.f_favCnt>0}">
						<span>(♥${free.f_favCnt})</span>
					</c:if>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	</c:if>
	
	<!-- 페이징 영역 시작 -->
	<div class="community-paging">${page}</div>
	<!-- 페이징 영역 끝 -->
</div>