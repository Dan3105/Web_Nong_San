<%@include file="/WEB-INF/views/include/library.jsp"%>
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
		<div class="col-sm-12 category-menu container">
			<p class="h2 bold">Category</p>
			<a href="category/add.htm"><button class="btn btn-success">Add
					Category</button></a>
			<form method="GET"
				action="${path }/admin/category/searchCategory.htm">
				<div class="input-group">
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Name Category" aria-label="search" name="search">
						<button type="submit" class="btn btn-primary">
							<i class="ti-search"></i>
						</button>
					</div>
				</div>
			</form>
			<div class="category-menu-content">
				<!-- Bang mat hang -->
				<div class="h-100 overflow-y-scroll position-relative">

					<table class="table table-hover table-striped table-categories">
						<thead class="position-sticky top-0 bg-light">
							<tr>
								<th class="col" scope="col">Ten Mat Hang</th>
								<th class="col" scope="col">Hinh anh</th>
								<th class="col-3" scope="col">Insert</th>
								<th class="col-3" scope="col">Delete</th>
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
												</button></a>
										</div>
									</td>
									<td>
										<div
											class="h-100 d-flex align-items-center justify-content-start">
											<button type="button" class="btn btn-danger"
												data-bs-toggle="modal" data-bs-target="#exampleModal"
												id="del_button${status.index }"
												data-value="category/delete${item.id}.htm"
												class="btn btn-danger ms-2">
												<i class="ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<c:choose>
					<c:when test="${crrPage-1 < 1}">
						<a class="disabled cursor-not-allowed" href="#" class=" m-2"><button
								disabled class="btn btn-outline-info  cursor-not-allowed">
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
								disabled class="btn btn-outline-info  cursor-not-allowed">
								<i class="ti-angle-double-right"></i>
							</button></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>


</body>

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
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
<%@include file="/WEB-INF/views/include/admin-footer.jsp"%>