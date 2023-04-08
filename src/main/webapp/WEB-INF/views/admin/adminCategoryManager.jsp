<%@include file="/WEB-INF/views/include/adminHeader.jsp"%>
<link rel="stylesheet"
	href="<c:url value="/assets/css/admincss/admin-category.css"/>">
<script src="<c:url value="/assets/js/admin/adminCategoryManager.js"/>">></script>
<title>Admin Category Manager</title>
<body style="background-color: var($ gray-300)"></body>
	<%@include file="/WEB-INF/views/include/adminHeaderNav.jsp"%>
	<div id="main-content" class="row pt-3">
		<div class="col-md-2"></div>
		<div class=" col-md category-menu container">
			<p class="h2 bold">Category</p>
			<div class="category-menu-content">
				<!-- Bang mat hang -->
				<div class="h-100 overflow-y-scroll position-relative">
					<table class="table table-hover table-striped table-categories">
						<thead class="position-sticky top-0 bg-light">
							<tr>
								<th class="col-1" scope="col">Id</th>
								<th class="col" scope="col">Ten Mat Hang</th>
								<th class="col-2" scope="col" class="table-info">Insert</th>
								<th class="col-2" scope="col" class="table-danger">Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="status" var="item" items="${list}">
								<tr>
									<th scope="row">
										<p class="p-0 m-0">${item.categoryId}</p>
									</th>
									<td id="CategoryName${status.index}">
										<div>
											<p class="p-0 m-0">${item.name }</p>
											<input style="display:none" type='text' class='form-control' value='' aria-label='Category'>
										</div>
										
									</td>
									<td>
										<button class="btn btn-primary h-100" id="edit_button${status.index}" onclick="EditRow(${status.index})">
											<i class="ti-pencil-alt"></i>
										</button>
										<div id="EditChange${status.index}" class="h-100" style="display:none">
											<button class="btn btn-success" onclick="OnConfirmEdit(${status.index})">Y</button>
											<button class="btn btn-warning" onclick="OnCancelEdit(${status.index})">X</button>
										</div>
									</td>
									<td>
										<button class="btn btn-danger">
											<i class="ti-trash"></i>
										</button>
									</td>
								</tr>
							</c:forEach>
							<c:set var="listLength" value="${fn:length(list)}"
								scope="session" />
							<tr>
								<th scope="row"><p class="p-0 m-0">${listLength}</p></th>
								<td><input type="text" class="form-control"
									placeholder="New Category" aria-label="Category"></td>
								<td colspan="2">
									<button class="btn btn-danger">
										<i class="ti-trash"></i>
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>


		<!-- Menu mat hang -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md">
				<p class="h2 bold">Product</p>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">Mat Hang</th>
							<th scope="col">Ten Mat hang</th>
							<th scope="col">Ten Cua Hang</th>
							<th scope="col">Tinh Trang</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Banana</td>
							<td>Haha hoho</td>
							<td>Phia Tay mien dong</td>
							<td>Con hang</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Banana</td>
							<td>Haha hoho</td>
							<td>Phia Tay mien dong</td>
							<td>Con hang</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Banana</td>
							<td>Haha hoho</td>
							<td>Phia Tay mien dong</td>
							<td>Con hang</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>Banana</td>
							<td>Haha hoho</td>
							<td>Phia Tay mien dong</td>
							<td>Con hang</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>Banana</td>
							<td>Haha hoho</td>
							<td>Phia Tay mien dong</td>
							<td>Con hang</td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>Banana</td>
							<td>Haha hoho</td>
							<td>Phia Tay mien dong</td>
							<td>Con hang</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>


	<%@include file="/WEB-INF/views/include/adminFooter.jsp"%>