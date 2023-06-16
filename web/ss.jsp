<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    BoardRepository boardRepository = BoardRepository.getInstance();
    List<Board> boardList = boardRepository.getBoardList();

    for (Board board : boardList) {
        String imagePath = "img/" + board.getFilepath();
%>
<a href="board.jsp?board_id=<%= board.getId() %>">
    <p>파일 이름: <%= board.getFilepath() %>
    </p>
    <img src="<%= imagePath %>">
</a>
<%
    }
%>
</body>
</html>
