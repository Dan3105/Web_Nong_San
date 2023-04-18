<%@include file="/WEB-INF/views/include/header.jsp"%>




<body>

	<!-- Wishlist Breadcrumb -->
	<div class="m-4 wishlist-breadcrumb">
		<div class="container">
			<div class="row ">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="#!">Home</a></li>
							<li class="breadcrumb-item"><a href="#!">Shop</a></li>
							<li class="breadcrumb-item active" aria-current="page">My
								Wishlist</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!--End Wishlist Breadcrumb -->

	<!-- Wishlist -->
	<section class="mt-8 mb-14">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="mb-8">

						<h1 class="mb-1">
							<s:message code="wishlist.title" />
						</h1>
						<p class="mb-4">
							<s:message code="wishlist.detail1" />
							<span>5</span>
							<s:message code="wishlist.detail2" />
						</p>
					</div>
					<div>

						<!-- table -->
						<div class="table-responsive">
							<table class="table text-nowrap table-with-checkbox">
								<thead class="table-light">
									<tr>
										<th>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value=""
													onClick="toggle(this)" id="checkAll"> <label
													class="form-check-label" for="checkAll"> </label>
											</div>
										</th>
										<th></th>
										<th><s:message code="wishlist.product" /></th>
										<th><s:message code="wishlist.amount" /></th>
										<th><s:message code="wishlist.status" /></th>
										<th><s:message code="wishlist.actions" /></th>
										<th><s:message code="wishlist.remove" /></th>
									</tr>
								</thead>
								<tbody>
									<tr>

										<td class="align-middle">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value=""
													id="chechboxTwo"> <label class="form-check-label"
													for="chechboxTwo"> </label>
											</div>

										</td>
										<td class="align-middle"><a href="#"><img
												src="assets/img/products/product-img-1.jpg"
												class="icon-shape icon-xxl" alt=""></a></td>
										<td class="align-middle">
											<div>
												<h5 class="fs-6 mb-0">
													<a href="#" class="text-inherit">Organic Banana</a>
												</h5>
												<small>$.98 / lb</small>
											</div>
										</td>
										<td class="align-middle">$35.00</td>
										<td class="align-middle"><span class="badge bg-success">In
												Stock</span></td>
										<td class="align-middle">
											<div class="btn btn-primary btn-sm">Add to Cart</div>
										</td>
										<td class="align-middle "><a href="#" class="text-muted"
											data-bs-toggle="tooltip" data-bs-placement="top"
											aria-label="Delete" data-bs-original-title="Delete"> <i
												class="bi bi-trash"></i>
										</a></td>
									</tr>

								</tbody>
							</table>
						</div>

					</div>
				</div>

			</div>



		</div>

	</section>
	<!--End Wishlist -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="assets/js/wishlist.js"></script>
</body>
</html>