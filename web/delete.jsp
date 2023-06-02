<%@ page import="repository.BoardRepository" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");
  BoardRepository boardRepository = BoardRepository.getInstance();

  String id = request.getParameter("id");

  // 게시물 삭제 로직
  if (Objects.nonNull(id)) {
    boardRepository.delete(id);
  }
%>

<html>
<head>
  <title>Title</title>
</head>
<body>
<h2>게시물이 삭제되었습니다.</h2>
</body>
</html>
