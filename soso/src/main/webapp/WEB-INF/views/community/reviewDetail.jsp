<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script src="${pageContext.request.contextPath}/js/community.reviewFav.js"></script>
<script src="${pageContext.request.contextPath}/js/community.reviewReply.js"></script>
<!-- 자유 글상세 시작 -->
<div class="community-page-main">

	<p>

	<h2>${review.review_title}</h2>
	<ul class="v-detail-info">
		<li>
			<c:if test="${!empty review.mem_photo_name}">
			<img src="imageReviewView.do?review_num=${review.review_num}&review_type=1" width="40" height="40" class="my-photo">
			</c:if>
			<c:if test="${empty review.mem_photo_name}">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
			</c:if>
		</li>
		<li>
			<c:if test="${empty review.mem_nick}">${review.mem_id}</c:if>
			<c:if test="${!empty review.mem_nick}">${review.mem_nick}</c:if>
			<br>
			<c:if test="${!empty review.review_modifydate}">최근 수정일 : ${review.review_modifydate}</c:if>
			<c:if test="${empty review.review_modifydate}">작성일 : ${review.review_regdate}</c:if>
			조회 : ${review.review_hit}
			<c:if test="${review.review_rating!=0}">
			평점 : ${review.review_rating}
			</c:if>
		</li>
		<li>
			스터디명 : ${review.review_stc_name}
		</li>
	</ul>
	<c:if test="${!empty review.review_filename}">
	<ul>
		<li>
			첨부파일 : <a href="fileReview.do?review_num=${review.review_num}">${review.review_filename}</a>
		</li>
	</ul>
	</c:if>
	<hr size="1" width="100%">
	
	<c:if test="${fn:endsWith(review.review_filename,'.jpg') || fn:endsWith(review.review_filename,'.JPG') ||
				  fn:endsWith(review.review_filename,'.jpeg') || fn:endsWith(review.review_filename,'.JPEG') ||
				  fn:endsWith(review.review_filename,'.gif') || fn:endsWith(review.review_filename,'.GIF') ||
				  fn:endsWith(review.review_filename,'.jfif') || fn:endsWith(review.review_filename,'.JFIF') ||
				  fn:endsWith(review.review_filename,'.png') || fn:endsWith(review.review_filename,'.PNG')}"> 
	<div class="align-center">
		<img src="imageReviewView.do?review_num=${review.review_num}&review_type=2" class="detail-img">
	</div>
	</c:if>
	
	<p>
		${review.review_content}
	</p>
	
	<hr size="1" width="100%">
	
	<!-- 좋아요 영역 시작 -->
	<div>
		<img id="v_output_fav" data-num="${review.review_num}" src="${pageContext.request.contextPath}/images/like01.png" width="20">
		<span id="v_output_fcount"></span>
	</div>
	<!-- 좋아요 영역 끝 -->
	
	<hr size="1" width="100%">
	
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num==review.mem_num}">
		<input type="button" value="수정" onclick="location.href='reviewUpdate.do?review_num=${review.review_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('reviewDelete.do?review_num=${review.review_num}');
				}
			}
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='reviewList.do'">
	</div>
	
	<!-- 댓글 UI 시작 -->
	<div id="v_reply_div">
		<span class="vre-title">댓글 작성</span>
		<form id="vre_form" action="listReviewReply.do">
			<input type="hidden" name="review_num" value="${review.review_num}" id="review_num">
			<textarea rows="3" cols="50" name="vre_content" id="vre_content" class="rep-content"
			<c:if test="${empty user}">disabled="disabled"</c:if>
			><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			
			<c:if test="${!empty user}">
			<div id="vre_first">
				<span class="letter-count">500/500</span>
			</div>
			<div id="vre_second">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="v_output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="댓글 더보기">
	</div>
	<div id="v_loading" style="display:none;"> <!-- 목록 출력 대기 시간동안 로딩이미지 보여주기 -->
		<img src="${pageContext.request.contextPath}/images/loading.gif" width="50" height="50">
	</div>
	<!-- 댓글 목록 끝 -->
	<!-- 댓글 UI 끝 -->
</div>
<!-- 홍보 글상세 끝 -->