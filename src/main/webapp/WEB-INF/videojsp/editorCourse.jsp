	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" 
          uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>editorCourse</title>

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
				<li><a href="speakerShow.do">主讲人管理</a></li>
				<li class="active"><a href="courseShow.do">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.accounts}</span> <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>&nbsp;&nbsp;
				 <a href="adminLogin.do" class="navbar-link">退出</a>
			</p>
		</div>

	</div>

</nav>

	<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
		<div class="container">
				<h2>修改课程</h2>						
		</div>
	</div>
	<div class="container" style="margin-top: 20px;">
		<form id="infoForm" class="form-horizontal" action="commit.do" method="post" novalidate="novalidate">					
			<div class="form-group">
			
				<label for="courseId" class="col-sm-2 control-label">课程序号</label>
				<div class="col-sm-10">
					<input class="form-control" name="courseId" id="courseId" placeholder="${course.courseId }" value="" type="text">
				</div>
			</div>			
			<div class="form-group">
			    <label for="subjectId" class="col-sm-2 control-label">所属学科</label>
			    <div class="col-sm-10">
					<select name="subjectId" id="subjectId" class="form-control" >
							<c:forEach  items="${allsubject}" var="i">
							<option value="${i.subjectId }" >${i.subjectName}</option>
							</c:forEach>						
					</select>
			    </div>
			  </div>									
			<div class="form-group">
				<label for="subjectTitle" class="col-sm-2 control-label">课程标题</label>
				<div class="col-sm-10">
					<input class="form-control" name="courseTitle" id="subjectTitle" placeholder="${course.courseTitle}" value="" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="courseDesc" placeholder="${course.courseDesc}"name="courseDesc" rows="3"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" >提交编辑</button>
				</div>
			</div>
		</form>
	</div>
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="./static/js/jquery-1.js"></script>
<script src="./static/js/bootstrap.js"></script>
<script src="./static/js/confirm.js"></script>
<script src="./static/js/jquery.js"></script>
<script src="./static/js/message_cn.js"></script>
	<!-- <script  type = "text/javascript" >
	function change(){
	     document.getElementById("subjectId")["${course.subjectId}"].selected=true;
	}
	</script > -->
	<script type="text/javascript">
		$(function(){

			$('#infoForm').validate({
				rules: {
					subjectId: {
						required: true,
						min:1
					},
					courseTitle: {
						required: true
					},
					courseDesc:{
						required:true
					}
				},
				messages:{
					subjectId:'请选择所属学科',
					courseTitle:'请填写课程标题',
					courseDesc:'请填写简介信息'
				}
			});


		});

	</script>





<div id="modal-background" class=""></div><div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1"><div class="modal-dialog modal-undefined"><div class="modal-content"><div class="modal-header"><button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button"><span aria-hidden="true">×</span></button><h4 id="modal-title" class="modal-title">Modal Title</h4></div><div id="modal-body" class="modal-body"> Modal Message </div><div id="modal-footer" class="modal-footer"></div></div></div></div><div id="modal-background" class=""></div></body></html>