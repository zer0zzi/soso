<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community/community.css">
<script src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script src="${pageContext.request.contextPath}/js/community.freeFav.js"></script>
<script src="${pageContext.request.contextPath}/js/community.freeReply.js"></script>
<!-- 자유 글상세 시작 -->
<div class="community-page-main-detail">
	<ul class="community-detail-member">
		<li>
			<c:if test="${!empty free.mem_photo_name}">
			<img src="imageFreeView.do?free_num=${free.free_num}&free_type=1" width="40" height="40" class="my-photo">
			</c:if>
			<c:if test="${empty free.mem_photo_name}">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
			</c:if>
		</li>
		<li class="community-detail-member-padding">
			<c:if test="${empty free.mem_nick}">${free.mem_id}</c:if>
			<c:if test="${!empty free.mem_nick}">${free.mem_nick}</c:if>
		</li>
		<li class="community-detail-member-padding">·</li>
		<li class="community-detail-member-padding">
			<c:if test="${!empty free.free_modifydate}">(수정)${free.free_modifydate}</c:if>
			<c:if test="${empty free.free_modifydate}">${free.free_regdate}</c:if>
		</li>
		<li class="community-detail-member-padding">·</li>
		<li class="community-detail-member-padding">
			${free.free_hit} views
		</li>
	</ul>
	
	<div class="clear"></div>
	
	<div class="community-page-main-detail-content">
	<h2>${free.free_title}</h2>
	
	<div class="hr">
		<hr size="1" width="100%">
	</div>
	
	<!-- filename의 끝부분에 .jpg가 있으면 true를 반환해서 이미지를 시각적으로 보여준다. -->
	<c:if test="${fn:endsWith(free.free_filename,'.jpg') || fn:endsWith(free.free_filename,'.JPG') ||
				  fn:endsWith(free.free_filename,'.jpeg') || fn:endsWith(free.free_filename,'.JPEG') ||
				  fn:endsWith(free.free_filename,'.gif') || fn:endsWith(free.free_filename,'.GIF') ||
				  fn:endsWith(free.free_filename,'.jfif') || fn:endsWith(free.free_filename,'.JFIF') ||
				  fn:endsWith(free.free_filename,'.png') || fn:endsWith(free.free_filename,'.PNG')}"> 
	<div class="align-center">
		<img src="imageView.do?free_num=${free.free_num}&free_type=2" class="detail-img">
	</div>
	</c:if>
	
	<p>
		${free.free_content}
	</p>
	
	<c:if test="${!empty free.free_filename}">
	첨부파일 : <a href="freeFile.do?free_num=${free.free_num}">${free.free_filename}</a>
	</c:if>
	
	<div class="hr">
		<hr size="1" width="100%">
	</div>
	
	<!-- 좋아요 영역 시작 -->
	<div class="detail-bottom-left">
		<img id="output_fav" data-num="${free.free_num}" src="${pageContext.request.contextPath}/images/like01.png" width="15">
		<span id="output_fcount"></span>
	</div>
	<!-- 좋아요 영역 끝 -->
	
	<div class="detail-bottom-right align-right">
		<c:if test="${!empty user && user.mem_num==free.mem_num}">
		<input type="button" value="수정" onclick="location.href='freeUpdate.do?free_num=${free.free_num}'" class="detail-update-btn">
		<input type="button" value="삭제" class="detail-delete-btn" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('freeDelete.do?free_num=${free.free_num}');
				}
			}
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='freeList.do'" class="detail-list-btn">
	</div>
	
	<div class="hr clear">
		<hr size="1" width="100%">
	</div>
	
	<!-- 댓글 UI 시작 -->
	<div id="f_reply_div">
		<span class="fre-title"><span style="color:#969CE4"><b>C</b></span>omments</span>
		<div class="reply-div">
		<form id="fre_form" action="listFreeReply.do">
			<input type="hidden" name="free_num" value="${free.free_num}" id="free_num">
			<textarea rows="3" cols="50" name="fre_content" id="fre_content" class="rep-content"
			<c:if test="${empty user}">disabled="disabled"</c:if>
			><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			
			<c:if test="${!empty user}">
			<div id="fre_second">
				<input type="submit" value="댓글 등록" class="reply-insert-btn">
			</div>
			<div id="fre_first">
				<span class="letter-count" style="color:#495057">0/500</span>
			</div>
			</c:if>
		</form>
		</div>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="f_output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="댓글 더보기">
	</div>
	<div id="loading" style="display:none;"> <!-- 목록 출력 대기 시간동안 로딩이미지 보여주기 -->
		<img src="${pageContext.request.contextPath}/images/loading.gif" width="50" height="50">
	</div>
	<!-- 댓글 목록 끝 -->
	<!-- 댓글 UI 끝 -->
	</div>
</div>
<!-- 자유 글상세 끝 -->