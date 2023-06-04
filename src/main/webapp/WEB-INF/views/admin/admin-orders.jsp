<%@include file="/WEB-INF/views/include/library.jsp"%>

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
		<div class="col-2 d-none d-lg-inline "><%@include
				file="/WEB-INF/views/admin/admin-header-nav.jsp"%></div>
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
									<h2>Categories</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Dashboard </a></li>
											<li class="breadcrumb-item active" aria-current="page"
												class="text-decoration-none">Orders</li>
										</ol>

									</nav>
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
											action="admin/feedback/searchFeedback.htm">
											<input class="form-control" type="search"
												placeholder="Search Feedback" aria-label="Search"
												name="search">
										</form>
									</div>
									<div class="col-xl-2 col-md-4 col-12">
										<div class="dropdown">
											<button class="btn btn-success dropdown-toggle" type="button"
												data-bs-toggle="dropdown" aria-expanded="false">
												<c:if test="${filter == 0 }">All</c:if>
												<c:if test="${filter == 1 }">Unresolved</c:if>
												<c:if test="${filter == 2 }">On Moving</c:if>
												<c:if test="${filter == 3 }">Success</c:if>
												<c:if test="${filter == 4 }">Cancel</c:if>
											</button>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item"
													href="admin/feedback.htm?filter=0">All</a></li>
												<li><a class="dropdown-item"
													href="admin/orders/unresolve-order.htm">Unresolved</a></li>
												<li><a class="dropdown-item"
													href="admin/orders/moving-order.htm">On Moving</a></li>
												<li><a class="dropdown-item"
													href="admin/orders/resolved-order.htm">Success</a></li>
												<li><a class="dropdown-item"
													href="admin/orders/cancel-order.htm">Cancel</a></li>

											</ul>
										</div>
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
									<th>Name</th>
									<th>Order ID</th>
									<th>Status</th>
									<th>Date</th>
									<th>Status</th>
									<th>Amount</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach varStatus="status" var="item" items="${orders}">
									<tr>
										<td class="align-middle"><span style="color: #a8729a;">${item.accName }</span></td>
										<td class="align-middle"><span style="color: #a8729a;">${orders.orderId }</span></td>
										<td class="align-middle"><button type="button"
												data-bs-toggle="collapse" aria-expanded="false"
												data-bs-target="#box-items${status.index }"
												class="btn me-1 ms-1 btn-outline-info">
												<p class="fw-normal mb-0">Detail Receivie</p>
											</button></td>
										<td class="align-middle"><div class="text-truncate">${item.feedbackContent}</div></td>
										<td class="align-middle"><fmt:formatDate
												value="${item.postingDate}" pattern="dd-MM-yyyy" /></td>
										<td class="align-middle"><c:if test="${item.status == 0}">
												<span class="badge bg-danger">Disable</span>
											</c:if> <c:if test="${item.status == 1}">
												<span class="badge bg-success">Enable</span>
											</c:if></td>
										<td class="align-middle"><fmt:formatNumber
												value="${item.price }" type="currency" currencySymbol="d"
												maxFractionDigits="0" /></td>


									</tr>
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
			<!--End pagination -->
		</div>
	</div>
</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>