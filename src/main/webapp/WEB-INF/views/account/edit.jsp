<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<h2>THAY ĐỔI THÔNG TIN</h2>
<h4>${message}</h4>
<form:form class="/account/edit" modelAttribute="form" enctype="multipart/form-data">
	<div class="form-group">
		<label>Tên tài khoản</label> 
		<form:input path="id" class="form-control" readonly="true"/>
	</div>
		<form:hidden path="password"/>
	<div class="form-group">
		<label>Tên đầy đủ</label> 
		<form:input path="fullname" class="form-control"/>
	</div>
	<div class="form-group">
		<label>Email</label> 
		<form:input path="email" class="form-control" readonly="true"/>
	</div>
	<div class="form-group">
		<label>Ảnh cá nhân</label> 
		<img alt="" src="/static/imgs/customers/${form.photo}" style="width: 80px;height: 90px;">
		<input type="file" name = "photo_file"/>
		<form:hidden path="photo" class="form-control"/>
	</div>
	
	<form:hidden path="activated"/>
	<form:hidden path="admin"/>
	<div class="form-group">
		<button class="btn btn-default">Cập nhật</button>
	</div>
</form:form>
