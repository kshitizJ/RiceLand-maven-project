<%@page import="detail.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User user1 = (User) session.getAttribute("user");
	Admin admin = (Admin) session.getAttribute("admin");
	if (user1 == null && admin == null) {
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./all_components/common.jsp"%>
<title>Login</title>
</head>
<body>
	<%@include file="./all_components/navbar.jsp"%>
	<header class="account-page">
		<div
			class="container d-flex justify-content-center align-items-center">
			<div class="row">
				<div class="col-12">
					<%
						String error = (String) session.getAttribute("error");
					if ("Please login with right credentials...".equals(error)) {
					%>
					<div class="alert alert-danger" role="alert">Please login
						with right credentials...</div>
					<%
						session.removeAttribute("error");
					}
					%>
				</div>
				<div class="col-lg-6 col-12">
					<img src="./assets/images/rice/mainn-rice.jpg" width=100%>
				</div>
				<div class="col-lg-6 col-12 cent">
					<form class="needs-validation" novalidate method="post"
						action="LoginServlet">
						<div class="col-12 form-group">
							<label for="validationCustomUsername">Email</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroupPrepend">@</span>
								</div>
								<input type="text" class="form-control"
									id="validationCustomUsername" placeholder="Email ID"
									aria-describedby="inputGroupPrepend" name="email" required>
								<div class="invalid-feedback">Please choose a username.</div>
							</div>
							<small id="emailHelp" class="form-text text-muted">We'll
								never share your email with anyone else.</small>
						</div>
						<div class="col-12 form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								placeholder="Password" name="pass" required>
							<div class="invalid-feedback">Please enter password.</div>
						</div>
						<p class="col-12">
							Don't have an account? <a href="register.jsp">Sign Up.</a>
						</p>
						<button type="submit" class="col-12 btn">Log In</button>
					</form>
				</div>
			</div>
		</div>
	</header>
	<!-- End of Header -->
	<%@include file="./all_components/footer.jsp"%>
</body>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
<%
	} else {
%>
<script>
	history.forward();
</script>
<%
}
%>
<script src="./assets/js/smooth-scroll.js"></script>

<script>
	var scroll = new SmoothScroll('a[href*="#"]');
</script>
</html>