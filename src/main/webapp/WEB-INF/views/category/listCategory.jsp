<!-- Category -->
<div class="container category">
	<div class="row">
		<div class="col-12 mb-6">
			<h5 class="fw-bold mb-5 fs-3">
				<s:message code="global.category" />
			</h5>

		</div>
	</div>
	<div class="owl-carousel owl-theme">
		<c:forEach var="c" items="${category }">
			<div class="item p-3">
				<div class="card mb-3">
					<div class="card-body text-center py-6 text-center ">
						<div class="my-3">
							<a href="product/index.htm?categoryId=${c.categoryId }"> <img
								class="card-img-top"
								src="<c:url value="/assets/img/category/${c.image}"/>"
								alt="Card image cap">
							</a>
						</div>
						<p class="card-text ">
							<a href="#" class="text-decoration-none  ">${c.name } </a>
						</p>
					</div>

				</div>
			</div>

		</c:forEach>

	</div>
</div>
<!-- End Category -->