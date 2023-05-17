<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<body>

	<div class="m-4 wishlist-breadcrumb">
		<div class="container">
			<div class="row ">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="#!">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page"><s:message
									code="wishlist.name" /></li>
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
							<s:message code="wishlist.title" />
						</h1>
						<p class="mb-4">
							<s:message code="wishlist.detail1" />
							<span>5</span>
							<s:message code="wishlist.detail2" />
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
									<th><s:message code="wishlist.name" /></th>
									<th><s:message code="wishlist.des" /></th>
									<th><s:message code="wishlist.price" /></th>
									<th><s:message code="wishlist.action" /></th>
									<th><s:message code="wishlist.remove" /></th>
								</tr>
							</thead>
							<c:forEach var="c" items="${wishlists }">
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
										<td class="align-middle">
											<a href = '<c:url value = "wishlist/addToCart/${c.product.productId}.htm"/>'type="button" class="btn btn-success">Add To
												Cart</a>
										</td>

										<td class="align-middle "><a
											href='<c:url value = "wishlist/delete/${c.product.productId}.htm"/>'
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


		</div>
	</section>
	<!--End wishlist -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>