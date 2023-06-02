<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 2023-05-31
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="addBoard.jsp">
    <table>
        <tr>
            <td> 제목</td>
            <td> <input type="text" name="title" size="20" ></td>
        </tr>

        <tr>
            <td> 내용</td>
            <td> <input type="text" name="content" size="20" ></td>
        </tr>



        <tr>
            <td> <input type="submit" value="전송"> </td>
            <td> <input type="reset" value="취소"> </td>
        </tr>

    </table>
</form>
</body>
</html>
