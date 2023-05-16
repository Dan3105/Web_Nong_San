<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/library.jsp"%>

<body>
	<c:set var="localeCode" value="${pageContext.response.locale}" />

	<!-- Language Bar -->
	<div class="language bg-light py-1">
		<div class="container">
			<div class="row">

				<div class="col-md-6 col-12 text-center text-md-start">
					<div class="me-auto  ">
						<s:message code="global.intro" />
					</div>
				</div>

				<div class="col-6 text-end d-none d-md-block">
					<div class="dropdown ">
						<button
							class="btn btn-sm dropdown-toggle border-0 text-muted me-2"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<c:if test="${localeCode == 'vi'}">
								<i class="flag-icon flag-icon-vn lang-icon"></i> VN
						</c:if>
							<c:if test="${localeCode == 'en'}">
								<i class="flag-icon flag-icon-us lang-icon"></i> EN
						</c:if>
						</button>

						<ul class="dropdown-menu text-center ">
							<li><a class="dropdown-item text-muted"
								href='<c:url value = "index.htm?language=vi"/>'><i
									class="flag-icon flag-icon-vn me-1"></i>VN</a></li>
							<li><a class="dropdown-item text-muted"
								href='<c:url value = "index.htm?language=en"/>'><i
									class="flag-icon flag-icon-us me-1"></i>EN</a></li>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End Language Bar -->

	<!--Navbar  -->
	<nav class="navbar navbar-expand-lg mb-3 ">
		<div class="container">
			<a class="navbar-brand"
				href='<c:url value = "index.htm?language=${pageContext.response.locale}"/>'>
				<img src="${company.logoNavImg }" alt="Logo">
			</a>


			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href='<c:url value = "index.htm?language=${pageContext.response.locale}"/>'><s:message
								code="global.nav_item1" /> </a></li>
					<li class="nav-item"><a class="nav-link"
						href="product/index.htm"><s:message
								code="global.nav_item2" /></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><s:message
								code="global.nav_item3" /></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><s:message
								code="global.nav_item4" /></a></li>	

				</ul>
				<div class="search-and-icons d-flex position-relative">
					<!-- Search Form -->
					<div class="search-bar d-flex  flex-column me-3">
						<form role="search" action="searchFood.htm">
							<input class="form-control " type="search"
								placeholder=<s:message code="global.search"/>
								aria-label="Search" name="search">
						</form>
					</div>


					<div class="user-icons d-flex justify-content-center gap-2 ">
						<a href="wishlist.htm" class="wishlist icon position-relative">
							<i class="bi bi-heart"></i><span
							class="position-absolute top-10 start-80 translate-middle badge rounded-pill  ">1
								<span class="visually-hidden">unread messages</span>
						</span>
						</a> <a
							href='<c:url value = "account/index.htm?language=${pageContext.response.locale}"/>'
							class="profile icon"> <i class="bi bi-person"></i>
						</a> <a
							href='<c:url value = "cart/index.htm?language=${pageContext.response.locale}"/>'
							class="cart icon position-relative"> <i class="bi bi-cart3"></i><span
							class="position-absolute top-10 start-80 translate-middle badge rounded-pill ">5
								<span class="visually-hidden">unread messages</span>
						</span>
						</a>

					</div>
				</div>

			</div>
		</div>

	</nav>
	<!--End Navbar  -->
	<%-- <%@include file="/WEB-INF/views/cart/index.jsp"%> --%>