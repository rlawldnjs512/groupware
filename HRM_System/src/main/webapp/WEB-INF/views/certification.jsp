<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
    </style>
    <meta charset="UTF-8">
    <title>증명서 신청</title>
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp" %>
			<ul class="nav flex-wrap border-transparent">
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
							active" href="/keen/demo1/account/overview.html">
						내 정보
					</a>
				</li>
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active" href="/keen/demo1/account/overview.html">
						일정 관리
					</a>
				</li>
				<li class="nav-item my-1">
					<a class="btn btn-sm btn-color-gray-600 bg-state-body btn-active-color-gray-800 fw-bolder fw-bold fs-6 fs-lg-base nav-link px-3 px-lg-4 mx-1  
						    active" href="./certification.do">
						증명서 관리
					</a>
				</li>
			</ul>
        <div class="main-content">
			
			
            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">
                    증명서 신청 이력
                </h1>
                <div class="d-flex justify-content-end align-items-center gap-2 gap-lg-3">
                    <div class="d-flex align-items-center">
                        <select id="campaign-type"
                                name="campaign-type"
                                data-control="select2"
                                data-hide-search="true"
                                class="form-select form-select-sm bg-body border-body w-auto select2-hidden-accessible"
                                data-select2-id="select2-data-7-hhxp"
                                tabindex="-1"
                                aria-hidden="true"
                                data-kt-initialized="1">
                            <option value="certtype" selected="selected" data-select2-id="select2-data-9-h6l8">증명서 선택</option>
                            <option value="재직">재직 증명서</option>
                            <option value="퇴직">퇴직 증명서</option>
                            <option value="경력">경력 증명서</option>
                        </select>
						
						<form id="select-form" action="./select.do" method="POST">
						    <!-- 로그인한 emp_id 값을 전달 -->
						    <c:if test="${not empty sessionScope.loginVo}">
						        <input type="hidden" name="emp_id" value="${sessionScope.loginVo.emp_id}">
						    </c:if>
						    <c:if test="${empty sessionScope.loginVo}">
						        <p>로그인이 필요합니다.</p>
						        <!-- 로그인되지 않았다면 경고창이나 다른 페이지로 리다이렉트 -->
						    </c:if>
						    <!-- 선택한 증명서 종류를 전달할 input -->
						    <input type="hidden" id="selected-type" name="type" value="">

						    <button type="button" class="btn btn-light-primary ms-2" id="select-btn">선택</button>
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
                                <th>발급번호</th>
                                <th>증명서 종류</th>
                                <th>신청 날짜</th>
                                <th>신청 사유</th>
                                <th>승인 날짜</th>
                                <th>승인 상태</th>
                                <th>다운로드</th>
                            </tr>
                        </thead>
						<tbody>
						    <c:if test="${empty lists}">
						        <tr>
						            <td colspan="6">결과가 없습니다.</td>
						        </tr>
						    </c:if>
						    <c:forEach var="vo" items="${lists}" varStatus="vs">
						        <tr>
						            <td>${vo.cert_num}</td>
						            <td>${vo.type}</td>
						            <td>${vo.req_date}</td>
						            <td>${vo.reason}</td>
						            <td>${vo.cert_date}</td>
						            <td>${vo.cert_status}</td>
									<td>
										<form action="downloadCertificate.jsp" method="post">
											<input type="hidden" name="cert_num" value="${vo.cert_num}">
											<button type="submit" class="btn btn-primary btn-sm">다운로드</button>
										</form>
									</td>									
						        </tr>
						    </c:forEach>
						</tbody>
                    </table>
                </div>
            </div>

            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">
                    증명서 신청
                </h1>
                <div>
					<form action="./pdf.do" method="get">
					        <table>
								<tr>
								    <th class="gray">신청ID</th>
								    <td>
								        <c:if test="${not empty sessionScope.loginVo}">
								            <input type="text" name="requestId" value="${sessionScope.loginVo.emp_id}" readonly>
								        </c:if>
								        <c:if test="${empty sessionScope.loginVo}">
								            <input type="text" name="requestId" placeholder="로그인 필요" disabled>
								        </c:if>
								    </td>
								    <th>증명서 구분</th>
								    <td>
								        <select name="certificateType">
								            <option value="">증명서 선택</option>
								            <option value="employment">재직증명서</option>
								            <option value="income">소득증명서</option>
								            <option value="career">경력증명서</option>
								        </select>
								    </td>
								    <th class="gray">신청 날짜</th>
								    <td><input type="date" name="requestDate"></td>
								</tr>
								<tr>
								    <th class="gray">사원번호</th>
								    <td>
								        <c:if test="${not empty sessionScope.loginVo}">
								            <input type="text" name="employeeNumber" value="${sessionScope.loginVo.emp_id}" readonly>
								        </c:if>
								        <c:if test="${empty sessionScope.loginVo}">
								            <input type="text" name="employeeNumber" placeholder="로그인 필요" disabled>
								        </c:if>
								    </td>
								    <th>이름</th>
								    <td>
								        <c:if test="${not empty sessionScope.loginVo}">
								            <input type="text" name="name" value="${sessionScope.loginVo.name}" readonly>
								        </c:if>
								        <c:if test="${empty sessionScope.loginVo}">
								            <input type="text" name="name" placeholder="로그인 필요" disabled>
								        </c:if>
								    </td>
								    <th class="gray">승인 날짜</th>
								    <td><input type="date" name="approvalDate"></td>
								</tr>
								<tr>
								    <th class="gray">부서</th>
								    <td>
								        <c:if test="${not empty sessionScope.loginVo}">
								            <input type="text" name="department" value="${sessionScope.loginVo.dept_name}" readonly>
								        </c:if>
								        <c:if test="${empty sessionScope.loginVo}">
								            <input type="text" name="department" placeholder="로그인 필요" disabled>
								        </c:if>
								    </td>
								    <th>직급</th>
								    <td>
								        <c:if test="${not empty sessionScope.loginVo}">
								            <input type="text" name="position" value="${sessionScope.loginVo.position}" readonly>
								        </c:if>
								        <c:if test="${empty sessionScope.loginVo}">
								            <input type="text" name="position" placeholder="로그인 필요" disabled>
								        </c:if>
								    </td>
								    <th class="gray">승인 상태</th>
								    <td>
								        <select name="approvalStatus">
								            <option value="pending">대기</option>
								            <option value="approved">승인</option>
								            <option value="rejected">반려</option>
								        </select>
								    </td>
								</tr>

					            <tr>
					                <th class="gray">신청 사유</th>
					                <td colspan="5"><textarea name="reason" rows="3" style="width:100%;"></textarea></td>
					            </tr>
					        </table>
					        <br>
							<div style="text-align:right;">
						        <button type="submit" class="btn btn-light-primary ms-2" id="select-btn">신청</button>
						        <a href="./certification.do" class="btn btn-light-primary ms-2" id="select-btn">취소</a>
							</div>
					</form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
