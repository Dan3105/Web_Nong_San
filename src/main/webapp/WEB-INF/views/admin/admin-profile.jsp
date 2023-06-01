<%@include file="/WEB-INF/views/include/admin-header.jsp"%>

<body>
	<%@include file="/WEB-INF/views/include/admin-header-nav.jsp"%>
	<div class="d-flex align-items-center justify-content-center w-100"
		style="height: 75vh">
		<form:form method="post" action="profile.htm"
			modelAttribute="userbean"
			class="border-1 rounded-3 border-primary container rounded bg-white m-0"
			style="border: solid" enctype="multipart/form-data">
			<div class="row">
				<form:input type="hidden" path="password" />
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
							<button class="btn btn-primary profile-button" name="update"
								type="submit">Save Profile</button>
							<c:if test="${message eq false }">
								<p class="mt-2 fw-semibold fs-6 text-danger">Failed in saving profile</p>
							</c:if>
							<c:if test="${message eq true }">
								<p class="mt-2 fw-semibold fs-6 text-success">Success in saving profile</p>
							</c:if>

						</div>
					</div>
				</div>
				<div class="col-md-4 border-right">
					<div
						class="d-flex flex-column align-items-center text-center p-3 py-5">
						<img id="ouput" class="rounded-circle mt-5" width="150px"
							src="<c:url value="/assets/img/account/${user.avatar}"/>"
							onerror=" 	this.onerror = null;
										this.src='https://i.pinimg.com/474x/66/da/e1/66dae117263cc353d351949bcc76e1e4.jpg';" /><span
							class="font-weight-bold">Edogaru</span><span
							class="text-black-50">${userbean.email }</span><span> </span>
					</div>
					<div
						class="d-flex justify-content-center align-items-center mt-3 mb-3">
						<label for="avatar">Avatar:</label>
						<form:input  type="file" class="form-control-file ps-2" id="avatar"
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
