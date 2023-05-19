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
				<div class="col-12">
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


				</div>
			</div>

			<div class="row">
				<!-- table -->
				<div class="col-12">
					<div class="table-responsive">
						<table class="table text-nowrap">
							<thead class="table-light">
								<tr>
									<th><s:message code="cart.name" /></th>
									<th><s:message code="cart.des" /></th>
									<th><s:message code="cart.price" /></th>
									<th><s:message code="cart.amount" /></th>
									<th><s:message code="cart.total" /></th>
									<th><s:message code="cart.remove" /></th>
								</tr>
							</thead>
							<c:forEach var="c" items="${carts }">
								<tbody>
									<tr>
										<td class="align-middle">
											<div class="d-flex align-items-center">
												<div class="image">
													<a href="#"><img
														src="<c:url value="/assets/img/products/${c.product.image}"/>"
														class="icon-shape" alt=""> </a>
												</div>

											</div>


										</td>
										<td class="align-middle">
											<div class="d-flex align-items-center">
												<div class="text">
													<h5 class="fs-6 mb-0">
														<a href="#" class="text-inherit">${c.product.productName }</a>
													</h5>
													<small>${c.product.detail }</small>
												</div>
											</div>
										</td>

										<td class="align-middle"><fmt:formatNumber
												value="${c.product.price}" type="currency"
												currencySymbol="đ" maxFractionDigits="0" /></td>
										<td class="align-middle"><c:if test="${c.quantity > 1}">
												<a role="button"
													href="cart/quantity/minus.htm?productID=${c.product.productId}&quantity=${c.quantity}"
													class="  btn btn-light">-</a>
											</c:if> <c:if test="${c.quantity == 1}">
												<a role="button" aria-disabled="true"
													href="cart/quantity/minus.htm?productID=${c.product.productId}&quantity=${c.quantity}"
													class="disabled btn btn-light">-</a>
											</c:if> <label class="border border-light px-3 py-1 pb-1">${c.quantity}</label>
											<a role="button"
											href="cart/quantity/plus.htm?productID=${c.product.productId}&quantity=${c.quantity}"
											class="btn btn-light">+</a></td>
										<td class="align-middle"><fmt:formatNumber
												value="${c.product.price * c.quantity }" type="currency"
												currencySymbol="đ" maxFractionDigits="0" /></td>
										<td class="align-middle "><a
											href='<c:url value = "cart/delete/${c.product.productId}.htm"/>'
											class="text-muted" data-bs-toggle="tooltip"
											data-bs-placement="top" aria-label="Delete"
											data-bs-original-title="Delete"> <i class="bi bi-trash"></i>
										</a></td>
									</tr>

								</tbody>

							</c:forEach>

						</table>
					</div>
				</div>
				<!-- Chi tiết đặt hàng -->

			</div>
			<div class="row mb-4">
				<div class="col-7"></div>
				<div
					class="col-lg-5 col-sm-12 p-2 text-dark bg-opacity-10"
					>
					<div class="  mb-5 mb-lg-0">
						<div class="card-body p-4">
							<div class="row">

								<div class="d-flex " style="font-weight: 500;">
									<p class="mb-2 me-2 me-auto ">Tạm Tính</p>
									<p class="mb-2">
										<fmt:formatNumber value="${total }" type="currency"
											currencySymbol="đ" maxFractionDigits="0" />
									</p>
								</div>

								<div class="d-flex  " style="font-weight: 500;">
									<p class="mb-0 me-2 me-auto">Giảm Giá</p>
									<p class="mb-0 ms-auto">
										<fmt:formatNumber value="${total }" type="currency"
											currencySymbol="đ" maxFractionDigits="0" />
									</p>
								</div>

								<hr class="my-4">

								<div class="d-flex   mb-4" style="font-weight: 500;">
									<p class="mb-2 me-2 me-auto">Tổng Cộng</p>
									<p class="mb-2 ms-auto">
										<fmt:formatNumber value="${total }" type="currency"
											currencySymbol="đ" maxFractionDigits="0" />
									</p>
								</div>

								<a href="#" type="button" class="btn btn-primary mb-4 ">
									Tiếp tục mua hàng </a> <a type="button" href="#"
									class="btn btn-success  ${cart.size() == 0 ? 'disabled' : ''}">
									Thanh Toán </a>

							</div>


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