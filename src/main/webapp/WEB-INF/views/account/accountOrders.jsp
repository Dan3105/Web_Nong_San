<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<br>

<div class="container">
	<div class="row">
		<div class="col-3 d-none d-lg-block">
			<%@include file="/WEB-INF/views/account/menuProfile.jsp"%>
		</div>

		<div class="col-9  p-3">


			<div class="h4 text-uppercase">Đơn hàng</div>
			<hr>
			<div class="row">
				<!-- table -->
				<div class="col-12">
					<div class="table-responsive">
						<table class="table text-nowrap">
							<thead class="table-success">
								<tr>
									<th>Chi Tiết</th>
									<th>Ngày Mua</th>
									<th>Sản Phẩm</th>
									<th>Tổng Tiền</th>
									<th>Trạng Thái</th>
								</tr>
							</thead>
							<c:forEach var="o" items="${orders }">
								<tbody>
									<tr>
										<td class="align-middle"><a href="#"><i
												class="bi bi-info-circle"></i></a></td>
										<td class="align-middle"><fmt:formatDate
												pattern="dd-MM-yyyy" value="${o.orderTime}" /></td>
										<td class="align-middle">

											<ul>
												<c:forEach var="orderDetail" items="${o.orderDetails }">
													<li>${orderDetail.product.productName }</li>
												</c:forEach>
											</ul>

										</td>

										<td class="align-middle"></td>

										<td class="align-middle "><a
											href='<c:url value = "wishlist/delete/${c.product.productId}.htm"/>'
											class="text-muted"> <i class="bi bi-trash"></i>
										</a></td>
									</tr>

								</tbody>

							</c:forEach>

						</table>
					</div>
				</div>



			</div>
		</div>

	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>