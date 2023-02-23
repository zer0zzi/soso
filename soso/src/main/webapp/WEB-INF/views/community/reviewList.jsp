<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">
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
<div class="v-page-main">
	<div class="main-menu">
		<h2>
			<a href='${pageContext.request.contextPath}/community/fullList.do'>커뮤니티</a>
			 / 
			<a href='${pageContext.request.contextPath}/community/reviewList.do'>후기게시판</a>
		</h2>
	</div>
	
	<!-- 서브 메뉴 시작 -->
	<div class="sub-menu">
		<ul>
			<li><a href='${pageContext.request.contextPath}/community/fullList.do'>전체게시판</a></li>
			<li><a href='${pageContext.request.contextPath}/community/freeList.do'>자유</a></li>
			<li><a href='${pageContext.request.contextPath}/community/promoList.do'>홍보</a></li>
			<li><a href='${pageContext.request.contextPath}/community/reviewList.do'>후기</a></li>
			<c:if test="${!empty user && user.mem_auth<9}">
			<li>
				<input type="button" value="글작성" onclick="location.href='reviewWrite.do'">
			</li>
			</c:if>
			<c:if test="${!empty user && user.mem_auth==9}">
			<li>
				<input type="button" value="공지작성" onclick="location.href='reviewWrite.do'">
			</li>
			</c:if>
		</ul>
	</div>
	<!-- 서브 메뉴 끝 -->
	
	<br>
	<p>
	
	<!-- 정렬 영역 시작 -->
	<div class="review-sort">
		<select onchange="if(this.value) location.href=(this.value)">
			<option value="reviewList.do?sort=last" selected <c:if test="${param.sort=='last'}">selected</c:if>>최신순</option>
			<option value="reviewList.do?sort=hit" <c:if test="${param.sort=='hit'}">selected</c:if>>조회순</option>
			<option value="reviewList.do?sort=reply" <c:if test="${param.sort=='reply'}">selected</c:if>>댓글순</option>
			<option value="reviewList.do?sort=fav" <c:if test="${param.sort=='fav'}">selected</c:if>>추천순</option>
		</select>
	</div>
	<!-- 정렬 영역 끝 -->
	
	<p>
	
	<!-- 검색 영역 시작 -->
	<form action="reviewList.do" id="v_search_form" method="get">
		<ul class="v-search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>전체</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>제목</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>내용</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>작성자</option>
					<option value="5" <c:if test="${param.keyfield==5}">selected</c:if>>스터디명</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
				<input type="button" value="목록" onclick="location.href='reviewList.do'">
			</li>
			<li>
				<c:if test="${mem_auth==9}">
					<input type="hidden" name="review_fixed" id="review_fixed" value="${review_fixed==1}">
				</c:if>
			</li>
		</ul>
	</form>
	<!-- 검색 영역 끝 -->
	
	<!-- 목록 영역 시작 -->
	<c:if test="${count==0}">
	<div class="v-result-display">작성된 게시글이 없습니다.</div>
	</c:if>
	
	<c:if test="${count>0}">
	<div class="review-fixed-1">
		<table>
			<tr class="review-table-title">
				<th>번호</th>
				<th width="400">제목(댓글수)</th>
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
				<td>
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
	<div class="review-fixed-2">
		<table>
			<tr class="review-table-title">
				<th>스터디명</th>
				<th>번호</th>
				<th>평점</th>
				<th width="400">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>review_fixed==2</th>
				<th>댓글수</th>
				<th>좋아요수</th>
			</tr>
			<c:forEach var="review" items="${reviewList}">
			<input type="hidden" name="review_fixed" id="review_fixed" value="${review_fixed}">
			<c:if test="${review.review_fixed==2}">
			<tr class="review-table-item">
				
				<td>${review.review_stc_name}</td>
				<td>${review.review_num}</td>
				<td>${review.review_rating}</td>
				<td><a href="reviewDetail.do?review_num=${review.review_num}">${review.review_title}</a></td>
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
	<div class="review-paging">${page}</div>
	<!-- 페이징 영역 끝 -->
</div>