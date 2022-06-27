<%@page import="entity.User"%>
<%@page import="service.AuthorService"%>
<%@page import="entity.Author"%>
<%@page import="java.util.List"%>
<%@page import="entity.Book"%>
<%@page import="service.BookService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body>
	<%
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			response.sendRedirect("/login");
		}
		AuthorService authorService = new AuthorService();
		List<Author> authors = authorService.getAllAuthors();
	%>
	<div class="my-4">
		<h2 class="display-5 text-center">Add Book</h2>
	</div>
	<div class="d-flex justify-content-center">
		<form action="add-book" method="post" class="w-25 mx-3"
			enctype="application/json">
			<%
				if (request.getAttribute("errorMessage") != null) {
			%>
			<p class="text-danger"><%=request.getAttribute("errorMessage")%></p>
			<%
				}
			%>
			<div class="mb-2">
				<label>Book Code</label> <input type="text" name="code"
					class="form-control" />
			</div>
			<div class="mb-2">
				<label>Book Name</label> <input type="text" name="name"
					class="form-control" />
			</div>
			<div class="mb-2">
				<label>Author</label> <select class="form-control" name="author">
					<%
						for (Author author : authors) {
					%>
					<option value="<%=author.getName()%>"><%=author.getName()%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="mb-2">
				<label>Added On</label> <input type="date" name="date"
					class="form-control" />
			</div>
			<div class="my-4">
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="button" class="btn btn-danger">Cancel</button>
			</div>
		</form>
	</div>

</body>
</html>