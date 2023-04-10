<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h2>Giỏ Hàng</h2>
<table class="table">
	<thead>
		<tr>
			<!-- <th>Id</th> -->
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
			<tr>
				<%-- <td>${p.id}</td> --%>
				<td>${p.name}</td>
				<td> <f:formatNumber value="${p.unitPrice}"
					pattern="#,###.## đ" /></td>
				<td>${p.discount}</td>
				<td> ${p.quantity}</td>
				<td> <f:formatNumber value="${p.quantity * p.unitPrice * ((100-p.discount)/100)}"
					pattern="#,###.## đ" /></td>
			</tr>

		</c:forEach>

	</tbody>
</table>

<h2>THANH TOÁN</h2>
<h4>${message}</h4>
<form:form action="/order/checkout" modelAttribute="order" >
	<div class="form-group">
		<label>Tên tài khoản</label> 
		<form:input path="customer.id" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Ngày đặt hàng</label> 
		<form:input path="orderDate" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Địa chỉ</label> 
		<form:input path="address" class="form-control"/>
	</div>
	<div class="form-group">
		<label>Tổng tiền</label> 
		<form:input path="amount" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Ghi chú</label> 
		<form:textarea path="description" row = "3" class="form-control"/>
	</div>
	<div class="form-group">
		<button class="btn btn-default">Đặt Hàng</button>
	</div>
</form:form>
