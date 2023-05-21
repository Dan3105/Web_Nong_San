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
									alt="Product" class=" img-fluid">
								</a>
								<div class="card-product-action">
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
</section>