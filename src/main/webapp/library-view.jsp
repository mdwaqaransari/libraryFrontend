<%@page import="service.BookService"%>
<%@page import="entity.Book"%>
<%@page import="entity.User"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Library</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
	<%
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			response.sendRedirect("/login");
		}
	%>
	<h2 class="display-5 text-center my-3">Books Listing</h2>
	<div class="d-flex py-2 justify-content-end">
		<a href="add-book"><button class="btn btn-success mx-3">Add
				Book</button></a>
		<p class="mx-3">
			<a href="logout">Logout</a>&nbsp;&nbsp;(<%=user.getUsername()%>)
		</p>
	</div>


	<div class="d-flex justify-content-center">
		<div class="w-25 my-4"></div>
	</div>
	<div class="d-flex justify-content-center">
		<%
			List<Book> books = BookService.getAllBooks();
			if (books.size() < 1) {
		%>
		<div>
			<h2>Store is Empty!</h2>
		</div>
		<%
			} else {
		%>
		<table class="table table-bordered px-5 w-75">
		<caption>Books Library</caption>
			<tr>
				<th>Book Code</th>
				<th>Book Name</th>
				<th>Author</th>
				<th>Date Added</th>
				<th>Actions</th>
			</tr>
			<%
				for (Book book : books) {
			%>

			<tr>
				<td><%=book.getCode()%></td>
				<td><%=book.getName()%></td>
				<td><%=book.getAuthor()%></td>
				<td><%=book.getDateAdded()%></td>
				<td class="d-flex justify-content-center"><a
					href="edit-book?id=<%=book.getCode()%>" class="mx-3"><em
						class="bi bi-pencil-fill"></em></a> <a
					href="delete-book?code=<%=book.getCode()%>" class="mx-3"><em
						class="bi bi-trash-fill"></em></a></td>
			</tr>
			<%
				}
				}
			%>
		</table>

	</div>
</body>
</html>