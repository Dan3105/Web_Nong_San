<%@include file="/WEB-INF/views/include/adminHeader.jsp"%>
<script src="<c:url value="/assets/js/admin/adminRegister.js"/>">></script>
<title>Register</title>
</head>

<body class="bg-success">
	<div class="container d-flex justify-content-center align-items-center"
		style="height: 100vh;">
		<div class="col-md-6 container">
			<h2>Register Form</h2>
			<form>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" placeholder="Enter email"
						name="email">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" id="password" placeholder="Enter password"
						name="password">
				</div>
				<div class="form-group">
					<label for="firstName">First Name:</label> <input type="text"
						class="form-control" id="firstName" placeholder="Enter first name"
						name="firstName">
				</div>
				<div class="form-group">
					<label for="lastName">Last Name:</label> <input type="text"
						class="form-control" id="lastName" placeholder="Enter last name"
						name="lastName">
				</div>

				<div class="form-group row">
					<div class="col-md-6">
						<label for="province">Province:</label> <select
							class="form-control" id="province">
							<option value="">-- Select Province --</option>
							<c:forEach items="${address.provinceBean}" var="province">
								<option value="${province.id}">${province.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-6">
						<label for="district">District:</label> <select
							class="form-control" id="district">
							<option value="">-- Select District --</option>
							<c:forEach items="${address.districtBean}" var="district">
								<option value="${district.id}"
									data-province="${district.province.id}">${district.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="ward">Ward:</label> <select class="form-control"
						id="ward">
						<option value="">-- Select Ward --</option>
						<c:forEach items="${address.wardBean}" var="ward">
							<option value="${ward.id}" data-district="${ward.district.id}">${ward.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="phone">Phone Number:</label> <input type="text"
						class="form-control" id="phone" placeholder="Enter phone number"
						name="phone">
				</div>
				<div class="form-group">
					<label for="avatar">Avatar:</label> <input type="file"
						class="form-control-file" id="avatar" name="avatar">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
	<script>lazyLoading()</script>
</body>
</html>