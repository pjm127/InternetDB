<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-03
  Time: 오후 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  BoardRepository boardRepository = BoardRepository.getInstance();
  String id = request.getParameter("id");
  Board board = boardRepository.getBoardById(Integer.valueOf(id));
%>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h2>게시글 수정</h2>


</body>
</html>
