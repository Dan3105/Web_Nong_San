<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>




<body>

	<div class="m-4 cart-breadcrumb">
		<div class="container">
			<div class="row ">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="#!">Home</a></li>
							<li class="breadcrumb-item"><a href="#!">Shop</a></li>
							<li class="breadcrumb-item active" aria-current="page">Cart</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<section class="mt-8 mb-14">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="mb-8">

						<h1 class="mb-1">
							<s:message code="cart.title" />
						</h1>
						<p class="mb-4">
							<s:message code="cart.detail1" />
							<span>5</span>
							<s:message code="cart.detail2" />
						</p>
					</div>
					<div>

						<!-- table -->
						<div class="table-responsive">
							<table class="table text-nowrap">
								<thead class="table-light">
									<tr>
										<th><s:message code="cart.name" /></th>
										<th><s:message code="cart.price" /></th>
										<th><s:message code="cart.amount" /></th>
										<th><s:message code="cart.total" /></th>
										<th><s:message code="cart.remove" /></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="align-middle">
											<div class="d-flex align-items-center">
												<div class="image">
													<a href="#"><img
														src="assets/img/products/product-img-1.jpg"
														class="icon-shape" alt=""> </a>
												</div>
												<div class="text">
													<h5 class="fs-6 mb-0">
														<a href="#" class="text-inherit">Organic Banana</a>
													</h5>
													<small>$.98 / lb</small>
												</div>
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
	<!--End cart -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>