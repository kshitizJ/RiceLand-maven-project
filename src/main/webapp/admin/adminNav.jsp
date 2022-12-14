<%@page import="detail.Admin"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
Admin admin = (Admin) session.getAttribute("admin");
if (admin != null) {
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="admin.jsp"><img
			src="../assets/images/logo/logo.svg" width="125px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="showUsers.jsp"><i
						class="fas fa-list-alt"></i> Users</a></li>
				<li class="nav-item"><a class="nav-link" href="showProduct.jsp"><i
						class="fas fa-th-list"></i> Products</a></li>
				<li class="nav-item"><a class="nav-link" href="addProduct.jsp"><i
						class="fas fa-plus"></i> Add Product</a></li>
			</ul>
			<div class="d-flex ml-auto">
				<ul class="navbar-nav">
					<li class="nav-item"><a
						class="nav-link btn btn-success mx-2 text-white" href=""><b><%=admin.getFname() + " " + admin.getLname()%></b></a></li>
					<li class="nav-item"><a
						class="nav-link btn btn-danger  mx-2 text-white"
						href="../LogoutServlet"><b>Logout</b></a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<%
	} else {
response.sendRedirect("../login.jsp");
}
%>