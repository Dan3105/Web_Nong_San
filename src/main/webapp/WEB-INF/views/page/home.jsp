<%@include file="/WEB-INF/views/include/header.jsp"%>



<!-- Slider -->
<div class="container slider mb-5">

	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>

		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active   ">
				<img class="d-block w-100 img-slider rounded" src="${company.slider1Img }"
					alt="First slide">

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
			<div class="carousel-item    ">
				<img class="d-block w-100 img-slider rounded" src="${company.slider2Img }"
					alt="First slide">

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
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span>

		</a> <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
			data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span>

		</a>
	</div>

</div>


<!-- Category -->
<section>
	<div class="container mb-5 catagory">
		<div class="row">
			<div class="col-12 mb-6">
				<h5 class="fw-bold mb-5 fs-3">
					<s:message code="global.category" />
				</h5>
			</div>
		</div>

		<nav class="row gy-2">
			<div class="col-lg-6 col-md-12">
				<div class="row">
					<div class="col-3">
						<a href="#" class="text-center">
							<div class="card justify-content-center align-items-center pt-3">
								<img class="card-img-top" src="assets/img/catagory/thanh-long.webp"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text ">Fruits</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-3">
						<a href="#" class="text-center ">
							<div class="card justify-content-center align-items-center pt-3">
								<img class="card-img-top" src="assets/img/catagory/gia-vi.webp"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text ">Spice</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-3">
						<a href="#" class="text-center">
							<div class="card justify-content-center align-items-center pt-3">
								<img class="card-img-top" src="assets/img/catagory/thuc-pham-kho.webp"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text ">Dry food</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-3">
						<a href="#" class="text-center">
							<div class="card justify-content-center align-items-center pt-3">
								<img class="card-img-top" src="assets/img/catagory/suon-heo.webp"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text ">Pig</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12">
				<div class="row">
					<div class="col-3">
						<a href="#" class="text-center ">
							<div class="card justify-content-center align-items-center pt-3">
								<img class="card-img-top" src="assets/img/catagory/banh.jpg" alt="Card image cap">
								<div class="card-body">
									<p class="card-text ">Snack</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-3">
						<a href="#" class="text-center">
							<div class="card justify-content-center align-items-center pt-3">
								<img class="card-img-top" src="assets/img/catagory/tea.jpg" alt="Card image cap">
								<div class="card-body">
									<p class="card-text ">Tea</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-3">
						<a href="#" class="text-center ">
							<div class="card justify-content-center align-items-center pt-3">
								<img class="card-img-top" src="assets/img/catagory/instant-food.jpg"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text ">Instant food</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-3">
						<a href="#" class="text-center ">
							<div class="card justify-content-center align-items-center pt-3">
								<img class="card-img-top" src="assets/img/catagory/baby.jpg" alt="Card image cap">
								<div class="card-body">
									<p class="card-text ">Baby care</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</nav>
	</div>
</section>
<!--End Category -->


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
						<a href="#!" class="btn btn-dark"><s:message code="global.banner1.btn" /></a>
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
						<a href="#!" class="btn btn-dark"><s:message code="global.banner2.btn" /></a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- Popular Product -->
