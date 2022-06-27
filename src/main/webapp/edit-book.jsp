<%@page import="entity.User"%>
<%@page import="entity.Author"%>
<%@page import="service.AuthorService"%>
<%@page import="java.util.List"%>
<%@page import="entity.Book"%>
<%@page import="service.BookService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Edit Book</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body>
	<div class="my-4">
		<h2 class="display-5 text-center">Edit Product</h2>
	</div>
	<%
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			response.sendRedirect("/login");
		}

		Book book = (Book) request.getAttribute("book");
		AuthorService authorService = new AuthorService();
		List<Author> authors = authorService.getAllAuthors();
	%>
	<div class="d-flex justify-content-center">
		<form action="edit-book" method="post" class="w-25 mx-3">
			<%
				if (request.getAttribute("errorMessage") != null) {
			%>
			<p class="text-danger"><%=request.getAttribute("errorMessage")%></p>
			<%
				}
			%>
			<input type="hidden" value="<%=book.getId()%>" name="id" />
			<div class="mb-2">
				<input type="hidden" class="form-control"
					value="<%=book.getCode()%>" name="code" /> <input type="text"
					class="form-control" disabled value="<%=book.getCode()%>" />
			</div>
			<div class="mb-2">
				<label>Book Name</label> <input type="text" name="name"
					class="form-control" value="<%=book.getName()%>" />
			</div>
			<div class="mb-2">
				<label>Author</label> <select class="form-control" name="author">
					<%
						for (Author author : authors) {
					%>
					<option value="<%=author.getName()%>"
						<%=author.getName().equalsIgnoreCase(book.getAuthor()) ? "selected" : ""%>><%=author.getName()%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="mb-2">
				<label>Added On</label> <input type="text" name="dateAdded"
					class="form-control" disabled value="<%=book.getDateAdded()%>" />
			</div>
			<div class="my-4">
				<button type="submit" class="btn btn-primary">Update Book</button>
			</div>
		</form>
	</div>

</body>
</html>