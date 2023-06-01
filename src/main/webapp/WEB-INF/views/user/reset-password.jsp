<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<title>Reset Password</title>
</head>
<body>
	<div class="container">
		<form method="POST">
			<div class="row">
				<div class="col-sm-8">
				<%-- <input type="hidden" value="${email }" name="email"/> --%>
				<p>Change password for ${email }</p>
				</div>
				<div class="col-sm-8">
					<label>New Password</label>
					<div class="form-group pass_show">
						<input type="password" name="password"
							class="form-control" placeholder="New Password">
					</div>
					<label>Confirm Password</label>
					<div class="form-group pass_show">
						<input type="password" name="confirm-passsword"
							class="form-control" placeholder="Confirm Password">
					</div>
					<input type="hidden" value="${request.getRequestURL() }" name="oldPath"/>
					<button type="submit" class="btn btn-primary">Submit Change</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>