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
	<div id="admin-menu-content-user">
		<div class="container content-user-breadcrumb m-3 bg-light">
			<div class="row">
				<div class="col-6 content-user-name h4 ">
					<a href="create-employee.htm"><button>Create Employee
						</button></a>
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
			<div class="row mt-4">
				<div class="col">
					<table class="table">
						<thead>
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
											<a id="del_button${status.index }"
												href="user/delete${account.accountId}.htm"><button
													class="btn btn-danger ms-2">
													<i class="ti-trash"></i>
												</button></a>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div
				class="container d-flex row justify-content-end align-items-center">
				<p class="col-md-7 text-muted text-end p-0 m-0">Rows per pages:</p>
				<div class="btn-group col-1">
					<button type="button" class="btn dropdown-toggle p-1"
						data-bs-toggle="dropdown" aria-expanded="false">7</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">1</a></li>
						<li><a class="dropdown-item" href="#">2</a></li>
						<li><a class="dropdown-item" href="#">3</a></li>
					</ul>
				</div>
				<div
					class="row col-md-3 d-flex justify-content-between align-items-center content-user-pageselect">
					<p class="col-md-6 m-0 text-muted ">1-7 of 1240</p>
					<a class="col-md-3 m-0 text-decoration-none" href=""><i
						class="ti-arrow-left"></i></a> <a
						class="col-md-3 m-0 text-decoration-none" href=""><i
						class="ti-arrow-right"></i></a>
				</div>
			</div>
		</div>

	</div>
	<%@include file="/WEB-INF/views/include/admin-footer.jsp"%>