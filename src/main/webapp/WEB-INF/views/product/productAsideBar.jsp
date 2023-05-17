<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<link rel="stylesheet" href="assets/css/user/nouislider.css" type="text/css">

<body>

	<aside class="col-lg-3 col-md-4 mb-6 mb-md-0">

		<div class="offcanvas-header d-lg-none">
			<h5 class="offcanvas-title" id="offcanvasCategoryLabel">Filter</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>

		<div class="offcanvas-body ps-lg-2 pt-lg-0">

			<!-- Categories -->
			<div class="mb-5">

				<!-- nav -->
				<div class="d-flex flex-column flex-shrink-0 p-3 "
					style="width: 200px;">
					<a href="/"
						class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
						<svg class="bi me-2" width="40" height="32">
            					<use xlink:href="#bootstrap"></use>
        						</svg> <span class="fs-4">Category</span>
					</a>
					<hr>

					<ul class="nav nav-pills flex-column mb-auto text-decoration-none">
						<c:forEach var="c" items="${category }">
							<li class="nav-item"><a
								href="product/index.htm?categoryId=${c.categoryId}"
								class="nav-link" aria-current="page"> <svg class="bi me-2"
										width="16" height="16">
                    			<use xlink:href="#home"></use>
                				</svg> ${c.name }
							</a></li>
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



		</div>

	</aside>
	<script type="text/javascript" src="assets/js/user/nouislider.js"></script>
</body>
