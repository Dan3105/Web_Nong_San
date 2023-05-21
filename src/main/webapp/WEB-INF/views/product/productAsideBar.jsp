<aside class="col-lg-3 col-md-6 d-none d-lg-block mb-6 mb-md-0 ">
	<!-- Categories -->
	<div class="mb-1">
		<!-- nav -->
		<div class="d-flex flex-column p-3  ">
			<h2 class="fs-4">
				<s:message code="product.breadcrumb_2" />
			</h2>
			<hr>	

			<ul
				class="nav nav-pills flex-column mb-auto me-auto text-decoration-none overflow-auto">
				<c:forEach var="c" items="${category }">
					<li class="nav-item"><a
						href="product/index.htm?categoryId=${c.categoryId}&currentPage=1"
						class="nav-link link-success "> ${c.name } </a></li>
				</c:forEach>

			</ul>
			

		</div>

	</div>
	<!-- Loc theo gia -->
	<div class="mb-1">
		<!-- nav -->
		<div class="d-flex flex-column p-3  ">
			<h2 class="fs-4">
				<s:message code="product.price" />
			</h2>
			<hr>

			<ul
				class="nav nav-pills flex-column mb-auto me-auto text-decoration-none">

				<li class="nav-item"><a
					href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=0&index=${index}"
					class="nav-link link-success "> <s:message code="product.all" />
				</a></li>
				<li class="nav-item"><a
					href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=1&index=${index}"
					class="nav-link link-success "><s:message code="product.price_below" /> <fmt:formatNumber
							value="100000" type="currency" currencySymbol="VND"
							maxFractionDigits="0" /></a></li>
				<li class="nav-item"><a
					href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=2&index=${index}"
					class="nav-link link-success "> <fmt:formatNumber
							value="100000" type="currency" currencySymbol="VND"
							maxFractionDigits="0" /> - <fmt:formatNumber value="200000"
							type="currency" currencySymbol="VND" maxFractionDigits="0" /></a></li>
				<li class="nav-item"><a
					href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=3&index=${index}"
					class="nav-link link-success "> <fmt:formatNumber
							value="200000" type="currency" currencySymbol="VND"
							maxFractionDigits="0" /> - <fmt:formatNumber value="300000"
							type="currency" currencySymbol="VND" maxFractionDigits="0" /></a></li>
				<li class="nav-item"><a
					href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=4&index=${index}"
					class="nav-link link-success "> <fmt:formatNumber
							value="300000" type="currency" currencySymbol="VND"
							maxFractionDigits="0" />-<fmt:formatNumber value="500000"
							type="currency" currencySymbol="VND" maxFractionDigits="0" /></a></li>
				<li class="nav-item"><a
					href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=5&index=${index}"
					class="nav-link link-success "> <fmt:formatNumber
							value="500000" type="currency" currencySymbol="VND"
							maxFractionDigits="0" />-<fmt:formatNumber value="1000000"
							type="currency" currencySymbol="VND" maxFractionDigits="0" /></a></li>
				<li class="nav-item"><a
					href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=6&index=${index}"
					class="nav-link link-success "> <s:message code="product.price_above" />  <fmt:formatNumber
							value="1000000" type="currency" currencySymbol="VND"
							maxFractionDigits="0" /></a></li>


			</ul>
			

		</div>

	</div>



</aside>


