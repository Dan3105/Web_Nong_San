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
										code="search.breadcrumb_1" /> </a></li>
							<li class="breadcrumb-item active" aria-current="page"
								class="text-decoration-none"><s:message
									code="search.breadcrumb_2" /></li>
						</ol>

					</nav>
				</div>
			</div>
		</div>
	</div>

	<div class="container mb-5">

		<h5 class="py-4 text-success">
			<c:if test="${total == 0}">
				<span><s:message code="search.none" /></span>
			</c:if>
			<c:if test="${total > 0}">
				${total} <span><s:message code="search.find" /></span>
			</c:if>

		</h5>

		<div class="row row-cols-2 row-cols-md-4  g-4">
			<c:forEach var="p" items="${products }">
				<!-- col -->
				<div class="col">
					<!-- card -->
					<div class="card card-product">
						<div class="card-body">

							<!-- badge -->
							<div class="text-center position-relative ">
								<c:if test="${p.coupon.discount != null}">
									<div class=" position-absolute top-0 start-0">
										<span class="badge bg-danger">30%</span>
									</div>
								</c:if>
								<a href="product/detail.htm?productId=${p.productId }"> <img
									src="<c:url value="/assets/img/products/${p.image}"/>"
									alt="Product" class=" img-fluid" style="width: 200px; height: 200px">
								</a>
								<div class="card-product-action ${(p.quantity == 0)?  'invisible' : 'visible' }">
									<a href="product/detail.htm?productId=${p.productId }"
										class="btn-action"><i class="bi bi-eye"></i></a> <a
										href='<c:url value = "product/addToWishlist.htm?productId=${p.productId }"/>'
										class="btn-action"><i class="bi bi-heart"></i></a> <a
										href='<c:url value = "product/addToCart.htm?productId=${p.productId }"/>'
										class="btn-action"><i class="bi bi-cart-plus"></i></a>
								</div>

							</div>

							<!-- heading category -->
							<div class="text-small mt-2 mb-1 text-muted">
								<small>${p.category.name }</small>
							</div>

							<h2 class="fs-6 text-inherit text-success">${p.productName }</h2>


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


							</div>
						</div>
					</div>
				</div>
			</c:forEach>



		</div>


	</div>

	<!-- Phan trang -->
	<div class="row mt-5 ">

		<!-- nav -->
		<nav>
			<ul class="pagination d-flex justify-content-center ms-2">
				<li class="page-item ${(currentPage == 1) ? 'disabled' : '' }"><a
					class="page-link  mx-1 " aria-label="Previous"
					href="searchFood.htm?index=${currentPage - 1 }&currentPage=${in.count  }&search=${search }">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="i" begin="1" end="${totalPage}" varStatus="in">

					<li class="page-item "><a
						class="page-link  mx-1 ${(currentPage == in.count) ? 'active' : '' }"
						href="searchFood.htm?currentPage=${in.count  }&search=${search}">${in.count}</a></li>
				</c:forEach>
				<li class="page-item"><a
					class="page-link mx-1 text-body ${(currentPage == totalPage) ? 'disabled' : '' }"
					aria-label="Next"
					href="searchFood.htm?currentPage=${currentPage + 1  }&search=${search }">
						<span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>



	</div>


	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>