<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://localhost:8080/Voids/">--><base href=".">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<script type="text/javascript" src="./static/js/jquery-1.js"></script>
<title>登录</title>

<link href="./static/js/bootstrap.css" rel="stylesheet">
</head>
<body>
	<form  action="userLogin.do" method="post">
		<div style="margin-top: 20%;">
			<img  src="./static/z/logo.png"  class="img-responsive center-block"  alt="Responsive image" style="width: 20%">
			<div class="container" >
				<div class="row">
					<div class="col-md-4"></div>
					<div class="form-group col-md-4" style="">
					<input class="form-control"  name="" style="border: 1px solid #5CB85C"  placeholder="用户名" type="text"> 
					</div>
					<div class="col-md-4"></div>
				</div>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="form-group col-md-4">
						<input class="form-control" name="" style="border: 1px solid #5CB85C" id="" placeholder="密码" type="password">
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-success center-block" style="width: 80%;"  >登 录</button>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</form>
	<div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1">
		<div class="modal-dialog modal-undefined">
			<div class="modal-content">
				<div class="modal-header">
					<button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button">
						<span aria-hidden="true">×</span>
					</button>
					<h4 id="modal-title" class="modal-title">Modal Title</h4>
				</div>
				<div id="modal-body" class="modal-body">Modal Message</div>
				<div id="modal-footer" class="modal-footer"></div>
			</div>
		</div>
	</div>
	<div id="modal-background" class=""></div>
</body>

</html>
