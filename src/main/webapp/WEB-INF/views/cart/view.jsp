<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h2>Giỏ Hàng</h2>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Tên Sản Phẩm</th>
			<th>Giá</th>
			<th>Giảm Giá</th>
			<th>Số lượng</th>
			<th>Tổng Tiền</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="p"
			items="${sessionScope['scopedTarget.cartService'].items}">
			<tr data-id = "${p.id}" data-price = "${p.unitPrice}" data-discount="${p.discount}">
				<td>${p.id}</td>
				<td>${p.name}</td>
				<td> <f:formatNumber value="${p.unitPrice}"
					pattern="#,###.## đ" /></td>
				<td>${p.discount}</td>
				<td> <input value="${p.quantity}" type="number" min="1" style="width: 70px"/></td>
				<td class = "amt"> <f:formatNumber value="${p.quantity * p.unitPrice * ((100-p.discount)/100)}"
					pattern="#,###.## đ" /></td>
				<td>
					<button class="btn btn-sm btn-warning btn-cart-remove">
						<i class = "glyphicon glyphicon-trash"></i>
					</button>
				</td>
			</tr>

		</c:forEach>

	</tbody>
</table>

<button class="btn btn-sm btn-danger btn-cart-clear">Xóa giỏ hàng</button>
<a href="/order/checkout" class="btn btn-sm btn-success">Thanh Toán</a>


