<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>휴가원 신청</title>
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/approval.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<style>
.ck-editor__editable {
    min-height: 400px;  /* 최소 높이 */
    max-height: 600px;  /* 최대 높이 */
    overflow-y: auto;   /* 내용이 많으면 스크롤 */
}
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

th, td {
	align-content: center;
}

#reason {
	min-height: 500px; /* 최소 높이 설정 */
	max-height: 600px; /* 최대 높이 설정 */
	overflow-y: auto; /* 높이를 넘어서면 스크롤 */
}

</style>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
        <div class="main-content">
        	<form action="./TempLeave.do" method="post" enctype="multipart/form-data">
	            <div class="card p-4" style="width: 1300px;">
					<h2 class="text-center mb-4">
						<c:choose>
							<c:when test="${documentDto.doc_type == '휴가'}">휴가원</c:when>
							<c:when test="${documentDto.doc_type == '출장'}">출장서</c:when>
							<c:when test="${documentDto.doc_type == '보고서'}">보고서</c:when>
							
						</c:choose>
					</h2>

					<div>
		                <div style="float: left; width: 30%">
							<table class="table table-borderless w-100 mb-3">
								<tr>
									<th rowspan="2">기안자</th>
									<th>소속부서</th>
									<th>직급</th>
									<th>성명</th>
									<th>사원번호</th>
								</tr>
								<tr>
									<td>${documentDto .dept_name}</td>
									<td>${documentDto .position}</td>
									<td>${documentDto .name}</td>
									<td>${documentDto .emp_id}</td>
								</tr>
							</table>
						</div>
						<div style="float: right; width: 60%">
							<table class="table table-borderless mb-3">
								<tr>
									<th rowspan="2">결재</th>
									<th>본인</th>
									<th>결재자1</th>
									<th>결재자2</th>
									<th>결재자3</th>
								</tr>
								<tr id="approvalLineTd_1">
									<td id="approvalLineTd_2"><img id="signatureImage"
										src="${documentDto.signSaved}" width="80" height="75"
										style="border: 1px solid black;" />
									</td>


									<td>
									<c:if test="${documentDto.apprv_level == 1}">
								    <button class="btn btn-success" onclick="approveDocument(1)">승인</button>
										</c:if></td>
									<td><c:if
											test="${documentDto.apprv_level == 2}">
											<button class="btn btn-success" onclick="approveDocument(2)">승인</button>
										</c:if></td>
									<td>
									<c:if test="${documentDto.apprv_level == 3}">
									<button class="btn btn-success" onclick="approveDocument(3)">승인</button>
									</c:if>
									</td>
								</tr>
								
								
				
								
								
								
							</table>
						</div>
					</div>
	
					<table class="table table-borderless mb-3">
					 <c:if test="${documentDto.doc_type eq '출장'}">
					 <c:forEach var="vo" items="${reportDto}">
		                	<tr>
								<th>제목</th>
								<th><input type="text" id="title" name="title" value="${vo.title}"
									class="form-control" placeholder="제목을 입력하세요."></th>
							</tr>
							<tr>
								<th>기간</th>
								<th style="text-align: left;">
									<input type="date" class="form-control" name="trip_start" 
											style="width: 30%; display: inline-block;" value="${tripDto.trip_start}">
									 ~ 
									<input type="date" class="form-control" name="trip_end" 
											style="width: 30%; display: inline-block;" value="${tripDto.trip_end}">
								</th>
							</tr>
							<tr>
								<th>지역</th>
								<th>
									<textarea id="place" name="destination" class="form-control" rows="5" placeholder="지역을 입력하세요.">${tripDto.destination}</textarea>
								</th>
							</tr>
							<tr>
								<th>목적</th>
								<th>
									<textarea id="reason" name="content" class="form-control" rows="5" placeholder="목적을 입력하세요.">${vo.content}</textarea>
								</th>
							</tr>
						</c:forEach>
					 </c:if>
					 
					 
					  <c:if test="${documentDto.doc_type eq '보고서'}">
						<c:forEach var="vo" items="${reportDto}">
							<tr>
								<th>제목</th>
								<th>
									<input type="text" id="title" name="title" value="${vo.title}"
									class="form-control" placeholder="제목을 입력하세요.">
								</th>
							</tr>
							<tr>
								<th>파일</th>
								<th>
									<div class="file-container">
										<input class="form-control form-control-sm" id="formFileSm"
											type="file" name="file" multiple="multiple">
									</div>
								</th>
							</tr>
							<tr>
								<th>내용</th>
								<th><textarea class="ck-editor" id="classic" name="content"
										placeholder="내용을 입력하세요" readonly >${vo.content}</textarea></th>
							</tr>
						</c:forEach>
						</c:if>
						
						  <c:if test="${documentDto.doc_type eq '휴가'}">
						<c:forEach var="vo" items="${reportDto}">
							<tr>
								<th>제목</th>
								<th><input type="text" id="title" name="title" value="${vo.title}"
									class="form-control" placeholder="제목을 입력하세요."></th>
							</tr>
							<tr>
							    <th>종류</th>
							    <th style="text-align: left;">
							        <input type="radio" id="morning" name="type" value="오전반차" 
							               class="form-check-input" 
							               ${leaveDto.type == '오전반차' ? 'checked' : ''}> 
							        <label for="morning" class="form-check-label">오전반차</label>
							
							        <input type="radio" id="afternoon" name="type" value="오후반차" 
							               class="form-check-input ms-2" 
							               ${leaveDto.type == '오후반차' ? 'checked' : ''}> 
							        <label for="afternoon" class="form-check-label">오후반차</label>
							
							        <input type="radio" id="full" name="type" value="연차" 
							               class="form-check-input ms-2" 
							               ${leaveDto.type == '연차' ? 'checked' : ''}> 
							        <label for="full" class="form-check-label">연차</label>
							    </th>
							</tr>
							<tr>
								<th>기간</th>
								<th style="text-align: left;">
									<input type="date" class="form-control" name="leave_start" 
									       value="${leaveDto.leave_start}" style="width: 30%; display: inline-block;">
									~
									<input type="date" class="form-control" name="leave_end" 
									       value="${leaveDto.leave_end}" style="width: 30%; display: inline-block;">
								</th>
							</tr>
							<tr>
								<th>사유</th>
								<th>
									<textarea id="reason" name="content" class="form-control" rows="5" placeholder="사유를 입력하세요.">${vo.content}</textarea>
								</th>
							</tr>
						</c:forEach>
						</c:if>
					</table>
	                
	            </div>
			</form>
        </div>
    </div>
   
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    // 모든 input 태그를 읽기 전용으로 설정
	    document.querySelectorAll("input, textarea, select").forEach(function(element) {
	        element.setAttribute("readonly", true); // 입력 불가능하게
	        element.setAttribute("disabled", true); // 선택 불가능하게
	    });

	    // 승인 버튼만 활성화
	    document.querySelectorAll(".btn-success").forEach(function(button) {
	        button.removeAttribute("disabled"); // 승인 버튼 활성화
	    });
	});


ClassicEditor
.create(document.querySelector('#classic'))

.then(editor => {
	
    editor.isReadOnly = true; 
})
.catch(error => {
    console.error(error);
});
	</script>
	
		
    
</body>
</html>