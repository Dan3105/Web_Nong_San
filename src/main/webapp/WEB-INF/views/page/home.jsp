<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<!-- Slider -->
<div class="container slider mb-5">
	<div id="carouselExampleIndicators" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
				class="active"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active   ">
				<img class="d-block w-100 img-slider rounded"
					src="${company.slider1Img }" alt="First slide">

				<div class="carousel-caption d-none d-md-block ">
					<div class="badge bg-warning text-wrap sale">
						<s:message code="global.slide1.discount" />
					</div>
					<h2 class="mt-5 fs-1 fw-bold text-dark  ">
						<s:message code="global.slide1.title" />
					</h2>
					<p class="text-secondary">
						<s:message code="global.slide1.des" />
					</p>
					<button type="button" class="btn btn-dark">
						<s:message code="global.slide1.btn" />
						<i class="bi bi-arrow-right-short"></i>
					</button>
				</div>


			</div>
			<div class="carousel-item ">
				<img class="d-block w-100 img-slider rounded"
					src="${company.slider2Img }" alt="First slide">

				<div class="carousel-caption d-none d-md-block ">
					<div class="badge bg-warning text-wrap sale">
						<s:message code="global.slide2.discount" />
					</div>
					<h2 class="mt-5 fs-1 fw-bold text-dark  ">
						<s:message code="global.slide2.title" />
					</h2>
					<p class="text-secondary">
						<s:message code="global.slide2.des" />
					</p>
					<button type="button" class="btn btn-dark">
						<s:message code="global.slide2.btn" />
						<i class="bi bi-arrow-right-short"></i>
					</button>
				</div>


			</div>

		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-bs-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span>

		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-bs-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span>

		</a>
	</div>
</div>


<!-- Category -->
<div class="container category">
	<div class="row">
		<div class="col-12 mb-6">
			<h5 class="fw-bold mb-5 fs-3">
				<s:message code="global.category" />
			</h5>

		</div>
	</div>
	<div class="owl-carousel owl-theme">
		<c:forEach var="c" items="${category }">
			<div class="item p-3">
				<div class="card mb-3">
					<div class="card-body text-center py-6 text-center ">
						<div class="my-3">
							<a href="product/index.htm?categoryId=${c.categoryId }"> <img
								class="card-img-top"
								src="<c:url value="/assets/img/category/${c.image}"/>"
								alt="Card image cap">
							</a>
						</div>
						<p class="card-text ">
							<a href="#" class="text-decoration-none  ">${c.name } </a>
						</p>
					</div>

				</div>
			</div>

		</c:forEach>

	</div>
</div>
<!-- End Category -->

