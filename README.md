# 그룹웨어 기반 전자결재 및 예약관리 시스템

## 프로젝트 개요
회사에서 사용할 수 있는 **전자결재 시스템 및 예약관리 플랫폼**을 구축하여, 결재 프로세스의 디지털 전환과 더불어 **증명서 관리**, **보고서 작성** 등 다양한 업무를 전자 시스템으로 확장할 수 있는 **모듈형 그룹웨어**를 구현하였습니다.

## 개발 목적
- **전자서명 기반 보안**을 통해 개인정보를 안전하게 보호  
- 누구나 쉽게 사용할 수 있는 **간편한 전자결재 시스템** 제공

## 주요 목표
- **Spring Boot 3 기반 SPA 서버**를 통해 **비동기식 전자결재 시스템 구축**  
- 효율적인 UI/UX를 통한 사용성 극대화

---

## 팀 구성 및 역할

| 이름     | 역할         |
|----------|--------------|
| 김지원   | 형상관리     |
| 선지윤   | 문서관리     |
| 이상훈   | DB관리       |
| 신아림   | UI/UX 관리   |

---

## 사용 기술

### 프론트엔드
- Bootstrap 5  
- HTML5 / CSS3  
- jQuery / AJAX  
- Handlebars.js  
- **FullCalendar API**  
- **SignaturePad API**  
- **jsTree API**  
- **HTML2PDF API**
- **Mail API (SMTP)**  

### 백엔드
- Spring Boot 3  
- MyBatis  
- JSP / JSTL  
- Lombok  
- **CKEditor 5**  
- **Mail API (SMTP)**  
- **스케줄링 라이브러리**

### 데이터베이스
- Oracle 19c ATP

---

## 개발 환경 및 도구

| 분류         | 도구 및 환경                     |
|--------------|----------------------------------|
| IDE          | Eclipse 2025-03                  |
| DB 툴        | DBeaver                          |
| 협업 도구    | GitHub, Google Drive, Slack      |
| UI/UX 설계   | Figma                            |
| 테스트       | JUnit                            |
| 문서 작성    | MS Office                        |

---

## CI/CD & 배포
- **빌드 도구**: Maven  
- **CI/CD**: GitHub Actions  
- **컨테이너화**: Docker Hub  
- **서버 배포**: Tomcat

---

<h2>🗺 ERD (Entity Relationship Diagram)</h2>
<img src="https://drive.google.com/uc?export=view&id=1QaxjiS75WnE2ZikVfCP6MBi8o-KvjhZD" alt="ERD" width="700"/>
