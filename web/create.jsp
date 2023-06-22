<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--  Reseponsive meta  -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>NEOSHOCK</title>


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

<br>

<hr>
<!--  username input  -->
<div class="form-group">
    <!-- form tag using UserCreationForm with centered text with bootstrap5 library -->

    <form action="addBoard.jsp" method="POST" enctype="multipart/form-data">

        <div class="mb-3">
            <label class="form-label" for="id_title">제목</label>
            <input type="text" name="title" rows="1" maxlength="100" class="form-control"
                   placeholder="Enter the title of the article" required="" id="id_title">
        </div>

        <div class="mb-3"><label class="form-label" for="id_content">유튜브</label>
            <input name="youtubeUrl" class="form-control" placeholder="youtubeUrl" required="" id="id_content">
        </div>
        <div class="mb-3">
            <input type="file" name="photo">
        </div>
        <div class="mb-3"><label class="form-label" for="id_content">내용</label>
            <textarea name="content" cols="40" rows="10" class="form-control"
                      placeholder="Enter the description of the article" id="id_content">
            </textarea>
        </div>
        <input style="border-radius: 10rem; font-size: 1.25rem; margin-top: 1rem;
                          color: white; background-color: black; font-family: 'Do Hyeon';
                          margin: 2rem calc(50% - 5rem) 2rem calc(50% - 5rem); width: 10rem;
                          vertical-align: middle" class="btn btn-dark rounded-pill px-3 border border-secondary"
               type="submit" value="저장">
    </form>
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