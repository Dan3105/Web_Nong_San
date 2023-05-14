<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

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
				<div class="col-9">
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
							<c:forEach var="c" items="${carts }">
								<tbody>
									<tr>
										<td class="align-middle">
											<div class="d-flex align-items-center">
												<div class="image">
													<a href="#"><img src="${c.product.image }"
														class="icon-shape" alt=""> </a>
												</div>
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
													href="cart/quantity/minus.htm?productID=${c.product.productID}&quantity=${c.quantity}"
													class="  btn btn-light">-</a>
											</c:if> <c:if test="${c.quantity == 1}">
												<a role="button" aria-disabled="true"
													href="cart/quantity/minus.htm?productID=${c.product.productID}&quantity=${c.quantity}"
													class="disabled btn btn-light">-</a>
											</c:if> <label class="border border-light px-3 py-1 pb-1">${c.quantity}</label>
											<a role="button"
											href="cart/quantity/plus.htm?productID=${c.product.productID}&quantity=${c.quantity}"
											class="btn btn-light">+</a></td>
										<td class="align-middle"><fmt:formatNumber
												value="${c.product.price * c.quantity }" type="currency"
												currencySymbol="đ" maxFractionDigits="0" /></td>
										<td class="align-middle "><a
											href='<c:url value = "cart/delete/${c.product.productID}.htm"/>'
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
				<div class="col-3">
					<div class="bg-success bg-opacity-10 p-2 mb-2">
						<!-- Địa chỉ -->
						<div class="fs-6 fw-bold">Giao tới</div>
						<div class="h5 ps-3">
							<%-- ${sessionScope.user.lastName } --%>
							AHIHI
						</div>
						<div class="text-secondary">Số điện thoại: AHIHI</div>
						<div class="text-secondary fst-italic">AHIHI</div>
					</div>

					<div class="bg-success bg-opacity-10 p-2 mb-2">
						<!-- Giảm giá -->
						<div class="fw-bold">Chưa có chương trình giảm giá</div>
						<!-- Tiêu đề cho chương trình giảm giá -->
						<div class="fst-italic">Giảm: 0%</div>
					</div>

					<div class="bg-success bg-opacity-10 p-2 mb-2 ">
						<!-- Bảng giá -->
						<div class="row">
							<div class="col">Tạm tính:</div>
							<div class="col text-end">
								<fmt:formatNumber value="${total }" type="currency"
									currencySymbol="đ" maxFractionDigits="0" />
							</div>
						</div>
						<div class="row">
							<div class="col">Giảm giá:</div>
							<div class="col text-end">-0 đ</div>
						</div>
						<hr>
						<div class="row fw-bolder">
							<div class="col">Tổng cộng:</div>
							<div class="col text-end">
								<fmt:formatNumber value="${total }" type="currency"
									currencySymbol="đ" maxFractionDigits="0" />
							</div>
						</div>
					</div>
					<div class="p-2 d-grid">
						<!-- Button -->
						<a class="btn btn-warning bg-gradient" href="home.htm"
							role="button">Tiếp tục mua sắm</a>
					</div>
					<div class="p-2 d-grid">
						<!-- Button -->
						<a
							class="btn btn-danger bg-gradient ${cart.size() == 0 ? 'disabled' : ''}"
							href="user/checkout.htm" role="button">Mua hàng</a>
					</div>
				</div>
			</div>



		</div>
	</section>
	<!--End cart -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>