<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script src="${pageContext.request.contextPath}/js/community.promoFav.js"></script>
<script src="${pageContext.request.contextPath}/js/community.promoReply.js"></script>
<!-- 홍보 글상세 시작 -->
<div class="community-page-main">
	<p>

	<c:if test="${promo.promo_status==1}">모집중</c:if>
	<c:if test="${promo.promo_status==2}">모집완료</c:if>
	
	<h2>${promo.promo_title}</h2>
	<ul class="p-detail-info">
		<li>
			<c:if test="${!empty promo.mem_photo_name}">
			<img src="imageView.do?promo_num=${promo.promo_num}&promo_type=1" width="40" height="40" class="my-photo">
			</c:if>
			<c:if test="${empty promo.mem_photo_name}">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
			</c:if>
		</li>
		<li>
			<c:if test="${empty promo.mem_nick}">${promo.mem_id}</c:if>
			<c:if test="${!empty promo.mem_nick}">${promo.mem_nick}</c:if>
			<br>
			<c:if test="${!empty promo.promo_modifydate}">최근 수정일 : ${promo.promo_modifydate}</c:if>
			<c:if test="${empty promo.promo_modifydate}">작성일 : ${promo.promo_regdate}</c:if>
			조회 : ${promo.promo_hit}
		</li>
	</ul>
	<c:if test="${!empty promo.promo_filename}">
	<ul>
		<li>
			첨부파일 : <a href="file.do?promo_num=${promo.promo_num}">${promo.promo_filename}</a>
		</li>
	</ul>
	</c:if>
	<hr size="1" width="100%">
	
	<c:if test="${fn:endsWith(promo.promo_filename,'.jpg') || fn:endsWith(promo.promo_filename,'.JPG') ||
				  fn:endsWith(promo.promo_filename,'.jpeg') || fn:endsWith(promo.promo_filename,'.JPEG') ||
				  fn:endsWith(promo.promo_filename,'.gif') || fn:endsWith(promo.promo_filename,'.GIF') ||
				  fn:endsWith(promo.promo_filename,'.jfif') || fn:endsWith(promo.promo_filename,'.JFIF') ||
				  fn:endsWith(promo.promo_filename,'.png') || fn:endsWith(promo.promo_filename,'.PNG')}"> 
	<div class="align-center">
		<img src="imageFreeView.do?promo_num=${promo.promo_num}&promo_type=2" class="detail-img">
	</div>
	</c:if>
	
	<p>
		${promo.promo_content}
	</p>
	
	<hr size="1" width="100%">
	
	<!-- 좋아요 영역 시작 -->
	<div>
		<img id="p_output_fav" data-num="${promo.promo_num}" src="${pageContext.request.contextPath}/images/like01.png" width="20">
		<span id="p_output_fcount"></span>
	</div>
	<!-- 좋아요 영역 끝 -->
	
	<hr size="1" width="100%">
	
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num==promo.mem_num}">
		<input type="button" value="수정" onclick="location.href='promoUpdate.do?promo_num=${promo.promo_num}'">
		<input type="button" value="삭제" id="delete_btn">
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
		<input type="button" value="목록" onclick="location.href='promoList.do'">
	</div>
	
	<!-- 댓글 UI 시작 -->
	<div id="p_reply_div">
		<span class="pre-title">댓글 작성</span>
		<form id="pre_form" action="listPromoReply.do">
			<input type="hidden" name="promo_num" value="${promo.promo_num}" id="promo_num">
			<textarea rows="3" cols="50" name="pre_content" id="pre_content" class="rep-content"
			<c:if test="${empty user}">disabled="disabled"</c:if>
			><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			
			<c:if test="${!empty user}">
			<div id="pre_first">
				<span class="letter-count">500/500</span>
			</div>
			<div id="pre_second">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="p_output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="댓글 더보기">
	</div>
	<div id="p_loading" style="display:none;"> <!-- 목록 출력 대기 시간동안 로딩이미지 보여주기 -->
		<img src="${pageContext.request.contextPath}/images/loading.gif" width="50" height="50">
	</div>
	<!-- 댓글 목록 끝 -->
	<!-- 댓글 UI 끝 -->
</div>
<!-- 홍보 글상세 끝 -->