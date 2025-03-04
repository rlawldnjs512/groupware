<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.URLEncoder" %>
<%
    request.setCharacterEncoding("UTF-8");

    String certNum = request.getParameter("cert_num");

    String certType = request.getParameter("certificateType");
    String filePath = "/DATA/CERT/";

    if ("재직".equals(certType)) {
        filePath += "재직/";
    } else if ("경력".equals(certType)) {
        filePath += "경력/";
    } else if ("퇴직".equals(certType)) {
        filePath += "퇴직/";
    } else {
        out.println("<script>alert('잘못된 요청입니다.'); history.back();</script>");
        return;
    }

    String fileName = certNum + ".pdf";
    String fullPath = filePath + fileName;

    File file = new File(fullPath);

    if (file.exists() && file.isFile()) {
        response.setContentType("application/pdf");
        response.setContentLength((int) file.length());

        // 파일명 인코딩 (공백 처리)
        String encodedFileName = URLEncoder.encode(fileName, "UTF-8").replace("+", "%20");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

        try (FileInputStream fileInputStream = new FileInputStream(file);
             OutputStream outStream = response.getOutputStream()) {

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }
            outStream.flush();
        } catch (IOException e) {
            out.println("<script>alert('파일 다운로드 중 오류가 발생했습니다.'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('파일이 존재하지 않습니다.'); history.back();</script>");
    }
%>
