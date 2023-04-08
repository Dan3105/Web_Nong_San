<%@include file="/WEB-INF/views/include/adminHeader.jsp" %>
<title>Login</title>
<link rel="stylesheet" href="<c:url value="/assets/css/admincss/admin-login.css"/>">
</head>
<body>
<div class="container d-flex justify-content-center align-items-center" style="height:100vh;">

    <div class="col-md-6">
      <div class="card admin-login-background-inside">
        <div class="card-body">
          <div class="text-center mb-3 ">
            <img src="<c:url value="/assets/img/logo.png"/>" alt="Logo" class="w-100">
          </div>
          <form:form method="post" action="admin.htm" modelAttribute="admin">
            <div class="form-group my-4">
              <form:input placeholder="Username" type="text" class="form-control admin-login-input" path="username"/>
            </div>
            <div class="form-group my-4">
              <form:input placeholder="Password" type="password" class="admin-login-input form-control" path="password"/>
            </div>
            <div class="px-4"></div>
            <button type="submit" class="btn btn-primary btn-block admin-login-login-btn">Sign in</button>
             <div class="form-group text-right">
            <a href="#" class="w-100 small"><b class="">Forgot Password?</b></a>
          </div>
          </form:form>
        </div>	
      </div>
    </div>

</div>
<%@include file="/WEB-INF/views/include/adminFooter.jsp" %>