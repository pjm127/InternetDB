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
<center>
    <h2>test01 table의 내용을 출력해 보자</h2>
    <table border="1" width="400">
        <tr>
            <th>NO</th>
            <th>NAME</th>
            <th>HDATE</th>
            <th>HDATE</th>
        </tr>
        <% for (Board board : boardList) { %>
        <tr>
            <td><a href="/board.jsp/<%= board.getId() %>"><%= board.getTitle() %></a></td>
            <td><%= board.getContent() %></td>
            <td><%= board.getCreate_date() %></td>
            <td>
                <form method="POST" action="/delete.jsp">
                    <input type="hidden" name="id" value="<%= board.getId() %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</center>
</body>
</html>
