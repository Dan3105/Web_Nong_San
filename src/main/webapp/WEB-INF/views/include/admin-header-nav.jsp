<link rel="stylesheet"
	href="<c:url value="/assets/css/admincss/admin-menu.css"/>">

<!-- Admin menu vertical -->
<nav id="sidebar">
	<div class="p-4">
		<a class="h-100 rounded-0" href="#logo"> <img
			src="<c:url value="/assets/img/logo.png"/>" alt="logo"
			class="p-1 w-100">
		</a>
		<ul class="list-unstyled components mb-5">
			<li class="active"><a href="#managerSubmenu" type="button"
				data-bs-toggle="collapse" aria-expanded="false"
				class="navbar-toggle" data-bs-target="#managerSubmenu"><button
						class="btn btn-outline-success p-4 border-0 w-100 text-start">
						<i class="pe-2 ti-layout-menu-v"></i>Manager
					</button></a>
				<ul class="collapse show list-unstyled " id="managerSubmenu">
					<li><a href="overview.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-pie-chart"></i>Overview
							</button></a></li>
					<li class="nav-item w-100"><a href="user.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-light-bulb"></i>User
							</button></a></li>
					<li class="nav-item w-100"><a href="voucher.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-ticket"></i>Voucher
							</button></a></li>
					<li class="nav-item w-100"><a href="category.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-briefcase"></i>Category
							</button></a></li>
				</ul></li>
			<li><a href="admin-info.htm"><button
						class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
						<i class="pe-2 ti-light-bulb"></i>About Admin
					</button></a></li>

		</ul>
		<script>
			var currentUrl = window.location.pathname;

			var buttons = document.querySelectorAll('.btn-hover-nav');

			for (var i = 0; i < buttons.length; i++) {
				var button = buttons[i];
				var href = button.parentElement.getAttribute('href');
				if (currentUrl.endsWith(href)) {
					button.classList.add('active');
				} else {
					button.classList.remove('active');
				}
			}
		</script>
	</div>
</nav>
<div id="content">
	<!-- Navbar -->
	<nav
		class="navbar navbar-main navbar-expand-lg px-0 shadow-none border-radius-xl"
		id="navbarBlur" data-scroll="true">
		<div
			class="container-fluid d-flex py-1 align-items-center justify-content-between">
			<nav aria-label="breadcrumb">
				<ol
					class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
					<li class="breadcrumb-item text-sm"><a
						class="opacity-5 fs-5 text-dark" href="#">Pages</a></li>
					<li class="breadcrumb-item fs-5 text-sm text-dark active"
						aria-current="page">index</li>
				</ol>
				<h6 class="font-weight-bolder mb-0">index</h6>

			</nav>
			<div class="navbar mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
				<ul class="w-100 navbar-nav justify-content-end">
					<li class="nav-item px-3 d-flex align-items-center"><a
						href="#" class="nav-link text-body pe-4"> <i
							class="ti-bell fs-4 cursor-pointer"></i>
					</a></li>
					<li><a><img class="d-block rounded-pill w-100"
							style="max-width: 50px; min-width: 30px;"
							src="https://i.pinimg.com/474x/66/da/e1/66dae117263cc353d351949bcc76e1e4.jpg"
							alt="concat"></a></li>
				</ul>
			</div>
		</div>
	</nav>