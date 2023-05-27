<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<style>
@media ( max-width : 767.98px) {
	.border-sm-start-none {
		border-left: none !important;
	}
}

.hidden {
	display: none !important;
}
</style>
<script src="<c:url value="/assets/js/employee/EmployeeProductFormHandler.js"/>"></script>
<body>
	<%@include file="/WEB-INF/views/employee/employee-header-nav.jsp"%>
	<fmt:setLocale value="vi_VN" />
	<fmt:setBundle basename="java.text.resources" />

	<section>
		<button type="button" onclick="CreateProduct()" class="btn btn-success">Add Products</button>
		<div class="container py-5 h-100 overflow-y-scroll position-relative">
			<c:forEach varStatus="status" var="item" items="${products}">
				<div class="row justify-content-center mb-3">
					<div class="col-md-12 col-xl-10">
						<div class="card shadow-0 border rounded-3">
							<div class="card-body">
								<div class="row">
									<div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
										<div class="bg-image hover-zoom ripple rounded ripple-surface">
											<!-- Image don hang -->
											<img class="w-100"
												src="<c:url value="/assets/img/products/${item.image}"/>"
												onerror="
										this.onerror = null;
										this.src='https://i.pinimg.com/474x/66/da/e1/66dae117263cc353d351949bcc76e1e4.jpg';"
												alt="admin-img" /> <a href="#!">
												<div class="hover-overlay">
													<div class="mask"
														style="background-color: rgba(253, 253, 253, 0.15);"></div>
												</div>
											</a>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-6">
										<!--  -->
										<!-- Ten don hang -->
										<h5>${item.productName }</h5>
										<input type="hidden" id="productName${item.productId }"
											value="${item.productName  }" />
										<!-- Loai mat hang -->
										<div class="mt-1 mb-0 text-muted small">
											<input type="hidden" id="categoryId${item.productId }"
												value="${item.categoryId }"> <span>${item.categoryName }</span>
										</div>
										<div>
											<!-- Ngay dang - Ngay het han-->
											<%-- <span class="text-primary"> ${item.postingDate }</span>  --%><input
												type="hidden" id="postingDate${item.productId }"
												value="${item.postingDate }">
										</div>
										<!-- So luong -->
										<div class="text-danger mb-1 me-2">
											<p>
												Quantity: <i class="ti-briefcase"></i> <span>${item.quantity }
												</span>
											</p>
											<input type="hidden" id="quantity${item.productId }"
												value="${item.quantity }" />
										</div>
										<!-- Detail don hang -->
										<p class="text-truncate mb-4 mb-md-0">${item.detail}</p>
										<input type="hidden" id="detail${item.productId }"
											value="${item.detail}" />
									</div>
									<div
										class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
										<!-- Gia giam -->
										<div class="d-flex flex-row align-items-center mb-1">
											<h4 class="mb-1 me-2 text-success">
												<fmt:formatNumber type="currency" pattern="#,##0"
													value="${item.price - item.price * item.discount} " />
												<span class="fs-5 fw-normal">/ ${item.unit }</span>

												<!--  -->
												<input type="hidden" id="unit${item.productId }"
													value="${item.unit }" />
												<input type="hidden" id="price${item.productId }"
													value="${item.price }" /> <input type="hidden"
													id="discountId${item.productId }"
													value="${item.discountId }" />
											</h4>
											<!-- Gia goc -->
											<span class="text-danger text-decoration-line-through"><fmt:formatNumber
													type="currency" currencySymbol="d" pattern="#,##0"
													value="${item.price}" /></span>
										</div>
										<!-- % giam gia coupon neu co -->
										<h6 class="text-success">
											<fmt:formatNumber type="percent" value="${item.discount}" />
										</h6>
										<div class="d-flex flex-column mt-4">
											<!-- Nut chinh sua mat hang -->
											<button onclick="UpdateProduct(${item.productId})"
												class="btn btn-primary btn-sm" type="button">Update</button>
											<form:form method="post" action="products/delete${item.productId}.htm">
												<button class="btn btn-outline-danger btn-sm mt-2"
													type="submit">Delete</button>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>
		<div class="d-flex align-items-center justify-content-end">
			<div class="row">
				<div class="col-4 d-flex align-items-center justify-content-between">
					<a href="?crrPage=${crrPage - 1}" class=" m-2"><button class="btn btn-outline-info"><i class="ti-angle-double-left"></i></button></a>
					<a href="?crrPage=${crrPage + 1}" class=" m-2"><button class="btn btn-outline-info"><i class="ti-angle-double-right"></i></button></a>
				</div>	
			</div>
		</div>
	</section>
	<div class="position-fixed top-0 start-0"
		style="width: 100vw; height: 100vh; background-color: rgba(0, 0, 0, 0.4);"
		id="product-form-panel">
		<div
			class="d-flex justify-content-center align-items-center w-100 h-100">
			<div class=" bg-light mt-2 opacity-100 " style="width: 700px;">
				<div class="p-2 d-flex justify-content-between align-items-center">
					<h5 class="fs-4 m-3">Product Information</h5>
					<button type="button" class="btn btn-outline-danger"
						onclick="CloseForm()">
						<i class="ti-close"></i>
					</button>
				</div>

				<form:form id="product-form" method="post" action=""
					modelAttribute="productForm" class="row m-3"
					enctype="multipart/form-data">
					<div class="col-md-12 mt-2">
						<label for="inputNameProduct" class="form-label">Name
							product</label>
						<form:input path="productName" class="form-control"
							id="inputNameProduct" />
					</div>
					<div class="col-md-5 mt-2">
						<label for="inputCategory" class="form-label">Category
							Type</label>
						<form:select path="categoryId" id="inputCategory"
							class="form-select" items="${categories }" itemValue="categoryId"
							itemLabel="name">
						</form:select>
					</div>
					<div class="col-md-3 mt-2">
						<label for="inputQuantity" class="form-label">Quantity</label>
						<form:input path="quantity" type="number" class="form-control"
							id="inputQuantity"/>
					</div>
					<div class="col-md-3 mt-2">
						<label for="inputUnit" class="form-label">Unit</label>
						<form:input path="unit" type="text" class="form-control"
							id="inputUnit" />
					</div>
					<div class="col-md-6 mt-2">
						<label for="inputImage" class="form-label">Image Archieve</label>
						<form:input type="file" class="form-control" id="inputImage"
							path="imageFile" accept="image/*" />
					</div>
					<div class="col-md-5 mt-2">
						<label for="inputPrice" class="form-label">Price</label>
						<form:input path="price" type="number" class="form-control"
							id="inputPrice" inputmode="numeric" />
					</div>
					<div class="col-md-6 mt-2">
						<label for="inputDate" class="form-label">Date Posting</label>
						<form:input type="date" class="form-control" id="inputDate"
							path="postingDate"/>
					</div>
					<div class="col-md-6 mt-2">
						<label for="inputDSId" class="form-label">Discount Apply</label>
						<form:select path="discountId" id="inputDSId" class="form-select"
							items="${coupons }" itemValue="couponId" itemLabel="name">
						</form:select>
					</div>

					<div class="col-md-12 mt-2">
						<div class="form-floating mb-3">
							<form:input type="text" class="form-control" path="detail"
								placeholder="Leave a detail here" id="inputDetail"
								style="height: 100px" />
							<label for="inputDetail">Detail</label>
						</div>
					</div>
					<div
						class="col-12 mt-2 d-flex align-items-center justify-content-center">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script>CloseForm()</script>
</body>
</html>