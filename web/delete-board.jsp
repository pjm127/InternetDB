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
  String loginNmae = (String) session.getAttribute("name");

  // 작성자 ID와 로그인한 ID 비교 후 삭제 로직
  try {
    Board board = boardRepository.getBoardById(Integer.valueOf(id));
    if (board != null && board.getWriter().equals(loginNmae)) {
      boardRepository.delete(Integer.valueOf(id));
    } else {

      throw new RuntimeException("삭제할 수 없습니다.");
    }
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
