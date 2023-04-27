<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<script src="<c:url value="/assets/js/admin/AdminRegister.js"/>"></script>
<title>Register</title>
<base href="${pageContext.servletContext.contextPath }"/>
</head>

<body class="bg-success">
	<!--  -->

	<section style="background-color: #eee; height: 70vh;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
										up</p>
									<p class="text-danger">${message }</p>
									<form:form class="mx-1 mx-md-4" method="post"
										modelAttribute="user" enctype="multipart/form-data">

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
											<label for="avatar">Avatar:</label> <form:input type="file"
												class="form-control-file" id="avatar" path="avatar" accept="image/"/>
											<form:errors class="text-danger" path="avatar" />
										</div>
										<button name="register" type="submit" class="btn btn-primary">Submit</button>

									</form:form>

								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">

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
<%-- 

<div class="form-group row">
	<div class="col-md-6">
		<label for="province">Province:</label> <select class="form-control"
			id="province">
			<option value="">-- Select Province --</option>
			<c:forEach items="${address.provinceBean}" var="province">
				<option value="${province.id}">${province.name}</option>
			</c:forEach>
		</select>
	</div>
	<div class="col-md-6">
		<label for="district">District:</label> <select class="form-control"
			id="district">
			<option value="">-- Select District --</option>
			<c:forEach items="${address.districtBean}" var="district">
				<option value="${district.id}"
					data-province="${district.province.id}">${district.name}</option>
			</c:forEach>
		</select>
	</div>
</div>

<div class="form-group">
	<label for="ward">Ward:</label> <select class="form-control" id="ward">
		<option value="">-- Select Ward --</option>
		<c:forEach items="${address.wardBean}" var="ward">
			<option value="${ward.id}" data-district="${ward.district.id}">${ward.name}</option>
		</c:forEach>
	</select>
</div> 	<script>lazyLoading()</script>--%>