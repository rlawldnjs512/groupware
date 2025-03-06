<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<style>
:root {
	--bs-primary: #1b84ff;
	--bs-primary-light: #e9f3ff;
	--bs-primary-white: #fff;
}

.btn.btn-light-primary {
	color: var(--bs-primary);
	border-color: var(--bs-primary-light);
	background-color: var(--bs-primary-light);
}

.btn.btn-light-primary:hover {
	color: var(--bs-primary-white);
	border-color: var(--bs-primary);
	background-color: var(--bs-primary);
}

.btn.btn-light-primary:focus {
	outline: none;
	box-shadow: 0 0 0 0.25rem rgba(var(--bs-primary), 0.5);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f0f0f0;
}

.gray {
	background-color: #ddd;
}

.container {
	display: relative;
}

.ck.ck-editor {
    max-width: 100%;
}
.ck-editor__editable {
    min-height: 400px;
}
</style>
</head>
<%@ include file="sidebar.jsp"%>
<body>
	<div class="content" id="content">
		<%@ include file="header.jsp"%>

		<div class="main-content" style="padding: 30px;">
			<form id="select-form" action="./newFree.do" method="POST" enctype="multipart/form-data">
				<div class="mb-3">
					<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요">
				</div>
				<div class="mb-3">
					<textarea class="form-control" id="classic" rows="3" style="width: 100%;" placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="mb-3">
					<input class="form-control form-control-sm" id="formFileSm" type="file" multiple="multiple">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-primary mb-3">확인</button>
					<button class="btn btn-danger mb-3" onclick="history.back()">취소</button>
				</div>
			</form>
		</div>

	</div>




	<script>
	ClassicEditor
    .create(document.querySelector('#classic'), {
        // 높이 설정
        height: 400, // 높이를 400px로 설정
        
        // 툴바 설정 (옵션에 따라 조정)
        toolbar: [
            'bold', 'italic', 'link', 'undo', 'redo' // 툴바에 포함될 버튼들
        ],
        // 기본 글꼴 크기 및 스타일 설정
        fontSize: '11px', // 기본 글꼴 크기
    })
    .catch(error => {
        console.error(error);
    });

    </script>
</body>
</html>
