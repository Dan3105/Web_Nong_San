<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<section class="mt-lg-14 mt-8 ">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="my-8">
					<!-- row -->
					<div class="row">
						<div class="col-md-4">
							<div class="me-lg-12 mb-6 mb-md-0">
								<div class="mb-5">
									<!-- title -->
									<h4 class="mb-3">Customer reviews</h4>

									<span> <!-- rating --> <small class="text-warning">
											<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
									</small><span class="ms-3">4.1 out of 5</span><small class="ms-3">11,130
											global ratings</small></span>
								</div>
								<div class="mb-8">
									<!-- progress -->
									<div class="d-flex align-items-center mb-2">
										<div class="text-nowrap me-3 text-muted">
											<span class="d-inline-block align-middle text-muted">5</span><i
												class="bi bi-star-fill ms-1 small text-warning"></i>
										</div>
										<div class="w-100">
											<div class="progress" style="height: 6px;">
												<div class="progress-bar bg-warning" role="progressbar"
													style="width: 60%;" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
										<span class="text-muted ms-3">53%</span>
									</div>
									<!-- progress -->
									<div class="d-flex align-items-center mb-2">
										<div class="text-nowrap me-3 text-muted">
											<span class="d-inline-block align-middle text-muted">4</span><i
												class="bi bi-star-fill ms-1 small text-warning"></i>
										</div>
										<div class="w-100">
											<div class="progress" style="height: 6px;">
												<div class="progress-bar bg-warning" role="progressbar"
													style="width: 50%;" aria-valuenow="50" aria-valuemin="0"
													aria-valuemax="50"></div>
											</div>
										</div>
										<span class="text-muted ms-3">22%</span>
									</div>
									<!-- progress -->
									<div class="d-flex align-items-center mb-2">
										<div class="text-nowrap me-3 text-muted">
											<span class="d-inline-block align-middle text-muted">3</span><i
												class="bi bi-star-fill ms-1 small text-warning"></i>
										</div>
										<div class="w-100">
											<div class="progress" style="height: 6px;">
												<div class="progress-bar bg-warning" role="progressbar"
													style="width: 35%;" aria-valuenow="35" aria-valuemin="0"
													aria-valuemax="35"></div>
											</div>
										</div>
										<span class="text-muted ms-3">14%</span>
									</div>
									<!-- progress -->
									<div class="d-flex align-items-center mb-2">
										<div class="text-nowrap me-3 text-muted">
											<span class="d-inline-block align-middle text-muted">2</span><i
												class="bi bi-star-fill ms-1 small text-warning"></i>
										</div>
										<div class="w-100">
											<div class="progress" style="height: 6px;">
												<div class="progress-bar bg-warning" role="progressbar"
													style="width: 22%;" aria-valuenow="22" aria-valuemin="0"
													aria-valuemax="22"></div>
											</div>
										</div>
										<span class="text-muted ms-3">5%</span>
									</div>
									<!-- progress -->
									<div class="d-flex align-items-center mb-2">
										<div class="text-nowrap me-3 text-muted">
											<span class="d-inline-block align-middle text-muted">1</span><i
												class="bi bi-star-fill ms-1 small text-warning"></i>
										</div>
										<div class="w-100">
											<div class="progress" style="height: 6px;">
												<div class="progress-bar bg-warning" role="progressbar"
													style="width: 14%;" aria-valuenow="14" aria-valuemin="0"
													aria-valuemax="14"></div>
											</div>
										</div>
										<span class="text-muted ms-3">7%</span>
									</div>
								</div>


							</div>
						</div>
						<!-- col -->
						<div class="col-md-8">
							<div class="mb-10">
								<div
									class="d-flex justify-content-between align-items-center mb-8">
									<div>
										<!-- heading -->
										<h4>Reviews</h4>
									</div>
									<div>
										<select class="form-select">
											<option selected="">Top Review</option>
											<option value="1">One</option>
											<option value="2">Two</option>
											<option value="3">Three</option>
										</select>
									</div>

								</div>
								<div class="d-flex border-bottom pb-6 mb-6">
									<!-- img -->
									<!-- img -->
									<img src="../assets/images/avatar/avatar-10.jpg" alt=""
										class="rounded-circle avatar-lg">
									<div class="ms-5">
										<h6 class="mb-1">Shankar Subbaraman</h6>
										<!-- select option -->
										<!-- content -->
										<p class="small">
											<span class="text-muted">30 December 2022</span> <span
												class="text-primary ms-3 fw-bold">Verified Purchase</span>
										</p>
										<!-- rating -->
										<div class=" mb-2">
											<i class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star-fill text-warning"></i> <i
												class="bi bi-star-fill text-warning"></i> <span
												class="ms-3 text-dark fw-bold">Need to recheck the
												weight at delivery point</span>
										</div>
										<!-- text-->
										<p>Product quality is good. But, weight seemed less than
											1kg. Since it is being sent in open package, there is a
											possibility of pilferage in between. FreshCart sends the
											veggies and fruits through sealed plastic covers and Barcode
											on the weight etc. .</p>
										<div>
											<div class="border icon-shape icon-lg border-2 ">
												<!-- img -->
												<img src="../assets/images/products/product-img-1.jpg"
													alt="" class="img-fluid ">
											</div>
											<div class="border icon-shape icon-lg border-2 ms-1 ">
												<!-- img -->
												<img src="../assets/images/products/product-img-2.jpg"
													alt="" class="img-fluid ">
											</div>
											<div class="border icon-shape icon-lg border-2 ms-1 ">
												<!-- img -->
												<img src="../assets/images/products/product-img-3.jpg"
													alt="" class="img-fluid ">
											</div>

										</div>

									</div>
								</div>


							</div>
							<div>
								<!-- rating -->
								<h3 class="mb-5">Create Review</h3>
								<div class="border-bottom py-4 mb-4 rating-box">
									<h4 class="mb-3">Overall rating</h4>
									<ul class="stars ">
										<li><i class="bi bi-star-fill"></i></li>
										<li><i class="bi bi-star-fill"></i></li>
										<li><i class="bi bi-star-fill"></i></li>
										<li><i class="bi bi-star-fill"></i></li>
										<li><i class="bi bi-star-fill"></i></li>
									</ul>
								</div>



							</div>

							<div class=" py-4 mb-4">
								<!-- heading -->
								<h5>Add a written review</h5>
								<textarea class="form-control" rows="3" id="content"
									placeholder="What did you like or dislike? What did you use this product for?"></textarea>

							</div>
							<!-- button -->
							<div class="d-flex justify-content-end">
								<%-- <a href="product/detail.htm?productId=${product.productId}" class="btn btn-primary">Submit
									Review</a> --%>
								<button class="btn btn-primary" onclick="submit()">Submit
									Review</button>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>


</section>
