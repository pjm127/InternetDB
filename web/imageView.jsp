<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-06-15
  Time: 오후 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%=application.getContextPath()%>
<%= request.getSession().getServletContext().getRealPath("/")%>

<img src="img/626.jpg">
</body>
</html>
