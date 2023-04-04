<%@include file="/WEB-INF/views/include/adminHeader.jsp"%>
<link rel="stylesheet" href="<c:url value="/assets/css/admincss/admin-category.css"/>">
<title>Admin Category Manager</title>
<body style="background-color: var($ gray-300)">
	<%@include file="/WEB-INF/views/include/adminHeaderNav.jsp"%>
	<div id="main-content" class="row pt-3">
		<div class="col-md-2"></div>
		<div class=" col-md category-menu container">
			<p class="h2 bold">Category</p>
			<div class="row category-menu-content">
			<!-- Form Thong Tin loai hang -->
				<form class="col-md-6 h-100">
					<p class="h5 bold">About Category</p>
					<div class="mb-3 form-check w-100">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Mat
								hang 1 </label> <input type="email" class="form-control"
								id="inputCategory" aria-describedby="emailHelp">
							<div class="form-text">Loai Mat Hang</div>
						</div>
					</div>
					<ul class="d-flex flex-row justify-content-between">
						<li><button type="submit" class="btn btn-primary">Add</button></li>
						<li><button type="submit" class="btn btn-primary">Delete</button></li>
					</ul>
				</form>
				
				<!-- Bang mat hang -->
				<div class="col-md-6 h-100 overflow-y-scroll position-relative">
					<table class="table table-hover table-striped table-categories">
						<thead class="position-sticky top-0 bg-light">
							<tr>
								<th scope="col">No</th>
								<th scope="col">Ten Mat Hang</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="status" var="item" items="${list}">
								<tr>
									<th scope="row">${status.index }</th>
									<td><c:out value="${item.name }" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>


		<!-- Menu mat hang -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md">
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