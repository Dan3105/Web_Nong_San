<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!-- Language Bar -->
<div class="language bg-light py-1">
	<div class="container">
		<div class="row">

			<div class="col-md-6 col-12 text-center text-md-start">
				<div class="me-auto  ">
					<s:message code="global.intro" />
				</div>
			</div>

			<div class="col-6 text-end d-none d-md-block">
				<div class="dropdown ">
					<button class="btn btn-sm dropdown-toggle border-0 text-muted me-2"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<c:if test="${pageContext.response.locale == 'vi'}">
							<i class="flag-icon flag-icon-vn lang-icon"></i> VN
						</c:if>
						<c:if test="${ pageContext.response.locale == 'en'}">
							<i class="flag-icon flag-icon-us lang-icon"></i> EN
						</c:if>
					</button>

					<ul class="dropdown-menu text-center ">
						<li><a class="dropdown-item text-muted"
							href='<c:url value = "index.htm?language=vi"/>'><i
								class="flag-icon flag-icon-vn me-1"></i>VN</a></li>
						<li><a class="dropdown-item text-muted"
							href='<c:url value = "index.htm?language=en"/>'><i
								class="flag-icon flag-icon-us me-1"></i>EN</a></li>
					</ul>

				</div>
			</div>
		</div>
	</div>
</div>
<!--End Language Bar -->