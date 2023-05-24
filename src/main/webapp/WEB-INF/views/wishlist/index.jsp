<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<body>

	<div class="my-5">
		<div class="container">
			<div class="row ">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
							<li class="breadcrumb-item  "><a href="index.htm"
								class="text-decoration-none text-success "><s:message
										code="wishlist.breadcrumb_1" /> </a></li>
							<li class="breadcrumb-item active" aria-current="page"
								class="text-decoration-none"><s:message
									code="wishlist.breadcrumb_2" /></li>
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
							<s:message code="wishlist.breadcrumb_2" />
						</h1>
						<p class="mb-4">
							<c:if test="${wishlists.size() > 0 }">
								<span>${wishlists.size()}</span>
								<s:message code="wishlist.find" />
							</c:if>
							<c:if test="${wishlists.size() == 0 }">
								<s:message code="wishlist.none" />
							</c:if>
						</p>
					</div>


				</div>
			</div>
			<c:if test="${wishlists.size() > 0 }">
				<div class="row">
					<!-- table -->
					<div class="col-12">
						<div class="table-responsive">
							<table class="table text-nowrap">
								<thead class="table-success">
									<tr>
										<th><s:message code="wishlist.photo" /></th>
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
															class="icon-shape" alt="" width="200" height="200">
														</a>
													</div>
												</div>


											</td>
											<td class="align-middle">
												<div class="d-flex align-items-center">
													<div class="text">
														<h5 class="fs-6 mb-0">
															<a
																href="product/detail.htm?productId=${c.product.productId }"
																class="text-inherit link-success
																">${c.product.productName }</a>
														</h5>
														<small class="text-muted text-wrap">${c.product.unit }</small>
													</div>
												</div>
											</td>

											<td class="align-middle"><fmt:formatNumber
													value="${c.product.price}" type="currency"
													currencySymbol="đ" maxFractionDigits="0" /></td>
											<td class="align-middle"><a
												href='<c:url value = "wishlist/addToCart/${c.product.productId}.htm"/>'
												type="button"
												class="btn btn-success  btn-sm ${(c.product.quantity == 0) ? 'disabled' : '' }">
													<c:if test="${(c.product.quantity == 0) }">
														<s:message code="wishlist.out_of_item" />
													</c:if> <c:if test="${(c.product.quantity > 0) }">
														<s:message code="wishlist.add_to_cart" />
													</c:if>
											</a></td>

											<td class="align-middle "><a
												href='<c:url value = "wishlist/delete/${c.product.productId}.htm"/>'
												class="text-muted"> <i class="bi bi-trash"></i>
											</a></td>
										</tr>

									</tbody>

								</c:forEach>

							</table>
						</div>
					</div>



				</div>
			</c:if>

		</div>
	</section>
	<!--End wishlist -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>