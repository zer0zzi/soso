<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath}/css/group/noticeWrite.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper p-t-45 p-b-50">
        <div class="wrapper wrapper--w800">
            <div class="card card-6">
                <div class="card-body">
                		<div class="form-row">
                            <div class="name">등록일 / 수정일</div>
                            <div class="value">
                            	<div class="input--style-6 non-cursor">${detail.grp_date}
                            	<c:if test="${!empty detail.grp_mdate}"> / ${detail.grp_mdate}</c:if>
                            	</div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">제목</div>
                            <div class="value">
                            	<div class="input--style-6 non-cursor">${detail.grp_title}</div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">내용</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="textarea--style-6 non-cursor width-content">${detail.grp_content}</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">업로드</div>
                            <div class="value">
                                <div class="input-group js-input-file">
                                	<c:if test="${!empty detail.grp_filename}"> 
                                		<a href="/group/file.do?grp_num=${detail.grp_num}">${detail.grp_filename}</a>
                                	</c:if>
                                	<!-- 이미지일때 처리방법 -->
                                	<c:if test="${fn:endsWith(detail.grp_filename,'.jpg') || 
							        	fn:endsWith(detail.grp_filename,'.JPG') ||
										fn:endsWith(detail.grp_filename,'.jpeg') ||
										fn:endsWith(detail.grp_filename,'.JPEG') ||
										fn:endsWith(detail.grp_filename,'.gif') ||
										fn:endsWith(detail.grp_filename,'.GIF') ||
										fn:endsWith(detail.grp_filename,'.png') ||
										fn:endsWith(detail.grp_filename,'.PNG')}">
										<div class="align-center">
											<img src="/group/imageView.do?grp_num=${detail.grp_num}" class="detail-img"
											style="width:400px;">
										</div>	
									</c:if>
                                </div>
                            </div>
                        </div>
                    <c:if test="${!empty master}">
                    <form>
                        <div class="card-footer two-button">
							<input type="button" value="수정" class="btn btn--radius-2 btn--blue-2 button1" 
							onclick="location.href='${pageContext.request.contextPath}/group/groupNoticeModify.do?grp_num=${detail.grp_num}'">
							<input type="button" value="삭제" class="btn btn--radius-2 btn--blue-2 button2" 
							onclick="location.href='${pageContext.request.contextPath}/group/groupNoticeDelete.do?grp_num=${detail.grp_num}&stc_num=${detail.stc_num}'">
						</div>
                    </form>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/group/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/group/global.js"></script>
    

</body>
</html>