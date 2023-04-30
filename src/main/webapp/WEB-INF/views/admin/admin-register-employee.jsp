<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<%@include file="/WEB-INF/views/include/admin-header-nav.jsp"%>
<body>
	<section style="background-color: #eee; height: 70vh;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="justify-content-center">
								<div class="col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
										up</p>
									<p class="text-danger">${message }</p>
									<form:form class="mx-1 mx-md-4" method="post" action="employee-register.htm" 
										modelAttribute="userbean" enctype="multipart/form-data">

										<div class="form-group mt-3 mb-3">
											<label for="email">Email:</label>
											<form:input type="email" class="form-control" id="email"
												placeholder="Enter email" path="email" />
											<form:errors class="text-danger" path="email" />
										</div>
										<div class="form-group mt-3 mb-3">
											<label for="password">Password:</label>
											<form:input type="password" class="form-control"
												id="password" placeholder="Enter password" path="password" />
											<form:errors class="text-danger" path="password" />
										</div>
										<div class="form-group row mt-3 mb-3">
											<div class="col-md-8">
												<div class="form-outline">
													<label class="form-label" for="lastName">Last name</label>
													<form:input type="text" id="lastName"
														class="form-control form-control-lg" path="lastName" />
													<form:errors class="text-danger" path="lastName" />
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-outline">
													<label class="form-label" for="firstName">First
														name</label>
													<form:input type="text" id="firstName"
														class="form-control form-control-lg" path="firstName" />
													<form:errors class="text-danger" path="firstName" />
												</div>
											</div>
										</div>
										<div class="form-group mt-3 mb-3">
											<label for="phoneNumber">Phone Number:</label>
											<form:input type="text" class="form-control" id="phoneNumber"
												placeholder="Enter phone number" path="phoneNumber" />
											<form:errors class="text-danger" path="phoneNumber" />
										</div>
										<div class="form-group mt-3 mb-3">
											<label for="avatar">Avatar:</label>
											<form:input type="file" class="form-control-file" id="avatar"
												path="avatar" accept="image/*" />
											<form:errors class="text-danger" path="avatar" />
										</div>
										<button type="submit" class="btn btn-primary">Submit</button>

									</form:form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>