<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
		<!-- section-->
		<div class="mt-4">
			<div class="container">
				<!-- row -->
				<div class="row ">
					<!-- col -->
					<div class="col-12">
						<!-- breadcrumb -->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="#!">Home</a></li>
								<li class="breadcrumb-item"><a href="#!">Shop</a></li>
								<li class="breadcrumb-item active" aria-current="page">Snacks
									&amp; Munchies</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- section -->
		<div class=" mt-8 mb-lg-14 mb-8">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row gx-10">
					<!-- col -->
					<aside class="col-lg-3 col-md-4 mb-6 mb-md-0">
						<div class="offcanvas offcanvas-start offcanvas-collapse w-md-50 "
							tabindex="-1" id="offcanvasCategory"
							aria-labelledby="offcanvasCategoryLabel">

							<div class="offcanvas-header d-lg-none">
								<h5 class="offcanvas-title" id="offcanvasCategoryLabel">Filter</h5>
								<button type="button" class="btn-close"
									data-bs-dismiss="offcanvas" aria-label="Close"></button>
							</div>
							<div class="offcanvas-body ps-lg-2 pt-lg-0">
								<div class="mb-8">
									<!-- title -->
									<h5 class="mb-3">Categories</h5>
									<!-- nav -->
									<ul class="nav nav-category" id="categoryCollapseMenu">
										<li class="nav-item border-bottom w-100 collapsed"
											data-bs-toggle="collapse" data-bs-target="#categoryFlushOne"
											aria-expanded="false" aria-controls="categoryFlushOne"><a
											href="#" class="nav-link">Dairy, Bread &amp; Eggs <i
												class="feather-icon icon-chevron-right"></i></a> <!-- accordion collapse -->
											<div id="categoryFlushOne"
												class="accordion-collapse collapse"
												data-bs-parent="#categoryCollapseMenu">
												<div>
													<!-- nav -->

													<ul class="nav flex-column ms-3">
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Milk</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Milk
																Drinks</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Curd
																&amp; Yogurt</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Eggs</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Bread</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Buns
																&amp; Bakery</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Butter
																&amp; More</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Cheese</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Paneer
																&amp; Tofu</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Cream
																&amp; Whitener</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Condensed
																Milk</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Vegan
																Drinks</a></li>
													</ul>



												</div>
											</div></li>
										<!-- nav item -->
										<li class="nav-item border-bottom w-100 collapsed"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
											aria-expanded="false" aria-controls="flush-collapseTwo"><a
											href="#" class="nav-link"> Snacks &amp; Munchies <i
												class="feather-icon icon-chevron-right"></i>
										</a> <!-- collapse -->
											<div id="flush-collapseTwo"
												class="accordion-collapse collapse"
												data-bs-parent="#categoryCollapseMenu">
												<div>



													<ul class="nav flex-column ms-3">
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Chips
																&amp; Crisps</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Nachos</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Popcorn</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Bhujia
																&amp; Mixtures</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Namkeen
																Snacks</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Healthy
																Snacks</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Cakes
																&amp; Rolls</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Energy
																Bars</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Papad
																&amp; Fryums</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Rusks
																&amp; Wafers</a></li>
													</ul>


												</div>
											</div></li>
										<li class="nav-item border-bottom w-100 collapsed"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseThree" aria-expanded="false"
											aria-controls="flush-collapseThree"><a href="#"
											class="nav-link">Fruits &amp; Vegetables <i
												class="feather-icon icon-chevron-right"></i></a> <!-- collapse -->
											<div id="flush-collapseThree"
												class="accordion-collapse collapse"
												data-bs-parent="#categoryCollapseMenu">
												<div>

													<ul class="nav flex-column ms-3">
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link active"
															aria-current="page" href="#!">Fresh Vegetables</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Herbs
																&amp; Seasonings</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Fresh
																Fruits</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Organic
																Fruits &amp; Vegetables</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Cuts
																&amp; Sprouts</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Exotic
																Fruits &amp; Veggies</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Flower
																Bouquets, Bunches</a></li>
													</ul>
												</div>
											</div></li>
										<li class="nav-item border-bottom w-100 collapsed"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseFour" aria-expanded="false"
											aria-controls="flush-collapseFour"><a href="#"
											class="nav-link">Cold Drinks &amp; Juices <i
												class="feather-icon icon-chevron-right"></i></a> <!-- collapse -->
											<div id="flush-collapseFour"
												class="accordion-collapse collapse"
												data-bs-parent="#categoryCollapseMenu">
												<div>
													<ul class="nav flex-column ms-3">
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Soft
																Drinks</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Fruit
																Juices</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Coldpress</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Energy
																Drinks</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Water
																&amp; Ice Cubes</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Soda
																&amp; Mixers</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Concentrates
																&amp; Syrups</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Detox
																&amp; Energy Drinks</a></li>
														<!-- nav item -->
														<li class="nav-item"><a href="#!" class="nav-link">Juice
																Collection</a></li>
													</ul>
												</div>
											</div></li>



										<li class="nav-item border-bottom w-100 collapsed"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseFive" aria-expanded="false"
											aria-controls="flush-collapseFive"><a href="#"
											class="nav-link">Breakfast &amp; Instant Food <i
												class="feather-icon icon-chevron-right"></i></a> <!-- collapse -->
											<div id="flush-collapseFive"
												class="accordion-collapse collapse"
												data-bs-parent="#categoryCollapseMenu">
												<div>

													<ul class="nav flex-column ms-3">
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link active"
															aria-current="page" href="#!">Batter</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Breakfast
																Cereal</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Noodles,
																Pasta &amp; Soup</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Frozen
																Non-Veg Snackss</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Frozen
																Veg</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Vermicelli</a>
														</li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Instant
																Mixes</a></li>
													</ul>
												</div>
											</div></li>
										<li class="nav-item border-bottom w-100 collapsed"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseSix"
											aria-expanded="false" aria-controls="flush-collapseSix">
											<a href="#" class="nav-link">Bakery &amp; Biscuits <i
												class="feather-icon icon-chevron-right"></i></a> <!-- collapse -->
											<div id="flush-collapseSix"
												class="accordion-collapse collapse"
												data-bs-parent="#categoryCollapseMenu">
												<div>

													<ul class="nav flex-column ms-3">
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link active"
															aria-current="page" href="#!">Cookies</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Glucose
																&amp; Marie</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Sweet
																&amp; Salty</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Healthy
																&amp; Digestive</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Cream
																Biscuits</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Rusks
																&amp; Wafers</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Cakes
																&amp; Rolls</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">
																Buns &amp; Bakery</a></li>
													</ul>

												</div>
											</div>
										</li>
										<li class="nav-item border-bottom w-100 collapsed"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseSeven" aria-expanded="false"
											aria-controls="flush-collapseSeven"><a href="#"
											class="nav-link">Chicken, Meat &amp; Fish <i
												class="feather-icon icon-chevron-right"></i></a> <!-- collapse -->
											<div id="flush-collapseSeven"
												class="accordion-collapse collapse"
												data-bs-parent="#categoryCollapseMenu">
												<div>

													<ul class="nav flex-column ms-3">
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link active"
															aria-current="page" href="#!">Chicken</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Sausage,
																Salami &amp; Ham</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Exotic
																Meat</a></li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Eggs</a>
														</li>
														<!-- nav item -->
														<li class="nav-item"><a class="nav-link" href="#!">Frozen
																Non-Veg Snacks</a></li>

													</ul>
												</div>
											</div></li>

									</ul>
								</div>

								<div class="mb-8">

									<h5 class="mb-3">Stores</h5>
									<div class="my-4">
										<!-- input -->
										<input type="search" class="form-control"
											placeholder="Search by store">
									</div>
									<!-- form check -->
									<div class="form-check mb-2">
										<!-- input -->
										<input class="form-check-input" type="checkbox" value=""
											id="eGrocery" checked=""> <label
											class="form-check-label" for="eGrocery"> E-Grocery </label>
									</div>
									<!-- form check -->
									<div class="form-check mb-2">
										<!-- input -->
										<input class="form-check-input" type="checkbox" value=""
											id="DealShare"> <label class="form-check-label"
											for="DealShare"> DealShare </label>
									</div>
									<!-- form check -->
									<div class="form-check mb-2">
										<!-- input -->
										<input class="form-check-input" type="checkbox" value=""
											id="Dmart"> <label class="form-check-label"
											for="Dmart"> DMart </label>
									</div>
									<!-- form check -->
									<div class="form-check mb-2">
										<!-- input -->
										<input class="form-check-input" type="checkbox" value=""
											id="Blinkit"> <label class="form-check-label"
											for="Blinkit"> Blinkit </label>
									</div>
									<!-- form check -->
									<div class="form-check mb-2">
										<!-- input -->
										<input class="form-check-input" type="checkbox" value=""
											id="BigBasket"> <label class="form-check-label"
											for="BigBasket"> BigBasket </label>
									</div>
									<!-- form check -->
									<div class="form-check mb-2">
										<!-- input -->
										<input class="form-check-input" type="checkbox" value=""
											id="StoreFront"> <label class="form-check-label"
											for="StoreFront"> StoreFront </label>
									</div>
									<!-- form check -->
									<div class="form-check mb-2">
										<!-- input -->
										<input class="form-check-input" type="checkbox" value=""
											id="Spencers"> <label class="form-check-label"
											for="Spencers"> Spencers </label>
									</div>
									<!-- form check -->
									<div class="form-check mb-2">
										<!-- input -->
										<input class="form-check-input" type="checkbox" value=""
											id="onlineGrocery"> <label class="form-check-label"
											for="onlineGrocery"> Online Grocery </label>
									</div>

								</div>
								<div class="mb-8">
									<!-- price -->
									<h5 class="mb-3">Price</h5>
									<div>
										<!-- range -->
										<div id="priceRange"
											class="mb-3 noUi-target noUi-ltr noUi-horizontal noUi-txt-dir-ltr">
											<div class="noUi-base">
												<div class="noUi-connects">
													<div class="noUi-connect"
														style="transform: translate(14.6259%, 0px) scale(0.510204, 1);"></div>
												</div>
												<div class="noUi-origin"
													style="transform: translate(-85.3741%, 0px); z-index: 5;">
													<div class="noUi-handle noUi-handle-lower" data-handle="0"
														tabindex="0" role="slider" aria-orientation="horizontal"
														aria-valuemin="6.0" aria-valuemax="199.0"
														aria-valuenow="49.0" aria-valuetext="$49">
														<div class="noUi-touch-area"></div>
													</div>
												</div>
												<div class="noUi-origin"
													style="transform: translate(-34.3537%, 0px); z-index: 4;">
													<div class="noUi-handle noUi-handle-upper" data-handle="1"
														tabindex="0" role="slider" aria-orientation="horizontal"
														aria-valuemin="49.0" aria-valuemax="300.0"
														aria-valuenow="199.0" aria-valuetext="$199">
														<div class="noUi-touch-area"></div>
													</div>
												</div>
											</div>
										</div>
										<small class="text-muted">Price:</small> <span
											id="priceRange-value" class="small">$49 - $199</span>

									</div>



								</div>
								<!-- rating -->
								<div class="mb-8">

									<h5 class="mb-3">Rating</h5>
									<div>
										<!-- form check -->
										<div class="form-check mb-2">
											<!-- input -->
											<input class="form-check-input" type="checkbox" value=""
												id="ratingFive"> <label class="form-check-label"
												for="ratingFive"> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star-fill text-warning "></i> <i
												class="bi bi-star-fill text-warning "></i> <i
												class="bi bi-star-fill text-warning "></i> <i
												class="bi bi-star-fill text-warning "></i>
											</label>
										</div>
										<!-- form check -->
										<div class="form-check mb-2">
											<!-- input -->
											<input class="form-check-input" type="checkbox" value=""
												id="ratingFour" checked=""> <label
												class="form-check-label" for="ratingFour"> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star-fill text-warning "></i> <i
												class="bi bi-star-fill text-warning "></i> <i
												class="bi bi-star-fill text-warning "></i> <i
												class="bi bi-star text-warning"></i>
											</label>
										</div>
										<!-- form check -->
										<div class="form-check mb-2">
											<!-- input -->
											<input class="form-check-input" type="checkbox" value=""
												id="ratingThree"> <label class="form-check-label"
												for="ratingThree"> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star-fill text-warning "></i> <i
												class="bi bi-star-fill text-warning "></i> <i
												class="bi bi-star text-warning"></i> <i
												class="bi bi-star text-warning"></i>
											</label>
										</div>
										<!-- form check -->
										<div class="form-check mb-2">
											<!-- input -->
											<input class="form-check-input" type="checkbox" value=""
												id="ratingTwo"> <label class="form-check-label"
												for="ratingTwo"> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star text-warning"></i> <i
												class="bi bi-star text-warning"></i> <i
												class="bi bi-star text-warning"></i>
											</label>
										</div>
										<!-- form check -->
										<div class="form-check mb-2">
											<!-- input -->
											<input class="form-check-input" type="checkbox" value=""
												id="ratingOne"> <label class="form-check-label"
												for="ratingOne"> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star text-warning"></i> <i
												class="bi bi-star text-warning"></i> <i
												class="bi bi-star text-warning"></i> <i
												class="bi bi-star text-warning"></i>
											</label>
										</div>
									</div>


								</div>
								<div class="mb-8 position-relative">
									<!-- Banner Design -->
									<!-- Banner Content -->
									<div class="position-absolute p-5 py-8">
										<h3 class="mb-0">Fresh Fruits</h3>
										<p>Get Upto 25% Off</p>
										<a href="#" class="btn btn-dark">Shop Now<i
											class="feather-icon icon-arrow-right ms-1"></i></a>
									</div>
									<!-- Banner Content -->
									<!-- Banner Image -->
									<!-- img -->
									<img src="../assets/images/banner/assortment-citrus-fruits.png"
										alt="" class="img-fluid rounded ">
									<!-- Banner Image -->
								</div>
							</div>
						</div>
					</aside>
					<section class="col-lg-9 col-md-12">
						<!-- card -->
						<div class="card mb-4 bg-light border-0">
							<!-- card body -->
							<div class=" card-body p-9">
								<h2 class="mb-0 fs-1">Snacks &amp; Munchies</h2>
							</div>
						</div>
						<!-- list icon -->
						<div class="d-lg-flex justify-content-between align-items-center">
							<div class="mb-3 mb-lg-0">
								<p class="mb-0">
									<span class="text-dark">24 </span> Products found
								</p>
							</div>

							<!-- icon -->
							<div class="d-md-flex justify-content-between align-items-center">
								<div class="d-flex align-items-center justify-content-between">
									<div>

										<a href="shop-list.html" class="text-muted me-3"><i
											class="bi bi-list-ul"></i></a> <a href="shop-grid.html"
											class=" me-3 active"><i class="bi bi-grid"></i></a> <a
											href="shop-grid-3-column.html" class="me-3 text-muted"><i
											class="bi bi-grid-3x3-gap"></i></a>
									</div>
									<div class="ms-2 d-lg-none">
										<a class="btn btn-outline-gray-400 text-muted"
											data-bs-toggle="offcanvas" href="#offcanvasCategory"
											role="button" aria-controls="offcanvasCategory"><svg
												xmlns="http://www.w3.org/2000/svg" width="14" height="14"
												viewBox="0 0 24 24" fill="none" stroke="currentColor"
												stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-filter me-2">
                  <polygon
													points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon>
                </svg> Filters</a>
									</div>
								</div>

								<div class="d-flex mt-2 mt-lg-0">
									<div class="me-2 flex-grow-1">
										<!-- select option -->
										<select class="form-select">
											<option selected="">Show: 50</option>
											<option value="10">10</option>
											<option value="20">20</option>
											<option value="30">30</option>
										</select>
									</div>
									<div>
										<!-- select option -->
										<select class="form-select">
											<option selected="">Sort by: Featured</option>
											<option value="Low to High">Price: Low to High</option>
											<option value="High to Low">Price: High to Low</option>
											<option value="Release Date">Release Date</option>
											<option value="Avg. Rating">Avg. Rating</option>

										</select>
									</div>

								</div>

							</div>
						</div>
						<!-- row -->
						<div
							class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">

							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">

										<!-- badge -->
										<div class="text-center position-relative ">
											<div class=" position-absolute top-0 start-0">
												<span class="badge bg-danger">Sale</span>
											</div>
											<a href="shop-single.html"> <!-- img -->
												<img src="../assets/images/products/product-img-1.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="shop-wishlist.html" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Wishlist" data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Snack
													&amp; Munchies</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Haldiram's Sev
												Bhujia</a>
										</h2>
										<div>
											<!-- rating -->
											<small class="text-warning"> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-half"></i></small> <span
												class="text-muted small">4.5(149)</span>
										</div>
										<!-- price -->
										<div
											class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$18</span> <span
													class="text-decoration-line-through text-muted">$24</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">
										<!-- badge -->
										<div class="text-center position-relative">
											<div class=" position-absolute top-0 start-0">
												<span class="badge bg-success">14%</span>
											</div>

											<a href="shop-single.html"> <!-- img -->
												<img src="../assets/images/products/product-img-2.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip"
													data-bs-html="true" aria-label="Wishlist"
													data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Bakery
													&amp; Biscuits</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">NutriChoice
												Digestive </a>
										</h2>
										<div class="text-warning">
											<!-- rating -->
											<small> <i class="bi bi-star-fill"></i> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small>
											<span class="text-muted small">4.5 (25)</span>
										</div>
										<!-- price -->
										<div
											class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$24</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">
										<!-- badge -->
										<div class="text-center position-relative">
											<a href="shop-single.html"><img
												src="../assets/images/products/product-img-3.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip"
													data-bs-html="true" aria-label="Wishlist"
													data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Bakery
													&amp; Biscuits</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Cadbury 5 Star
												Chocolate</a>
										</h2>
										<div class="text-warning">
											<!-- rating -->
											<small> <i class="bi bi-star-fill"></i> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i></small>
											<span class="text-muted small">5 (469)</span>
										</div>
										<!-- price -->
										<div
											class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$32</span> <span
													class="text-decoration-line-through text-muted">$35</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">
										<!-- badge -->
										<div class="text-center position-relative">
											<div class=" position-absolute top-0">
												<span class="badge bg-danger">Hot</span>
											</div>

											<a href="shop-single.html"> <!-- img -->
												<img src="../assets/images/products/product-img-4.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip"
													data-bs-html="true" aria-label="Wishlist"
													data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Snack
													&amp; Munchies</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Onion Flavour
												Potato</a>
										</h2>
										<div class="text-warning">
											<!-- rating -->
											<small> <i class="bi bi-star-fill"></i> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-half"></i> <i class="bi bi-star"></i></small> <span
												class="text-muted small">3.5 (456)</span>
										</div>
										<!-- price -->
										<div
											class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$3</span> <span
													class="text-decoration-line-through text-muted">$5</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">
										<!-- badge -->
										<div class="text-center position-relative">
											<a href="shop-single.html"><img
												src="../assets/images/products/product-img-5.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip"
													data-bs-html="true" aria-label="Wishlist"
													data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Instant
													Food</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Salted Instant
												Popcorn </a>
										</h2>
										<div class="text-warning">
											<!-- rating -->
											<small> <i class="bi bi-star-fill"></i> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small>
											<span class="text-muted small">4.5 (39)</span>
										</div>
										<div class="d-flex justify-content-between mt-4">
											<div>
												<span class="text-dark">$13</span> <span
													class="text-decoration-line-through text-muted">$18</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">

										<!-- badge -->
										<div class="text-center position-relative ">
											<div class=" position-absolute top-0">
												<span class="badge bg-danger">Sale</span>
											</div>
											<a href="shop-single.html"> <!-- img -->
												<img src="../assets/images/products/product-img-6.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="shop-wishlist.html" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Wishlist" data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Dairy,
													Bread &amp; Eggs</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Blueberry
												Greek Yogurt</a>
										</h2>
										<div>
											<!-- rating -->
											<small class="text-warning"> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-half"></i></small> <span
												class="text-muted small">4.5 (189)</span>
										</div>
										<!-- price -->
										<div
											class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$18</span> <span
													class="text-decoration-line-through text-muted">$24</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">
										<!-- badge -->
										<div class="text-center position-relative">
											<a href="shop-single.html"><img
												src="../assets/images/products/product-img-7.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip"
													data-bs-html="true" aria-label="Wishlist"
													data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Dairy,
													Bread &amp; Eggs</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Britannia
												Cheese Slices</a>
										</h2>
										<div class="text-warning">
											<!-- rating -->
											<small> <i class="bi bi-star-fill"></i> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i></small>
											<span class="text-muted small">5 (345)</span>
										</div>
										<!-- price -->
										<div
											class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$24</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">
										<!-- badge -->
										<div class="text-center position-relative">
											<a href="shop-single.html"><img
												src="../assets/images/products/product-img-8.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip"
													data-bs-html="true" aria-label="Wishlist"
													data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Instant
													Food</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Kellogg's
												Original Cereals</a>
										</h2>
										<div class="text-warning">
											<!-- rating -->
											<small> <i class="bi bi-star-fill"></i> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small>
											<span class="text-muted small">4 (90)</span>
										</div>
										<!-- price -->
										<div
											class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$32</span> <span
													class="text-decoration-line-through text-muted">$35</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">
										<!-- badge -->
										<div class="text-center position-relative">
											<a href="shop-single.html"><img
												src="../assets/images/products/product-img-9.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip"
													data-bs-html="true" aria-label="Wishlist"
													data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Snack
													&amp; Munchies</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Slurrp Millet
												Chocolate </a>
										</h2>
										<div class="text-warning">
											<!-- rating -->
											<small> <i class="bi bi-star-fill"></i> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small>
											<span class="text-muted small">4.5 (67)</span>
										</div>
										<!-- price -->
										<div
											class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$3</span> <span
													class="text-decoration-line-through text-muted">$5</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
							<!-- col -->
							<div class="col">
								<!-- card -->
								<div class="card card-product">
									<div class="card-body">
										<!-- badge -->
										<div class="text-center position-relative">
											<a href="shop-single.html"><img
												src="../assets/images/products/product-img-10.jpg"
												alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>
											<!-- action btn -->
											<div class="card-product-action">

												<a href="#!" class="btn-action" data-bs-toggle="modal"
													data-bs-target="#quickViewModal"><i class="bi bi-eye"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Quick View" data-bs-original-title="Quick View"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip"
													data-bs-html="true" aria-label="Wishlist"
													data-bs-original-title="Wishlist"><i
													class="bi bi-heart"></i></a> <a href="#!" class="btn-action"
													data-bs-toggle="tooltip" data-bs-html="true"
													aria-label="Compare" data-bs-original-title="Compare"><i
													class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<!-- heading -->
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Dairy,
													Bread &amp; Eggs</small></a>
										</div>
										<h2 class="fs-6">
											<a href="shop-single.html"
												class="text-inherit text-decoration-none">Amul Butter -
												500 g</a>
										</h2>
										<div class="text-warning">
											<!-- rating -->
											<small> <i class="bi bi-star-fill"></i> <i
												class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-half"></i> <i class="bi bi-star"></i></small> <span
												class="text-muted small">3.5 (89)</span>
										</div>
										<div class="d-flex justify-content-between mt-4">
											<div>
												<span class="text-dark">$13</span> <span
													class="text-decoration-line-through text-muted">$18</span>
											</div>
											<!-- btn -->
											<div>
												<a href="#!" class="btn btn-primary btn-sm"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
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
						<div class="row mt-8">
							<div class="col">
								<!-- nav -->
								<nav>
									<ul class="pagination">
										<li class="page-item disabled"><a
											class="page-link  mx-1 " href="#" aria-label="Previous">
												<i class="feather-icon icon-chevron-left"></i>
										</a></li>
										<li class="page-item "><a class="page-link  mx-1 active"
											href="#">1</a></li>
										<li class="page-item"><a class="page-link mx-1 text-body"
											href="#">2</a></li>

										<li class="page-item"><a class="page-link mx-1 text-body"
											href="#">...</a></li>
										<li class="page-item"><a class="page-link mx-1 text-body"
											href="#">12</a></li>
										<li class="page-item"><a class="page-link mx-1 text-body"
											href="#" aria-label="Next"> <i
												class="feather-icon icon-chevron-right"></i>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
</body>
</html>