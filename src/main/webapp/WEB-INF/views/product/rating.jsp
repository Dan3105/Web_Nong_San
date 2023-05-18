<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<section class="mt-lg-14 mt-10 p-5">
	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<div class="my-8">
					<!-- row -->
					<div class="row">
						<div class="col-md-4">
							<div class="me-lg-12 mb-6 mb-md-0">

								<div class="mb-5">
									<h4 class="mb-3">Customer reviews</h4>
									<c:forEach begin="1" end="5" varStatus="index">
										<!-- progress -->
										<div class="d-flex align-items-center mb-2">
											<div class="text-nowrap me-3 text-muted">
												<span class="d-inline-block align-middle text-muted">${5-index.count+1}</span><i
													class="bi bi-star-fill ms-1 small text-warning"></i>
											</div>
											<div class="w-100">
												<div class="progress" style="height: 6px;">
													<div class="progress-bar bg-warning" role="progressbar"
														style="width: ${product.feedbacks.size() > 0 ? (100*countStar[5-index.count+1]/product.feedbacks.size()) : 0}%;"
														aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<c:if test="${product.feedbacks.size() > 0 }">
												<span class="text-muted ms-3"><fmt:formatNumber
														type="percent"
														value="${countStar[5-index.count+1]/product.feedbacks.size()}" />
												</span>
											</c:if>

										</div>

									</c:forEach>

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

									<div class="dropdown">
										<button class="btn btn-success dropdown-toggle" type="button"
											data-bs-toggle="dropdown" aria-expanded="false">
											<c:choose>
												<c:when test="${filterStar==0}">
            										Newest
         										</c:when>
												<c:when test="${filterStar==1}">
           								 			Highest Stars
         										</c:when>
												<c:when test="${filterStar==2}">
           								 			5 Stars
         										</c:when>
												<c:when test="${filterStar==3}">
           								 			4 Stars
         										</c:when>
												<c:when test="${filterStar==4}">
           								 			3 Stars
         										</c:when>
												<c:when test="${filterStar==5}">
           								 			2 Stars
         										</c:when>
												<c:when test="${filterStar==6}">
           								 			1 Star
         										</c:when>
												<c:otherwise>
            										Filter
         										</c:otherwise>
											</c:choose>
										</button>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=0&productId=${product.productId }">
													Newest</a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=1&productId=${product.productId }">High
													Stars</a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=2&productId=${product.productId }">5
													Stars</a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=3&productId=${product.productId }">4
													Stars </a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=4&productId=${product.productId }">3
													Stars </a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=5&productId=${product.productId }">2
													Stars </a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=6&productId=${product.productId }">1
													Star </a></li>
										</ul>
									</div>

								</div>


							</div>

							<c:if test="${rateds.size() == 0 }">
								<div class="d-flex pb-7 mt-3 ">
									<div class="flex-shrink-0" style="">
										<img src="assets/img/smile.png" alt="...">
									</div>
									<div class="flex-grow-1 ms-3">Haven't got any comments
										yet</div>
								</div>
							</c:if>

							<c:forEach var="f" items="${rateds }" begin="0" end="2">
								<div class="d-flex pb-7 mt-3 ">

									<img
										src="<c:url value="/assets/img/account/${f.account.avatar}"/>"
										alt="" class="rounded-circle shadow-4"
										style="width: 30px; height: 30px">
									<div class="ms-5">
										<h6 class="mb-1">${f.account.getName()}</h6>
										<p class="small">
											<span class="text-muted"><fmt:formatDate
													value="${f.postingDate}" pattern="dd-MM-yyyy" /></span>
										</p>
										<!-- rating -->
										<div class=" mb-2">
											<c:forEach begin="1" end="5" varStatus="index">
												<c:choose>
													<c:when test="${index.count <= f.ratingStar}">
														<i class="bi bi-star-fill text-warning"></i>
													</c:when>
													<c:otherwise>
														<i class="bi bi-star-fill " style="color: #e6e6e6;"></i>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
										<!-- text-->
										<p>${f.feedbackContent }</p>


									</div>

								</div>
								<hr>
							</c:forEach>





							<!-- Create review in account -->
							<%-- <div>
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
								<a href="product/detail.htm?productId=${product.productId}" class="btn btn-primary">Submit
									Review</a>
								<button class="btn btn-primary" onclick="submit()">Submit
									Review</button>
							</div>
 --%>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>


</section>