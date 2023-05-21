<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<br>
<div class="container">
	<div class="row">

		<div class="col-9 mbg-azure p-3">

			<div class="h4 text-uppercase">Đơn hàng</div>
			<hr>
			<table class="table table-hover">
				<thead>
					<tr class="table-primary">
						<th scope="col" class="col-1 text-center">Chi tiết</th>
						<th scope="col" class="col-2">Ngày mua</th>
						<th scope="col" class="col-5">Sản phẩm</th>
						<th scope="col" class="col-2">Tổng tiền</th>
						<th scope="col" class="col-2">Trạng thái</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<%-- <tg:paging pagedListHolder="${pagedListHolder}"
				pagedLink="${pagedLink}" /> --%>
		</div>

	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%></html>