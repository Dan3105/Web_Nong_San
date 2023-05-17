<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<section class="my-lg-14 my-14">
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

			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<!-- badge -->


					</div>
					<!-- heading -->
					<div class="text-small mb-1">
						<a href="#!" class="text-decoration-none text-muted"><small>${product.category.name }</small></a>
					</div>
					<h2 class="fs-6">
						<a href="#!" class="text-inherit text-decoration-none">${product.productName }</a>
					</h2>
					<div>

						<!-- rating -->
						<small class="text-warning"> <i class="bi bi-star-fill"></i>
							<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
							class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small> <span
							class="text-muted small">4.5(149)</span>
					</div>
					<!-- price -->
					<div class="d-flex justify-content-between align-items-center mt-3">
						<div>
							<span class="text-dark"><fmt:formatNumber
									value="${product.price }" type="currency" currencySymbol="đ"
									maxFractionDigits="0" /></span>

							<c:if test="${p.coupon.discount != null}">
								<span class="text-decoration-line-through text-muted"> <fmt:formatNumber
										value="${product.price - (product.price * p.coupon.discount)}"
										type="currency" currencySymbol="đ" maxFractionDigits="0" />
								</span>
							</c:if>
						</div>
						<!-- btn -->
						<div>
							<a href="#!" class="btn btn-primary btn-sm"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-plus">
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
</section>