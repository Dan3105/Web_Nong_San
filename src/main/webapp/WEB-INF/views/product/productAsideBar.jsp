<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<link rel="stylesheet" href="assets/css/user/nouislider.css"
	type="text/css">

<body>

	<aside class="col-lg-3 col-md-3	 mb-6 mb-md-0  ">


		<!-- Categories -->
		<div class="mb-5">

			<!-- nav -->
			<div class="d-flex flex-column  p-3  ">
				<h2 class="fs-4">Category</h2>
				<hr>

				<ul class="nav nav-pills flex-column mb-auto text-decoration-none">
					<c:forEach var="c" items="${category }">
						<li class="nav-item"><a
							href="product/index.htm?categoryId=${c.categoryId}"
							class="nav-link link-success "> ${c.name } </a></li>
					</c:forEach>

				</ul>
				<hr>

			</div>

		</div>

		<!-- Price -->
		<div class="mb-5">

			<h5 class="mb-3">Price</h5>



			<small class="text-muted">Price:</small> <span id="priceRange-value"
				class="small">$0 - $1000</span>

		</div>




	</aside>
	<script type="text/javascript" src="assets/js/user/nouislider.js"></script>
</body>
