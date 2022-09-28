<%@ include file="menu.jsp"%>
<html>
<head>
<title>Add Customer</title>
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

.form_wrap.fullname, .form_wrap.select_box {
	display: flex;
}

.form_wrap.fullname .form_item, .form_wrap.select_box .form_item {
	width: 50%;
}

.form_wrap.fullname .form_item:first-child, .form_wrap.select_box .form_item:first-child
	{
	margin-right: 4%;
}

.wrapper .form_container .form_item label {
	display: block;
	margin-bottom: 5px;
	margin-left: 40px;
}

.form_item input[type="text"], .form_item select {
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
			<form name="form" action="customer-process" method="post">
				<div class="heading">
					<h2>Add Customer</h2>
				</div>

				<div class="form_wrap fullname">
					<div class="form_item">
						<label>Customer Id</label> <input type="text" name="customerId"
							value="">
					</div>


					<div class="form_item">
						<label>Customer Type</label> <input type="text"
							name="customerType">
					</div>

				</div>
				<div class="form_wrap">
					<div class="form_item">
						<label>Customer name</label> <input type="text"
							name="customerName">
					</div>
				</div>

				<div class="form_wrap">
					<div class="form_item">
						<label>On Board Date: </label> <input type="date"
							name="onBoardDate">
					</div>
				</div>

				<div class="form_wrap">
					<div class="form_item">
						<label>Off Board Date: </label> <input type="date"
							name="offBoardDate">
					</div>
				</div>

				<div class="btn">
					<input type="submit" value="Submit">
				</div>

			</form>
		</div>
	</div>
	<br><br>
</body>
</html>