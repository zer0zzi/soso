<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script src="${pageContext.request.contextPath}/js/community.promoFav.js"></script>
<script src="${pageContext.request.contextPath}/js/community.promoReply.js"></script>
<style>

</style>
<script>

</script>
<!-- 홍보 글상세 시작 -->
<div class="community-page-main-detail">
	
	<ul class="community-detail-member">
		<li>
			<c:if test="${!empty promo.mem_photo_name}">
			<img src="imagePromoView.do?promo_num=${promo.promo_num}&promo_type=1" width="40" height="40" class="my-photo">
			</c:if>
			<c:if test="${empty promo.mem_photo_name}">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
			</c:if>
		</li>
		<li>
			<span style="color:#F8B739"><b>
			<c:if test="${promo.promo_status==1}">모집중</c:if>
			</b></span>
			<span style="color:gray"><b>
			<c:if test="${promo.promo_status==2}">모집완료</c:if>
			</b></span>
			
			<input type="button" id="promo_faq" value="1:1문의하기">
			<br>
			<c:if test="${empty promo.mem_nick}">${promo.mem_id}</c:if>
			<c:if test="${!empty promo.mem_nick}">${promo.mem_nick}</c:if>
			&nbsp;·&nbsp;
			<c:if test="${!empty promo.promo_modifydate}">(수정)${promo.promo_modifydate}</c:if>
			<c:if test="${empty promo.promo_modifydate}">${promo.promo_regdate}</c:if>
			&nbsp;·&nbsp;
			${promo.promo_hit} views
		</li>
	</ul>
	
	<div class="clear"></div>
	
	<div class="community-page-main-detail-content">
	<h2>${promo.promo_title}</h2>
	
	<div class="hr">
		<hr size="1" width="100%">
	</div>
		
	<c:if test="${fn:endsWith(promo.promo_filename,'.jpg') || fn:endsWith(promo.promo_filename,'.JPG') ||
				  fn:endsWith(promo.promo_filename,'.jpeg') || fn:endsWith(promo.promo_filename,'.JPEG') ||
				  fn:endsWith(promo.promo_filename,'.gif') || fn:endsWith(promo.promo_filename,'.GIF') ||
				  fn:endsWith(promo.promo_filename,'.jfif') || fn:endsWith(promo.promo_filename,'.JFIF') ||
				  fn:endsWith(promo.promo_filename,'.png') || fn:endsWith(promo.promo_filename,'.PNG')}"> 
	<div class="align-center">
		<img src="imagePromoView.do?promo_num=${promo.promo_num}&promo_type=2" class="detail-img">
	</div>
	</c:if>
	
	<p>
		${promo.promo_content}
	</p>
	
	<c:if test="${!empty promo.promo_filename}">
	첨부파일 : <a href="file.do?promo_num=${promo.promo_num}">${promo.promo_filename}</a>
	</c:if>
	
	<div class="hr">
		<hr size="1" width="100%">
	</div>
	
	<!-- 좋아요 영역 시작 -->
	<div class="detail-bottom-left">
		<img id="p_output_fav" data-num="${promo.promo_num}" src="${pageContext.request.contextPath}/images/like01.png" width="15">
		<span id="p_output_fcount"></span>
	</div>
	<!-- 좋아요 영역 끝 -->
	
	<div class="detail-bottom-right align-right">
		<c:if test="${!empty user && user.mem_num==promo.mem_num}">
		<input type="button" value="수정" onclick="location.href='promoUpdate.do?promo_num=${promo.promo_num}'" class="detail-update-btn">
		<input type="button" value="삭제" class="detail-delete-btn" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('promoDelete.do?promo_num=${promo.promo_num}');
				}
			}
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='promoList.do'" class="detail-list-btn">
	</div>
	
	<div class="hr clear">
		<hr size="1" width="100%">
	</div>
	
	<!-- 댓글 UI 시작 -->
	<div id="p_reply_div">
		<span class="pre-title"><span style="color:#969CE4"><b>C</b></span>omments</span>
		<div class="reply-div">
		<form id="pre_form" action="listPromoReply.do">
			<input type="hidden" name="promo_num" value="${promo.promo_num}" id="promo_num">
			<textarea rows="3" cols="50" name="pre_content" id="pre_content" class="rep-content"
			<c:if test="${empty user}">disabled="disabled"</c:if>
			><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			
			<c:if test="${!empty user}">
			<div id="pre_second">
				<input type="submit" value="댓글 등록" class="reply-insert-btn">
			</div>
			<div id="pre_first">
				<span class="letter-count" style="color:#495057">0/500</span>
			</div>
			</c:if>
		</form>
		</div>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="p_output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="댓글 더보기">
	</div>
	<div id="p_loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/loading.gif" width="50" height="50">
	</div>
	<!-- 댓글 목록 끝 -->
	<!-- 댓글 UI 끝 -->
	</div>
</div>
<!-- 홍보 글상세 끝 -->