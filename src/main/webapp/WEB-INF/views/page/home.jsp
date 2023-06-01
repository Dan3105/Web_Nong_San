<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/languageBar.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<%@include file="/WEB-INF/views/include/slider.jsp"%>
<%@include file="/WEB-INF/views/category/listCategory.jsp"%>
<%@include file="/WEB-INF/views/include/banner.jsp"%>

<!-- Best Seller Product -->
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

<!-- Product By Category -->
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


<%@include file="/WEB-INF/views/include/whyChooseUs.jsp"%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script type="text/javascript" src="assets/owlcarousel/jquery.min.js"></script>
<script type="text/javascript"
	src="assets/owlcarousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="assets/js/user/header.js"></script>


</body>
</html>










