<%@include file="/WEB-INF/views/include/library.jsp"%>
<script
	src="<c:url value=" assets/js/employee/EmployeeVoucherFormHandler.js" />"></script>
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
									<h2>Voucher</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Voucher </a></li>

										</ol>

									</nav>
								</div>
								<!-- button -->
								<div>
									<button class="btn btn-success" onclick="CreateForm()">Add
										Voucher</button>
								</div>
							</div>
						</div>
					</div>
					<!--End Breadcrum -->


					<!-- End Search  Filter -->

					<div class="table-responsive ">
						<table class="table ">
							<thead class="position-sticky top-0 ">
								<tr class="table-success">
									<th>Coupon</th>
									<th>Posting Date</th>
									<th>Expiry Date</th>
									<th>Detail</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach varStatus="status" var="item" items="${coupons}">
									<tr>
										<td class="align-middle">
											<h1>
												<fmt:formatNumber type="percent" value="${item.discount }" />
											</h1> <span>OFF</span>
										</td>
										<td class="align-middle"><fmt:formatDate type="both"
												value="${item.postingDate}" pattern="dd-MM-yyyy hh:mm" /></td>
										<td class="align-middle"><fmt:formatDate type="both"
												value="${item.expiryDate}" pattern="dd-MM-yyyy hh:mm" /></td>

										<td class="align-middle"><p class="text-truncate"
												style="max-width: 50px;">${item.detail}</p></td>

										<td class="align-middle">

											<button type="button" onClick="UpdateForm(${item.couponId})"
												class="btn btn-sm me-1 btn-outline-success btn-block">
												Update</button>
										</td>
										<td class="align-middle">
											<button type="button" class="btn btn-danger btn-sm"
												data-bs-toggle="modal" data-bs-target="#exampleModal"
												id="del_button${status.index }"
												data-value="vouchers/delete${item.couponId }.htm"
												class="btn btn-outline-danger ms-2">Delete</button>
										</td>
										<input type="hidden" id="discountPercent${item.couponId }"
											value="${item.discount }" />
										<input type="hidden" id="itemExpiry${item.couponId }"
											value="${item.expiryDate }" />
										<p id="discountDetail${item.couponId }"
											class="text-truncate text-muted mb-0">${item.detail }</p>
									</tr>
								</c:forEach>
							</tbody>
						</table>


					</div>


					<div class="d-flex justify-content-center ">

						<!-- nav -->
						<nav>
							<ul class="pagination d-flex justify-content-center ms-2">
								<li class="page-item ${(crrPage == 1) ? 'disabled' : '' }"><a
									class="page-link  mx-1 " aria-label="Previous"
									href="admin/feedback.htm?crrPage=${crrPage - 1}&filter=${filter}">
										<span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:forEach var="i" begin="1" end="${totalPage }" varStatus="in">

									<li class="page-item "><a
										class="page-link  mx-1 ${(crrPage == in.count) ? 'active' : '' }"
										href="admin/feedback.htm?crrPage=${in.count}&filter=${filter}">${in.count}</a></li>
								</c:forEach>
								<li class="page-item"><a
									class="page-link mx-1 text-body ${(crrPage == totalPage) ? 'disabled' : '' }"
									aria-label="Next"
									href="admin/feedback.htm?crrPage=${crrPage + 1}&filter=${filter}">
										<span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>

					</div>

					<!-- Modal -->


				</div>


			</div>


			<!--End pagination -->
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Delete</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Are you sure to Delete ?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="#"><button type="button" class="btn btn-primary">Delete</button></a>
				</div>
			</div>
		</div>
	</div>
	<div class="position-fixed top-0 start-0"
		style="width: 100vw; height: 100vh; background-color: rgba(0, 0, 0, 0.4);"
		id="voucher-form-panel">
		<div
			class="d-flex justify-content-center align-items-center w-100 h-100">
			<div class=" bg-light mt-2 opacity-100 " style="width: 700px;">
				<div class="p-2 d-flex justify-content-between align-items-center">
					<h5 class="fs-4 m-3">Coupon Information</h5>
					<button type="button" class="btn btn-outline-danger"
						onclick="CloseForm()">
						<i class="ti-close"></i>
					</button>
					<form:form id="voucher-form" method="post" action=""
						modelAttribute="couponBean" class="row m-3"
						enctype="multipart/form-data">
						<div class="col-md-12 mt-2">
							<label for="inputNameDiscount" class="form-label">Name
								Coupon</label>
							<form:input path="name" class="form-control"
								id="inputNameDiscount" />
						</div>
						<div class="col-md-5 mt-2">
							<label for="percentDiscount">Discount percent</label>
							<div class="mt-2 d-flex align-items-center ">
								<form:input id="percentDiscount" type="range" value="0" min="0"
									max="0.99" step="0.01" path="discount"
									oninput="this.nextElementSibling.value = (this.value * 100).toFixed(0)" />
								<output class="ms-1" id="displayPercent" for="percentDiscount">0</output>
								%
								<div class="col-md-6 mt-2">
									<label for="inputDate" class="form-label">Date Posting</label>
									<form:input type="date" class="form-control" id="inputDate"
										path="postingDate" />
								</div>
								<div class="col-md-6 mt-2">
									<label for="expiryDate" class="form-label">Expriy Date</label>
									<form:input type="date" class="form-control" id="expiryDate"
										path="expiryDate" />
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
							</div>
						</div>

					</form:form>
					<script>CloseForm()</script>
				</div>
			</div>
		</div>
	</div>

</body>

<script src="<c:url value="assets/js/admin/AlertHandler.js"/>"></script>
</html>