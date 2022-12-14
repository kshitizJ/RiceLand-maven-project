<%@page import="dao.ProductDao"%>
<%@page import="detail.Product"%>
<%@page import="detail.Cart"%>
<%@page import="java.util.List"%>
<%@page import="db.DbConnect"%>
<%@page import="dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
User user1 = (User) session.getAttribute("user");
if (user1 != null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./all_components/common.jsp"%>
<title>Cart</title>
</head>
<body>
	<%@include file="./all_components/navbar.jsp"%>
	<section id="cartItems">
		<div class="container">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col-12">
					<h2 class="title">Cart</h2>
				</div>
				<div class="col-12">
					<%
						String msg = (String) session.getAttribute("msg");
					if ("Product added successfully..".equals(msg)) {
					%>
					<div class="alert alert-success" role="alert">Product added
						successfully..</div>
					<%
						session.removeAttribute("msg");
					} else if ("Something went wrong, please try again..".equals(msg)) {
					%>
					<div class="alert alert-danger" role="alert">Something went
						wrong, please try again..</div>
					<%
						session.removeAttribute("msg");
					} else if ("Successfully removed the product from your cart..".equals(msg)) {
					%>
					<div class="alert alert-success" role="alert">Successfully
						removed the product from your cart..</div>

					<%
						session.removeAttribute("msg");
					} else if ("Unable to remove the product, please try again..".equals(msg)) {
					%>
					<div class="alert alert-danger" role="alert">Unable to remove
						the product, please try again..</div>
					<%
						session.removeAttribute("msg");
					} else if ("Product quantity cannot be less than 0, please remove the product..".equals(msg)) {
					%>
					<div class="alert alert-danger" role="alert">Product quantity
						cannot be less than 0, please remove the product..</div>
					<%
						session.removeAttribute("msg");
					} else if ("Product already exist..".equals(msg)) {
					%>
					<div class="alert alert-success" role="alert">Product already
						exist..</div>
					<%
						session.removeAttribute("msg");
					} else if ("Cannot checkout please try again..".equals(msg)) {
					%>
					<div class="alert alert-danger" role="alert">Cannot checkout
						please try again..</div>
					<%
						session.removeAttribute("msg");
					}
					%>
				</div>
				<%
					CartDao cartdao = new CartDao(DbConnect.getCon());
				List<Cart> carts = cartdao.getUserCart(user.getId());
				%>
				<div class="col-12">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Product</th>
								<th scope="col">Quantity</th>
								<th scope="col">Subtotal</th>
							</tr>
						</thead>
						<tbody>
							<%
								Product product;
							ProductDao productdao = new ProductDao(DbConnect.getCon());
							for (Cart cart : carts) {
								product = new Product();
								product = productdao.getProduct(cart.getPid());
							%>
							<tr>
								<td>
									<div class="cart-info">
										<img style="border-radius: 5px;"
											src="./assets/images/rice/<%=product.getPath()%>">
										<div>

											<p><%=product.getName()%></p>

											<small>Price: <i class="fas fa-rupee-sign"></i> <%=product.getPrice()%>/Kg
											</small> <br> <a
												href="DeleteCartItem?uid=<%=user.getId()%>&pid=<%=product.getPid()%>"><b>Remove</b></a>
										</div>
									</div>
								</td>
								<td><a
									href="AddSubCartItem?msg=add&uid=<%=user.getId()%>&pid=<%=product.getPid()%>&prc=<%=product.getPrice()%>">
										<i class="fas fa-chevron-up"></i>
								</a>
									<p class="item-amount"><%=cart.getQuantity()%></p> <a
									href="AddSubCartItem?msg=sub&uid=<%=user.getId()%>&pid=<%=product.getPid()%>&prc=<%=product.getPrice()%>">
										<i class="fas fa-chevron-down"></i>
								</a></td>
								<%
									int quantity = cart.getQuantity() * product.getPrice();
								%>
								<td><i class="fas fa-rupee-sign"></i> <%=quantity%>/-</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<%
					int sum = 0;
				for (Cart cart : carts) {
					sum += cart.getStotal();
				}
				%>
				<div class="col-12 d-flex justify-content-center">
					<div class="total-price">
						<table class="table table-bordered">
							<tr>
								<td>Total</td>
								<td><i class="fas fa-rupee-sign"></i> <%=sum%>/-</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="col-12 text-center">
					<a href="CheckoutOrder?uid=<%=user.getId()%>"><button
							class="btn">Checkout</button></a>
				</div>
			</div>
		</div>
	</section>
	<!------ end of cart item details------>
	<%@include file="./all_components/footer.jsp"%>
</body>
</html>
<%
	} else {
response.sendRedirect("login.jsp");
}
%>