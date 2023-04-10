<%@ page pageEncoding="UTF-8"%>

<h2>QUÊN MẬT KHẨU</h2>
<h4>${message}</h4>
<form class="/account/forgot" method="post">
	<div class="form-group">
		<label>Tên đăng nhập</label> 
		<input name="id" class="form-control">
	</div>
	<div class="form-group">
		<label>Email</label> 
		<input name="email" class="form-control">
	</div>
	<div class="form-group">
		<button class="btn btn-default">Lấy lại mật khẩu</button>
	</div>
</form>
