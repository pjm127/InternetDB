<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-03
  Time: 오후 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
  BoardRepository boardRepository = BoardRepository.getInstance();
  String id = request.getParameter("id");
  // 게시글 수정 로직
  try {
    boardRepository.delete(Integer.valueOf(id));
  } catch (SQLException e) {
    throw new RuntimeException(e);
  }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>삭제</h2>
</body>
</html>
