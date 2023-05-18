<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link href="assets/css/user/product.css" rel="stylesheet" />
<div class="my-4">
	<div class="container">
		<div class="row ">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
						<li class="breadcrumb-item  "><a href="#!"
							class="text-decoration-none ">Home</a></li>
						<li class="breadcrumb-item"><a href="#!"
							class="text-decoration-none">Shop</a></li>
						<li class="breadcrumb-item active" aria-current="page"
							class="text-decoration-none">Category</li>
					</ol>

				</nav>
			</div>
		</div>
	</div>
</div>


<div class=" mt-8 mb-lg-14 mb-8">
	<div class="container">
		<div class="row gx-10">


			<%@include file="/WEB-INF/views/product/productDetail.jsp"%>
			<%@include file="/WEB-INF/views/product/rating.jsp"%>
			<%@include file="/WEB-INF/views/product/relatedItems.jsp"%>
		</div>



	</div>
</div>



<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script type="text/javascript" src="assets/js/user/product.js"></script>


</body>
</html>


</html>