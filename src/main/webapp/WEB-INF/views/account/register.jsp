<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<h2>ĐĂNG KÝ</h2>
<h4>${message}</h4>
<form:form action="/account/register" modelAttribute="form" enctype="multipart/form-data">
	<div class="form-group">
		<label>Tên tài khoản</label> 
		<form:input path="id" class="form-control"/>
		<form:errors path="id" />
	</div>
	<div class="form-group">
		<label>Mật khẩu</label> 
		<form:input type="password" path="password" class="form-control"/>
		<form:errors path="password"/>
	</div>
	<div class="form-group">
		<label>Tên đầy đủ</label> 
		<form:input path="fullname" class="form-control"/>
		<form:errors path="fullname"/>
	</div>
	<div class="form-group">
		<label>Email</label> 
		<form:input path="email" class="form-control"/>
		<form:errors path="email"/>
	</div>
	<div class="form-group">
		<label>Ảnh cá nhân</label> 
		<input type="file" name = "photo_file"/>
		<form:hidden path="photo" class="form-control"/>
	</div>
	

	<div class="form-group">
		<button class="btn btn-default">Đăng ký</button>
	</div>
</form:form>
