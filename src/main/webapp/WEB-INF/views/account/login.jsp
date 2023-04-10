<%@ page pageEncoding="UTF-8"%>

<h2>ĐĂNG NHẬP</h2>
<h4>${message}</h4>
<form class="/account/login" method="post">
	<div class="form-group">
		<label>Tên tài khoản</label> 
		<input name="id" class="form-control" value="${uid}">
		<h4>${idw}</h4>
	</div>
	<div class="form-group">
		<label>Mật khẩu</label> 
		<input type="password" name="pw" class="form-control" value="${pwd}">
		<h4>${pww}</h4>
	</div>
	<div class="form-group">
		<div class = "form-control">
			<input name="rm" type="checkbox"> 
			<label>Nhớ tài khoản</label>
		</div>
	</div>
	<div class="form-group">
		<button class="btn btn-default">Đăng nhập</button>
	</div>
</form>
