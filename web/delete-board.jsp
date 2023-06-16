<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="domain.UserStatus" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-03
  Time: 오후 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  BoardRepository boardRepository = BoardRepository.getInstance();
  String id = request.getParameter("id");
  String loginName = (String) session.getAttribute("name");

%>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h2>삭제</h2>
</body>
</html>
