<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="./css/emplist.css">

</head>


<body>

<!-- 사이드바 포함 -->
<%@ include file="sidebar.jsp"%>

<div class="content" id="content">
    <!-- 헤더 포함 -->
    <%@ include file="header.jsp"%>

    <div class="main-content">
        <fieldset class="btn-container">
    <form name="search-frm" method="get" action="./searchEmployee.do">
        <select name="type" id="type">
            <option value="dept" ${(param.type == "dept")?"selected":""}>부서</option>
        	<option value="name" ${(param.type == "name")?"selected":""}>성명</option>
        </select> 
        
        <input type="text" name="keyword" value="${param.keyword}" placeholder="검색어를 입력해주세요.">
        <button type="submit" class="button-common search-btn">
            <img src="images/search.svg" alt="검색 아이콘" style="width: 30px; height: 30px;">
        </button>
    </form>

    <c:if test="${sessionScope.loginVo.role eq 'A'}">
        <form action="./regist.do" method="get" class="ms-2 d-flex align-items-center">
            <button type="submit" class="button-common" style="border: none; background: none;">
                <img src="images/add.svg" alt="사원 등록" style="width: 30px; height: 30px; margin-right: 8px;">
                사원 등록
            </button>
        </form>
    </c:if>
</fieldset>

        <div id="searchResult">
            <table class="table table-hover">
                <thead>
                    <tr class="success">
                        <td>프로필</td>
                        <td>이름</td>
                        <td>직급</td>
                        <td>이메일</td>
                        <td>연락처</td>
                        <td>부서명</td>
                        <c:if test="${sessionScope.loginVo.role eq 'A'}">
                        <td>수정</td>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="emp" items="${empList}" varStatus="vs">
                        <tr>
                            <td>
                            <a href="javascript:void(0);"
                                    onclick="openEmployeeModal('${emp.emp_id}')"> 
                                    <img
                                        src="${empty emp.profile_image ? '/upload/profile/default.png' : emp.profile_image}"
                                        class="profile-img" alt="프로필 이미지">
                                </a> 
                            </td>
                            <td>${emp.name}</td>
                            <td>${emp.position}</td>
                            <td>${emp.email}
                                <img src="images/mail.svg" alt="아이콘" style="width: 15px; height: 15px;">
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${sessionScope.loginVo.role eq 'A'}">
                                     ${emp.phone} 
                                    <img src="images/phone.svg" alt="아이콘" style="width: 15px; height: 15px; margin-left: 5px;">
                        			</c:when>
                                    <c:otherwise>
                                       ${emp.phone.substring(0, 3)}-****${emp.phone.substring(8)}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${emp.dept_name}</td>


								<c:if test="${sessionScope.loginVo.role eq 'A'}">
									<td>
										<form action="./empupload.do" method="GET">
											<input type="hidden" name="emp_id" value="${emp.emp_id}">
											<button type="submit" class="button-common search-btn">
												수정 <img src="images/pen.svg" alt="수정"
													style="width: 15px; height: 15px;">
											</button>
										</form>
									</td>
								</c:if>
							</tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="pagination-container text-center">
    <ul class="pagination pagination-lg">
        <!-- 맨 처음 및 이전 버튼 (왼쪽) -->
        <c:if test="${page.page > 1}">
            <li><a href="./searchEmployee.do?page=1&type=${type}&keyword=${keyword}">&laquo;&laquo;</a></li>
            <li><a href="./searchEmployee.do?page=${page.page - 1}&type=${type}&keyword=${keyword}">&laquo;</a></li>
        </c:if>

        <!-- 페이지 번호 (가운데) -->
        <c:forEach var="i" begin="${page.stagePage}" end="${page.endPage}" step="1">
            <li class="${i == page.page ? 'active' : ''}">
                <a href="./searchEmployee.do?page=${i}&type=${type}&keyword=${keyword}">${i}</a>
            </li>
        </c:forEach>

        <!-- 다음 및 맨 끝 버튼 (오른쪽) -->
        <c:if test="${page.page < page.totalPage}">
            <li><a href="./searchEmployee.do?page=${page.page + 1}&type=${type}&keyword=${keyword}">&raquo;</a></li>
            <li><a href="./searchEmployee.do?page=${page.totalPage}&type=${type}&keyword=${keyword}">&raquo;&raquo;</a></li>
        </c:if>
    </ul>