<section class="my-lg-14 my-8 mb-5">
	<div class="container">
		<div class="row">
			<div class="col-12 mb-6">
				<h5 class="fw-bold mb-5 fs-3">
					<s:message code="global.popular" />
				</h5>
			</div>
		</div>

		<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
			<div class="col">
				<div class="card card-product">
					<div class="card-body">

						<div class="text-center position-relative ">
							<div class=" position-absolute top-0 start-0">
								<span class="badge bg-danger">Sale</span>
							</div>
							<a href="#!"> <img src="assets/img/products/product-img-1.jpg"
								alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>

							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="#!" class="btn-action"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"
									data-bs-original-title="Wishlist"><i class="bi bi-heart"></i></a> <a href="#!"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>

						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Snack &amp;
									Munchies</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Haldiram's
								Sev Bhujia</a>
						</h2>
						<div>

							<small class="text-warning"> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small> <span
								class="text-muted small">4.5(149)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div>
								<span class="text-dark">$18</span> <span
									class="text-decoration-line-through text-muted">$24</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative">
							<div class=" position-absolute top-0 start-0">
								<span class="badge bg-success">14%</span>
							</div>
							<a href="./pages/shop-single.html"><img
								src="assets/img/products/product-img-2.jpg" alt="Grocery Ecommerce Template"
								class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="../shop-wishlist.html"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist" data-bs-original-title="Wishlist"><i
									class="bi bi-heart"></i></a> <a href="#!" class="btn-action" data-bs-toggle="tooltip"
									data-bs-html="true" aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>

						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Bakery
									&amp; Biscuits</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">NutriChoice
								Digestive </a>
						</h2>
						<div class="text-warning">

							<small> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-half"></i></small> <span class="text-muted small">4.5 (25)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div>
								<span class="text-dark">$24</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative">
							<a href="./pages/shop-single.html"><img
								src="assets/img/products/product-img-3.jpg" alt="Grocery Ecommerce Template"
								class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="../shop-wishlist.html"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist" data-bs-original-title="Wishlist"><i
									class="bi bi-heart"></i></a> <a href="#!" class="btn-action" data-bs-toggle="tooltip"
									data-bs-html="true" aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Bakery
									&amp; Biscuits</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Cadbury
								5 Star Chocolate</a>
						</h2>
						<div class="text-warning">

							<small> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i></small> <span class="text-muted small">5 (469)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div>
								<span class="text-dark">$32</span> <span
									class="text-decoration-line-through text-muted">$35</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative">
							<a href="./pages/shop-single.html"><img
								src="assets/img/products/product-img-4.jpg" alt="Grocery Ecommerce Template"
								class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="../shop-wishlist.html"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist" data-bs-original-title="Wishlist"><i
									class="bi bi-heart"></i></a> <a href="#!" class="btn-action" data-bs-toggle="tooltip"
									data-bs-html="true" aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>
							<div class=" position-absolute top-0 start-0">
								<span class="badge bg-danger">Hot</span>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Snack &amp;
									Munchies</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Onion
								Flavour Potato</a>
						</h2>
						<div class="text-warning">

							<small> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i> <i class="bi bi-star"></i></small>
							<span class="text-muted small">3.5 (456)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div>
								<span class="text-dark">$3</span> <span
									class="text-decoration-line-through text-muted">$5</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative">
							<a href="./pages/shop-single.html"><img
								src="assets/images/products/product-img-5.jpg" alt="Grocery Ecommerce Template"
								class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="../shop-wishlist.html"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist" data-bs-original-title="Wishlist"><i
									class="bi bi-heart"></i></a> <a href="#!" class="btn-action" data-bs-toggle="tooltip"
									data-bs-html="true" aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Instant
									Food</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Salted
								Instant Popcorn </a>
						</h2>
						<div class="text-warning">

							<small> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-half"></i></small> <span class="text-muted small">4.5 (39)</span>
						</div>
						<div class="d-flex justify-content-between mt-4">
							<div>
								<span class="text-dark">$13</span> <span
									class="text-decoration-line-through text-muted">$18</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">

						<div class="text-center position-relative ">
							<div class=" position-absolute top-0 start-0">
								<span class="badge bg-danger">Sale</span>
							</div>
							<a href="#!"> <img src="assets/images/products/product-img-6.jpg"
								alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="#!" class="btn-action"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"
									data-bs-original-title="Wishlist"><i class="bi bi-heart"></i></a> <a href="#!"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Dairy,
									Bread &amp; Eggs</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Blueberry
								Greek Yogurt</a>
						</h2>
						<div>

							<small class="text-warning"> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small> <span
								class="text-muted small">4.5 (189)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div>
								<span class="text-dark">$18</span> <span
									class="text-decoration-line-through text-muted">$24</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative">
							<a href="./pages/shop-single.html"><img
								src="assets/images/products/product-img-7.jpg" alt="Grocery Ecommerce Template"
								class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="../shop-wishlist.html"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist" data-bs-original-title="Wishlist"><i
									class="bi bi-heart"></i></a> <a href="#!" class="btn-action" data-bs-toggle="tooltip"
									data-bs-html="true" aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Dairy,
									Bread &amp; Eggs</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Britannia
								Cheese Slices</a>
						</h2>
						<div class="text-warning">

							<small> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i></small> <span class="text-muted small">5 (345)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div>
								<span class="text-dark">$24</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative">
							<a href="./pages/shop-single.html"><img
								src="assets/images/products/product-img-8.jpg" alt="Grocery Ecommerce Template"
								class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="../shop-wishlist.html"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist" data-bs-original-title="Wishlist"><i
									class="bi bi-heart"></i></a> <a href="#!" class="btn-action" data-bs-toggle="tooltip"
									data-bs-html="true" aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Instant
									Food</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Kellogg's
								Original Cereals</a>
						</h2>
						<div class="text-warning">

							<small> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-half"></i></small> <span class="text-muted small">4 (90)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div>
								<span class="text-dark">$32</span> <span
									class="text-decoration-line-through text-muted">$35</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative">
							<a href="./pages/shop-single.html"><img
								src="assets/images/products/product-img-9.jpg" alt="Grocery Ecommerce Template"
								class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="../shop-wishlist.html"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist" data-bs-original-title="Wishlist"><i
									class="bi bi-heart"></i></a> <a href="#!" class="btn-action" data-bs-toggle="tooltip"
									data-bs-html="true" aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Snack &amp;
									Munchies</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Slurrp
								Millet Chocolate </a>
						</h2>
						<div class="text-warning">

							<small> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-half"></i></small> <span class="text-muted small">4.5 (67)</span>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div>
								<span class="text-dark">$3</span> <span
									class="text-decoration-line-through text-muted">$5</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<div class="text-center position-relative">
							<a href="./pages/shop-single.html"><img
								src="assets/images/products/product-img-10.jpg" alt="Grocery Ecommerce Template"
								class="mb-3 img-fluid"></a>
							<div class="card-product-action">
								<a href="#!" class="btn-action" data-bs-toggle="modal"
									data-bs-target="#quickViewModal"><i class="bi bi-eye"
									data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
									data-bs-original-title="Quick View"></i></a> <a href="../shop-wishlist.html"
									class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist" data-bs-original-title="Wishlist"><i
									class="bi bi-heart"></i></a> <a href="#!" class="btn-action" data-bs-toggle="tooltip"
									data-bs-html="true" aria-label="Compare" data-bs-original-title="Compare"><i
									class="bi bi-arrow-left-right"></i></a>
							</div>
						</div>
						<div class="text-small mb-1">
							<a href="#!" class="text-decoration-none text-muted"><small>Dairy,
									Bread &amp; Eggs</small></a>
						</div>
						<h2 class="fs-6">
							<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Amul
								Butter - 500 g</a>
						</h2>
						<div class="text-warning">

							<small> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i> <i class="bi bi-star"></i></small>
							<span class="text-muted small">3.5 (89)</span>
						</div>
						<div class="d-flex justify-content-between mt-4">
							<div>
								<span class="text-dark">$13</span> <span
									class="text-decoration-line-through text-muted">$18</span>
							</div>
							<div>
								<a href="#!" class="btn btn-primary btn-sm"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
										fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Daily Best Sells -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-6">
				<h5 class="fw-bold mb-5 fs-3">
					<s:message code="global.best_seller" />
				</h5>
			</div>
		</div>
		<div class="table-responsive-xl pb-6">
			<div class="row row-cols-lg-4 row-cols-1 row-cols-md-2 g-4 flex-nowrap">
				<div class="col">
					<div class=" pt-8 px-6 px-xl-8 rounded"
						style="background: url(./assets/images/banner/banner-deal.jpg) no-repeat; background-size: cover; height: 470px;">
						<div>
							<h3 class="fw-bold text-white">100% Organic Coffee Beans.</h3>
							<p class="text-white">Get the best deal before close.</p>
							<a href="#!" class="btn btn-primary">Shop Now <i
								class="feather-icon icon-arrow-right ms-1"></i></a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card card-product">
						<div class="card-body">
							<div class="text-center  position-relative ">
								<a href="./pages/shop-single.html"><img
									src="assets/images/products/product-img-11.jpg" alt="Grocery Ecommerce Template"
									class="mb-3 img-fluid"></a>

								<div class="card-product-action">
									<a href="#!" class="btn-action" data-bs-toggle="modal"
										data-bs-target="#quickViewModal"><i class="bi bi-eye"
										data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
										data-bs-original-title="Quick View"></i></a> <a href="#!" class="btn-action"
										data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"
										data-bs-original-title="Wishlist"><i class="bi bi-heart"></i></a> <a href="#!"
										class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
										aria-label="Compare" data-bs-original-title="Compare"><i
										class="bi bi-arrow-left-right"></i></a>
								</div>
							</div>
							<div class="text-small mb-1">
								<a href="#!" class="text-decoration-none text-muted"><small>Tea,
										Coffee &amp; Drinks</small></a>
							</div>
							<h2 class="fs-6">
								<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Roast
									Ground Coffee</a>
							</h2>

							<div class="d-flex justify-content-between align-items-center mt-3">
								<div>
									<span class="text-dark">$13</span> <span
										class="text-decoration-line-through text-muted">$18</span>
								</div>
								<div>
									<small class="text-warning"> <i class="bi bi-star-fill"></i> <i
										class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
										class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
									</small> <span><small>4.5</small></span>
								</div>
							</div>
							<div class="d-grid mt-2">
								<a href="#!" class="btn btn-primary "> <svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add to cart
								</a>
							</div>
							<div class="d-flex justify-content-start text-center mt-3">
								<div class="deals-countdown w-100" data-countdown="2028/10/10 00:00:00">
									<span class="countdown-section"><span class="countdown-amount hover-up">2017</span><span
										class="countdown-period"> days </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">09</span><span class="countdown-period">
											hours </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">24</span><span class="countdown-period">
											mins </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">46</span><span class="countdown-period">
											sec </span></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card card-product">
						<div class="card-body">
							<div class="text-center  position-relative ">
								<a href="./pages/shop-single.html"><img
									src="assets/images/products/product-img-12.jpg" alt="Grocery Ecommerce Template"
									class="mb-3 img-fluid"></a>
								<div class="card-product-action">
									<a href="#!" class="btn-action" data-bs-toggle="modal"
										data-bs-target="#quickViewModal"><i class="bi bi-eye"
										data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
										data-bs-original-title="Quick View"></i></a> <a href="#!" class="btn-action"
										data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"
										data-bs-original-title="Wishlist"><i class="bi bi-heart"></i></a> <a href="#!"
										class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
										aria-label="Compare" data-bs-original-title="Compare"><i
										class="bi bi-arrow-left-right"></i></a>
								</div>
							</div>
							<div class="text-small mb-1">
								<a href="#!" class="text-decoration-none text-muted"><small>Fruits
										&amp; Vegetables</small></a>
							</div>
							<h2 class="fs-6">
								<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Crushed
									Tomatoes</a>
							</h2>
							<div class="d-flex justify-content-between align-items-center mt-3">
								<div>
									<span class="text-dark">$13</span> <span
										class="text-decoration-line-through text-muted">$18</span>
								</div>
								<div>
									<small class="text-warning"> <i class="bi bi-star-fill"></i> <i
										class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
										class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
									</small> <span><small>4.5</small></span>
								</div>
							</div>
							<div class="d-grid mt-2">
								<a href="#!" class="btn btn-primary "> <svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add to cart
								</a>
							</div>
							<div class="d-flex justify-content-start text-center mt-3 w-100">
								<div class="deals-countdown w-100" data-countdown="2028/12/9 00:00:00">
									<span class="countdown-section"><span class="countdown-amount hover-up">2077</span><span
										class="countdown-period"> days </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">09</span><span class="countdown-period">
											hours </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">24</span><span class="countdown-period">
											mins </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">46</span><span class="countdown-period">
											sec </span></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card card-product">
						<div class="card-body">
							<div class="text-center  position-relative ">
								<a href="./pages/shop-single.html"><img
									src="assets/images/products/product-img-13.jpg" alt="Grocery Ecommerce Template"
									class="mb-3 img-fluid"></a>
								<div class="card-product-action">
									<a href="#!" class="btn-action" data-bs-toggle="modal"
										data-bs-target="#quickViewModal"><i class="bi bi-eye"
										data-bs-toggle="tooltip" data-bs-html="true" aria-label="Quick View"
										data-bs-original-title="Quick View"></i></a> <a href="#!" class="btn-action"
										data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"
										data-bs-original-title="Wishlist"><i class="bi bi-heart"></i></a> <a href="#!"
										class="btn-action" data-bs-toggle="tooltip" data-bs-html="true"
										aria-label="Compare" data-bs-original-title="Compare"><i
										class="bi bi-arrow-left-right"></i></a>
								</div>
							</div>
							<div class="text-small mb-1">
								<a href="#!" class="text-decoration-none text-muted"><small>Fruits
										&amp; Vegetables</small></a>
							</div>
							<h2 class="fs-6">
								<a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Golden
									Pineapple</a>
							</h2>
							<div class="d-flex justify-content-between align-items-center mt-3">
								<div>
									<span class="text-dark">$13</span> <span
										class="text-decoration-line-through text-muted">$18</span>
								</div>
								<div>
									<small class="text-warning"> <i class="bi bi-star-fill"></i> <i
										class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
										class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small> <span><small>4.5</small></span>
								</div>
							</div>
							<div class="d-grid mt-2">
								<a href="#!" class="btn btn-primary "> <svg xmlns="http://www.w3.org/2000/svg"
										width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg> Add to cart
								</a>
							</div>
							<div class="d-flex justify-content-start text-center mt-3">
								<div class="deals-countdown w-100" data-countdown="2028/11/11 00:00:00">
									<span class="countdown-section"><span class="countdown-amount hover-up">2049</span><span
										class="countdown-period"> days </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">09</span><span class="countdown-period">
											hours </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">24</span><span class="countdown-period">
											mins </span></span><span class="countdown-section"><span
										class="countdown-amount hover-up">46</span><span class="countdown-period">
											sec </span></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



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
<script src="assets/js/header.js"></script>

</body>
</html>










