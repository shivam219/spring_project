<%@ include file="menu.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<html>

<head>
	<meta charset="UTF-8">
	<title>project master</title>

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
			margin-right: 800px;
		}

		.wrapper {
			max-width: 450px;
			width: 100%;
			margin: 30px auto 0;
			padding: 10px;
			margin-right: 700px;
		}

		.wrapper .form_container {
			background: #fff;
			padding: 30px;
			box-shadow: 1px 1px 15px rgba(0, 0, 0, 0.15);
			border-radius: 3px;
			width: 200%;
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

		.form_wrap.fullname,
		.form_wrap.select_box {
			display: flex;
		}

		.form_wrap.fullname .form_item,
		.form_wrap.select_box .form_item {
			width: 50%;
		}

		.form_wrap.fullname .form_item:first-child,
		.form_wrap.select_box .form_item:first-child {
			margin-right: 4%;
		}

		.wrapper .form_container .form_item label {
			display: block;
			margin-bottom: 5px;
			margin-left: 40px;
		}

		.form_item input[type="text"],
		.form_item select {
			width: 80%;
			padding: 10px;
			font-size: 16px;
			border: 1px solid #dadce0;
			border-radius: 3px;
			margin-left: 40px;
		}

		.form_item input[type="text"]:focus {
			border-color: #6271f0;
		}

		.btn input[type="submit"] {
			background: #1598d4;
			border: 1px solid #1598d4;
			padding: 10px;
			width: 500px;
			font-size: 16px;
			letter-spacing: 1px;
			border-radius: 3px;
			cursor: pointer;
			color: #fff;
			margin-left: 120px;
		}

		.form_item input[type="date"] {
			width: 80%;
			padding: 10px;
			font-size: 16px;
			border: 1px solid #dadce0;
			border-radius: 3px;
			margin-left: 40px;
		}

		.form_item input[type="date"]:focus {
			border-color: #6271f0;
		}
	</style>
	<div class="wrapper">
		<div class="form_container">
			<form method="post" action="project-process">
				<div class="heading">
					<h2>Add Project</h2>
				</div>

				<div class="form_wrap">
					<div class="form_item">
						<span class="glyphicon glyphicon-asterisk"></span> <label for="projectId"
							class="form-label">Project Id : </label> <input type="text" name="projectId">
					</div>
				</div>


				<div class="form_wrap">
					<div class="form_item">
						<span class="glyphicon glyphicon-briefcase fa-lg"> </span> <label for="projectName"
							class="form-label">Project Name : </label> <input type="text"
							name="projectName">
					</div>
				</div>


					<div class="form_item">
						<span class="glyphicon glyphicon-dashboard"></span> <label for="projectStatus"
							class="form-label">Project Status : </label>
						<select name="projectStatus">
							<option value="1">Active</option>
							<option value="0">Inactive</option>
						</select>
					</div>
				

					<div class="form_item">
						<span class="glyphicon glyphicon-user"></span>
						<label for="customername" class="form-label">Customer name : </label>
						<select name="customerId" id="customerId">
							<c:forEach items="${customerList}" var="c" varStatus="loop">
								<option value="${c.getCustomerId()}">${c.getCustomerName()}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form_item text-center ">
					<button class="btn btn-success btn text-center py-2 px-4" type="submit" value="Submit">Submit</button>
					</div>
			</form>
		</div>
	</div>
	<br><br>
</body>
</html>