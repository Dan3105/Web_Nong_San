<link rel="stylesheet"
	href="<c:url value="/assets/css/admincss/admin-menu.css"/>">
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- Admin menu vertical -->
<nav id="sidebar">
	<div class="p-4">
		<a class="h-100 rounded-0" href=""> <img
			src="<c:url value="/assets/img/logo.png"/>" alt="logo"
			class="p-1 w-100">
		</a>
		<ul class="list-unstyled components mb-5">
					<li><a href="${path }/admin/overview.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-pie-chart"></i>Overview
							</button></a></li>
					<li class="nav-item w-100"><a href="${path }/admin/user.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-light-bulb"></i>User
							</button></a></li>
					<li class="nav-item w-100"><a href="${path }/admin/orders.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-light-bulb"></i>Orders
							</button></a></li>
					<li class="nav-item w-100"><a
						href="${path }/admin/category.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-briefcase"></i>Category
							</button></a></li>
				
				<li class="collapse list-unstyled" id="info-account">
					<li class="nav-item w-100"><a href="${path}/admin/profile.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-user"></i>Profile
							</button></a></li>
					<li class="nav-item w-100"><a href="${path}/admin/address.htm"><button
								class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
								<i class="pe-2 ti-map"></i>Address
							</button></a></li>
							
				<li><a href="${path }/admin/logout.htm"><button
						class="btn btn-outline-success p-4 border-0 w-100 text-start btn-hover-nav">
						<i class="pe-2 ti-power-off"></i>Logout
					</button></a></li>

		</ul>
		<script>
			var currentUrl = window.location.pathname;
			var buttons = document.querySelectorAll('.btn-hover-nav');

			for (var i = 0; i < buttons.length; i++) {
				var button = buttons[i];
				var href = button.parentElement.getAttribute('href');
				href = href.slice(0, -4);
				if (currentUrl.includes(href)) {
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
			<nav>			
			</nav>
			<div class="navbar mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
				<ul class="w-100 navbar-nav justify-content-end">
					<li class="nav-item px-3 d-flex align-items-center"><a
						href="#" class="nav-link text-body pe-4"> <i
							class="ti-bell fs-4 cursor-pointer"></i>
					</a></li>
					<li><a href="${path}/admin/profile.htm"> <img
							class="d-block rounded-pill w-100"
							style="max-width: 50px; min-width: 30px;"
							src="<c:url value="/assets/img/account/${user.avatar}"/>"
							onerror="
										this.onerror = null;
										this.src='https://i.pinimg.com/474x/66/da/e1/66dae117263cc353d351949bcc76e1e4.jpg';"
							alt="admin-img" />
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
