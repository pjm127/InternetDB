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
  String title = request.getParameter("title");
  String content = request.getParameter("content");

  // 게시글 수정 로직
  Board board = boardRepository.getBoardById(Integer.valueOf(id));
  board.setTitle(title);
  board.setContent(content);
  boardRepository.update(Integer.parseInt(id),title,content);
%>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h2>수정</h2>

<p><a href="board.jsp?id=<%= board.getId() %>">수정된 게시글 보기</a></p>

</body>
</html>
