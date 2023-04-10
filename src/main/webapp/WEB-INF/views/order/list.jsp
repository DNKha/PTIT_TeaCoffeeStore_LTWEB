<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h2>DANH SÁCH ĐƠN HÀNG</h2>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Ngày đặt</th>
			<th>Địa chỉ nhận hàng: </th>
			<th>Tổng Tiền</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="o" items="${orders}">
			<tr>
				<td>${o.id}</td>
				<td>${o.orderDate}</td>
				<td>${o.address}</td>
				<td> <f:formatNumber value="${o.amount}" pattern="#,###.## đ" /></td>
				<td>
					<a href="/order/detail/${o.id}" class="btn btn-sm btn-info">Chi tiết</a>
				</td>	
			</tr>

		</c:forEach>

	</tbody>
</table>


