<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>휴가원 신청</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">	
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
            <th rowspan="2">결재자</th>
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

                    <c:if test="${appSign.emp_id == loginVo.emp_id}">
                       
                           
                            <div class="btn-container">
                             <form action="./updateApprov.do" method="POST">
                              <input type="hidden" name="doc_id" value="${param.doc_id}" />
                            <input type="hidden" name="apprv_id" value="${appSign.apprv_id}" />
                                <button type="submit" class="approval-btn">
                                    <i class="fa-solid fa-check"></i> 승인
                                </button>
                              </form>
                              
                              
                                <button type="button" class="approval-btn reject-btn" id="rejectBtn" >
                                    <i class="fa-solid fa-xmark"></i> 반려
                                </button>
                            </div>
                        
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
						<c:choose>
								<c:when test="${not empty documentDto.origin_name}">
									<!-- 파일 다운로드 링크 -->
									<a href="/downloadFile.do?fileName=${documentDto.origin_name}&doc_id=${param.doc_id}" 
										target="_blank"> 📂 ${documentDto.origin_name} </a>
								</c:when>
								<c:otherwise>
					                첨부된 파일이 없습니다
					            </c:otherwise>
						</c:choose>
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
				<div class="btn-container" style="text-align: center; margin-top: 20px;">
					    <button type="button" class="back-btn" onclick="history.back()">
					        <i class="fa-solid fa-arrow-left"></i> 뒤로가기
					    </button>
					</div>
	            </div>
        </div>
    </div>



<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" style="max-width: 700px;">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">반려</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <form action="/approvalRejection.do" method="post" >
        <input type="hidden" value="${documentDto.doc_id}" name="doc_id">
      <div class="modal-body">
        	<div class="form-group">
        <b>반려사유</b>
        <br>
        <textarea id="reject_text" name="reject_text" class="form-control" rows="4" style="width: 100%;"></textarea>
    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
        <button type="submit" class="btn btn-primary">확인</button>
      </div>
        </form>
    </div>
  </div>
</div>
	
		
    
</body>
<script type="text/javascript">
		document.getElementById("rejectBtn").addEventListener("click", function () {
		    let modal = new bootstrap.Modal(document.getElementById("staticBackdrop"));
		    modal.show();
		});
</script>

</html>