<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
        int view = board.getView();
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--  Reseponsive meta  -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>NEOSHOCK</title>


    <!-- BOOTSTRAP CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>


    <link rel="stylesheet" type="text/css" href="/static/articleapp/base.css">
    <link rel="stylesheet" type="text/css" href="/static/base.css">
    <link rel="stylesheet" type="text/css" href="/static/pagination.css">

    <!-- GOOGLE FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
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

<main role="main">


    <!-- Page content -->
    <div>
        <ul class="nav justify-content-end m-3" style="font-size: .8rem;font-family: 'Open Sans', sans-serif;">
            <li class="nav-item">
                <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
                   href="create.jsp">작성</a>
            </li>
            <li class="nav-item">
                <a class="nav-item btn btn-sm btn-warning rounded-pill py-2" style="color: inherit" href="logout.jsp">로그아웃</a>
            </li>

        </ul>
    </div>

    <hr class="my-0" style="visibility: hidden">


    <div style="width: 100%; text-align: center;">
        <a style="font-family: 'Abril Fatface', cursive; font-size: 3rem; color: inherit;" href="main_log.jsp">
            NEOSHOCK
        </a>
    </div>

    <br>

    <!--<div class="d-none d-sm-block">-->
    <hr>
    <div class="container">

        <h1 style=" text-align: center;
        font-family: 'Song Myung', sans-serif;
        font-weight: 600; font-size: 2rem;
        margin: 2.5rem 0rem .5rem 0rem">
            제목
        </h1>
    </div>

    <div style="text-align: center">

        <div style="text-align: center; box-shadow: #d4d4d4 0px 0px 5px; border-radius: 1rem;
            display: inline-block;" class="mx-2">
            <a href="/accounts/detail/5a9eb383-61f8-4b06-a68c-2f50121f4377">

                <img style="display: inline-block;    width: 2rem; height: 2rem; object-fit: cover;
                    border-radius: 10px; box-shadow: #cccccc 0px 0px 5px;
                     margin: .3rem; vertical-align: top" src="
                     
                     /static/articleapp/images/default.png
                     
                     " alt="">


                <p style="text-align: center; vertical-align: bottom; display: inline-block;
            font-family: 'Do Hyeon', sans-serif; font-size: 1.2rem; color: inherit;
             margin: 0.3rem 0.6rem 0.3rem 0rem;">
                    사용자ID
                </p>
            </a>
        </div>
    </div>
    <hr>
    <div class="form_class_max_800px">


        <img style="width: 100%" src="cat.png" alt="">


        <div class="text-right">
            <br>
            <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
               href="modify.jsp">수정</a>
            <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
               href="delete.jsp">삭제</a>
        </div>

        <p style="margin-top: 3rem">

            <br>

        </p>


        <div style="text-align: center; margin: 2rem; margin-bottom: 1rem">
            <a href="/likes/article/c0d5b8da-2cd9-4fac-ad4d-28a91004f21e/like/">
                <span class="upvote_button">
                
                <i style="font-size: 2rem !important; vertical-align: middle;
                    color: #ff6e78" class="material-icons">favorite</i>
                
                    <span style="font-family: 'Noto Sans KR', serif; font-weight: 700" class="upvote_count">0</span>
                </span>
            </a>
        </div>


    </div>

    <hr>

    <!-- Comment section -->
    <div class="comment_section form_class_max_800px">
        <div class="comment_title">
            <h3 style="font-family: 'Do Hyeon'; font-weight: 700; font-size: 1.5rem; margin-bottom: 1rem">
                Comments
            </h3>
        </div>

        <div class="comment_list">

        </div>

        <div class="comment_create">
            <form action="/comments/create/5926899" method="post">
                <input type="hidden" name="csrfmiddlewaretoken"
                       value="UebCH2LreLw5WaXlnentL9kKMJv0BciBJeWVDCmmGY3vlnR850mNotktWCQnvTLf">
                <div class="mb-3"><textarea name="content" cols="40" rows="4" class="form-control bg-light"
                                            style="color: inherit" placeholder="Enter the description of the comment"
                                            required="" id="id_content"></textarea></div>

                <div class="text-right">
                    <!-- Button with dark background and trailing send icon from material icon -->
                    <button type="submit" class="btn btn-dark btn-sm">
                        <i class="material-icons" style="color: white; font-size: 1.5rem; vertical-align: middle">
                            send</i>
                        Comment
                    </button>
                </div>
            </form>
        </div>
    </div>
    </div>


    <div class="drawer-overlay drawer-toggle"></div>
</body>
</html>