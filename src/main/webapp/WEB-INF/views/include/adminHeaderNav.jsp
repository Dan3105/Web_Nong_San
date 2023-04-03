<link rel="stylesheet"
	href="<c:url value="/assets/css/admincss/admin-menu.css"/>">
<!-- Admin header -->
<div id="screen-container" class="row-cols-2 row">

	<!-- Admin menu vertical -->
	<nav
		class="col-md-2 col-sm-12 p-0 navbar navbar-expand-lg bg-body-tertiary ">
		<div class="flex-column">
			<a class="btn navbar-brand h-100 rounded-0 position-relative"
				href="#logo"> <img
				src="<c:url value="/assets/img/logo.png"/>" alt="logo"
				class="p-1 w-100">
			</a>
			<button class="navbar-toggler flex-end" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="position-absolute collapse navbar-collapse w-100"
				id="navbarSupportedContent">
				<ul class="navbar-nav flex-column w-100">
					<li class="nav-item w-100"><button type="button"
							class="btn btn-outline-success p-4 border-0 w-100 text-start">
							<i class="pe-2 ti-pie-chart"></i>Overview
						</button></li>
					<li class="nav-item w-100"><button type="button"
							class="btn btn-outline-success p-4 border-0 w-100 text-start">
							<i class="pe-2 ti-light-bulb"></i>User
						</button></li>
					<li class="nav-item w-100"><button type="button"
							class="btn btn-outline-success p-4 border-0 w-100 text-start">
							<i class="pe-2 ti-ticket"></i>Voucher
						</button></li>
					<li class="nav-item w-100"><button type="button"
							class="btn btn-outline-success p-4 border-0 w-100 text-start">
							<i class="pe-2 ti-briefcase"></i>Product
						</button></li>
					<li class="nav-item w-100"><button type="button"
							class="btn btn-outline-success p-4 border-0 w-100 text-start">
							<i class="pe-2 ti-agenda"></i>Agent
						</button></li>
					<li class="nav-item w-100"><button type="button"
							class="btn btn-outline-success p-4 border-0 w-100 text-start">
							<i class="pe-2 ti-info-alt"></i>Set info
						</button></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Admin menu horizontal -->
	<div id="admin-menu-header"
		class="col-md container-fluid align-items-center d-inline-block">

		<ul
			class="row container-fluid justify-content-between align-items-center">
			<li class="col header-searchbar"><label>
					<form class="input-group border rounded-pill align-items-center"
						action="#" method="post">
						<i class="ti-search input-group-text searchbar-icon "></i> <input
							class="form-control" type="search" placeholder="Search"
							aria-label="Search">
					</form>
			</label></li>
			<li class="col-md-5 header-breadcrumb">
				<p class="text-center">Admin Dashboard</p>
			</li>
			<li
				class="col-md row container-fluid align-items-center justify-content-between header-userinfo">
				<div
					class="col-md-2 container d-flex align-items-center userinfo-notification p-0 pe-5 border-end border-1">
					<a class="text-decoration-none text-secondary position-relative"><i
						class="fs-5 ti-bell text-center "></i> <span
						class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
							<span class="visually-hidden">New alerts</span>
					</span></a>
				</div>

				<div class="col-md userinfo-username">
					<p class="m-0 text-center">Admin Username</p>
				</div>
				<div
					class="col-md-2 align-items-center userinfo-userlogo me-3 d-flex">
					<a><img class="d-block rounded-pill"
						src="https://i.pinimg.com/474x/66/da/e1/66dae117263cc353d351949bcc76e1e4.jpg"
						alt="concat"></a>
				</div>

			</li>
		</ul>


	</div>

</div>