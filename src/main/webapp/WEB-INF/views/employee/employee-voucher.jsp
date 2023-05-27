<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="<c:url value="/assets/js/employee/EmployeeVoucherFormHandler.js"/>"></script>
</head>
<style>
body {
	background: #dedede;
}

.coupon .kanan {
	border-left: 1px dashed #ddd;
	width: 40% !important;
	position: relative;
}

.coupon .kanan .info::after, .coupon .kanan .info::before {
	content: '';
	position: absolute;
	width: 20px;
	height: 20px;
	background: #dedede;
	border-radius: 100%;
}

.coupon .kanan .info::before {
	top: -10px;
	left: -10px;
}

.coupon .kanan .info::after {
	bottom: -10px;
	left: -10px;
}

.coupon .time {
	font-size: 1.6rem;
}

.hidden {
	display: none !important;
}
</style>

<body>
	<%@include file="/WEB-INF/views/employee/employee-header-nav.jsp"%>
	<button class="btn btn-success" onclick="CreateForm()">Add
		Voucher</button>
	<div style="max-height: 90vh" class="mt-3 overflow-y-scroll row">
		<c:forEach var="item" items="${coupons}">
			<div class="d-inlineblock col-md-6">
				<div
					class="coupon bg-white rounded mb-3 d-flex justify-content-between">
					<div class="d-flex align-items-center kiri p-3">
						<div class="icon-container ">
							<div class="d-flex flex-row justify-content-end off">
								<input type="hidden" id="discountPercent${item.couponId }"
									value="${item.discount }" />
								<h1>
									<fmt:formatNumber type="percent" value="${item.discount }" />
								</h1>
								<span>OFF</span>
							</div>
						</div>
					</div>
					<div class="tengah py-3 d-flex w-100 justify-content-start">
						<input type="hidden" id="discountPosting${item.couponId }"
							value="${item.postingDate }" /> <input type="hidden"
							id="discountStatus${item.couponId }" value="${item.status }" />

						<input type="hidden" id="itemExpiry${item.couponId }"
							value="${item.expiryDate }" /> 
						<div>
							<c:if test="${item.valid eq true }">
								<!-- Valid condition -->
								<span class="mb-2 badge text-bg-success">Valid</span>
							</c:if>
							<c:if test="${item.valid eq false }">
								<!-- Valid condition -->
								<span class="mb-2 badge text-bg-danger">Invalid</span>
							</c:if>

							<!-- Name -->
							<h3 id="discountName${item.couponId }" class="lead">${item.name }</h3>
							<!-- Detail -->
							<p id="discountDetail${item.couponId }"
								class="text-truncate text-muted mb-0">${item.detail }</p>
						</div>
					</div>
					<div class="kanan">
						<div class="info m-3 d-flex align-items-center">
							<div class="">
								<div class="d-flex align-items-center">
									<c:if test="${item.days > 0 }">
										<span class="time font-weight-light"> <span>
												${item.days } days</span>
										</span>
									</c:if>
								</div>
								<div class="d-flex align-items-center justify-content-center">
									<button type="button" onClick="UpdateForm(${item.couponId})"
										class="btn btn-sm me-1 btn-outline-success btn-block">
										Update</button>
									<form:form action="vouchers/delete${item.couponId }.htm" method="post">
										<button type="submit"
											class="btn btn-sm ms-1 btn-outline-danger btn-block">
											Delete</button>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>
	<div class="row">
				<div class="col-8"></div>
				<div class="col-4 d-flex align-items-center justify-content-between">
					<a href="?crrPage=${crrPage - 1}" class=" m-2"><button class="btn btn-primary fs-bold"><i class="ti-angle-double-left"></i></button></a>
					<a href="?crrPage=${crrPage + 1}" class=" m-2"><button class="btn btn-primary fs-bold"><i class="ti-angle-double-right"></i></button></a>
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
				</div>

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
						</div>
					</div>
					<div class="col-md-4 mt-2 form-check form-switch">
						<label class="form-check-label ms-1" for="statusDiscount">Open
							Discount</label>
						<div
							class="mt-2 d-flex align-items-center justify-content-between">
							<form:checkbox class="form-check-input ms-1" role="switch"
								id="statusDiscount" path="status" />
						</div>
					</div>
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
				</form:form>
			</div>
			<script>CloseForm()</script>
		</div>
	</div>
</body>
</html>