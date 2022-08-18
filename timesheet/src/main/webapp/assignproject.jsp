
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<h2>Assign project</h2>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Assign project</title>
</head>
<body>
	<table>
		<tr>
			<td><label>select employee</label> 
			<select name="country">
					<c:forEach items="${empList}" var="empName"
						varStatus="loop">
						<option value="${loop.index}">${empName.getEmpName()}</option>
					</c:forEach>
					
			</select>
			</td>
		</tr>
		<tr>
			<td><label>select project</label> 
			<select name="projectname" >
					<c:forEach items="${projectList}" var="projectName"
						varStatus="loop">
						<option value="${loop.index}">${projectName.getProjectname()}</option>
					</c:forEach>
					
			</select>
			</td>
		</tr>
	</table>
</body>
</html>