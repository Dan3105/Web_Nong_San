<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<title>Login</title>
<link rel="stylesheet"
	href="<c:url value="/assets/css/usercss/user-login.css"/>">
</head>
<body>
	<section class="h-100 gradient-form" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div class="text-center">
										<img src="assets/img/logo.png" style="width: 185px;"
											alt="logo">
									</div>

									<form:form method="post" action="guest.htm"
										modelAttribute="userbean" class="pt-4">
										<p class="fw-bold">Please login to your account</p>

										<div class="form-outline pt-2 mb-4">
											<label class="form-label" for="username">Username</label>
											<form:input placeholder="Email address" type="email"
												class="form-control" path="username" id="username" />
										</div>

										<div class="form-outline mb-4">
											<label class="form-label" for="password">Password</label>
											<form:input type="password" class="form-control"
												path="password" id="password" />
										</div>

										<div class="text-center pt-1 mb-5 pb-1">
											<button name="guest-login"
												class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
												type="submit">Log in</button>
											<a class="text-muted" href="#">Forgot password?</a>
										</div>

										<div
											class="d-flex align-items-center justify-content-center pb-4">
											<p class="mb-0 me-2">Don't have an account?</p>
											<a href="guest/guest-register.htm"><button
													type="button"
													class="btn btn-outline-danger">Create new</button></a>
										</div>
									</form:form>

								</div>
							</div>
							<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
								<div class="text-white px-3 py-4 p-md-5 mx-md-4">
									<h4 class="mb-4">We are more than just a company</h4>
									<p class="small mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit, sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										quis nostrud exercitation ullamco laboris nisi ut aliquip ex
										ea commodo consequat.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/WEB-INF/views/include/admin-footer.jsp"%>