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

    <!-- Main CSS-->
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
    <link href="${pageContext.request.contextPath}/css/group/noticeWrite.css" rel="stylesheet" media="all">
    <script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
</head>

<body>
    <div class="page-wrapper p-t-45 p-b-50">
        <div class="wrapper wrapper--w800">
            <div class="card card-6">
                <div class="card-body">
                    <form:form action="groupNoticeWrite.do" modelAttribute="groupNoticeVO" enctype="multipart/form-data">
                    <form:errors element="div" cssClass="error-color"/>
                    
                    
                        <div class="form-row">
                            <div class="name">
                            <label for="grp_title">Title</label>
                        </div>
                            <div class="value">
                            	<form:input path="grp_title" class="input--style-6" placeholder="Notice Title"/>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">
								<label for="grp_content">content</label>
							</div>
                            <div class="value">
                                <div class="input-group">
                                    <form:textarea path="grp_content" class="textarea--style-6" placeholder="Please fill out the notice."/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">
                            	<label for="file">Upload CV</label>
                           	</div>
                            <div class="value">
                                <div class="input-group js-input-file">
                                    <input class="input-file" type="file" name="file_cv" id="file">
                                    <label class="label--file" for="file">Choose file</label>
                                    <span class="input-file__info">No file chosen</span>
                                </div>
                                <div class="label--desc">Upload your image or document file. Max file size 50 MB</div>
                            </div>
                        </div>
                        <div class="card-footer">
							<form:button class="btn btn--radius-2 btn--blue-2">Send Application</form:button>
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