<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<title>Admin Users Manager</title>
<style>
td {
	height: 6vh;
}
</style>
<body>
	<%@include file="/WEB-INF/views/include/admin-header-nav.jsp"%>
	<!-- Main Content -->
	<div class="d-block w-100" style="height: 75vh">
		<div class="bg-light h-100">
			<div class="row">
				<div class="col-6 h4 ">
					<a href="create-employee.htm"><button
							class="btn btn-outline-success btn-hover-nav">Create
							Employee</button></a>
				</div>
				<div
					class="col-6 content-user-filter d-flex justify-content-end align-items-center">
					<a class="p-2" href="get-employee.htm"><button
							id="employee-btn" class="btn btn-outline-primary btn-hover-nav">
							<i class="ti-filter p-2"></i>Employee
						</button></a> <a class="p-2" href="get-guest.htm"><button id="guest-btn"
							class="btn btn-outline-primary btn-hover-nav">
							<i class="ti-layout-list-post p-2"></i>Guest
						</button></a>
					<script>
						var currentUrl = window.location.pathname;
						var buttonEm = document.getElementById('employee-btn');
						var buttonG = document.getElementById('guest-btn');
						if (currentUrl.includes('employee')) {
							buttonEm.classList.add('active');
							buttonG.classList.remove('active');
						} else {
							buttonG.classList.add('active');
							buttonEm.classList.remove('active');
						}
					</script>
				</div>
			</div>
			<div class="row mt-4 h-100">
				<div class="col h-100 overflow-y-scroll position-relative"
					style="height: 100vh">
					<table class="table table-hover table-striped table-categories">
						<thead class="position-sticky top-0 bg-white">
							<tr>
								<th class="p-3">Avatar</th>
								<th class="p-3">Fullname</th>
								<th class="p-3">Status</th>
								<th class="p-3">Email</th>
								<th class="p-3">Enable</th>
								<th class="p-3">Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="status" var="account" items="${accounts}">
								<tr>
									<td><img style="height: inherit"
										src="<c:url value = "/assets/img/account/${account.avatar }"/>">
									</td>
									<td><div
											class="h-100 d-flex align-items-center justify-content-start">
											<c:set var="fullName"
												value="${account.lastName} ${account.firstName} " />
											<p class="m-0">${fullName}</p>
										</div></td>
									<td>
										<div
											class="h-100 d-flex align-items-center justify-content-start">
											<c:choose>
												<c:when test="${account.status eq '1'}">
													<div
														class="d-flex align-items-center w-75 h-50 badge rounded-pill text-bg-success">
														<p class="m-0 w-100 text-center">Enable</p>
													</div>
												</c:when>
												<c:otherwise>
													<div
														class="d-flex align-items-center w-75 h-50 badge rounded-pill text-bg-danger">
														<p class="m-0 w-100 text-center">Block</p>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
									<td><p class="p-3">${account.email }</p></td>
									<td>
										<div
											class="h-100 d-flex align-items-center justify-content-start">
											<a href="enable${account.accountId }.htm?source=${source}"><button
													class="btn btn-primary" type="button"
													id="edit_button${status.index}">
													<c:choose>
														<c:when test="${ account.status eq '1'}">
															<div class="">
																<i class="ti-lock"></i>
															</div>
														</c:when>
														<c:otherwise>
															<div class="">
																<i class="ti-unlock"></i>
															</div>
														</c:otherwise>
													</c:choose>
												</button></a>
										</div>
									</td>
									<td><div
											class="h-100 d-flex align-items-center justify-content-start">
											<button type="button" class="btn btn-danger"
												data-bs-toggle="modal" data-bs-target="#exampleModal"
												id="del_button${status.index }"
												data-value="delete${account.accountId}.htm?source=${source}"
												class="btn btn-danger ms-2">
												<i class="ti-trash"></i>
											</button>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="d-flex align-items-center justify-content-end">
				<div class="row">
					<div
						class="col-4 d-flex align-items-center justify-content-between">
						<c:choose>
							<c:when test="${crrPage-1 < 1}">
								<a href="#" class="disabled cursor-not-allowed m-2"><button
										disabled class="btn btn-outline-info">
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
								<a href="#" class="disabled  cursor-not-allowed m-2"><button
										disabled class="btn btn-outline-info">
										<i class="ti-angle-double-right"></i>
									</button></a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Modal -->
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
</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>