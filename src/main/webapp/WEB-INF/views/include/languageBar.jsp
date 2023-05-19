<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/library.jsp"%>
<c:set var="localeCode" value="${pageContext.response.locale}" />
<body>
	<!-- Language Bar -->
	<div class="language bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-12 text-center text-md-start">
					<div class="me-auto  ">
						<s:message code="global.intro" />
					</div>
				</div>

				<div class="col-6 text-end d-none d-md-block">
					<div class="dropdown ">
						<button
							class="btn btn-sm dropdown-toggle border-0 text-muted me-2"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<c:if test="${localeCode == 'vi'}">
								<i class="flag-icon flag-icon-vn lang-icon"></i> VN
						</c:if>
							<c:if test="${localeCode == 'en'}">
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