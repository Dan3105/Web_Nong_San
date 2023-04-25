<%@include file="/WEB-INF/views/include/admin-header.jsp"%>
<body>
	<c:if test="${not empty addBean }">
		<c:set var="crrBean" value="addBean" />
		<c:set var="actionString" value="add.htm" />
	</c:if>

	<c:if test="${not empty updateBean }">
		<c:set var="crrBean" value="updateBean" />
		<c:set var="actionString" value="update.htm" />
	</c:if>
	<p>${crrBean }</p>
	<p>${actionString }</p>
	<form:form class="w-75" action="${actionString }" method="post" modelAttribute="${crrBean }">
		<form:textarea path="id"/>
		<div class="form-group">
			<label for="name-category">Name Category</label> <form:input
				type="text" class="form-control" id="name-category"
				path="name"/>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</body>
</html>