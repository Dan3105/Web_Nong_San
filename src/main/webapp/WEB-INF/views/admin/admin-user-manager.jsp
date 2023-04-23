<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<title>Admin Users Manager</title>

<body>
	<%@include file="/WEB-INF/views/include/admin-header-nav.jsp"%>
	<!-- Main Content -->
	<div id="admin-menu-content-user" class="row">
		<div class="col-md-2 emptyspace p-0"></div>

		<div class="col-md container content-user-breadcrumb m-3 bg-light">
			<div class="row">
				<div class="col-6 content-user-name h4 ">All users</div>
				<div
					class="col-6  content-user-filter d-flex justify-content-end align-items-center">
					<a type="button"><i class="ti-filter p-2"></i>Filter</a> <a
						type="button"><i class="ti-layout-list-post p-2"></i>Sort</a>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<table class="table">
						<thead>
							<tr>
								<th class="p-3">Name</th>
								<th class="p-3">Age</th>
								<th class="p-3">Address</th>
								<th class="p-3">Salary</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="p-3">John Mayour</td>
								<td class="p-3">21</td>
								<td class="p-3">Houston</td>
								<td class="p-3">1200</td>
							</tr>
							<tr>
								<td class="p-3">John Mayour</td>
								<td class="p-3">21</td>
								<td class="p-3">Houston</td>
								<td class="p-3">1200</td>
							</tr>
							<tr>
								<td class="p-3">John Mayour</td>
								<td class="p-3">21</td>
								<td class="p-3">Houston</td>
								<td class="p-3">1200</td>
							</tr>
							<tr>
								<td class="p-3">John Mayour</td>
								<td class="p-3">21</td>
								<td class="p-3">Houston</td>
								<td class="p-3">1200</td>
							</tr>
							<tr>
								<td class="p-3">John Mayour</td>
								<td class="p-3">21</td>
								<td class="p-3">Houston</td>
								<td class="p-3">1200</td>
							</tr>
							<tr>
								<td class="p-3">John Mayour</td>
								<td class="p-3">21</td>
								<td class="p-3">Houston</td>
								<td class="p-3">1200</td>
							</tr>
							<tr>
								<td class="p-3">John Mayour</td>
								<td class="p-3">21</td>
								<td class="p-3">Houston</td>
								<td class="p-3">1200</td>
							</tr>
							<tr>
								<td class="p-3">John Mayour</td>
								<td class="p-3">21</td>
								<td class="p-3">Houston</td>
								<td class="p-3">1200</td>
							</tr>
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