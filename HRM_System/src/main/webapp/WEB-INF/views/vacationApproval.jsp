<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>휴가원 신청</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/approval.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <script src="./js/approval_line.js"></script>
</head>
<body>

<%@ include file="sidebar.jsp" %>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
        <div class="container mt-5" style="width: 70%; max-width: 100%; margin: auto;">
            <div class="card shadow-lg p-4">
                <h2 class="text-center mb-4">휴가원</h2>
                <div class="d-flex justify-content-end mb-3">
                    <button id="line" onclick="windowOpen()" class="btn btn-outline-success me-2">결재선 선택</button>
                    <button class="btn btn-outline-warning me-2" onclick="/vacationSave.do">임시 저장</button>
                    <button class="btn btn-outline-danger me-2" onclick="history.back(-1)">취소</button>
                    <button class="btn btn-outline-primary">상신 하기</button>
                </div>
                
                <table class="table table-borderless w-100 mb-3">
				    <tbody>
				        <tr>
				            <td class="fw-bold">소속부서</td>
				            <td>개발부</td>
				            <td class="fw-bold">직급</td>
				            <td>사원</td>
				            <td class="fw-bold">성명</td>
				            <td>노진구</td>
				        </tr>
					</tbody>
				</table>
				<table class="table table-borderless mb-3">
					<tr>
						<td style="text-align: left;">선택된 결재선</td>
						<td id="approvalLineTd_1"></td>
						<td id="approvalLineTd_2"></td>
					</tr>
				</table>

				<div class="mb-3">
                    <label for="title" class="form-label fw-bold">제목</label>
                    <input type="text" id="title" name="title" class="form-control">
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">종류</label>
                    <div>
                        <input type="radio" id="morning" name="leave_type" value="오전반차" class="form-check-input"> <label for="morning" class="form-check-label">오전반차</label>
                        <input type="radio" id="afternoon" name="leave_type" value="오후반차" class="form-check-input ms-2"> <label for="afternoon" class="form-check-label">오후반차</label>
                        <input type="radio" id="full" name="leave_type" value="연차" class="form-check-input ms-2"> <label for="full" class="form-check-label">연차</label>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">기간</label>
                    <div class="d-flex gap-2">
                        <input type="date" class="form-control"> ~ <input type="date" class="form-control">
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="reason" class="form-label fw-bold">사유</label>
                    <textarea id="reason" name="content" class="form-control" rows="5"></textarea>
                </div>
            </div>
        </div>
    </div>
	<script type="text/javascript">
		function line(approvalLine) {
			console.log(approvalLine)
			let row1 = document.getElementById("approvalLineTd_1");
	        let row2 = document.getElementById("approvalLineTd_2");
	
	
// 	        이름 목록을 approvalLindTd_1의 td로 추가
	        approvalLine.forEach(person => {
				console.log(person.name)
	            let td_1 = document.createElement("td");
	            td_1.textContent = person.name;
	            row1.appendChild(td_1);
	            
	            let td_2 = document.createElement("td");
	            td_2.setAttribute("rowspan", approvalLine.length);
		        row2.appendChild(td_2)
	        });
	
		}
	</script>
</body>
</html>