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
	
	<div class="review-fixed-1">
	<c:if test="${count>0}">
	<div class="full-list">
		<c:forEach var="review" items="${reviewList}">
		<c:if test="${review.review_fixed==1}">
			<input type="hidden" name="review_fixed" id="review_fixed" value="${review.review_fixed}">
			<table class="full-class">
				<tr class="full-item">
					<td style="color:red">공지사항</td>
				</tr>
				<tr>
					<td style="text-align:left;">
						<a href="reviewDetail.do?review_num=${review.review_num}" class="title-hover">📌 &nbsp; ${review.review_title}</a>
					</td>
				</tr>
			</table>
		</c:if>
		</c:forEach>
	</div>
	</c:if>
	</div>
	
	<div class="review-fixed-2">
	<c:if test="${count>0}">
	<div class="full-list">
		<c:forEach var="review" items="${reviewList}">
		<c:if test="${review.review_fixed==2}">
			<input type="hidden" name="review_fixed" id="review_fixed" value="${review_fixed}">
			<table class="full-class-2">
				<tr class="full-item">
					<tr class="full-item" height="20">
						<td>
							<a href="reviewList.do"><span style="color:gray">Community&nbsp;/</span></a>
							<c:if test="${review.tblName=='후기'}">
							<a href="reviewList.do">${review.tblName}</a>
							</c:if>
						</td>
					</tr>
					<tr height="50">
						<td>
							<span class="left">
							<c:if test="${!empty review.mem_photo_name}">
							<img src="imageReviewView.do?review_num=${review.review_num}&review_type=1" width="25" height="25" class="my-photo">
							</c:if>
							<c:if test="${empty review.mem_photo_name}">
							<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo">
							</c:if>
							</span>
							
							<span class="left-id">
							<c:if test="${empty review.mem_nick}">${review.mem_id}</c:if>
							<c:if test="${!empty review.mem_nick}">${review.mem_nick}</c:if>
							<br>${review.review_regdate}
							</span>
							
						</td>
					</tr>
					<tr height="20">
						<td><b style="color:#969CE4;">${review.studyName}</b></td>
					</tr>
					<tr height="50">
						<td>
							<a href="reviewDetail.do?review_num=${review.review_num}" class="title-hover"><b>${review.review_title}</b></a>
						</td>
					</tr>
					<tr class="review-content" height="100">
						<td><a href="reviewDetail.do?review_num=${review.review_num}" class="title-hover">${review.review_content}</a></td>
					</tr>
					<tr height="20" class="line"></tr>
					<tr height="30">
						<td>
							<span class="left-review">
							${review.review_hit} views &nbsp;·&nbsp;
							${review.v_replyCnt} comments &nbsp;·&nbsp;
								<span style="color:red">${review.review_rating}</span> rating
							</span>
							<span class="right-review">
							${review.v_favCnt} 💗
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
	<div class="community-paging clear">${page}</div>
	<!-- 페이징 영역 끝 -->
</div>