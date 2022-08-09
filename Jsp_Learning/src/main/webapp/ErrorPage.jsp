 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error page</title>
</head>
<body>

<h1 style="text-align:center ; vertical-align: middle;">Error has been catched !!! </h1>

<p><%=exception.toString()%> </p>
</body>
</html> 