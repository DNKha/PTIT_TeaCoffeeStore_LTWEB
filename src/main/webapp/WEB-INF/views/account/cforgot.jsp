<%@ page pageEncoding="UTF-8"%>

<h2>THAY ĐỔI MẬT KHẨU</h2>
<h4>${message}</h4>
<form class="/account/forgot" method="post">
	<%-- <div class="form-group">
		<label>Mật khẩu</label> 
		<input name="pw" class="form-control" value="${pwd1}">
	</div>
	<div class="form-group">
		<label>Nhập lại Mật khẩu</label> 
		<input name="pw" class="form-control" value="${pwd2}">
	</div> --%>
	
	<div class="form-group">
		<label>Mật khẩu mới</label> 
		<input type="password" name="pw1" class="form-control">
	</div>
	<div class="form-group">
		<label>Nhập lại mật khẩu</label> 
		<input type="password" name="pw2" class="form-control">
	</div>
	<div class="form-group">
		<button class="btn btn-default">Đổi mật khẩu</button>
	</div>
</form>