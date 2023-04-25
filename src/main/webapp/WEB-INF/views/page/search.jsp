<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<body>
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Library</li>
			</ol>
		</nav>
		<h5>
			<span>${search.have }</span> ${fn:length(products)} <span>${search.result }</span>
		</h5>
		<div class="row row-cols-2 row-cols-md-4 g-4">
			<c:forEach var="p" items="${products }">
				<div class="col">
					<div class="card">
						<img src="${p.image }" class="card-img-top"
							alt="Hollywood Sign on The Hill" />
						<div class="card-body">
							<h5 class="card-title">${p.productName }</h5>
							<p class="card-detail">${p.detail }</p>
							<p class="card-price">
								<fmt:setLocale value="en_US" />
								<fmt:formatNumber value="${p.price }" type="number" />
							</p>
						</div>
					</div>
				</div>
			</c:forEach>



		</div>


	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>