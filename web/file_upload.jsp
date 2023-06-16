<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String savePath = "C:\\Users\\mikey\\Desktop\\InternetDBHw\\web\\img";
  String file = "";
  String oriFile = "";
  int sizeLimit = 5 * 1024 * 1024;
  System.out.println(savePath);

  MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
  Enumeration files = multi.getFileNames();
  String name = (String) files.nextElement();

  file = multi.getFilesystemName(name);
  oriFile = multi.getOriginalFileName(name);
%>

<html>
<head>
  <title>File Upload</title>
</head>
<body>
<h2>파일 업로드 성공</h2><br/>
파일 저장 위치 : <%= savePath%><br/>
파일 저장 이름 : <%= file%><br/>
파일 원본 이름 : <%= oriFile%>
</body>
</html>
