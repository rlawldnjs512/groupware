<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록</title>
<link rel="stylesheet" href="./css/editemp.css">
</head>
<%@ include file="sidebar.jsp" %>
<body>
    <div class="content" id="content">
        <%@ include file="header.jsp"%>
        <div class="main-content">
            <div class="card">
                <div class="card-header">
                    사원 등록
                    <img src="images/e.svg" alt="아이콘" style="width: 40px; height: 40px;">
                </div>
                <div class="card-body">
                    <!-- 사원 등록 폼 -->
                    <form action="./regist.do" method="POST">
                        <div class="form-group">
                            <label for="name">이름:</label>
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="birth">생년월일: ex)19981205</label>
                            <input type="text" id="birth" name="birth" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="dept_id">부서:</label> 
                            <select id="dept_id" name="dept_id" class="form-control" required>
                                <option value="1">1 - 개발부</option>
                                <option value="2">2 - 디자인부</option>
                                <option value="3">3 - 인사부</option>
                                <option value="4">4 - 재무부</option>
                                <option value="5">5 - 영업부</option>
                                <option value="6">6 - 개발부</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="position">직책:</label>
                            <input type="text" id="position" name="position" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="phone">전화번호:</label>
                            <input type="text" id="phone" name="phone" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="tel">내선번호:</label>
                            <input type="text" id="tel" name="tel" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="email">이메일:</label>
                            <input type="email" id="email" name="email" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="hire_date">입사일:</label>
                            <input type="date" id="hire_date" name="hire_date" class="form-control" required>
                        </div>

                        <div class="button-container">
                            <button type="submit" class="btn button-common">
                                등록
                            </button>
                            <a href="javascript:window.history.back();" class="btn button-common">
                                뒤로가기
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
