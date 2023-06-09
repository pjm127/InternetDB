<%@ page import="repository.BoardRepository" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="domain.Board" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%
    request.setCharacterEncoding("utf-8");
    int boardId = Integer.parseInt(request.getParameter("board_id"));

    // MemberRepository 인스턴스 생성 및 회원 ID 및 권한 가져오기

    BoardRepository boardRepository = BoardRepository.getInstance();
    Board board = boardRepository.getBoard(boardId);
    String title = board.getTitle();
    String content = board.getContent();
    String youtube = board.getYoutube(); //유튜브경로
    String filepath = board.getFilepath(); //사진경로


%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--  Reseponsive meta  -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>NEOSHOCK</title>

    <!-- AXIOS LINK FROM STATIC -->
    <script src="/static/js/axios.min.js"></script>

    <!-- BOOTSTRAP CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>


    <link rel="stylesheet" type="text/css" href="/static/articleapp/base.css">
    <link rel="stylesheet" type="text/css" href="/static/base.css">
    <link rel="stylesheet" type="text/css" href="/static/pagination.css">

    <!-- GOOGLE FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&amp;family=Nanum+Myeongjo:wght@800&amp;display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Song+Myung&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&amp;display=swap"
          rel="stylesheet">


    <style>
        .active {
            z-index: 0;
        }
    </style>
</head>


<!-- body with max width 1080-->
<body style="max-width: 1080px; margin: 0 auto;" class="drawer drawer--left drawer-close">


<!-- Page content -->
<div>
    <ul class="nav justify-content-end m-3" style="font-size: .8rem;font-family: 'Open Sans', sans-serif;">

        <li class="nav-item">
            <a class="nav-item btn btn-sm btn-warning rounded-pill py-2" style="color: inherit"
               href="logout.jsp">로그아웃</a>
        </li>


    </ul>
</div>

<hr class="my-0" style="visibility: hidden">


<div style="width: 100%; text-align: center;">
    <a style="font-family: 'Abril Fatface', cursive; font-size: 3rem; color: inherit;" href="main_log.jsp">
        NEOSHOCK
    </a>
</div>


<div class="form_class_max_800px">

    <!--  username input  -->
    <div class="form-group">
        <!-- form tag using UserCreationForm with centered text with bootstrap5 library -->

        <form action="update-process.jsp?board_id=<%= boardId %>" method="POST" enctype="multipart/form-data">

            <input type="hidden" name="csrfmiddlewaretoken"
                   value="SNdNKgLAwrScU9c1txNucOQxU4QCrCKbXmKSbxTYNEAuqDZ7tvUqW9uKiunOrR9c">
            <%--            <div class="mb-3">--%>
            <%--                <label class="form-label" for="id_title">제목</label>--%>

            <%--                <input type="text" name="title" rows="1" maxlength="100" class="form-control"--%>
            <%--                       placeholder="Enter the title of the article" required="" id="id_title">--%>

            <%--            </div>--%>
            <div class="mb-3">
                <label class="form-label" for="id_title">제목</label>
                <input type="text" name="title" rows="1" maxlength="100" class="form-control"
                       placeholder="Enter the title of the article" required="" id="id_title"
                       value="<%= title %>">
            </div>

            <div class="mb-3">
                <label class="form-label" for="id_content">유튜브</label>
                <input type="text" name="youtube" class="form-control" placeholder="YouTube link"
                       required="" id="id_content" value="<%= youtube %>">
            </div>

            <input type="file" name="image" accept="image/*" class="form-control"
                   placeholder="Enter the image of the article" style="border: none; height: auto;" required=""
                   id="id_image" value="<%= filepath %>">

            <div class="mb-3">
                <label class="form-label" for="id_content">내용</label>
                <textarea name="content" cols="40" rows="10" class="form-control"
                          placeholder="Enter the description of the article" id="id_content">
        <%= content %>
    </textarea>
            </div>

            <input style="border-radius: 10rem; font-size: 1.25rem; margin-top: 1rem;
                          color: white; background-color: black; font-family: 'Do Hyeon';
                          margin: 2rem calc(50% - 5rem) 2rem calc(50% - 5rem); width: 10rem;
                          vertical-align: middle" class="btn" type="submit" value="수정">
        </form>
    </div>
</div>

<script>
    document.getElementById('id_image').onchange = function () {
        var maxFileSize = 4 * 1024 * 1024;  // 4MB in bytes
        if (this.files[0].size > maxFileSize) {
            alert("The maximum file size that can be uploaded is 4MB. Please select a smaller file.");
            this.value = "";  // Reset the file input
        }
    };


</script>


<hr class="my-4">

<style>
    body {
        background-color: #f2f2f2;
        color: #222;
    }

    .dark-mode {
        background-color: #222;
        color: #f2f2f2;
    }

</style>


<div class="drawer-overlay drawer-toggle"></div>
</body>
</html>