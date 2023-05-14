<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<%@include file="/WEB-INF/views/include/admin-header-nav.jsp" %>
<body>
	<c:if test="${not empty addBean }">
		<c:set var="crrBean" value="${addBean}" />
		<c:set var="nameBean" value="addBean"/>
		<c:set var="actionString" value="add.htm" />
	</c:if>

	<c:if test="${not empty updateBean }">
		<c:set var="crrBean" value="${updateBean}" />
		<c:set var="nameBean" value="updateBean"/>
		<c:set var="actionString" value="update.htm" />
	</c:if>

	<form:form class="w-75" action="${actionString }" method="post"
		modelAttribute="${nameBean }" enctype="multipart/form-data">
		<form:input type="hidden" path="id"/> 
		<div class="form-group">
			<label for="name-category">Name Category</label>
			<form:input type="text" class="form-control" id="name-category"
				path="name" />
		</div>
		<div class="form-group">
			<p>Current Image Display</p>
			<img class="width-100" src="<c:url value="/assets/img/category/${crrBean.image}"/>"
				alt="Image not found" />
		</div>


		<div class="form-group">
			<label for="image">Change Image</label>
			<form:input id="image" type="file" class="form-control"
				accept="image/*" path="fileImage" />
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</body>
</html>