<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="repository.BoardRepository" %>
<%@ page import="domain.Board" %>
<%@ page import="java.util.List" %>
<%
    String name = (String) session.getAttribute("username");

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
    <link rel="stylesheet" type="text/css" href="style.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>

    <link rel="stylesheet" type="text/css" href="/static/articleapp/base.css">
    <link rel="stylesheet" type="text/css" href="/static/base.css">


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
            <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white" href="create.jsp">
                작성
            </a>
        </li>
        <li class="nav-item" onclick="location.href='joinMember.html'">
            <a class="nav-item btn btn-sm btn-warning rounded-pill py-2" style="color: inherit;" href="logout.jsp">
                <strong> 로그아웃</strong>
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
<hr>
<!-- Masonry image using magicgrid library -->
<!-- Style -->
<style>
    .container div {
        width: 40%;
        max-width: 240px;
        max-height: 1000px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container img {
        max-width: 100%;
        border-radius: 1.5rem;
        min-height: 160px;
        object-fit: cover;
    }

    .outer_card div {
        height: auto;
        width: auto;
    }

</style>


<style>
    /* HORIZONTAL SCROLL */
    .scroll-container {
        overflow: auto;
        white-space: nowrap;
        padding: 5px 70px 5px 20px;
        background: transparent;
        height: 15rem;
        border-radius: 15px;
        -ms-overflow-style: none; /* IE and Edge */
        scrollbar-width: none; /* Firefox */
    }

    .scroll-container::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
    }

    .gridscroll {
        display: inline-block;
    }

</style>

<script>
    var $grid = $('.all_wrap').imagesLoaded(function () {
        $grid.masonry({
            itemSelector: '.grid-item',
            fitwidth: true
        });
    });
    $('.all_wrap').masonry({
        // options...
        itemSelector: '.grid-item',
        fitwidth: true
    });
</script>

<div class="container"
     style="max-width: 1080px; margin: 2rem 0px 0px; padding: 0px; position: relative; height: 1080px;">

    <%
        BoardRepository boardRepository = BoardRepository.getInstance();
        List<Board> boardList = boardRepository.getBoardList();
        int count = 0;
    %>
    <table align="center">
        <tr>
            <% for (Board board : boardList) {
                count++;
                String imagePath = "img/" + board.getFilepath();

            %>
            <td>
                <a href="view.jsp?board_id=<%= board.getId() %>">
                    <img src="<%= imagePath %>">
                </a>
            </td>
            <% if (count % 3 == 0) { %>
        </tr>
        <tr>
            <% } %>
            <% } %>
        </tr>
    </table>
    <%
    %>
    <div class="outer_card" style="position: absolute; transform: translate(108px, 0px);">
        <a href="view.jsp? member_id=member_id">


    </div>
</div>


<!-- article create button -->
<div class="d-flex justify-content-center">
    <ul class="nav justify-content-end m-3" style="font-size: 0.8rem; font-family: 'Open Sans', sans-serif;">


        <li class="nav-item">
            <a class="btn btn-dark rounded-pill px-3 border border-secondary" style="color: white"
               href="create.jsp">작성</a>
        </li>
    </ul>
</div>

<hr>

<div class="text-center mt-4">

    <!-- main_horizontal_fixed -->
    <ins class="adsbygoogle" style="display:inline-block;width:500px;height:90px"
         data-ad-client="ca-pub-9402609902262093" data-ad-slot="1480343918">
        <iframe id="aswift_0"
                style="height: 1px !important; max-height: 1px !important; max-width: 1px !important; width: 1px !important;">
            <iframe id="google_ads_frame0"></iframe>
        </iframe>
    </ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
</div>

<script>

    function add_article_box(article_uuid) {
        var modal_title = document.getElementById('modal-title');
        var modal_body = document.getElementById('modal-body');

        var title = "Select Box";
        modal_title.innerHTML = title;


        var body_data = "";


        modal_body.innerHTML = body_data;


    }

    function add_article_axios(box_pk, article_uuid) {
        axios({
            method: 'post',
            url: '/articleboxes/add/' + box_pk + '/' + article_uuid + '/',
            headers: {
                'X-CSRFToken': 'KuOiiSvmYN6dEPRGWSlaRtdfO0z4sy00P3lnJ9DKf0OvajEMWQs6BORscq6gsNp1'
            },
        })
            .then(function (response) {
                var toast_body = document.getElementById('toast-body');
                toast_body.setAttribute('class', 'toast align-items-center text-bg-success border-0');
                document.getElementById('toast-content').innerText = "Article added to box Successfully";
                const toast = new bootstrap.Toast(toast_body);
                toast.show();
            })
            .catch(function (error) {
                var toast_body = document.getElementById('toast-body');
                toast_body.setAttribute('class', 'toast align-items-center text-bg-danger border-0');
                document.getElementById('toast-content').innerText = "Failed to add article to box";
                const toast = new bootstrap.Toast(toast_body);
                toast.show();
            });
    }

    function remove_article_axios(box_pk, article_uuid, target) {
        axios({
            method: 'post',
            url: '/articleboxes/remove/' + box_pk + '/' + article_uuid + '/',
            headers: {
                'X-CSRFToken': 'KuOiiSvmYN6dEPRGWSlaRtdfO0z4sy00P3lnJ9DKf0OvajEMWQs6BORscq6gsNp1'
            },
        })
            .then(function (response) {
                var toast_body = document.getElementById('toast-body');
                toast_body.setAttribute('class', 'toast align-items-center text-bg-success border-0');
                document.getElementById('toast-content').innerText = "Article removed from box Successfully";
                const toast = new bootstrap.Toast(toast_body);
                toast.show();
            })
            .catch(function (error) {
                var toast_body = document.getElementById('toast-body');
                toast_body.setAttribute('class', 'toast align-items-center text-bg-danger border-0');
                document.getElementById('toast-content').innerText = "Failed to remove article from box";
                const toast = new bootstrap.Toast(toast_body);
                toast.show();
            });
    }

