<%@include file="/WEB-INF/views/include/library.jsp"%>
<script
	src="<c:url value="/assets/js/employee/EmployeeProductFormHandler.js"/>"></script>
<style>
.hidden {
	display: none !important;
}
</style>
<body>
	<c:choose>
		<c:when test="${alert == 1}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-danger alert-dismissible fade show"
					role="alert">
					Delete Failed
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>
		<c:when test="${alert == 2}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Delete Successfully
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>

	</c:choose>
	<div class="row">
		<!-- Sidebar -->
		<div class="col-2 d-none d-lg-inline ">
			<%@include file="/WEB-INF/views/employee/employee-header-nav.jsp"%></div>
		<div class="col-10 col-12-sm col-12-md">
			<div id="content-wrapper" class="d-flex flex-column">
				<nav
					class="  navbar navbar-light bg-white mb-4 static-top shadow d-none d-lg-inline">
					<%@include file="/WEB-INF/views/admin/admin-topbar.jsp"%>
				</nav>

				<div class="container">
					<!-- Breadcrum -->
					<div class="row mb-8">
						<div class="col-md-12">
							<div class="d-md-flex justify-content-between align-items-center">
								<div>
									<h2>Product</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Product </a></li>

										</ol>

									</nav>
								</div>
								<!-- button -->
								<div>
									<button type="button" onclick="CreateProduct()"
										class="btn btn-success">Add Products</button>
								</div>
							</div>
						</div>
					</div>
					<!--End Breadcrum -->


					<div class="row  ">
						<div class="col-xl-12 col-12 mb-5">
							<div class=" px-6 py-6 p-4">
								<div class="row justify-content-between">
									<div class="col-lg-4 col-md-6 col-12 mb-2 mb-md-0">
										<form class="d-flex" role="search"
											action="employee/category/searchCategory.htm">
											<input class="form-control" type="search"
												placeholder="Search Category" aria-label="Search"
												name="search">
										</form>
									</div>

								</div>


							</div>
						</div>
					</div>

					<!-- End Search  Filter -->
					<!-- table -->
					<div class="table-responsive ">
						<table class="table ">
							<thead class="position-sticky top-0 ">
								<tr class="table-success">
									<th>Image</th>
									<th>Name</th>
									<th>Category</th>
									<th>Posting Date</th>
									<th>Quantity</th>
									<th>Detail</th>
									<th>Price</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach varStatus="status" var="item" items="${products}">
									<tr>
										<td class="align-middle"><a
											href="product/detail.htm?productId=${item.productId }"> <img
												src="<c:url value="
                                                        assets/img/products/${item.image}" />"
												alt="Product Name" style="width: 80px"></a></td>
										<td class="align-middle"><a
											href="product/detail.htm?productId=${item.productId }"
											class="text-dark">${item.productName}</a></td>
										<td class="align-middle"><input type="hidden"
											id="categoryId${item.productId }" value="${item.categoryId }">
											<span>${item.categoryName }</span></td>

										<td class="align-middle"><fmt:formatDate
												value="${item.postingDate}" pattern="dd-MM-yyyy" /><input
											type="hidden" id="postingDate${item.productId }"
											value="${item.postingDate }"></td>
										<td class="align-middle"><span>${item.quantity } </span></td>
										<td class="align-middle"><p class="text-truncate"
												style="max-width: 50px;">${item.detail}</p> <input
											type="hidden" id="detail${item.productId }"
											value="${item.detail}" /></td>
										<td class="align-middle"><c:if
												test="${item.discount > 0}">
												<span class="text-dark fw-bold"><fmt:formatNumber
														value="${item.price - (item.price * item.discount)}"
														type="currency" currencySymbol="VND" maxFractionDigits="0" /></span>
												<span class="text-decoration-line-through text-muted">
													<fmt:formatNumber value="${item.price }" type="currency"
														currencySymbol="VND" maxFractionDigits="0" />
												</span>
											</c:if> <c:if test="${item.discount == 0}">
												<span class="text-dark fw-bold"> <fmt:formatNumber
														value="${item.price }" type="currency"
														currencySymbol="VND" maxFractionDigits="0" />
												</span>
											</c:if></td>
										<td class="align-middle">
											<button onclick="UpdateProduct(${item.productId})"
												class="btn btn-primary btn-sm" type="button">Update</button>

										</td>
										<td class="align-middle"><button type="button"
												class="btn btn-danger btn-sm" data-bs-toggle="modal"
												data-bs-target="#exampleModal"
												id="del_button${status.index }"
												data-value="employee/products/delete${item.productId}.htm"
												class="btn btn-danger ms-2">Delete</button></td>


									</tr>
									<input type="hidden" id="productName${item.productId }"
										value="${item.productName  }" />
									<input type="hidden" id="categoryId${item.productId }"
										value="${item.categoryId }">
									<input type="hidden" id="postingDate${item.productId }"
										value="${item.postingDate }">
									<input type="hidden" id="quantity${item.productId }"
										value="${item.quantity }" />
									<input type="hidden" id="detail${item.productId }"
										value="${item.detail}" />
									<input type="hidden" id="unit${item.productId }"
										value="${item.unit }" />
									<input type="hidden" id="price${item.productId }"
										value="${item.price }" />
									<input type="hidden" id="discountId${item.productId }"
										value="${item.discountId }" />
								</c:forEach>
							</tbody>
						</table>


					</div>
				</div>


			</div>

			<div class="d-flex justify-content-center ">

				<!-- nav -->
				<nav>
					<ul class="pagination d-flex justify-content-center ms-2">
						<li class="page-item ${(crrPage == 1) ? 'disabled' : '' }"><a
							class="page-link  mx-1 " aria-label="Previous"
							href="employee/products.htm?crrPage=${crrPage - 1}&filter=${filter}">
								<span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${totalPage }" varStatus="in">

							<li class="page-item "><a
								class="page-link  mx-1 ${(crrPage == in.count) ? 'active' : '' }"
								href="employee/products.htm?crrPage=${in.count}&filter=${filter}">${in.count}</a></li>
						</c:forEach>
						<li class="page-item"><a
							class="page-link mx-1 text-body ${(crrPage == totalPage) ? 'disabled' : '' }"
							aria-label="Next"
							href="employee/products.htm?crrPage=${crrPage + 1}&filter=${filter}">
								<span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>

			</div>
			<!--End pagination -->
		</div>

	</div>
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
						<i class="bi bi-x-circle"></i>
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
							id="inputQuantity" />
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
							path="postingDate" />
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


<script src="<c:url value="assets/js/admin/AlertHandler.js"/>"></script>
</html>