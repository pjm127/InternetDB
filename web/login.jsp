<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ page import="repository.MemberRepository" %>
<%@ page import="config.Encrypt" %>
<%@ page import="domain.LoginFormBean" %>
<%@ page import="java.io.PrintWriter" %>

<%
  request.setCharacterEncoding("utf-8");
  MemberRepository memberRepository = MemberRepository.getInstance();
  Encrypt en = Encrypt.getInstance();

  LoginFormBean loginForm = new LoginFormBean();
  loginForm.setName(request.getParameter("name"));
  loginForm.setStudentId(Integer.parseInt(request.getParameter("studentId")));
  loginForm.setPassword(request.getParameter("password"));

  int result = memberRepository.login(loginForm.getName(), loginForm.getPassword(), loginForm.getStudentId());
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인 액션</title>
</head>
<body>
<h2>Result: <%= result %>
</h2>

<%
  if (result == 1) { // 비밀번호 맞을때
    session.setAttribute("username", loginForm.getName());
    session.setAttribute("studentID", loginForm.getStudentId());
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href='main_log.jsp'"); // mainpage로 이동
    script.println("</script>");


  } else if (result == 0) { // 비밀번호 틀릴때
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('비밀번호가 틀립니다.')");  // mainpage로 이동
    script.println("history.back()"); // 다시 로그인 페이지로 보낸다. 전 페이지
    script.println("</script>");
  } else if (result == -1) { // 아이디 존재하지 않을때
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('존재하지 않는 아이디입니다.')");  // mainpage로 이동
    script.println("history.back()"); // 다시 로그인 페이지로 보낸다. 전 페이지
    script.println("</script>");
  } else if (result == -2) { // 데이터베이스 오류 발생
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('데이터베이스 오류가 발생하였습니다.')");  // mainpage로 이동
    script.println("history.back()"); // 다시 로그인 페이지로 보낸다. 전 페이지
    script.println("</script>");
  }

  session.setAttribute("username", loginForm.getName());
  session.setAttribute("studentId", loginForm.getStudentId());
%>

</body>
</html>
