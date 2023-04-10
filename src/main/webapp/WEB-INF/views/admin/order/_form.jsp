<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form class="${base}/index" modelAttribute="entity">
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Order Id</label>
					<form:input path="id" class="form-control" readonly="true"
						placeholder="Auto Number" />
				</div>
				<div class="form-group col-sm-6">
					<label>Customer Id</label>
					<form:input path="customer.id" class="form-control" readonly="true" />
				</div>
			</div>

			<div class="row">
				<div class="form-group col-sm-6">
					<label>Order Date</label>
					<form:input path="orderDate" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label>Shipping Address</label>
					<form:input path="address" class="form-control" />
				</div>
			</div>


			<div class="row">
				<div class="form-group col-sm-6">
					<label>Total Amount</label>
					<form:input path="amount" class="form-control" readonly="true" />
				</div>
				<div class="form-group col-sm-6">
					<label>Description</label>
					<form:textarea path="description" rows="3" class="form-control" />
				</div>
			</div>

			<div class="row">

				<div class="form-group col-sm-6">
					<label>Confirm</label>
					<div class="form-control">
						<form:radiobutton path="ttconfirm" value="true" label="Yes" />
						<form:radiobutton path="ttconfirm" value="false" label="No" />
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label>Delete</label>
					<div class="form-control">
						<form:radiobutton path="ttdelete" value="true" label="Yes" />
						<form:radiobutton path="ttdelete" value="false" label="No" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<button class="btn btn-warning" formaction="${base}/update">Update</button>
				<a class="btn btn-primary" href="/admin/order/index">Reset</a>
			</div>

		</form:form>
		<c:if test="${!empty details}">
			<jsp:include page="_details.jsp" />
		</c:if>
	</div>
</div>

