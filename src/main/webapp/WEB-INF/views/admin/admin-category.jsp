<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<link rel="stylesheet"
	href="<c:url value="/assets/css/admincss/admin-category.css"/>">
<script src="<c:url value="/assets/js/admin/AdminCategoryManager.js"/>"></script>
<title>Admin Category Manager</title>
<style>
td {
	height: 6vh;
}
</style>

<body style="background-color: var($ gray-300)">
	<%@include file="/WEB-INF/views/include/admin-header-nav.jsp"%>
	<div class="row container">
		<div class="col-xl-6 col-lg-12 category-menu container">
			<p class="h2 bold">Category</p>
			<a href="category/add.htm"><button class="btn btn-success">Add
					Category</button></a>
			<div class="category-menu-content">
				<!-- Bang mat hang -->
				<div class="h-100 overflow-y-scroll position-relative">

					<table class="table table-hover table-striped table-categories">
						<thead class="position-sticky top-0 bg-light">
							<tr>
								<th class="col" scope="col">Ten Mat Hang</th>
								<th class="col" scope="col">Hinh anh</th>
								<th class="col-3" scope="col">Insert/Delete</th>
								<th class="col-1" scope="col">Tim Kiem</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="status" var="item" items="${list}">
								<tr>

									<td id="CategoryName${status.index}">
										<div>
											<p class="p-0 m-0">${item.name }</p>
										</div>
									</td>
									<td id="ImageName${status.index }">
										<div style="height: inherit">
											<c:if test="${item == null }">
												<img class="h-100" alt="Image-null"
													src=https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg />
											</c:if>
											<c:if test="${item != null }">
												<img class="h-100" alt="Image${status.index}"
													src="<c:url value="/assets/img/category/${item.image}"/>">
											</c:if>
										</div>
									</td>
									<td>
										<div
											class="h-100 d-flex align-items-center justify-content-start">
											<a href="category/update${item.id }.htm"><button
													class="btn btn-primary" type="button"
													id="edit_button${status.index}">
													<i class="ti-pencil-alt"></i>
												</button></a> <a id="del_button${status.index }"
												href="category/delete${item.id}.htm"><button
													class="btn btn-danger ms-2">
													<i class="ti-trash"></i>
												</button></a>
										</div>
									</td>
									<td><a href="category/find${item.id}"><button
												class="btn btn-success ms-2">
												<i class="ti-search"></i>
											</button></a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>

			</div>
		</div>


		<!-- Menu mat hang -->
		<div class="col-xl-6 col-lg-12">
			<p class="h2 bold">Product</p>
			<div class="container"></div>
		</div>
	</div>
	</div>
	</div>


	<%@include file="/WEB-INF/views/include/admin-footer.jsp"%>