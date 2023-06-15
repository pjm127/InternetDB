<%@ page import="domain.Board" %>
<%@ page import="repository.BoardRepository" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-15
  Time: 오후 6:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<%
  request.setCharacterEncoding("utf-8");
  BoardRepository boardRepository = BoardRepository.getInstance();
  String title = request.getParameter("title");
  String content = request.getParameter("content");
  String youtube = request.getParameter("Youtube");
  String image = request.getParameter("image");

  System.out.println("image = " + title);
  System.out.println("image = " + content);


  Board board = new Board(title, content,youtube,image);
  Integer studentId = (Integer) session.getAttribute("studentId");
  boardRepository.save(board,studentId);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>성공</h2>
</body>
</html>