</div>






			<c:if test="${empty empList}">
            <p>현재 사원 목록이 없습니다.</p>
        </c:if>
    </div>
   
<!-- 상세보기 모달창 -->
<div id="employeeModal" class="modal fade" tabindex="-1"
    aria-labelledby="employeeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="employeeModalLabel">
                    <img src="images/user.svg" alt="아이콘" style="width: 50px; height: 50px;">
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeEmployeeModal()"></button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tbody>
                        <tr>
                            <th><img src="images/card.svg" alt="아이콘" style="width: 100px; height: 100px;"></th>
                            <td class="profile-container">
                                <img id="empProfileImage" class="profile-img" alt="프로필 이미지">
                            </td>
                        </tr>
                        <tr>
                            <th><i class="fa-solid fa-user"></i>이름</th>
                            <td id="empName"></td>
                           
                        </tr>
                        <tr>
                            <th><i class="fas fa-briefcase"></i>부서</th>
                            <td id="empDept"></td>
                        </tr>
                        <tr>
                            <th><i class="fas fa-cogs"></i>직위</th>
                            <td id="empPosition"></td>
                        </tr>
                        <tr>
                            <th><i class="fas fa-birthday-cake"></i>생년월일</th>
                            <td id="empBirthDate"></td>
                        </tr>
                        <tr>
                            <th><i class="fas fa-phone-alt"></i>내선번호</th>
                            <td id="empPhoneExtension"></td>
                        </tr>
                        <tr>
                            <th><i class="fas fa-envelope"></i>이메일</th>
                            <td id="empEmail"></td>
                        </tr>
                        <tr>
                            <th><i class="fas fa-mobile-alt"></i>연락처</th>
                            <td id="empPhone"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    // 로그인한 사용자의 role을 JSP에서 EL로 가져오기
    var userRole = '${sessionScope.loginVo.role}'; // 로그인한 사용자 role 값

    // 모달을 닫는 함수 정의
    function closeEmployeeModal() {
        $('#employeeModal').modal('hide');
    }

    // 사원 정보를 담고 있는 객체
    var employees = {};
    <c:forEach var="emp" items="${empList}">
        employees['${emp.emp_id}'] = {
            emp_id : '${emp.emp_id}',
            name : '${emp.name}',
            profile_image : '${empty emp.profile_image ? "/upload/profile/default.png" : emp.profile_image}',
            dept_name : '${emp.dept_name}',
            position : '${emp.position}',
            birth : '${emp.birth}',
            tel : '${emp.tel}',
            email : '${emp.email}',
            phone : '${emp.phone}'
        };
    </c:forEach>

    // 모달을 여는 함수
    function openEmployeeModal(emp_id) {
        var emp = employees[emp_id];
        if (!emp) {
            alert('사원 정보를 찾을 수 없습니다.');
            return;
        }

        // 모달에 사원 정보 채우기
        document.getElementById('empName').textContent = emp.name;
        document.getElementById('empProfileImage').src = emp.profile_image;
        document.getElementById('empDept').textContent = emp.dept_name;
        document.getElementById('empPosition').textContent = emp.position;
        document.getElementById('empBirthDate').textContent = emp.birth;
        document.getElementById('empPhoneExtension').textContent = emp.tel;
        document.getElementById('empEmail').textContent = emp.email;

        // 연락처 마스킹 처리
        var empPhoneElement = document.getElementById('empPhone');
        if (userRole === 'U') {
            // role이 'U'이면 연락처 마스킹 처리
            var maskedPhone = emp.phone.substring(0, 3) + '-****-' + emp.phone.substring(8);
            empPhoneElement.textContent = maskedPhone;
        } else {
            // role이 'A'이면 전체 연락처 표시
            empPhoneElement.textContent = emp.phone;
        }

        // 모달 열기
        $('#employeeModal').modal('show');
    }
</script>


</body>
</html>