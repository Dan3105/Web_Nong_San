<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<link rel="stylesheet"
	href="<c:url value="/assets/css/admincss/admin-category.css"/>">
<script src="<c:url value="/assets/js/admin/AdminCategoryManager.js"/>"></script>
<title>Admin Category Manager</title>
<body style="background-color: var($ gray-300)"></body>
<%@include file="/WEB-INF/views/include/admin-header-nav.jsp"%>
<div class="row container">
	<div class="col-xl-6 col-lg-12 category-menu container">
		<p class="h2 bold">Category</p>
		<div class="category-menu-content">
			<!-- Bang mat hang -->
			<div class="h-100 overflow-y-scroll position-relative">
				<form:form method="post">
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
											<input style="display: none" type='text' class='form-control'
												value='' aria-label='Category' name='inputCategory${item.id }'>
										</div>

									</td>
									<td id="ImageName${status.index }">
										<div>
											<c:if test="${item == null }">
												<img alt="Image-null"
													src=https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg />
											</c:if>
											<c:if test="${item != null }">
												<img alt="Image${status.index}" src="${item.image}">
											</c:if>
										</div>
									</td>
									<td class="d-flex align-items-center justify-content-center">
										<button class="btn btn-primary h-100 " type="button"
											id="edit_button${status.index}"
											onclick="EditRow(${status.index})">
											<i class="ti-pencil-alt"></i>
										</button>

										<div id="EditChange${status.index}"
											class="align-items-center h-100" style="display: none">
											<a href="category/edit${item.id}.htm"><button
													class="btn btn-success"
													onclick="OnConfirmEdit(${status.index})">Y</button></a>
											<button class="btn btn-warning"
												onclick="OnCancelEdit(${status.index})">X</button>
										</div> <a id="del_button${status.index }"
										href="category/delete${item.id}.htm"><button
												class="btn btn-danger ms-2">
												<i class="ti-trash"></i>
											</button></a>
									</td>
									<td><a href="category/find${item.id}.htm"><button
												class="btn btn-success ms-2">
												<i class="ti-search"></i>
											</button></a></td>
								</tr>
							</c:forEach>
							<%-- <c:set var="listLength" value="${fn:length(list)}" scope="session" />
						<tr>
							<th scope="row"><p class="p-0 m-0">${listLength}</p></th>
							<td><input type="text" class="form-control"
								placeholder="New Category" aria-label="Category"></td>
							<td colspan="2">
								<button class="btn btn-danger">
									<i class="ti-trash"></i>
								</button>
							</td>
						</tr> --%>
						</tbody>
					</table>
				</form:form>
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