<%@page import="detail.User"%>
<%@page import="java.util.List"%>
<%@page import="dao.OrderDao"%>
<%@page import="db.DbConnect"%>
<%@page import="dao.ProductDao"%>
<%@page import="detail.Product"%>
<%@page import="detail.Order"%>
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
<%@include file="./all_components/common.jsp"%>
<title>Invoice</title>
</head>
<body onload="window.print()">
	<section id="cartItems">
		<div class="container">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col-12">
					<h2 class="title">Invoice</h2>
				</div>
				<div class="col-12">
					<h4 class="text-center">
						Name:
						<%=user1.getFname() + " " + user1.getLname()%></h4>
				</div>
				<div class="col-12">
					<h5 class="text-left">Address</h5>
					<p class=""><%=user1.getAddress()%>,
						<%=user1.getCity()%>,
						<%=user1.getState()%>,
						<%=user1.getZip()%></p>
				</div>


				<%
					OrderDao orderdao = new OrderDao(DbConnect.getCon());
				List<Order> orders = orderdao.getOrder(user1.getId());
				%>
				<div class="col-12">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Product</th>
								<th scope="col">Price</th>
								<th scope="col">Quantity</th>
								<th scope="col">Subtotal</th>
								<th scope="col">Status</th>
							</tr>
						</thead>
						<tbody>
							<%
								Product product;
							ProductDao productdao = new ProductDao(DbConnect.getCon());
							for (Order order : orders) {
								product = new Product();
								product = productdao.getProduct(order.getPid());
								if (order.getSts().equals("pending")) {
							%>
							<tr>
								<td>
									<div class="cart-info d-flex align-items-center">
										<img style="border-radius: 5px;"
											src="./assets/images/rice/<%=product.getPath()%>">
										<div>
											<p><%=product.getName()%></p>
										</div>
									</div>
								</td>
								<td><i class="fas fa-rupee-sign"></i> <%=order.getPrc()%></td>
								<td>
									<p class="item-amount"><%=order.getQuant()%></p>
								</td>
								<td><i class="fas fa-rupee-sign"></i> <%=order.getStotal()%>/-</td>
								<td><%=order.getSts()%></td>
							</tr>
							<%
								}
							}
							%>
						</tbody>
					</table>
				</div>
				<%
					int sum = 0;
				for (Order order : orders) {
					if (order.getSts().equals("pending")) {
						sum += order.getStotal();
					}
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
			</div>
		</div>
	</section>
</body>
</html>
<%
	} else {
response.sendRedirect("login.jsp");
}
%>