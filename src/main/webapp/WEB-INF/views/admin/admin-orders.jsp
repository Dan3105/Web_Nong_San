<%@include file="/WEB-INF/views/include/library.jsp"%>

<body>
	<%@include file="/WEB-INF/views/include/admin-header-nav.jsp"%>
	<div class="d-flex align-items-center justify-content-end"
		style="height: 50px">
		<a href="admin/orders/unresolve-order.htm"><button class="m-1 btn btn-info">Unresolved</button></a>
		<a href="admin/orders/moving-order.htm"><button class="m-1 btn btn-warning">On
				Moving</button></a> <a href="admin/orders/resolved-order.htm"><button
				class="m-1 btn btn-success">Success</button></a> <a
			href="admin/orders/cancel-order.htm"><button class="m-1 btn btn-danger">Cancel</button></a>
	</div>


	<div class="container">
		<c:forEach varStatus="status" var="item" items="${orders}">
			<!--  -->
			<input type="hidden" value="${item.idOrder }" />
			<section class="h-100 container gradient-custom">
				<div class="py-2 h-100">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-lg-10 col-xl-12">
							<div class="card" style="border-radius: 10px;">
								<div
									class="w-100 d-flex align-items-center justify-content-between card-header p-3">
									<h5 class="text-muted mb-0">
										<!-- Ten Khach hang -->
										Order From <span style="color: #a8729a;">${item.accName }</span>!
									</h5>
									<div
										class="d-flex justify-content-between align-items-center p-0">
										<button type="button" data-bs-toggle="collapse"
											aria-expanded="false"
											data-bs-target="#box-items${status.index }"
											class="btn me-1 ms-1 btn-outline-info">
											<p class="fw-normal mb-0">Detail Receivie</p>
										</button>
									</div>
								</div>

								<div class="card-body p-2">
									<div class="collapse" id="box-items${status.index }">
										<c:forEach var="detail" items="${item.products }">
											<div class="card shadow-0 border mb-4">
												<div class="card-body">
													<div class="row">
														<div class="col-md-2">
															<img
																src="<c:url value="/assets/img/products/${detail.productBean.image}"/>"
																class="img-fluid">
														</div>
														<!-- Ten san pham -->
														<div
															class="col-md-2 text-center d-flex justify-content-center align-items-center">
															<p class="text-muted mb-0">${detail.productBean.productName}</p>
														</div>
														<!-- Loai mat hang -->
														<div
															class="col-md-2 text-center d-flex justify-content-center align-items-center">
															<p class="text-muted mb-0 small">${detail.productBean.categoryName}</p>
														</div>
														<!-- So luong -->
														<div
															class="col-md-2 text-center d-flex justify-content-center align-items-center">
															<p class="text-muted mb-0 small">Quantity:
																${detail.quantity }</p>
														</div>
														<div
															class="col-md-2 text-center d-flex justify-content-center align-items-center">
															<p class="text-muted mb-0">Discount:
																${detail.productBean.discount }</p>
														</div>
														<!-- Total cash -->
														<div
															class="col-md-1 text-center d-flex justify-content-center align-items-center">

															<p class="text-muted mb-0 small">
																<fmt:formatNumber
																	value="${detail.productBean.price * detail.quantity}"
																	type="currency" currencySymbol="d"
																	maxFractionDigits="0" />
															</p>
														</div>
														<!-- Total cash - discount-->
														<div
															class="col-md-1 text-center d-flex justify-content-center align-items-center">
															<p class="text-muted mb-0 small">
																<fmt:formatNumber
																	value="${detail.productBean.totalPrice * detail.quantity}"
																	type="currency" currencySymbol="d"
																	maxFractionDigits="0" />
															</p>
														</div>
													</div>


												</div>
											</div>
										</c:forEach>
										<hr class="mb-4"
											style="background-color: #e0e0e0; opacity: 1;">
										<div class="row d-flex align-items-center">
											<div class="col-md-2">
												<p class="text-muted mb-0 small">Track Order</p>
											</div>
											<div class="col-md-10">
												<div class="progress"
													style="height: 6px; border-radius: 16px;"></div>
												<c:choose>
													<c:when test="${item.status eq 0 }">
														<div class="progress-bar" role="progressbar"
															style="width: 0%; border-radius: 16px; background-color: #a8729a;"
															aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
													</c:when>
													<c:when test="${item.status eq 1}">
														<div class="progress-bar" role="progressbar"
															style="width: 50%; border-radius: 16px; background-color: #a8729a;"
															aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
													</c:when>
													<c:when test="${item.status eq 2}">
														<div class="progress-bar" role="progressbar"
															style="width: 105%; border-radius: 16px; background-color: #a8729a;"
															aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
													</c:when>
													<c:otherwise>
														<div class="progress-bar" role="progressbar"
															style="width: 0%; border-radius: 16px; background-color: #a8729a;"
															aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="d-flex justify-content-around mb-1">
											<p class="text-muted mt-1 mb-0 small ms-xl-5">Out for
												delivary</p>
											<p class="text-muted mt-1 mb-0 small ms-xl-5">Delivered</p>
										</div>
									</div>
								</div>

								<div class="d-flex justify-content-between pt-2 pb-2 ms-3 me-3">
									<p class="fw-bold mb-0">Order Details</p>
									<!-- Total Prices -->
									<p class="text-muted mb-0">
										<span class="fw-bold me-4">Total Items</span>
										${item.totalPrice }
									</p>
								</div>
								<!-- Discount -->
								<div class="d-flex justify-content-between pt-2 pb-2 ms-3 me-3">
									<p class="text-muted mb-0">Date Order: <fmt:formatDate
													value="${item.deliveryDate}" pattern="dd-MM-yyyy" /></p>

									<p class="text-muted mb-0">
										<span class="fw-bold me-4">Address Delivery</span>
										${item.defaultAddress }
									</p>
								</div>
								<!-- Total -->
								<form method="post"
									action="admin/orders/update-order${item.idOrder}.htm?source=${source}">
									<div class="d-flex justify-content-between pt-2 pb-2 ms-3 me-3">
										<div>
											<label for="status" class="text-muted mb-0">Status:</label> <select
												name="statusSelect${item.idOrder }"
												title="Select order status">
												<c:forEach var="map" items="${mapStatus }">
													<option value="${map.key}"
														${map.key == item.status ? 'selected' :'' }>${map.value }</option>
												</c:forEach>
											</select>

										</div>

										<p class="text-muted mb-0">
											<span class="fw-bold me-4">Date Receive</span>
											<fmt:formatDate
													value="${item.receivedDate }" pattern="dd-MM-yyyy" />
										</p>
									</div>
									<c:if test="${item.status eq 0 or item.status eq 1 }">
										<div class="d-flex align-itmes-center p-2 justify-content-end">
											<button type="submit" class="btn btn-outline-success">Update</button>

										</div>
									</c:if>
								</form>
							</div>
						</div>

					</div>

				</div>

			</section>
		</c:forEach>
	</div>
	<c:choose>
		<c:when test="${crrPage-1 < 1}">
			<a class="disabled cursor-not-allowed" href="#" class=" m-2"><button
					disabled class="btn btn-outline-info cursor-not-allowed">
					<i class="ti-angle-double-left"></i>
				</button></a>
		</c:when>
		<c:otherwise>
			<a href="${source }?crrPage=${crrPage - 1}" class=" m-2"><button
					class="btn btn-outline-info">
					<i class="ti-angle-double-left"></i>
				</button></a>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${crrPage + 1 <= totalPage  }">
			<a href="${source }?crrPage=${crrPage + 1}" class=" m-2"><button
					class="btn btn-outline-info">
					<i class="ti-angle-double-right"></i>
				</button></a>
		</c:when>
		<c:otherwise>
			<a class="disabled cursor-not-allowed" href="#" class=" m-2"><button
					disabled class="btn btn-outline-info cursor-not-allowed">
					<i class="ti-angle-double-right"></i>
				</button></a>
		</c:otherwise>
	</c:choose>
</body>
</html>