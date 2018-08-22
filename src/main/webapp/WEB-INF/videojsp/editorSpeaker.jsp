<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--<base href="http://localhost:8080/Voids/">--><base href=".">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>editorSpeaker</title>

<link href="./static/js/bootstrap.css" rel="stylesheet">

<style type="text/css">
.col-md-1 {
	padding-top: 20px;
}

.a1 {
	color: gray;
}

b {
	float: right;
}
</style>
</head>
<body>
<nav class="navbar-inverse">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="videoShow.do">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li><a href="videoShow.do">视频管理</a></li>
				<li class="active"><a href="speakerShow.do">主讲人管理</a></li>
				<li><a href="courseShow.do">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.accounts}</span> 
				<i class="glyphicon glyphicon-log-in" aria-hidden="true">
				</i>&nbsp;&nbsp;
				<a href="adminLogin.do" class="navbar-link">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
	<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
		<div class="container">	
				<h2>编辑主讲人</h2>
		</div>
	</div>
	<div class="container" style="margin-top: 20px;">
		<form id="infoForm" class="form-horizontal" action="editorSpeaker.do" novalidate="novalidate">
		<div class="form-group">
				<label for="speakerId" class="col-sm-2 control-label">序号</label>
				<div class="col-sm-10">
					<input class="form-control" name="speakerId" placeholder="${speaker.speakerId}" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="speakerName" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-10">
					<input class="form-control" name="speakerName" id="speakerName" placeholder="${speaker.speakerName}" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="speakerJob" class="col-sm-2 control-label">职位</label>
				<div class="col-sm-10">
					<input class="form-control" name="speakerJob" id="speakerJob" placeholder="${speaker.speakerJob}" type="text">
				</div>
			</div>
			
			<div class="form-group">
				<label for="speakerHeadUrl" class="col-sm-2 control-label">头像地址</label>
				<div class="col-sm-10">
					<input class="form-control" name="speakerHeadUrl" id="speakerHeadUrl" placeholder="${speaker.speakerHeadUrl}" type="text">
				</div>
			</div>
			
			<div class="form-group">
				<label for="speakerDesc" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<input class="form-control" name="speakerDesc" id="speakerDesc" placeholder="${speaker.speakerDesc}" type="text">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" >提交编辑</button>
				</div>
			</div>
		</form>
	</div>
	<!-- å¦æIEçæ¬å°äº9ï¼å è½½ä»¥ä¸js,è§£å³ä½çæ¬å¼å®¹é®é¢ -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="./static/js/jquery-1.js"></script>
<script src="./static/js/bootstrap.js"></script>
<script src="./static/js/confirm.js"></script>
<script src="./static/js/jquery.js"></script>
<script src="./static/js/message_cn.js"></script>

	<script>
		$(function(){
			$('#infoForm').validate({
				rules: {
					speakerName:{
						required: true
					},
					speakerJob:{
						required: true
					},
					headImgUrl:{
						required:true
					},
					speakerDesc:{
						required:true
					}
				},
				messages:{
					speakerName:'请填写讲师名字',
					speakerJob:'请填写讲师职位',
					headImgUrl:'请填写讲师头像地址(网络图片地址)',
					speakerDesc:'请填写讲师简介信息'
				}
			});
		});
	</script>
<div id="modal-background" class=""></div>
<div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1">
<div class="modal-dialog modal-undefined"><div class="modal-content">
<div class="modal-header"><button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button">
<span aria-hidden="true">×</span></button><h4 id="modal-title" class="modal-title">Modal Title</h4></div>
<div id="modal-body" class="modal-body"> Modal Message </div><div id="modal-footer" class="modal-footer">
</div></div></div></div><div id="modal-background" class=""></div></body>

</html>