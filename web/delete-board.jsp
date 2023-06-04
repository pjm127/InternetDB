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
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
  BoardRepository boardRepository = BoardRepository.getInstance();
  String id = request.getParameter("id");
  String loginName = (String) session.getAttribute("name");
  UserStatus userStatus = (UserStatus) session.getAttribute("userStatus");

  // 작성자 이름과 로그인한 계정 이름 비교 및 관리자계정은 삭제 가능
  try {
    Board board = boardRepository.getBoardById(Integer.valueOf(id));
    if (board != null) {
      if (board.getWriter().equals(loginName) || userStatus == UserStatus.ADMIN) {
        boardRepository.delete(Integer.valueOf(id));
      } else {
        throw new RuntimeException("삭제할 수 없습니다.");
      }
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
