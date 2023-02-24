<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script type="text/javascript">
	// 검색 유효셩 체크
	$(function(){
		$('#v_search_form').submit(function(){
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
	<div class="full-list review-fixed-1">
		<table>
			<tr class="review-table-title">
				<th>번호</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>review_fixed==1</th>
				<th>댓글수</th>
				<th>좋아요수</th>
			</tr>
			<c:forEach var="review" items="${reviewList}">
			<input type="hidden" name="review_fixed" id="review_fixed" value="${review.review_fixed}">
			<c:if test="${review.review_fixed==1}">
			<tr class="review-table-item">
				<td>${review.review_num}</td>
				<td style="text-align:left;">
					<a href="reviewDetail.do?review_num=${review.review_num}">${review.review_title}</a>
				</td>
				<td>
					<c:if test="${empty review.mem_nick}">${review.mem_id}</c:if>
					<c:if test="${!empty review.mem_nick}">${review.mem_nick}</c:if>
				</td>
				<td>${review.review_regdate}</td>
				<td>${review.review_hit}</td>
				<td>${review.review_fixed}</td>
				<td>
					<c:if test="${review.v_replyCnt>0}">
						<span>(${review.v_replyCnt})</span>
					</c:if>
				</td>
				<td>
					<c:if test="${review.v_favCnt>0}">
						<span>(♥${review.v_favCnt})</span>
					</c:if>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="full-list review-fixed-2">
		<table>
			<tr class="review-table-title">
				<th>스터디명</th>
				<th>번호</th>
				<th>평점</th>
				<th width="400">제목[댓글수]</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>review_fixed==2</th>
				<th>좋아요수</th>
			</tr>
			<c:forEach var="review" items="${reviewList}">
			<input type="hidden" name="review_fixed" id="review_fixed" value="${review_fixed}">
			<c:if test="${review.review_fixed==2}">
			<tr class="review-table-item">
				
				<td>${review.review_stc_name}</td>
				<td>${review.review_num}</td>
				<td>${review.review_rating}</td>
				<td style="text-align:left;">
					<a href="reviewDetail.do?review_num=${review.review_num}">${review.review_title}</a>&nbsp;[ ${review.v_replyCnt} ]
				</td>
				<td>
					<c:if test="${empty review.mem_nick}">${review.mem_id}</c:if>
					<c:if test="${!empty review.mem_nick}">${review.mem_nick}</c:if>
				</td>
				<td>${review.review_regdate}</td>
				<td>${review.review_hit}</td>
				<td>${review.review_fixed}</td>
				<td>
					<c:if test="${review.v_replyCnt>0}">
						<span>(${review.v_replyCnt})</span>
					</c:if>
				</td>
				<td>
					<c:if test="${review.v_favCnt>0}">
						<span>(♥${review.v_favCnt})</span>
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