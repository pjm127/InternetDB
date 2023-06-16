<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<html>
<head>
    <title>게시물</title>
</head>
<body>
<%
    // 게시물 ID 가져오기
    int boardId = Integer.parseInt(request.getParameter("board_id"));

    // BoardRepository 인스턴스 생성 및 게시물 가져오기
    BoardRepository boardRepository = BoardRepository.getInstance();
    Board board = boardRepository.getBoard(boardId);

    if (board != null) {
        // 게시물 정보 가져오기
        String title = board.getTitle();
        String content = board.getContent();
        String youtubeUrl = board.getYoutube();
        String imagePath = "img/" + board.getFilepath();
        int view = board.get
%>
<h1><%= title %>
</h1>
<p><%= content %>
</p>
<p>YouTube URL: <%= youtubeUrl %>
</p>
<img src="<%= imagePath %>" alt="Image">
<%
    } else {
        // 게시물이 존재하지 않을 경우 처리
        out.println("해당 게시물을 찾을 수 없습니다.");
    }
%>
</body>
</html>
