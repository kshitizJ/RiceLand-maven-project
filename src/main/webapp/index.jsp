<%@page import="dao.ProductDao" %>
	<%@page import="db.DbConnect" %>
		<%@page import="detail.Product" %>
			<%@page import="java.util.List" %>
				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<!DOCTYPE html>
					<html>

					<head>
						<%@include file="./all_components/common.jsp" %>
							<title>RiceLand</title>
					</head>

					<body>
						<%@include file="./all_components/navbar.jsp" %>
							<div class="header" id="page-top">
								<div class="container">
									<div class="row d-flex justify-content-center align-items-center">
										<div class="col-md-4 col-12">
											<h1>Give your health a new lifestyle!</h1>
											<p>The only website to find best quality rice for you!</p>
											<a href="products.jsp" class="btn">Explore Now <i class="fas fa-arrow-right"></i></a>
										</div>
										<div>
											<img class="img-fluid" src="./assets/images/rice/mainn-rice.jpg">

										</div>
									</div>

								</div>
							</div>
							<!-- End of header -->
							<!-- About Section -->
							<section id="about">
								<div class="container">
									<div class="row d-flex justify-content-center align-items-center">
										<div class="col-12">
											<h2 class="title">About Us</h2>
											<p class="lead">
												We here are mainly to serve good quality and rich type of rice via
												online server. We have come up with <b>Riceland</b> from which
												customers can effectively select the type of rice they want to
												consume. Since it is extremely important to eat healthy and
												unpolished rice, this system provides very natural rice straight
												from the granaries. To avoid crowding at markets and public areas
												for shopping, We here at Riceland have everything they need to
												know about the right quality of rice and which rice is good for
												their health. We have a detailed description of each quality of
												rice and we also provide reviews from the ones who already bought
												from us. We also provide cash on delivery for each and every
												product with no extra cost except for the tax.
											</p>
										</div>
									</div>
								</div>
							</section>
							<!-- End of About Section -->
							<% ProductDao productdao=new ProductDao(DbConnect.getCon()); List<Product> products =
								productdao.getProductsByCategory("featured");
								%>
								<!--------------featured products-------------->
								<section id="FeaturedProduct">
									<div class="container">
										<h2 class="title">Featured products</h2>
										<div class="row d-flex justify-content-center align-items-center">
											<% int count=0; for (Product product : products) { %>
												<div class="col-lg-4 col-mg-6 col-12 text-center">
													<div id="">
														<img class="img-fluid" src="./assets/images/rice/<%=product.getPath()%>"
															style="width: 375px; height: 350px; border-radius: 5px;"> <a
															class="stretched-link"
															href="productdetail.jsp?id=<%=product.getPid()%>"></a>
														<h4>
															<%=product.getName()%>
														</h4>
														<div class="rating">
															<% for (int str=0; str < product.getStar(); str++) { %>
																<i class="fa fa-star"></i>
																<% } %>
														</div>
														<p>
															<i class="fas fa-rupee-sign"></i>
															<%=product.getPrice()%>/Kg
														</p>
													</div>
												</div>
												<% count++; if (count==3) { break; } } %>
													<a href="products.jsp" class="btn">More Products <i
															class="fas fa-arrow-right"></i></a>
										</div>
									</div>
								</section>
								<!-------------- end of featured products -------------->
								<% products=productdao.getProductsByCategory("latest"); %>
									<!-- Latest Product -->
									<div class="container">
										<h2 class="title">Latest products</h2>
										<div class="row d-flex justify-content-center align-items-center">
											<% count=0; for (Product product : products) { %>
												<div class="col-lg-4 text-center">
													<img class="img-fluid" style="width: 300px; height: 250px; border-radius: 5px;"
														src="./assets/images/rice/<%=product.getPath()%>"> <a class="stretched-link"
														href="productdetail.jsp?id=<%=product.getPid()%>"></a>
													<h4>
														<%=product.getName()%>
													</h4>
													<div class="rating">
														<% for (int str=0; str < product.getStar(); str++) { %>
															<i class="fa fa-star"></i>
															<% } %>
													</div>
													<p>
														<i class="fas fa-rupee-sign"></i>
														<%=product.getStar()%>/Kg
													</p>
												</div>
												<% count++; if (count==3) { break; } } %>
										</div>
									</div>
									<!-- End of Latest Product -->
									<!-------testimonials------->
									<div class="testimonials">
										<div class="container">
											<h2 class="title">Testimonials</h2>
											<div class="row d-flex justify-content-center align-items-center">
												<div class="col-lg-4 col-12 testimonial rounded">
													<i class="fa fa-quote-left"></i>
													<p>
														Premium quality of rice.<br> Brown rice are must to try from
														this website.<br>
													</p>
													<div class="rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i>
													</div>
													<img src="./assets/images/testimonial/user 1.jpeg">
													<h3>Sia Parker</h3>
												</div>
												<div class="col-lg-4 col-12 testimonial rounded">
													<i class="fa fa-quote-left"></i>
													<p>
														Reasonable price of all the products and good quality.<br>Perfect
														description about each product.
													</p>

													<div class="rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o"></i>
													</div>
													<img src="./assets/images/testimonial/user2.jpeg">
													<h3>Michel Smith</h3>
												</div>
												<div class="col-lg-4 col-12 testimonial rounded">
													<i class="fa fa-quote-left"></i>
													<p>
														They sell really good quality of rice <br>under affordable
														prices.<br>Products are same as they are described.
													</p>

													<div class="rating">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i>
													</div>
													<img src="./assets/images/testimonial/user3.jpeg">
													<h3>Disha Naidu</h3>
												</div>
											</div>
										</div>
									</div>
									<!-------end of testimonials------->
									<!-------brands-------->
									<div class="brands">
										<div class="container">
											<div class="row d-flex justify-content-center align-items-center">
												<div class="col-lg-3 col-6">
													<img class="img-fluid" src="./assets/images/logo/kohi.jpg">
												</div>
												<div class="col-lg-3 col-6">
													<img class="img-fluid" src="./assets/images/logo/godrej.jpeg">
												</div>
												<div class="col-lg-3 col-6">
													<img class="img-fluid" src="./assets/images/logo/amazon.jpeg">
												</div>
												<div class="col-lg-3 col-6">
													<img class="img-fluid" src="./assets/images/logo/paypal.jpg">
												</div>
											</div>
										</div>
									</div>
									<%@include file="./all_components/footer.jsp" %>
					</body>
					<script src="./assets/js/smooth-scroll.js"></script>

					<script>
						var scroll = new SmoothScroll('a[href*="#"]');
					</script>

					</html>