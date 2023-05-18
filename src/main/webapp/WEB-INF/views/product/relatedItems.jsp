<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<section class="my-lg-14 my-14 mb-4">
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-12">
				<!-- heading -->
				<h3>Related Items</h3>
			</div>
		</div>
		<!-- row -->
		<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-2 mt-2">
			<!-- col -->
			<c:forEach var="p" items="${listProductSameCategory }">
				<div class="col">
					<div class="card card-product ">
						<div class="card-body">

							<div class="text-center position-relative ">
								<div class=" position-absolute top-0 start-0">
									<c:if test="${p.coupon.discount != null}">
										<span class="badge bg-danger"> <fmt:formatNumber
												value="${p.coupon.discount }" type="percent" /></span>
									</c:if>

								</div>
								<a href="product/detail.htm?productId=${p.productId }"> <img
									src="<c:url value="/assets/img/products/${p.image}"/>"
									alt="Grocery Ecommerce Template" class="mb-3 img-fluid"></a>

								<div class="card-product-action">
									<a href="#!" class="btn-action"><i class="bi bi-eye"></i></a> <a
										href='<c:url value = "product/addToWishlist.htm?productId=${p.productId }"/>'
										class="btn-action"><i class="bi bi-heart"></i></a> <a
										href="#!" class="btn-action"><i
										class="bi bi-arrow-left-right"></i></a>
								</div>

							</div>
							<div class="text-small mb-1">
								<a href="#!" class="text-decoration-none text-muted"><small>${p.category.name }</small></a>
							</div>
							<h2 class="fs-6">
								<a href="./pages/shop-single.html"
									class="text-inherit text-decoration-none">${p.productName }</a>
							</h2>

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

								<div>
									<a
										href='<c:url value = "product/addToCart.htm?productId=${p.productId }"/>'
										type="button" class="btn btn-primary liveToastBtn"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-plus">
                                            <line x1="12" y1="5" x2="12"
												y2="19"></line>
                                            <line x1="5" y1="12" x2="19"
												y2="12"></line>
                                        </svg> Add
									</a>

								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>




	</div>
</section>