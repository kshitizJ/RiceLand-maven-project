<%@page import="dao.ProductDao"%>
<%@page import="detail.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.OrderDao"%>
<%@page import="detail.Order"%>
<%@page import="db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
Admin admin1 = (Admin) session.getAttribute("admin");
if (admin1 != null) {
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common.jsp"%>
<title>Orders</title>
</head>
<body>
	<%@include file="adminNav.jsp"%>
	<%
		OrderDao orderDao = new OrderDao(DbConnect.getCon());
	List<Order> orders = orderDao.getOrder(Integer.parseInt(request.getParameter("id")));
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 my-4">
				<h1 class="text-center">User Order</h1>
			</div>
			<div class="col-12">
				<%
					String msg = (String) session.getAttribute("msg");
				if ("Order Completed..".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert">Order
					Completed..</div>
				<%
					session.removeAttribute("msg");
				} else if ("Something went wrong..".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert">Something went
					wrong, please try again..</div>
				<%
					session.removeAttribute("msg");
				}
				%>
			</div>

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
							if (order.getSts().equals("pending")) {
						%>
						<tr>
							<td>
								<div class="cart-info d-flex align-items-center">
									<div>
										<p><%=order.getName()%></p>
									</div>
								</div>
							</td>
							<td><i class="fas fa-rupee-sign"></i> <%=order.getPrc()%></td>
							<td>
								<p class="item-amount"><%=order.getQuant()%></p>
							</td>
							<td><i class="fas fa-rupee-sign"></i> <%=order.getStotal()%>/-</td>
							<td><a
								href="../CompletedOrder?id=<%=order.getOid()%>&uid=<%=request.getParameter("id")%>"
								class="btn btn-success">Completed</a></td>
						</tr>
						<%
							}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
<%
	} else {
response.sendRedirect("../login.jsp");
}
%>