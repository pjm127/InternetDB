<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.Enumeration" %>
<html>
<head>
    <title>게시물 수정</title>
</head>
<body>
<%

    request.setCharacterEncoding("utf-8");
    int boardId = Integer.parseInt(request.getParameter("board_id"));
    BoardRepository boardRepository = BoardRepository.getInstance();
    int sessionId = (Integer) session.getAttribute("studentId");

    String savePath = "C:\\Users\\mikey\\Desktop\\InternetDBHw\\web\\img";
    String file = "";
    String oriFile = "";
    int sizeLimit = 5 * 1024 * 1024;

    MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
    String title = multi.getParameter("title");
    String content = multi.getParameter("content");
    Board board = new Board(title, content);
    Enumeration files = multi.getFileNames();
    if (files.hasMoreElements()) {
        String name = (String) files.nextElement();
        file = multi.getFilesystemName(name);
        oriFile = multi.getOriginalFileName(name);
        board.setFilepath(file);
    }

    // 유튜브 URL 처리
    String youtubeUrl = multi.getParameter("youtubeUrl");
    board.setYoutube(youtubeUrl);

    // 게시물 수정

    boardRepository.update(boardId, title, content, file, youtubeUrl);

    // 수정 완료 메시지 출력
    out.println("게시물이 성공적으로 수정되었습니다.");
    }
    else
    {
    // 게시물이 존재하지 않을 경우 처리
    out
    .
    println
    (
    "해당 게시물을 찾을 수 없습니다."
    )
    ;
    }
%>
</body>
</html>
