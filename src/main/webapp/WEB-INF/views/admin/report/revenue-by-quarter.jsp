<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h2 class="alert alert-success">DOANH THU THEO QUÝ</h2>
<div class="row">
	<div class="col-sm-12">
		<table class="table table-hover">
			<thead>

				<tr>
					<th>Quý</th>
					<th>Số lượng đã bán</th>
					<th>Doanh thu</th>
					<th>Min</th>
					<th>Max</th>
					<th>Avg</th>
				</tr>


			</thead>
			<tbody>
				<c:forEach var="e" items="${data}">
					<tr>
						<td>  <f:formatNumber value="${e[0]}" pattern="#" /></td>
						<td>${e[1]}</td>
						<td><f:formatNumber value="${e[2]}" pattern="#,###.## đ" /></td>
						<td><f:formatNumber value="${e[3]}" pattern="#,###.## đ" /></td>
						<td><f:formatNumber value="${e[4]}" pattern="#,###.## đ" /></td>
						<td><f:formatNumber value="${e[5]}" pattern="#,###.## đ" /></td>
					</tr>
				</c:forEach>
			</tbod2y>
		</table>
	</div>
</div>

<h3 class="alert alert-success"> BIỂU ĐỒ DOANH THU THEO QUÝ</h3>
<jsp:include page="_revenue_quarter_chart.jsp"/>



