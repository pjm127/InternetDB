<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("utf-8");
    session.removeAttribute("username");
    session.removeAttribute("studentId");
    String user_id = (String) session.getAttribute("username");
    String user_pw = (String) session.getAttribute("studentId");

    out.println("설정된 세션 이름 username : " + user_id + "<br>");
    out.println("설정된 세션 값 studentId : " + user_pw + "<br>");
%>



<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>

    
<style>
body {
  background-color: #f2f2f2;
  color: #222;
}



</style>

</head>
<body>
<h1>로그아웃 되었습니다.</h1>
<a href="main_unlog.jsp" style="font-size: 25px">메인 페이지로 돌아가기</a>
</body>
</html>