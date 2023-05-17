<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="my-4">
	<div class="container">
		<div class="row ">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
						<li class="breadcrumb-item  "><a href="#!"
							class="text-decoration-none ">Home</a></li>
						<li class="breadcrumb-item"><a href="#!"
							class="text-decoration-none">Shop</a></li>
						<li class="breadcrumb-item active" aria-current="page"
							class="text-decoration-none">Category</li>
					</ol>

				</nav>
			</div>
		</div>
	</div>
</div>



<div class=" mt-8 mb-lg-14 mb-8">
	<div class="container">
		<div class="row gx-10">
			<%@include file="/WEB-INF/views/product/productAsideBar.jsp"%>
			<section class="col-lg-9 col-md-12">
				<!-- card -->
				<div class="card mb-4 bg-light border-0">
					<!-- card body -->
					<div class=" card-body p-9">
						<h2 class="mb-0 fs-1">${currentCategory.name }</h2>
					</div>
				</div>
				<!-- list icon -->
				<div class="d-lg-flex justify-content-between align-items-center">
					<div class="mb-3 mb-lg-0">
						<p class="mb-0">
							<span class="text-dark">${fn:length(productsFilterWithCategory) }
							</span> Products found
						</p>
					</div>

					<!-- icon -->
					<div class="d-md-flex justify-content-between align-items-center">

						<div>

							<!-- select option -->
							<div class="dropdown">
								<button class="btn btn-success dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Filter</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="product/filter.htm?index=0&categoryId=${currentCategory.categoryId }">
											None</a></li>
									<li><a class="dropdown-item"
										href="product/filter.htm?index=1&categoryId=${currentCategory.categoryId }">Low
											to High</a></li>
									<li><a class="dropdown-item"
										href="product/filter.htm?index=2&categoryId=${currentCategory.categoryId }">High
											to Low</a></li>
									<li><a class="dropdown-item"
										href="product/filter.htm?index=3&categoryId=${currentCategory.categoryId }">Release
											Date </a></li>
									<li><a class="dropdown-item"
										href="product/filter.htm?index=4&categoryId=${currentCategory.categoryId }">Rating
									</a></li>
								</ul>
							</div>

						</div>




					</div>
				</div>


				<div
					class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
					<c:forEach var="p" items="${productsFilterWithCategory }">
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
										<a href="product/detail.htm?productId=${p.productId }"> <!--bam vao hinh dẫn tới chi tiết sp -->
											<!-- img --> <img
											src="<c:url value="/assets/img/products/${p.image}"/>"
											alt="Grocery Ecommerce Template" class=" img-fluid">
										</a>

									</div>

									<!-- heading category -->
									<div class="text-small mt-2 mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>${p.category.name }</small></a>
									</div>

									<!-- heading name product -->
									<h2 class="fs-6">
										<a href="shop-single.html"
											class="text-inherit text-decoration-none">${p.productName }</a>
									</h2>

									<!-- rating -->
									<div>
										<span style="font-size: 110%; color: rgb(255, 187, 0);">&starf;</span>
										<span style="font-size: 110%; color: rgb(255, 187, 0);">&starf;</span>
										<span style="font-size: 110%; color: rgb(255, 187, 0);">&starf;</span>
										<span style="font-size: 110%; color: rgb(255, 187, 0);">&starf;</span>
										<span style="font-size: 110%; color: rgb(255, 187, 0);">&#11242;</span>



										<span class="text-muted small">4.5(149)</span>
									</div>

									<!-- price -->
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
										<!-- button ADD PRODUCT -->
										<div>
											<a href="#!"
												class="btn btn-success btn-sm align-items-center"><b>
													<!-- <span class="plus-button" stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-plus">&#43;</span> -->
													<svg xmlns="https://www.w3.org/TR/SVG2/" width="16"
														height="16" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="3.5"
														stroke-linecap="round" stroke-linejoin="round"
														class="feather feather-plus">
                                                    <line x1="12" y1="2"
															x2="12" y2="19"></line>
                                                    <line x1="3"
															y1="10.5" x2="21" y2="10.5"></line>
                                                </svg> Add
											</b> </a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>


				</div>
			</section>
		</div>
		<!-- </div> -->
	</div>
</div>


<!-- Phaan trang -->
<div class="row mt-5 ">

	<!-- nav -->
	<nav>
		<ul class="pagination d-flex justify-content-center">
			<li class="page-item disabled"><a class="page-link  mx-1 "
				href="#" aria-label="Previous"> <i
					class="feather-icon icon-chevron-left"></i>
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

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script type="text/javascript" src="assets/js/user/product.js"></script>


</body>
</html>

