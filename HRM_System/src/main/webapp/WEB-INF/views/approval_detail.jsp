<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>휴가원 신청</title>
	
<link rel="stylesheet" href="./css/approval_detail.css">



</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="approval-container">  
        <div class="main-content">
       
	            <div class="card p-4" style="width: 1300px;">
					  <h2 class="document-title">
						<c:choose>
							<c:when test="${documentDto.doc_type == '휴가'}">휴가원</c:when>
							<c:when test="${documentDto.doc_type == '출장'}">출장서</c:when>
							<c:when test="${documentDto.doc_type == '보고서'}">보고서</c:when>
						</c:choose>
					</h2>

					<div class="approval-container">  
						  <div class="drafter-info">
							<table class="table table-borderless mb-3">
								<col style="width: 15%;">
							            <col style="width: 20%;">
							            <col style="width: 20%;">
							            <col style="width: 20%;">
							            <col style="width: 25%;">
								<tr style="height: 20px;">
									<th rowspan="2">기안자</th>
									<th>부서</th>
									<th>직급</th>
									<th>성명</th>
									<th>사원번호</th>
								</tr>
								
								<tr style="height: 100px;">
									<td>${empdto.dept_name}</td>
									<td>${empdto.position}</td>
									<td>${empdto.name}</td>
									<td>${empdto.emp_id}</td>
								</tr>
							</table>
						</div>
						 <div class="approver-info">
    <table class="table table-borderless mb-3">
        <col width="180px">
        <col width="180px">
        <col width="180px">
        <col width="180px">
        <col width="180px">
        
        <!-- 결재자 목록 -->
        <tr id="approvalLineTd_1" style="height: 20px;">
            <th rowspan="2">결재</th>
            <th>본인</th>
            <c:forEach var="appNameList" items="${approvalList}">
                <th data-empid="${appNameList.emp_id}">
                    ${appNameList.name} (${appNameList.dept_name})
                </th>
            </c:forEach>
        </tr>

        <tr style="height: 100px;">
            <td>
                <img class="signature-image" src="${empdto.signSaved}" style="width: 50%; height: auto; object-fit: contain;"/>
            </td>

            <c:forEach var="appSign" items="${approvalList}" varStatus="status">
                <td data-empid="${appSign.emp_id}">
                    <img class="signature-image" src="${signatures[status.index].signSaved}" 
                         style="width: 50%; height: auto; object-fit: contain;"/>

                    <!-- 로그인한 사용자의 경우 승인/반려 버튼 표시 -->
                    <c:if test="${appSign.emp_id == loginVo.emp_id}">
                        <form action="./updateApprov.do" method="POST">
                            <input type="hidden" name="doc_id" value="${param.doc_id}" />
                            <input type="hidden" name="apprv_id" value="${appSign.apprv_id}" />
                            <div class="btn-container">
                                <button type="submit" class="approval-btn">
                                    <i class="fa-solid fa-check"></i> 승인
                                </button>
                                <button type="button" class="approval-btn reject-btn">
                                    <i class="fa-solid fa-xmark"></i> 반려
                                </button>
                            </div>
                        </form>
                    </c:if>
                </td>
            </c:forEach>
        </tr>
    </table>
</div>

					</div>
	
					<table class="table table-borderless mb-3">
						<tr>
							<th>제목</th>
							<th>
								${documentDto.title}
							</th> 
						</tr>  
						
						<tr>
							<th>파일</th>
							<th>
							${documentDto.origin_name}
								<c:if test="${documentDto.origin_name == null}">
								파일이 없습니다
								</c:if>
							</th> 
						</tr> 
						
						
						<c:if test="${tripDto != null}">
							<tr>
								<th>기간</th>
								<th>${tripDto.trip_start} ~ ${tripDto.trip_end}</th>
							</tr>
							<tr>
								<th>지역</th>
								<th>${tripDto.destination}</th>
							</tr>
						</c:if>
						
						<c:if test="${leaveDto != null}">
							
							<tr>
								<th>종류</th>
								<th>${leaveDto.type}</th>
							</tr>
							<tr>
								<th>기간</th>
								<th>${leaveDto.leave_start} ~ ${leaveDto.leave_end}</th>
							</tr>
						</c:if>
					<tr>
						<th>내용</th>
						<td>
							<div class="document-content">${documentDto.content}</div>
						</td>
					</tr>
					<tr>
				</table>
	            </div>
        </div>
    </div>

	
		
    
</body>


</html>