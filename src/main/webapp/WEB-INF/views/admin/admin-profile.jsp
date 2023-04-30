<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<body>
	<%@include file="/WEB-INF/views/include/admin-header-nav.jsp"%>
	<div class="d-flex align-items-center justify-content-center w-100"
		style="height: 75vh">
		<form:form method="post" action="save-profile.htm"
			modelAttribute="userbean"
			class="border-1 rounded-3 border-primary container rounded bg-white m-0"
			style="border: solid" enctype="multipart/form-data">
			<div class="row">

				<div class="col-md-8 border-right">
					<div class="p-3 py-5">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h4 class="text-right">Profile Settings</h4>
						</div>
						<div class="row mt-2">
							<div class="col-md-6">
								<label for="lastName" class="labels">Last Name</label>
								<form:input id="lastName" type="text" path="lastName"
									class="form-control" />
								<form:errors class="text-danger" path="lastName" />
							</div>
							<div class="col-md-6">
								<label for="firstName" class="labels">First Name</label>
								<form:input id="firstName" type="text" path="firstName"
									class="form-control" />
								<form:errors class="text-danger" path="firstName" />
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label for="email" class="labels">Email</label>
								<form:input id="email" type="email" path="email"
									class="form-control" />
								<form:errors class="text-danger" path="email" />
							</div>

							<div class="col-md-12">
								<label for="phoneNumber" class="labels">Phone Number</label>
								<form:input id="phoneNumber" type="text" path="phoneNumber"
									class="form-control" />
								<form:errors class="text-danger" path="phoneNumber" />
							</div>

						</div>
						<div class="mt-5 text-center">
							<button class="btn btn-primary profile-button" type="button">Save
								Profile</button>
						</div>
					</div>
				</div>
				<div class="col-md-4 border-right">
					<div
						class="d-flex flex-column align-items-center text-center p-3 py-5">
						<img class="rounded-circle mt-5" width="150px"
							src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span
							class="font-weight-bold">Edogaru</span><span
							class="text-black-50">${userbean.email }</span><span> </span>
					</div>
					<div class="mt-3 mb-3">
						<label for="avatar">Avatar:</label>
						<form:input type="file" class="form-control-file" id="avatar"
							path="avatar" accept="image/*" />
						<form:errors class="text-danger" path="avatar" />
					</div>
				</div>
			</div>
		</form:form>
	</div>
	</div>
	</div>
</body>
</html>

<%-- <div class="col-md-12 mt-2">
							<p class="m-1">Address 1</p>
							<div class="col-md-12 border-info border-1" style="border: solid">
								<div class="m-2 p-2">
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
												<option value="${ward.id}"
													data-district="${ward.district.id}">${ward.name}</option>
											</c:forEach>
										</select>
									</div>
									<label class="labels">Address Line 1</label><input type="text"
										class="form-control" placeholder="enter address line 1"
										value="">
									<!-- <script>lazyLoading()</script> -->
								</div>

							</div>
						</div>

 --%>