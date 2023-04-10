<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form class="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<label>Id</label>
				<form:input path="id" class="form-control" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Name</label>
				<form:input path="name" class="form-control" />
			</div>
			<div class="form-group">
				<label>NameVN</label>
				<form:input path="nameVN" class="form-control" />
			</div>
			<div class="form-group">
				<button class="btn btn-success" formaction="${base}/create">Create</button>
				<button class="btn btn-warning" formaction="${base}/update">Update</button>
				<button class="btn btn-danger" formaction="${base}/delete">Delete</button>
				<a class="btn btn-primary" href="/admin/category/index">Reset</a>
			</div>
		</form:form>
	</div>
</div>