<!-- Banner -->
<div class="container banner  py-5">
	<div class="row">
		<div class="col-12 col-md-6 mb-3 mb-lg-0">
			<div>

				<div class="rounded img"
					style="background: url('${company.banner1}') no-repeat; background-size: cover; background-position: center;">
					<div>
						<h3 class="fw-bold mb-1">
							<s:message code="global.banner1.title" />
						</h3>
						<p class="mb-4">
							<s:message code="global.banner1.des" />
						</p>
						<a href="<a href="product/detail.htm?productId=${p.productId }">"
							class="btn btn-dark"><s:message code="global.banner1.btn" /></a>
					</div>
				</div>



			</div>

		</div>
		<div class="col-12 col-md-6 ">

			<div>
				<div class="rounded img"
					style="background: url('${company.banner2}') no-repeat; background-size: cover; background-position: center;">
					<div>
						<h3 class="fw-bold mb-1">
							<s:message code="global.banner2.title" />
						</h3>
						<p class="mb-4">
							<s:message code="global.banner2.des" />
						</p>
						<a href="#!" class="btn btn-dark"><s:message
								code="global.banner2.btn" /></a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<!--End Banner -->

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
									src="<c:url value="/assets/img/products/${p.image}"/>"
									alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>

								<div class="card-product-action">
									<a href="#!" class="btn-action"><i class="bi bi-eye"></i></a>
									<a
										href='<c:url value = "product/addToWishlist.htm?productId=${p.productId }"/>'
										class="btn-action"><i class="bi bi-heart"></i></a> <a
										href="#!" class="btn-action"><i
										class="bi bi-arrow-left-right"></i></a>
								</div>

							</div>
							<div class="text-small mb-1">
								<a href="#!" class="text-decoration-none text-muted"><small>${p.category.name }</small></a>
							</div>
							<h2 class="fs-6">
								<a href="./pages/shop-single.html"
									class="text-inherit text-decoration-none">${p.productName }</a>
							</h2>
							<div>

								<small class="text-warning"> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small>
								<span class="text-muted small">4.5(149)</span>
							</div>
							<div
								class="d-flex justify-content-between align-items-center mt-3">
								<div>

									<span class="text-dark"><fmt:formatNumber
											value="${p.price - (p.price * p.coupon.discount)}"
											type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>

									<c:if test="${p.coupon.discount != null}">
										<span class="text-decoration-line-through text-muted">
											<fmt:formatNumber value="${p.price }" type="currency"
												currencySymbol="đ" maxFractionDigits="0" />
										</span>
									</c:if>
								</div>

								<div>
									<a
										href='<c:url value = "product/addToCart.htm?productId=${p.productId }"/>'
										type="button" class="btn btn-primary liveToastBtn"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12"
												y2="19"></line>
                                            <line x1="5" y1="12" x2="19"
												y2="12"></line>
                                        </svg> Add
									</a>

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
<c:forEach var="c" items="${categoryHasProducts }">
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
										class="mb-3 img-fluid"></a>

									<div class="card-product-action">
										<a href="#!" class="btn-action"><i class="bi bi-eye"></i></a>
										<a
											href='<c:url value = "product/addToWishlist.htm?productId=${p.productId }"/>'
											class="btn-action"><i class="bi bi-heart"></i></a> <a
											href="#!" class="btn-action"><i
											class="bi bi-arrow-left-right"></i></a>
									</div>

								</div>
								<div class="text-small mb-1">
									<a href="#!" class="text-decoration-none text-muted"><small>${p.category.name }</small></a>
								</div>
								<h2 class="fs-6">
									<a href="./pages/shop-single.html"
										class="text-inherit text-decoration-none">${p.productName }</a>
								</h2>
								<div>

									<small class="text-warning"> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small>
									<span class="text-muted small">4.5(149)</span>
								</div>
								<div
									class="d-flex justify-content-between align-items-center mt-3">
									<div>

										<span class="text-dark"><fmt:formatNumber
												value="${p.price - (p.price * p.coupon.discount)}"
												type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>

										<c:if test="${p.coupon.discount != null}">
											<span class="text-decoration-line-through text-muted">
												<fmt:formatNumber value="${p.price }" type="currency"
													currencySymbol="đ" maxFractionDigits="0" />
											</span>
										</c:if>
									</div>
									<div>
										<a
											href='<c:url value = "product/addToCart.htm?productId=${p.productId }"/>'
											type="button" class="btn btn-primary liveToastBtn"> <svg
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												viewBox="0 0 24 24" fill="none" stroke="currentColor"
												stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12"
													y2="19"></line>
                                            <line x1="5" y1="12" x2="19"
													y2="12"></line>
                                        </svg> Add
										</a>

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


<!-- Why choose us -->
<section class="my-lg-14 my-8 why-choose-us container mb-5">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-3">
				<div class="mb-8 mb-xl-0">
					<div class="mb-6 pb-3">
						<img src="assets/img/icons/clock.svg" alt="">
					</div>
					<h3 class="h5 mb-3">
						<s:message code="global.choose1.title" />
					</h3>
					<p>
						<s:message code="global.choose1.des" />
					</p>
				</div>
			</div>
			<div class="col-md-6  col-lg-3">
				<div class="mb-8 mb-xl-0">
					<div class="mb-6 pb-3">
						<img src="assets/img/icons/gift.svg" alt="">
					</div>
					<h3 class="h5 mb-3">
						<s:message code="global.choose2.title" />
					</h3>
					<p>
						<s:message code="global.choose2.des" />
					</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="mb-8 mb-xl-0">
					<div class="mb-6 pb-3">
						<img src="assets/img/icons/package.svg" alt="">
					</div>
					<h3 class="h5 mb-3">
						<s:message code="global.choose3.title" />
					</h3>
					<p>
						<s:message code="global.choose3.des" />
					</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="mb-8 mb-xl-0">
					<div class="mb-6 pb-3">
						<img src="assets/img/icons/refresh-cw.svg" alt="">
					</div>
					<h3 class="h5 mb-3">
						<s:message code="global.choose4.title" />
					</h3>
					<p>
						<s:message code="global.choose4.des" />
					</p>
				</div>
			</div>
		</div>
	</div>

</section>


<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script type="text/javascript" src="assets/owlcarousel/jquery.min.js"></script>
<script type="text/javascript"
	src="assets/owlcarousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/js/header.js"></script>


</body>
</html>










