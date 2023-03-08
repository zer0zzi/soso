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
	
	<div class="promo-fixed-1">
	<c:if test="${count>0}">
	<div class="full-list">
		<c:forEach var="promo" items="${promoList}">
		<c:if test="${promo.promo_fixed==1}">
			<input type="hidden" name="promo_fixed" id="promo_fixed" value="${promo.promo_fixed}">
			<table class="full-class">
				<tr class="full-item">
					<td style="color:red">공지사항</td>
				</tr>
				<tr>
					<td style="text-align:left;">
						<a href="promoDetail.do?promo_num=${promo.promo_num}" class="title-hover">📌 &nbsp; ${promo.promo_title}</a>
					</td>
				</tr>
			</table>
		</c:if>
		</c:forEach>
	</div>
	</c:if>
	</div>
	
	<div class="promo-fixed-2">
	<c:if test="${count>0}">
	<div class="full-list">
		<c:forEach var="promo" items="${promoList}">
		<c:if test="${promo.promo_fixed==2}">
			<input type="hidden" name="promo_fixed" id="promo_fixed" value="${promo.promo_fixed}">
			<table class="full-class">
				<tr class="full-item">
					<td>
						<a href="fullList.do"><span style="color:gray">커뮤니티&nbsp;/</span></a>
						<c:if test="${promo.tblName=='홍보'}">
						<a href="promoList.do">${promo.tblName}</a>
						</c:if>
						<span>
							&nbsp;
							<c:if test="${promo.promo_status==1}">
								<input type="button" value="모집중" class="promo-ing-btn">
							</c:if>
							<c:if test="${promo.promo_status==2}">
								<input type="button" value="모집완료" class="promo-comp-btn">
							</c:if>
						</span>
					</td>
				</tr>
				<tr>
					<td style="text-align:left;">
						<a href="promoDetail.do?promo_num=${promo.promo_num}">${promo.promo_title}</a>
					</td>
				</tr>
				<tr class="full-item">
					<td>
						<span class="left">
						<c:if test="${!empty promo.mem_photo_name}">
						<img src="imagePromoView.do?promo_num=${promo.promo_num}&promo_type=1" width="25" height="25" class="my-photo">
						</c:if>
						<c:if test="${empty promo.mem_photo_name}">
						<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo">
						</c:if>
						</span>
						
						<span class="left-id list-margin">
						<c:if test="${empty promo.mem_nick}">${promo.mem_id}</c:if>
						<c:if test="${!empty promo.mem_nick}">${promo.mem_nick}</c:if>
						&nbsp;·&nbsp;${promo.promo_regdate}
						</span>
						
						<span class="right">
						👁‍🗨 ${promo.promo_hit}
						&nbsp;·&nbsp;
						💬 &nbsp; ${promo.p_replyCnt}
						&nbsp;·&nbsp;
						💗 &nbsp; ${promo.p_favCnt}
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