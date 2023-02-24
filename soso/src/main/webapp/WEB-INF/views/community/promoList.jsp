<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script type="text/javascript">
	// 검색 유효셩 체크
	$(function(){
		$('#p_search_form').submit(function(){
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
	<div class="full-list promo-fixed-1">
		<table>
			<tr class="title">
				<th>번호</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>promo_fixed==1</th>
				<th>좋아요수</th>
			</tr>
			<c:forEach var="promo" items="${promoList}">
			<input type="hidden" name="promo_fixed" id="promo_fixed" value="${promo.promo_fixed}">
			<c:if test="${promo.promo_fixed==1}">
			<tr class="item">
				<td>${promo.promo_num}</td>
				<td style="text-align:left;">
					<a href="promoDetail.do?promo_num=${promo.promo_num}">${promo.promo_title}</a>
				</td>
				<td>
					<c:if test="${empty promo.mem_nick}">${promo.mem_id}</c:if>
					<c:if test="${!empty promo.mem_nick}">${promo.mem_nick}</c:if>
				</td>
				<td>${promo.promo_regdate}</td>
				<td>${promo.promo_hit}</td>
				<td>${promo.promo_fixed}</td>
				<td>
					<c:if test="${promo.p_favCnt>0}">
						<span>(♥${promo.p_favCnt})</span>
					</c:if>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="full-list promo-fixed-2">
		<table>
			<tr class="title">
				<th>번호</th>
				<th>모집여부</th>
				<th width="400">제목[댓글수]</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>promo_fixed==2</th>
				<th>좋아요수</th>
			</tr>
			<c:forEach var="promo" items="${promoList}">
			<input type="hidden" name="promo_fixed" id="promo_fixed" value="${promo.promo_fixed}">
			<c:if test="${promo.promo_fixed==2}">
			<tr class="item">
				<td>${promo.promo_num}</td>
				<td>
					<c:if test="${promo.promo_status==1}">모집중</c:if>
					<c:if test="${promo.promo_status==2}">모집완료</c:if>
				</td>
				<td style="text-align:left;">
					<a href="promoDetail.do?promo_num=${promo.promo_num}">${promo.promo_title}</a>&nbsp;[ ${promo.p_replyCnt} ]
				</td>
				<td>
					<c:if test="${empty promo.mem_nick}">${promo.mem_id}</c:if>
					<c:if test="${!empty promo.mem_nick}">${promo.mem_nick}</c:if>
				</td>
				<td>${promo.promo_regdate}</td>
				<td>${promo.promo_hit}</td>
				<td>${promo.promo_fixed}</td>
				<td>
					<c:if test="${promo.p_replyCnt>0}">
						<span>(${promo.p_replyCnt})</span>
					</c:if>
				</td>
				<td>
					<c:if test="${promo.p_favCnt>0}">
						<span>(♥${promo.p_favCnt})</span>
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