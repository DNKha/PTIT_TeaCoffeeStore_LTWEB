<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<h2>ĐƠN HÀNG</h2>
	<form:form action="/order/checkout" modelAttribute="order" >
	<div class="form-group">
		<label>Mã Đơn Hàng</label> 
		<form:input path="id" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Khách hàng</label> 
		<form:input path="customer.id" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Ngày đặt hàng</label> 
		<form:input path="orderDate" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Địa chỉ</label> 
		<form:input path="address" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Tổng tiền</label> 
		<form:input path="amount" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Ghi chú</label> 
		<form:textarea path="description" row = "3" class="form-control" readonly="true"/>
	</div>
	
</form:form>


<h2>CHI TIẾT ĐƠN HÀNG</h2>
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
		<c:forEach var="d" items="${details}">
			<tr>
				<td>${d.product.id}</td>
				<td>${d.product.name}</td>
				<td> <f:formatNumber value="${d.unitPrice}"
					pattern="#,###.## đ" /></td>
				<td>${d.discount}</td>
				<td> ${d.quantity}</td>
				<td> <f:formatNumber value="${p.quantity * p.unitPrice * ((100-p.discount)/100)}"
					pattern="#,###.## đ" /></td>
			</tr>

		</c:forEach>

	</tbody>
</table>

<a href="/order/list"> 
	<button class="btn btn-success"> ↩ Quay lại</button>
</a>

