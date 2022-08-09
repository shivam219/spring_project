<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
page directive - 
-language 
-extends 
-import 
-contentType 
-pageEncoding
-session
-info
-autoFlush
-buffer
-isErrorPage
-errorPage
IsELIgnomd
include directive 
page

Include directive -
<%@include file="Hello_world.jsp"%>
 --%>
 <%@include file="Hello_world.jsp"%>
 <jsp:include page="Hello_world.jsp"></jsp:include>
 
</body>

</html>