
<%@ include file="menu.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>project master</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




</head>
<body>

	<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	outline: none;
	font-family: sans-serif;
}

body {
	height: 100vh;
	background: #e1edf9;
	width: 100%;
	margin-left: 250px;
}

.wrapper {
	max-width: 450px;
	width: 100%;
	margin: 30px auto 0;
	padding: 10px;
	margin-left: 60px;
}

.wrapper .form_container {
	background: #fff;
	padding: 30px;
	box-shadow: 1px 1px 15px rgba(0, 0, 0, 0.15);
	border-radius: 3px;
	width: 200%;
	margin-right: 150%;
}

.heading {
	background: #015a80;
	margin: -30px;
	text-align: center;
	color: white;
	font-size: 19px;
	margin-bottom: 35px;
	padding: 10px;
}

.wrapper .form_container .form_item {
	margin-bottom: 25px;
}

.form_wrap.fullname, .form_wrap.select_box {
	display: flex;
}

.form_wrap.fullname .form_item, .form_wrap.select_box .form_item {
	width: 100%;
}

.form_wrap.fullname .form_item:first-child, .form_wrap.select_box .form_item:first-child
	{
	margin-right: 4%;
}

.wrapper .form_container .form_item label {
	display: block;
	margin-bottom: 5px;
}

.form_item input[type="text"], .form_item select {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #dadce0;
	border-radius: 3px;
}

.form_item input[type="text"]:focus {
	border-color: black;
	border-width: 3px;
	box-shadow: burlywood;
	width: 80%;
}

button {
	width: 50%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #dadce0;
	height: 50px;
	margin-top: 20px;
	margin-left: 180px;
}
</style>
	<div class="wrapper">
		<div class="form_container">
			<form method="post" action="projectmasterprocess">
				<div class="heading">
					<h2>Add Project</h2>
				</div>



				<div class="form_wrap">
					<div class="form_item">
						<span class="glyphicon glyphicon-asterisk"></span> <label
							for="projectId" class="form-label">Project Id : </label> <input
							type="text" name="projectId">
					</div>
				</div>


				<div class="form_wrap">
					<div class="form_item">
						<span class="glyphicon glyphicon-briefcase fa-lg"> </span> <label
							for="projectName" class="form-label">Project Name : </label> <input
							type="text" name="projectName">
					</div>
				</div>


				<div class="form_wrap select_box">
					<div class="form_item">
						<span class="glyphicon glyphicon-dashboard"></span> <label
							for="projectStatus" class="form-label">Project Status : </label>
						<select name="projectStatus">
							<option value="1">Active</option>
							<option value="0">Inactive</option>
						</select>
					</div>
				</div>
				
				
				<div class="form_wrap select_box">
					<div class="form_item">
						<span class="glyphicon glyphicon-user"></span> <label
							for="customername" class="form-label">Customer name : </label>
						<select name="customername" id="customername"> 
									<option value=""></option>
									<c:forEach items="${customerdata}" var="c" varStatus="loop">
										<option value="${c.getCustomerid()}">${c.getCustomername()}
										</option>
									</c:forEach>
								</select>
					</div>
				</div>


				
						
						

						<div>
							<button class="btn btn-success btn-lg" type="submit"
								value="Submit">Submit</button>
						</div>
			</form>
		</div>
	</div>
</body>
</html>