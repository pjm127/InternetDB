<%@ page import="domain.Board" %>
<%@ page import="repository.BoardRepository" %><%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-15
  Time: 오후 6:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<%

  // 게시글의 사진 저장 경로를 가져온다고 가정하고 변수에 할당
  String imagePath = "src/main/resources/static/img/62.jpg";

  // imagePath를 사용하여 이미지를 표시



%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<img src="<%= request.getContextPath() %>/<%= imagePath %>" >
</body>
</html>
