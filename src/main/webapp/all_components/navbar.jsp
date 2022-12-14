<%@page import="detail.User"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
	<div class="container">
		<a class="navbar-brand" href="index.jsp#page-top"><img
			src="./assets/images/logo/logo.svg" width="125px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav ml-auto">
				<a class="nav-item nav-link" href="index.jsp#page-top"><i
					class="fas fa-home"></i> Home</a> <a class="nav-item nav-link"
					href="index.jsp#about"><i class="fas fa-info-circle"></i> About
					Website</a>
				<%
					response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				User user = (User) session.getAttribute("user");
				if (user != null) {
				%>
				<a class="nav-item nav-link" href="products.jsp"><i
					class="fas fa-tags"></i> Products</a>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <i
						class="fas fa-id-badge"></i> <%=user.getFname() + " " + user.getLname()%>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="profile.jsp"><i
							class="fas fa-user"></i> Profile</a> <a class="dropdown-item"
							href="cart.jsp"><i class="fas fa-cart-plus"></i> My Cart</a> <a
							class="dropdown-item" href="orders.jsp"><i
							class="fas fa-sort-size-up-alt"></i> My Orders</a> <a
							class="dropdown-item" href="LogoutServlet"><i
							class="fas fa-sign-out-alt"></i> Log Out</a>
					</div></li>
				<%
					}
				if (user == null) {
				%>
				<a class="nav-item nav-link" href="login.jsp"><i
					class="fas fa-user"></i> Account</a>
				<%
					}
				%>
				<a class="nav-item nav-link" href="#contact"><i
					class="fas fa-file-signature"></i> Contact</a>
			</div>
		</div>
	</div>
</nav>