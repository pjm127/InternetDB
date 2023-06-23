<%@ page import="domain.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="domain.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="repository.MemberRepository" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Comment" %>
<%@ page import="repository.CommentRepository" %>
<%@ page import="repository.HeartRepository" %>

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
    <div>
            <%
            request.setCharacterEncoding("utf-8");
            // 게시물 ID 가져오기
            int boardId = Integer.parseInt(request.getParameter("board_id"));

            // BoardRepository 인스턴스 생성 및 게시물 가져오기
            BoardRepository boardRepository = BoardRepository.getInstance();
            Board board = boardRepository.getBoard(boardId);
            MemberRepository memberRepository = MemberRepository.getInstance();
            CommentRepository commentRepository = CommentRepository.getInstance();
            Comment comment1 = commentRepository.getCommentByBoardId(boardId);
            List<Comment> commentList = commentRepository.getCommentList(boardId);

            // 세션에서 학생 ID 가져오기
            int sessionStudentId = (Integer) session.getAttribute("studentId");


            int sessionMemberId = memberRepository.getMemberIdByStudentId(sessionStudentId); // 세션 학번으로 member_id
            String memRoleByStudentId = memberRepository.getMemRoleByStudentId(sessionStudentId); // 세션 학번으로 권한
            String memberNameByStudentId = memberRepository.getMemberNameByStudentId(sessionStudentId); // 세션 학번으로 member_name

            HeartRepository heartRepository = HeartRepository.getInstance();
            String name = (String) session.getAttribute("username");

        %>
        <!-- Page content -->
        <div>

            <ul class="nav justify-content-end m-3" style="font-size: 0.8rem; font-family: 'Open Sans', sans-serif;">
                <li>
                <li class="nav-item" style="margin-right: 10px;">

                    <a class="nav-item btn btn-sm btn-warning rounded-pill py-2" style="color: inherit">
                        <strong><%=name %>
                        </strong>
                    </a>

                </li>
                <li>
                <li class="nav-item" onclick="location.href='create.jsp'">
                    <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
                       href="create.jsp">
                        작성
                    </a>
                </li>

                <li class="nav-item" onclick="location.href='joinMember.html'">
                    <a class="nav-item btn btn-sm btn-warning rounded-pill py-2" style="color: inherit;"
                       href="logout.jsp">
                        <strong>로그아웃</strong>
                    </a>
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
                <%= board.getTitle() %>
            </h1>
        </div>

        <div style="text-align: center">

            <div style="text-align: center">
                <p style="text-align: center; vertical-align: bottom; display: inline-block;
            font-family: 'Do Hyeon', sans-serif; font-size: 1.0rem; color:black;
             margin: 0.3rem 0.6rem 0.3rem 0rem;">작성자</p>&nbsp;


                <p style="text-align: center; vertical-align: bottom; display: inline-block;
            font-family: 'Do Hyeon', sans-serif; font-size: 1.2rem; color: inherit;
             margin: 0.3rem 0.6rem 0.3rem 0rem;">
                    <%= board.getWriter() %>
                </p>
                <div style="text-align: Right">
                    <p style="text-align: center; vertical-align: bottom; display: inline-block;
            font-family: 'Do Hyeon', sans-serif; font-size: 1.0rem; color:black;
             margin: 0.3rem 0.6rem 0.3rem 0rem;"> <%= board.getCreate_date() %>
                </div>
            </div>

            <hr>
            <div class="form_class_max_800px" align="center">

                <% String imagePath = "img/" + board.getFilepath(); %>
                <a>
                    <img src="<%= imagePath %>" onclick="window.location.href='<%=board.getYoutube()%>';">
                </a>

                <br>
                <br>
                <div>
                    <p style="text-align: center; font-family: 'Do Hyeon', sans-serif; font-size: 1.5rem; color:black;"><%=board.getContent()%>
                    </p>
                </div>
                <hr>
                <div class="text-right">
                    <br>
                    <% if (board.getWriter().equals(memberNameByStudentId) || memRoleByStudentId.equals("ADMIN")) { %>
                    <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
                       href="modify.jsp?board_id=<%= boardId %>">수정</a>
                    <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
                       href="delete.jsp?board_id=<%= boardId %>">삭제</a>


                    <% } else { %>
                    <button class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
                            disabled>
                        수정
                    </button>
                    <button class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
                            disabled>
                        삭제
                    </button>
                    <% } %>

                </div>


                <p style="margin-top: 3rem">


                </p>


                <div style="text-align: center; margin: 2rem; margin-bottom: 1rem">
                    <a href="#" onclick="redirectToHeartPage()">
        <span class="upvote_button">
            <i style="font-size: 2rem !important; vertical-align: middle; color: #ff6e78" class="material-icons">favorite</i>
            <span style="font-family: 'Noto Sans KR', serif; font-weight: 700" class="upvote_count">
                <%= heartRepository.countHeart(boardId) %>
            </span>
        </span>
                    </a>
                    <br>
                    <p style="text-align: center; vertical-align: bottom; display: inline-block;
            font-family: 'Do Hyeon', sans-serif; font-size: 1.0rem; color:black;
             margin: 0.3rem 0.6rem 0.3rem 0rem;">조회수 <%=board.getView() %>
                    </p>

                    </p>
                </div>

                <script>
                    function redirectToHeartPage() {
                        var boardId = '<%= boardId %>';
                        var url = '/heart.jsp?board_id=' + boardId;
                        window.location.href = url;
                    }
                </script>


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
                    <%
                for (Comment comment : commentList) { %>
                <div class="comment">
                    <div>
                        <p style="text-align: center; vertical-align: bottom; display: inline-block;
            font-family: 'Do Hyeon', sans-serif; font-size: 1.2rem; color: black;
             margin: 0.3rem 0.6rem 0.3rem 0rem;">
                            <%= board.getWriter() %>
                        </p>

                        <p style="text-align: center; vertical-align: bottom; display: inline-block;
            font-family: 'Do Hyeon', sans-serif; font-size: 1.0rem; color:black;
             margin: 0.3rem 0.6rem 0.3rem 0rem;"><%= comment.getCreate_date()%>&nbsp;</p>


                        <p>
                            <%= comment.getContent() %>
                        </p>

                        <!-- Add any other information or styling for each comment here -->

                        <!-- 수정 버튼 -->
                        <form action="comment_modify.jsp?comment_id=<%= comment.getId() %>" method="POST">
                            <div id="textarea<%= comment.getId() %>" style="display: none;">
                            <textarea name="content" cols="20" rows="4" class="form-control bg-light"
                                      style="color: inherit" placeholder="Enter the description of the comment"
                                      required="" id="id_content"></textarea>

                                <input type="submit" class="btn btn-dark rounded-pill px-2 border border-secondary"
                                       style="color: white; float: right;" name="submit" value="수정완료">


                            </div>

                        </form>

                        <% if (comment.getWriter().equals(memberNameByStudentId) || memRoleByStudentId.equals("ADMIN")) { %>
                        <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
                           href="#" onclick="showTextarea('<%= comment.getId() %>')">수정</a>
                        <% } %>
                        <%--                    <% if (comment.getWriter().equals(memberNameByStudentId) || memRoleByStudentId.equals("ADMIN")) { %>--%>
                        <%--                    <a id="modify" class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"--%>
                        <%--                    >수정</a>--%>
                        <%--                    <% } %>--%>


                        <!-- 삭제 버튼 -->
                        <% if (comment.getWriter().equals(memberNameByStudentId) || memRoleByStudentId.equals("ADMIN")) { %>
                        <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
                           href="comment_delete.jsp?comment_id=<%= comment.getId() %>">삭제</a>


                        <% } %>
                        <hr>
                        <br>
                        <div id="myDIV" style="display:none">
                            <div class="mb-3">
                                <form action="comment_modify.jsp" method="post">
                                    <input type="hidden" name="comment_id" value="<%= comment.getId() %>">
                                    <textarea name="content" cols="40" rows="4" class="form-control bg-light"
                                              style="color: inherit"
                                              placeholder="Enter the description of the comment" required=""
                                              id="id_content"></textarea>
                                    <button type="submit"
                                            class="btn btn-dark rounded-pill px-2 border border-secondary">완료
                                    </button>
                                </form>
                            </div>
                        </div>
                        <% } %>
                        <br>

                    </div>

                    <%--                <script>--%>
                    <%--                    document.getElementById("modify").addEventListener("click", modify);--%>

                    <%--                    function modify() {--%>
                    <%--                        var con = document.getElementById("myDIV");--%>
                    <%--                        if (con.style.display == 'none') {--%>
                    <%--                            con.style.display = 'block';--%>
                    <%--                        } else if (con.style.display == 'block') {--%>
                    <%--                            con.style.display = 'none';--%>
                    <%--                        }--%>
                    <%--                    }</script>--%>
                    <script type="text/javascript">
                        function showTextarea(commentId) {
                            var textareaDiv = document.getElementById("textarea" + commentId);
                            if (textareaDiv.style.display == 'none') {
                                textareaDiv.style.display = "block";
                            } else {
                                textareaDiv.style.display = "none";
                            }
                        }
                    </script>

                    <div class="comment_create">
                        <form action="comment.jsp?board_id=<%= boardId %>" method="post">
                            <input type="hidden" name="csrfmiddlewaretoken"
                                   value="UebCH2LreLw5WaXlnentL9kKMJv0BciBJeWVDCmmGY3vlnR850mNotktWCQnvTLf">
                            <div class="mb-3"><textarea name="content" cols="40" rows="4"
                                                        class="form-control bg-light"
                                                        style="color: inherit"
                                                        placeholder="Enter the description of the comment"
                                                        required="" id="id_content"></textarea></div>

                            <div class="text-right">
                                <!-- Button with dark background and trailing send icon from material icon -->
                                <button type="submit" class="btn btn-dark btn-sm">
                                    <i class="material-icons"
                                       style="color: white; font-size: 1.5rem; vertical-align: middle">
                                        send</i>
                                    Comment
                                </button>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="drawer-overlay drawer-toggle"></div>
</body>
</html>