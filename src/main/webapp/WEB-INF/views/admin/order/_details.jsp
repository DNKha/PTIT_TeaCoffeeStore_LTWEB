<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>


<table class="table table-hover">
	<thead>

		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Unit Price</th>
			<th>Discount</th>
			<th>Quantity</th>
			<th>Amount</th>
		</tr>
		

	</thead>
	<tbody>
		<c:forEach var="e" items="${details}">
			<tr>
			<td>${e.product.id}</td>
			<td>${e.product.name}</td>
			<td><f:formatNumber value="${e.unitPrice}"
					pattern="#,###.## đ" /></td>
			<td>${e.discount}</td>
			<td>${e.quantity}</td>
			<td><f:formatNumber value="${e.quantity * e.unitPrice * ((100-e.discount)/100)}"
					pattern="#,###.## đ" /></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
