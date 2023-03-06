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
	
	<div class="free-fixed-1">
	<c:if test="${count>0}">
	<div class="full-list">
		<c:forEach var="free" items="${freeList}">
		<c:if test="${free.free_fixed==1}">
			<input type="hidden" name="free_fixed" id="free_fixed" value="${free.free_fixed}">
			<table class="full-class">
				<tr class="full-item">
					<td style="color:red">공지사항</td>
				</tr>
				<tr>
					<td style="text-align:left;">
						<a href="freeDetail.do?free_num=${free.free_num}" class="title-hover">📌 &nbsp; ${free.free_title}</a>
					</td>
				</tr>
			</table>
		</c:if>
		</c:forEach>
	</div>
	</c:if>
	</div>
		
	<div class="free-fixed-2">
	<c:if test="${count>0}">
	<div class="full-list">
		<c:forEach var="free" items="${freeList}">
		<c:if test="${free.free_fixed==2}">
			<table class="full-class">
				<tr class="full-item">
					<td>
						<a href="fullList.do"><span style="color:gray">Community&nbsp;/</span></a>
						<c:if test="${free.tblName=='자유'}">
						<a href="freeList.do">${free.tblName}</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<a href="freeDetail.do?free_num=${free.free_num}" class="title-hover">${free.free_title}</a>
					</td>
				</tr>
				<tr class="full-item">
					<td>
						<span class="left">
						<c:if test="${!empty free.mem_photo_name}">
						<img src="imageView.do?free_num=${free.free_num}&free_type=1" width="25" height="25" class="my-photo">
						</c:if>
						<c:if test="${empty free.mem_photo_name}">
						<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo">
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
		</c:if>
		</c:forEach>
	</div>
	</c:if>
	</div>
	
	<!-- 페이징 영역 시작 -->
	<div class="community-paging">${page}</div>
	<!-- 페이징 영역 끝 -->
</div>