</script>

<!-- Script -->
<script src="/static/articleapp/aowlrrmflem.js"></script>
<script>
    var _0x2c134c = _0x2789;
    (function (_0x3eced6, _0x5719b2) {
        var _0xc748e4 = _0x2789, _0x13836f = _0x3eced6();
        while (!![]) {
            try {
                var _0x5d51ac = parseInt(_0xc748e4(0x17a)) / 0x1 + parseInt(_0xc748e4(0x17b)) / 0x2 + -parseInt(_0xc748e4(0x17c)) / 0x3 + parseInt(_0xc748e4(0x17e)) / 0x4 + parseInt(_0xc748e4(0x176)) / 0x5 * (parseInt(_0xc748e4(0x178)) / 0x6) + parseInt(_0xc748e4(0x180)) / 0x7 + -parseInt(_0xc748e4(0x177)) / 0x8;
                if (_0x5d51ac === _0x5719b2) break; else _0x13836f['push'](_0x13836f['shift']());
            } catch (_0x574560) {
                _0x13836f['push'](_0x13836f['shift']());
            }
        }
    }(_0x216a, 0xd84b7));

    function _0x216a() {
        var _0x39c2b6 = ['listen', 'length', 'getElementsByTagName', 'complete', '1025wIDAIG', '4923352HhvUNM', '13194CMFWiT', 'addEventListener', '737710JOtWvJ', '1287056DLFrgb', '3976794gaJZCt', '.container', '2322384XFeZRy', 'img', '2900317nGCgAD', 'positionItems'];
        _0x216a = function () {
            return _0x39c2b6;
        };
        return _0x216a();
    }

    var magicGrid = new MagicGrid({
        'container': _0x2c134c(0x17d),
        'animate': ![],
        'gutter': 0x14,
        'static': !![],
        'useMin': !![]
    });
    magicGrid[_0x2c134c(0x182)]();
    var masonrys = document[_0x2c134c(0x174)](_0x2c134c(0x17f));
    for (let i = 0x0; i < masonrys[_0x2c134c(0x173)]; i++) {
        masonrys[i][_0x2c134c(0x175)] === !![] ? magicGrid[_0x2c134c(0x181)]() : masonrys[i][_0x2c134c(0x179)]('load', function () {
            magicGrid['positionItems']();
        }, ![]);
    }

    function _0x2789(_0x130308, _0x1e5803) {
        var _0x216a34 = _0x216a();
        return _0x2789 = function (_0x278956, _0x20d3e6) {
            _0x278956 = _0x278956 - 0x173;
            var _0x3ca371 = _0x216a34[_0x278956];
            return _0x3ca371;
        }, _0x2789(_0x130308, _0x1e5803);
    }

    for (let j = 0x0; j < 0xa; j++) {
        setInterval(magicGrid[_0x2c134c(0x181)], 0x7d0);
    }
</script>


<script>
    var scroll_container = document.getElementsByClassName('scroll-container');

    for (var i = 0; i < scroll_container.length; i++) {

        const slider = scroll_container[i];
        const preventClick = (e) => {
            e.preventDefault();
            e.stopImmediatePropagation();
        }
        let isDown = false;
        var isDragged = false;
        let startX;
        let scrollLeft;

        slider.addEventListener("mousedown", e => {
            isDown = true;
            slider.classList.add("active");
            startX = e.pageX - slider.offsetLeft;
            scrollLeft = slider.scrollLeft;
        });
        slider.addEventListener("mouseleave", () => {
            isDown = false;
            slider.classList.remove("active");
        });
        slider.addEventListener("mouseup", () => {
            isDown = false;
            const elements = document.getElementsByClassName("fav_image");
            if (isDragged) {
                for (let i = 0; i < elements.length; i++) {
                    elements[i].addEventListener("click", preventClick);
                }
            } else {
                for (let i = 0; i < elements.length; i++) {
                    elements[i].removeEventListener("click", preventClick);
                }
            }
            slider.classList.remove("active");
            isDragged = false;
        });
        slider.addEventListener("mousemove", e => {
            if (!isDown) return;
            isDragged = true;
            e.preventDefault();
            const x = e.pageX - slider.offsetLeft;
            const walk = x - startX;
            slider.scrollLeft = scrollLeft - walk;
        });
    }
</script>


<script>
    function show_toast(message, type) {
        var toast_body = document.getElementById('toast-body');
        if (type == 'error') {
            toast_body.setAttribute('class', 'toast align-items-center text-bg-danger border-0');
        } else if (type == 'success') {
            toast_body.setAttribute('class', 'toast align-items-center text-bg-success border-0');
        } else if (type == 'warning') {
            toast_body.setAttribute('class', 'toast align-items-center text-bg-warning border-0');
        } else {
            toast_body.setAttribute('class', 'toast align-items-center text-bg-info border-0');
        }
        document.getElementById('toast-content').innerText = message;
        const toast = new bootstrap.Toast(toast_body, {delay: 2000});
        toast.show();
    }
</script>


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