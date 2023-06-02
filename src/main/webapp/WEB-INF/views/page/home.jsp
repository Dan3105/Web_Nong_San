<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/languageBar.jsp"%>


<c:if test="${not empty alert}">
	<c:choose>
		<c:when test="${alert == 1}">

			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Thêm vào giỏ hàng thành công
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>

			</div>


		</c:when>
		<c:when test="${alert == 2}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Thêm vào danh sách yêu thích thành công
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>

			</div>
		</c:when>
	</c:choose>
</c:if>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<%@include file="/WEB-INF/views/include/slider.jsp"%>
<%@include file="/WEB-INF/views/category/listCategory.jsp"%>
<%@include file="/WEB-INF/views/include/banner.jsp"%>

<!-- Best Seller Product -->
<section>
	<c:if test="${products.size() > 0 }">
		<section class="my-lg-14 my-8 mb-5">
			<div class="container">
				<div class="row">
					<div class="col-12 mb-6">
						<h5 class="fw-bold mb-5 fs-3">
							<s:message code="global.best_sale" />
						</h5>
					</div>
				</div>

				<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
					<c:forEach var="p" items="${products }">
						<%@include file="/WEB-INF/views/include/listProduct1.jsp"%>
					</c:forEach>
				</div>
			</div>
		</section>
	</c:if>
</section>
<!-- New Product -->
<section>
	<c:if test="${newProducts.size() > 0 }">
		<section class="my-lg-14 my-8 mb-5">
			<div class="container">
				<div class="row">
					<div class="col-12 mb-6">
						<h5 class="fw-bold mb-5 fs-3">
							<s:message code="global.new_products" />
						</h5>
					</div>
				</div>

				<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
					<c:forEach var="p" items="${newProducts }">
						<%@include file="/WEB-INF/views/include/listProduct1.jsp"%>
					</c:forEach>
				</div>
			</div>
		</section>
	</c:if>
</section>
<!-- Best seller Product -->
<section>
	<c:if test="${bestseller.size() > 0 }">
		<section class="my-lg-14 my-8 mb-5">
			<div class="container">
				<div class="row">
					<div class="col-12 mb-6">
						<h5 class="fw-bold mb-5 fs-3">
							<s:message code="global.best_seller" />
						</h5>
					</div>
				</div>

				<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
					<c:forEach var="p" items="${bestseller }">
						<%@include file="/WEB-INF/views/include/listProduct1.jsp"%>
					</c:forEach>
				</div>
			</div>
		</section>
	</c:if>
</section>

<!-- Product By Category -->
<section>
	<c:forEach var="c" items="${productsWithCategory }">
		<section class="my-lg-14 my-8 mb-5">
			<div class="container">
				<div class="row">
					<div class="col-12 mb-6">
						<h5 class="fw-bold mb-5 fs-3">${c.name }</h5>
					</div>
				</div>

				<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
					<c:forEach var="p" items="${c.products }" begin="0" end="9">
						<%@include file="/WEB-INF/views/include/listProduct1.jsp"%>

					</c:forEach>
				</div>
			</div>
		</section>



	</c:forEach>
</section>

<%@include file="/WEB-INF/views/include/whyChooseUs.jsp"%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script type="text/javascript" src="assets/owlcarousel/jquery.min.js"></script>
<script type="text/javascript"
	src="assets/owlcarousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/js/user/header.js"></script>
<script type="text/javascript" src="assets/js/user/account.js"></script>

</body>
</html>