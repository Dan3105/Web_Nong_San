<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="/WEB-INF/views/include/header.jsp"%>

<%@include file="/WEB-INF/views/include/slider.jsp"%>
<%@include file="/WEB-INF/views/category/listCategory.jsp"%>
<%@include file="/WEB-INF/views/include/banner.jsp"%>

<!-- Best Seller Product -->
<section class="my-lg-14 my-8 mb-5">
	<div class="container">
		<div class="row">
			<div class="col-12 mb-6">
				<h5 class="fw-bold mb-5 fs-3">
					<s:message code="global.best_sale" />
				</h5>
			</div>
		</div>

		<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
			<c:forEach var="p" items="${products }">
				<div class="col">
					<div class="card card-product ">
						<div class="card-body">

							<div class="text-center position-relative ">
								<div class=" position-absolute top-0 start-0">
									<c:if test="${p.coupon.discount != null}">
										<span class="badge bg-danger"> <fmt:formatNumber
												value="${p.coupon.discount }" type="percent" /></span>
									</c:if>

								</div>
								<a href="product/detail.htm?productId=${p.productId }"> <img
									src="<c:url value="/assets/img/products/${p.image} "/>"
									alt="Product" class=" img-fluid"
									style="width: 200px; height: 200px"></a>

								<div class="card-product-action">
									<a href="product/detail.htm?productId=${p.productId }"
										class="btn-action"><i class="bi bi-eye"></i></a> <a
										href='<c:url value = "product/addToWishlist.htm?productId=${p.productId }"/>'
										class="btn-action"><i class="bi bi-heart"></i></a> <a
										href='<c:url value = "product/addToCart.htm?productId=${p.productId }"/>'
										class="btn-action"><i class="bi bi-cart-plus"></i></a>
								</div>

							</div>
							<div class="text-small mb-1 text-muted">
								<small>${p.category.name }</small>
							</div>
							<h2 class="fs-6 text-inherit text-success">${p.productName }
							</h2>

							<div
								class="d-flex justify-content-between align-items-center mt-3">
								<div>

									<span class="text-dark "><fmt:formatNumber
											value="${p.price - (p.price * p.coupon.discount)}"
											type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>

									<c:if test="${p.coupon.discount != null}">
										<span class="text-decoration-line-through text-muted">
											<fmt:formatNumber value="${p.price }" type="currency"
												currencySymbol="đ" maxFractionDigits="0" />
										</span>
									</c:if>
								</div>


							</div>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
</section>

<!-- Product By Category -->
<c:forEach var="c" items="${productsWithCategory }">
	<section class="my-lg-14 my-8 mb-5">
		<div class="container">
			<div class="row">
				<div class="col-12 mb-6">
					<h5 class="fw-bold mb-5 fs-3">${c.name }</h5>
				</div>
			</div>

			<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
				<c:forEach var="p" items="${c.products }" begin="0" end="9">
					<div class="col">
						<div class="card card-product">
							<div class="card-body">

								<div class="text-center position-relative ">
									<div class=" position-absolute top-0 start-0">
										<c:if test="${p.coupon.discount != null}">
											<span class="badge bg-danger"> <fmt:formatNumber
													value="${p.coupon.discount }" type="percent" /></span>
										</c:if>

									</div>
									<a href="product/detail.htm?productId=${p.productId }"> <img
										src="<c:url value="/assets/img/products/${p.image}"/>"
										alt="
										Grocery Ecommerce Template"
										class=" img-fluid" style="width: 200px; height: 200px">
									</a>

									<div class="card-product-action">
										<a href="product/detail.htm?productId=${p.productId }"
											class="btn-action"><i class="bi bi-eye"></i></a> <a
											href='<c:url value = "product/addToWishlist.htm?productId=${p.productId }"/>'
											class="btn-action"><i class="bi bi-heart"></i></a> <a
											href='<c:url value = "product/addToCart.htm?productId=${p.productId }"/>'
											class="btn-action"><i class="bi bi-cart-plus"></i></a>
									</div>

								</div>
								<div class="text-small mb-1 text-muted">
									<small>${p.category.name }</small>
								</div>
								<h2 class="fs-6 text-inherit text-success">${p.productName }
								</h2>



								<div
									class="d-flex justify-content-between align-items-center mt-3">
									<div>

										<span class="text-dark "><fmt:formatNumber
												value="${p.price - (p.price * p.coupon.discount)}"
												type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>

										<c:if test="${p.coupon.discount != null}">
											<span class="text-decoration-line-through text-muted">
												<fmt:formatNumber value="${p.price }" type="currency"
													currencySymbol="đ" maxFractionDigits="0" />
											</span>
										</c:if>
									</div>

								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</section>



</c:forEach>


<%@include file="/WEB-INF/views/include/whyChooseUs.jsp"%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script type="text/javascript" src="assets/owlcarousel/jquery.min.js"></script>
<script type="text/javascript"
	src="assets/owlcarousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/js/user/header.js"></script>


</body>
</html>










