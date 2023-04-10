<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form class="${base}/index" modelAttribute="entity" enctype="multipart/form-data">

			<div class="row">


				<div class="form-group col-sm-6">
					<label>Id</label>
					<form:input path="id" class="form-control" readonly="${!empty entity.id}"/>
				</div>
				<div class="form-group col-sm-6">
					<label>Password</label>
					<form:input path="password" class="form-control" />
				</div>
			</div>
			<div class="row">

				<div class="form-group col-sm-6">
					<label>Fullname</label>
					<form:input path="fullname" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label>Email</label>
					<form:input path="email" class="form-control" />
				</div>
			</div>
			<div class="row">

				<div class="form-group col-sm-12">
					<label>Photo</label>
					<input type="file" name="photo_file" class="form-control">
					<form:hidden path="photo"/>
				</div>
			</div>
			<div class="row">

				<div class="form-group col-sm-6">
					<label>Activated</label>
					<div class="form-control">
						<form:radiobutton path="activated" value="true" label="Yes" />
						<form:radiobutton path="activated" value="false" label="No" />
					</div>
				</div>
				<div class="form-group col-sm-6">
					<label>Role</label>
					<div class="form-control">
						<form:radiobutton path="admin" value="true" label="Admin" />
						<form:radiobutton path="admin" value="false" label="User" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<button class="btn btn-success" formaction="${base}/create">Create</button>
					<button class="btn btn-warning" formaction="${base}/update">Update</button>
					<button class="btn btn-danger" formaction="${base}/delete">Delete</button>
					<a class="btn btn-primary" href="/admin/customer/index">Reset</a>
				</div>
			</div>
		</form:form>
	</div>
</div>

