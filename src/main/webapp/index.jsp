<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
	<div class="header">
		<h2 class="display-5 text-center my-5">Login</h2>
	</div>
	<div class="body container d-flex justify-content-center">
		<form action="login" method="post">
			<div class="my-5">
			<%
				if (request.getAttribute("errorMessage") != null) {
			%>
			<p class="text-danger"><%=request.getAttribute("errorMessage")%></p>
			<%
				}
			%>
				<div class="my-2">
					<label for="username">Username</label> <input type="text"
						class="form-control" name="username" id="username" min=5 max=50 />
				</div>
				
				<div class="my-2">
					<label for="password">Password</label> <input type="text"
						class="form-control" name="password" id="password" min=5 max=50 />
				</div>
				<div class="my-2">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>

			</div>
		</form>
	</div>
</body>
</html>