<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-05-31
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    BoardRepository boardRepository = BoardRepository.getInstance();
    List<Board> boardList = boardRepository.getBoard();
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
