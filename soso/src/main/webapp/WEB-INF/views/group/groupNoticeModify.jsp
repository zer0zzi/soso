<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <link href="${pageContext.request.contextPath}/css/group/noticeWrite.css" rel="stylesheet" media="all">
    <script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
</head>

<body>
    <div class="page-wrapper p-t-45 p-b-50">
        <div class="wrapper wrapper--w800">
            <div class="card card-6">
                <div class="card-body">
                    <form:form action="groupNoticeModify.do" modelAttribute="groupNoticeVO" id="noticeModify_form" enctype="multipart/form-data">
                    <form:input path="grp_num" type="hidden" value="${grp_num}"/>
                    <form:errors element="div" cssClass="error-color"/>
                        <div class="form-row">
                            <div class="name">
                            <label for="grp_title">제목</label>
                        </div>
                            <div class="value">
                            	<form:input path="grp_title" class="input--style-6" maxlength="80"/>
                            	<form:errors path="grp_title" cssClass="error-color"/>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">
								<label for="grp_content">내용</label>
							</div>
                            <div class="value">
                                <div class="input-group">
                                    <form:textarea path="grp_content" class="textarea--style-6" maxlength="1000"/>
                                	<form:errors path="grp_content" cssClass="error-color"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">
                            	<label for="upload">업로드</label>
                           	</div>
                            <div class="value">
                                <div class="input-group js-input-file">
                                	<input type="file" name="upload" id="upload">
									<div class="label--desc">Upload your image or document file. Max file size 5MB</div>
									<c:if test="${!empty groupNoticeVO.grp_filename}">
										<div id="file_detail">
											[${groupNoticeVO.grp_filename}]파일이 등록되어 있습니다.
											<input type="button" value="delete file" id="file_del">
										</div>
										
										<script type="text/javascript">
										$(function(){
											$('#file_del').click(function(){
												let choice = confirm('삭제하시겠습니까?');
												if(choice){
													$.ajax({
														url:'/group/deleteFile.do',
														data:{grp_num:${groupNoticeVO.grp_num}},
														type:'post',
														dataType:'json',
														success:function(param){
															if(param.result == 'logout'){
																alert('로그인 후 사용하세요');
															}else if(param.result == 'success'){
																$('#file_detail').hide();
															}else{
																alert('파일 삭제 오류 발생');
															}
														},
														error:function(){
															alert('네트워크 오류 발생');
														}
													});
												}
											});
										});
										
										</script>
									</c:if>
                                </div> 
                            </div>
                        </div>
                        <div class="card-footer">
							<form:button class="btn btn--radius-2 btn--blue-2 btn-width">Submit</form:button>
						</div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/group/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/group/global.js"></script>
    

</body>
</html>