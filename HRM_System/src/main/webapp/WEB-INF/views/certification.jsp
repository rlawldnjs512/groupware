<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="./js/htp.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="./css/emplist.css">
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
		.text-length {
			max-width: 20ch;  /* 최대 10글자 (ch는 글자 단위) */
			min-width: 20ch;
		    white-space: nowrap;  /* 줄바꿈 방지 */
		    overflow: hidden;  /* 넘치는 내용 숨김 */
		    text-overflow: ellipsis;  /* 넘칠 경우 '...'으로 표시 */
		}
		.empty-row {
		    height: 52px; /* 2개 행 높이만큼 설정 */
		    background-color: #f8f9fa; /* 연한 색으로 구분 (선택 사항) */
		}
		.pagination-container {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 50px; /* 최소 높이 지정 */
		}
    </style>
    <meta charset="UTF-8">
    <title>증명서 신청</title>
</head>
<%@ include file="sidebar.jsp" %>
<body>
	<div class="content" id="content">
		<div class="header">
			<ul class="nav flex-wrap border-transparent">
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
							active"
					href="./mypage.do"> 내 정보 </a></li>
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active"
					href="#"> 일정 관리 </a></li>
				<li class="nav-item my-1"><a
					class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active"
					href="./certification.do"> 증명서 관리 </a></li>
			</ul>
		</div>
		<div class="main-content">


			<div
				class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
				<h1
					class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">
					증명서 신청 이력</h1>
				<div
					class="d-flex justify-content-end align-items-center gap-2 gap-lg-3">
					<div class="d-flex align-items-center">
						<c:if test="${sessionScope.loginVo.role eq 'A'}">
						    <form id="search-form" action="./select.do" method="GET">
						    	<input type="hidden" name="page" value="1">
						        <input type="text" name="emp_id" id="emp_id" placeholder="사원번호 입력">  <!-- 이름 대신 사원번호로 변경 -->
						        <button type="submit" class="btn btn-light-primary ms-2">검색</button>
						    </form>
						</c:if>
						
						<select id="campaign-type" name="campaign-type"
							data-control="select2" data-hide-search="true"
							class="form-select form-select-sm bg-body border-body w-auto select2-hidden-accessible"
							data-select2-id="select2-data-7-hhxp" tabindex="-1"
							aria-hidden="true" data-kt-initialized="1">
							<option value="certtype" selected="selected"
								data-select2-id="select2-data-9-h6l8">증명서 선택</option>
							<option value="재직">재직 증명서</option>
							<option value="퇴직">퇴직 증명서</option>
							<option value="경력">경력 증명서</option>
						</select>

						<form id="select-form" action="./select.do" method="GET">
							<c:if test="${sessionScope.loginVo.role eq 'U'}">
								<!-- 페이지 번호 1로 설정 -->
								<input type="hidden" name="page" value="1">
								<!-- 선택한 증명서 종류를 전달할 input -->
								<input type="hidden" id="selected-type" name="type" value="">
								<!-- 로그인한 emp_id 값을 전달 -->
								<c:if test="${not empty sessionScope.loginVo}">
									<input type="hidden" name="emp_id"
										value="${sessionScope.loginVo.emp_id}">
								</c:if>
								<c:if test="${empty sessionScope.loginVo}">
									<p>로그인이 필요합니다.</p>
									<!-- 로그인되지 않았다면 경고창이나 다른 페이지로 리다이렉트 -->
								</c:if>
							</c:if>
							
							<c:if test="${sessionScope.loginVo.role eq 'A'}">
								<!-- 페이지 번호 1로 설정 -->
								<input type="hidden" name="page" value="1">
								<!-- 선택한 증명서 종류를 전달할 input -->
								<input type="hidden" id="selected-type" name="type" value="">
							</c:if>
	
								<button type="button" class="btn btn-light-primary ms-2"
									id="select-btn">선택</button>
						</form>
						<script>
						    document.getElementById("select-btn").onclick = function() {
						        // 선택된 증명서 종류 값 가져오기
						        var type = document.getElementById("campaign-type").value;
						        console.log(type);  // 선택된 type 값을 콘솔에 출력하여 확인

						        // '증명서 선택' 옵션이 선택되지 않았다면
						        if (type !== "certtype") {
						            // hidden input에 선택된 type 값 넣기
						            document.getElementById("selected-type").value = type;
						            // 폼 제출
						            document.getElementById("select-form").submit();
						        } else {
						            alert("증명서 종류를 선택해주세요.");
						        }
						    };
						</script>

					</div>
				</div>

				<div class="table-responsive">
					<table class="table table-hover table-rounded table-striped border gy-7 gs-7">
					    <thead>
					        <tr class="fw-semibold fs-6 text-gray-800 border-bottom-2 border-gray-200">
					            <th class="text-length">발급번호</th>
					            <th class="text-length">증명서 종류</th>
					            <th class="text-length">신청 날짜</th>
					            <th class="text-length">신청 사유</th>
					            <th class="text-length">승인 날짜</th>
						        <th class="text-length">승인 상태</th>
					            <c:if test="${sessionScope.loginVo.role eq 'U'}">
						            <th class="text-length">다운로드</th>
						        </c:if>
						        <c:if test="${sessionScope.loginVo.role eq 'A'}">
						        	<th class="text-length">승인</th>
						        </c:if>
					        </tr>
					    </thead>
					    <tbody>
					    	<c:if test="${empty lists}">
					            <!-- 리스트가 비어있는 경우 빈 행 추가 -->
					            <tr class="empty-row">
					                <td colspan="7" style="text-align: center;">결과가 없습니다.</td>
					            </tr>
					            <tr class="empty-row">
					                <td colspan="7"></td>
					            </tr>
					        </c:if>
					        <c:forEach var="vo" items="${lists}" varStatus="vs">
					            <tr>
					                <td class="text-length">${vo.cert_num}</td>
					                <td class="text-length">${vo.type}</td>
					                <td class="text-length">${vo.req_date}</td>
					                <td class="text-length">${vo.reason}</td>
					                <td class="text-length">${vo.cert_date}</td>
					                <td class="text-length">${vo.cert_status}</td>
					                <c:if test="${sessionScope.loginVo.role eq 'U'}">
						                <td>
								            <c:choose>
								                <c:when test="${vo.cert_status == 'Y' && vo.is_download == 'Y'}">
								                    <!-- 다운로드 완료 버튼 -->
								                    <button class="btn btn-secondary btn-sm" disabled>다운로드 완료</button>
								                </c:when>
								                <c:when test="${vo.cert_status == 'Y'}">
								                    <!-- 다운로드 가능한 버튼 -->
								                    <button id="popupPdf" type="button" class="btn btn-primary btn-sm"
								                            onclick="openPreviewPopup('${vo.cert_num}', '${vo.type}', '${fn:escapeXml(vo.reason)}')">
								                        미리보기
								                    </button>
								                </c:when>
								                <c:otherwise>
								                    <button class="btn btn-secondary btn-sm" disabled>미리보기</button>
								                </c:otherwise>
								            </c:choose>
								        </td>
								    </c:if>
								    <c:if test="${sessionScope.loginVo.role eq 'A'}">
								    	<td>
								    		<c:choose>
								    			<c:when test="${vo.cert_status == 'N'}">
											        <form id="status_accept" action="/status.do" method="GET">
											            <input type="hidden" name="emp_id" value="${vo.emp_id}" />
											            <input type="hidden" name="cert_status" value="${vo.cert_status}" />
											            <input type="hidden" name="cert_num" value="${vo.cert_num}" />
											            <button type="submit" class="btn btn-primary btn-sm">승인하기</button>
											        </form>
											    </c:when>
								    			<c:otherwise>
								    				<button class="btn btn-secondary btn-sm" disabled>승인완료</button>
								    			</c:otherwise>
								    		</c:choose>
								    	</td>
								    </c:if>
					            </tr>
					        </c:forEach>
						    <c:if test="${fn:length(lists) == 1}">
					            <tr class="empty-row">
					                <td colspan="7"></td>
					            </tr>
					        </c:if>
						</tbody>
					</table>
					<script type="text/javascript">
					function openPreviewPopup(certNum, certType, reason) {
					    var encodedReason = encodeURIComponent(reason);
					    var targetPage = '';
					    
					    if (certType === '재직') {
					        targetPage = 'pdf_emp.jsp';
					    } else if (certType === '경력') {
					        targetPage = 'pdf_career.jsp';
					    } else if (certType === '퇴직') {
					        targetPage = 'pdf_retire.jsp';
					    } else {
					        alert('잘못된 요청입니다.');
					        return;
					    }
					    
					    var popup = window.open(targetPage + '?cert_num=' + certNum + '&reason=' + encodedReason, 
					                            'popupWindow', 
					                            'width=1000,height=800,scrollbars=yes,resizable=yes');
					    
					    if (popup) {
					        popup.focus();
					        
					        var checkPopupClosedInterval = setInterval(function() {
					            if (popup.closed) {
					                clearInterval(checkPopupClosedInterval);
					                
					                $.ajax({
					                    url: '/updateDownload',
					                    method: 'POST',
					                    data: { certNum: certNum },
					                    success: function(response) {
					                        alert("PDF 저장 완료");

					                        // 버튼 상태 업데이트
					                        $('#popupPdf')
					                            .attr('disabled', true) // 버튼 비활성화
					                            .text('다운로드 완료') // 텍스트 변경
					                            .removeClass('btn-primary') // 기존 스타일 제거
					                            .addClass('btn-secondary'); // 새로운 스타일 적용
					                    },
					                    error: function() {
					                        alert("서버 오류가 발생했습니다.");
					                    }
					                });
					            }
					        }, 1000);
					    }
					}
					</script>
				</div>
				<div class="pagination-container text-center">
				    <c:if test="${page.totalPage > 1}">
				        <ul class="pagination pagination-lg">
				            <!-- 이전 버튼 (왼쪽) -->
				            <c:if test="${page.page > 1}">
				                <li>
				                    <a href="./select.do?page=${page.page - 1}&type=${param.type}&emp_id=${param.emp_id}">&laquo;</a>
				                </li>
				                <c:if test="${sessionScope.loginVo.role eq 'A'}">
				                    <c:if test="${param.emp_id != null}">
				                        <!-- 사원번호로 검색하는 경우 -->
				                        <a href="./select.do?page=${page.page - 1}&emp_id=${param.emp_id}">&laquo;</a>
				                    </c:if>
				                    <c:if test="${param.type != null}">
				                        <!-- 증명서 종류로 검색하는 경우 -->
				                        <a href="./select.do?page=${page.page - 1}&type=${param.type}">&laquo;</a>
				                    </c:if>
				                </c:if>
				            </c:if>
				
				            <!-- 페이지 번호 (가운데) -->
				            <c:forEach var="i" begin="${page.stagePage}" end="${page.endPage}" step="1">
				                <li class="${i == page.page ? 'active' : ''}">
				                    <a href="./select.do?page=${i}&type=${param.type}&emp_id=${param.emp_id}">${i}</a>
				                    <c:if test="${sessionScope.loginVo.role eq 'A'}">
				                        <c:if test="${param.emp_id != null}">
				                            <!-- 사원번호로 검색하는 경우 -->
				                            <a href="./select.do?page=${i}&emp_id=${param.emp_id}">${i}</a>
				                        </c:if>
				                        <c:if test="${param.type != null}">
				                            <!-- 증명서 종류로 검색하는 경우 -->
				                            <a href="./select.do?page=${i}&type=${param.type}">${i}</a>
				                        </c:if>
				                    </c:if>
				                </li>
				            </c:forEach>
				
				            <!-- 다음 버튼 (오른쪽) -->
				            <c:if test="${page.page < page.endPage}">
				                <li>
				                    <a href="./select.do?page=${page.page + 1}&type=${param.type}&emp_id=${param.emp_id}">&raquo;</a>
				                </li>
				                <c:if test="${sessionScope.loginVo.role eq 'A'}">
				                    <c:if test="${param.emp_id != null}">
				                        <!-- 사원번호로 검색하는 경우 -->
				                        <a href="./select.do?page=${page.page + 1}&emp_id=${param.emp_id}">&raquo;</a>
				                    </c:if>
				                    <c:if test="${param.type != null}">
				                        <!-- 증명서 종류로 검색하는 경우 -->
				                        <a href="./select.do?page=${page.page + 1}&type=${param.type}">&raquo;</a>
				                    </c:if>
				                </c:if>
				            </c:if>
				        </ul>
				    </c:if>
				</div>


		<c:if test="${sessionScope.loginVo.role eq 'U'}">
			<div
				class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
				<h1
					class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">
					증명서 신청</h1>
				<div>
					<form action="./pdf.do" method="post" name="pdfInsert">
						<table>
							<tr>
								<th class="gray">신청ID</th>
								<td><c:if test="${not empty sessionScope.loginVo}">
										<input type="text" name="requestId"
											value="${sessionScope.loginVo.emp_id}" disabled>
									</c:if> <c:if test="${empty sessionScope.loginVo}">
										<input type="text" name="requestId" placeholder="로그인 필요"
											disabled>
									</c:if></td>
								<th>증명서 구분</th>
								<td><select name="certificateType">
										<option value="">증명서 선택</option>
										<option value="재직">재직증명서</option>
										<option value="퇴직">퇴직증명서</option>
										<option value="경력">경력증명서</option>
								</select></td>
								<th class="gray">신청 날짜</th>
								<td><input name="requestDate" id="requestDate" disabled></td>
							</tr>
							<tr>
								<th class="gray">사원번호</th>
								<td><c:if test="${not empty sessionScope.loginVo}">
										<input type="text" name="employeeNumber"
											value="${sessionScope.loginVo.emp_id}" disabled>
									</c:if> <c:if test="${empty sessionScope.loginVo}">
										<input type="text" name="employeeNumber" placeholder="로그인 필요"
											disabled>
									</c:if></td>
								<th>이름</th>
								<td><c:if test="${not empty sessionScope.loginVo}">
										<input type="text" name="name"
											value="${sessionScope.loginVo.name}" disabled>
									</c:if> <c:if test="${empty sessionScope.loginVo}">
										<input type="text" name="name" placeholder="로그인 필요" disabled>
									</c:if></td>
								<th class="gray">승인 날짜</th>
								<td><input type="approvalDate" name="approvalDate" value="" disabled></td>
							</tr>
							<tr>
								<th class="gray">부서</th>
								<td><c:if test="${not empty sessionScope.loginVo}">
										<input type="text" name="department"
											value="${sessionScope.loginVo.dept_name}" disabled>
									</c:if> <c:if test="${empty sessionScope.loginVo}">
										<input type="text" name="department" placeholder="로그인 필요"
											disabled>
									</c:if></td>
								<th>직급</th>
								<td><c:if test="${not empty sessionScope.loginVo}">
										<input type="text" name="position"
											value="${sessionScope.loginVo.position}" disabled>
									</c:if> <c:if test="${empty sessionScope.loginVo}">
										<input type="text" name="position" placeholder="로그인 필요"
											disabled>
									</c:if></td>
								<th class="gray">승인 상태</th>
								<td><input type="text" value="대기" disabled></td>
							</tr>

							<tr>
								<th class="gray">신청 사유</th>
								<td colspan="5"><textarea name="reason" rows="3"
										style="width: 100%;"></textarea></td>
							</tr>
						</table>
						<br>
						<div style="text-align: right;">
							<button type="submit" class="btn btn-light-primary ms-2"
								id="select-btn" name="success">신청</button>
							<a href="./certification.do" class="btn btn-light-primary ms-2"
								id="select-btn">취소</a>
						</div>
					</form>
					<script type="text/javascript">
					
					    document.addEventListener("DOMContentLoaded", function() {
					        let today = new Date();
					        let formattedDate = today.toISOString().split('T')[0]; 
					        document.getElementById("requestDate").value = formattedDate;
					    });
					    
					    document.getElementsByName("success")[0].addEventListener("click", function(event) {
					        
					    	event.preventDefault();

					        var certificateType = document.querySelector("select[name='certificateType']").value;
					        var reason = document.querySelector("textarea[name='reason']").value.trim();

					        if (certificateType === "") {
					            alert("증명서를 선택해 주세요.");
					        } else if (reason === "") {
					            alert("신청 사유를 입력해 주세요.");
					        } else {
					            alert("신청이 완료되었습니다");

					            document.querySelector("form[name='pdfInsert']").submit();
					        }
					    });

					</script>
				</div>
			</div>
		</c:if>
		</div>
	</div>
</body>
</html>
