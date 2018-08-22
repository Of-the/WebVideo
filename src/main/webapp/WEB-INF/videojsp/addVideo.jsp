<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://localhost:8080/Voids/">--><base href=".">
	  
    
    <!--表示使用IE最新的渲染模式进行解析-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>addVideo</title>
	
<link href="./static/js/bootstrap.css" rel="stylesheet">

    <style type="text/css">
	  th{
		 text-align: center;
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
				<li class="active"><a href="videoShow.do">视频管理</a></li>
				<li><a href="speakerShow.do">主讲人管理</a></li>
				<li><a href="courseShow.do">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.accounts}</span> <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>&nbsp;&nbsp;
				<a href="adminLogin.do" class="navbar-link" >退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->

</nav>
    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
	  <div class="container">	      
	      
        <h2>添加视频信息</h2>


    </div>
</div>

	<div class="container" style="margin-top: 20px;">
		
		  <form id="infoForm" class="form-horizontal" action="insertVideo.do" novalidate="novalidate">
		      		  		    
			  <div class="form-group">
			    <label for="title" class="col-sm-2 control-label">视频标题</label>
			    <div class="col-sm-10">
			      <input class="form-control" id="videoTitle" name="videoTitle" placeholder="${video.videoTitle}" type="text">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="speakerId" class="col-sm-2 control-label">主讲人</label>
			    <div class="col-sm-10">

					<select name="speakerId" id="speakerId" class="form-control error" aria-required="true" aria-invalid="true">
						<option value="0" selected="selected">请选择讲师</option>
						
							<c:forEach items="${allspeaker }" var="i">
							<option value="${i.speakerId }">${i.speakerName }</option>
							</c:forEach>
						
					</select><label id="speakerId-error" class="error" for="speakerId">请选择视频主讲人</label>

			     
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="courseId" class="col-sm-2 control-label">所属课程</label>
			    <div class="col-sm-10">


						<select name="courseId" id="courseId" class="form-control">
							<option value="0" selected="selected">请选择所属课程</option>
								<c:forEach items="${allcourse}" var="i">
								<option value="${i.courseId }">${i.courseTitle }</option>
								</c:forEach>
						</select>
						
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="videoTime" class="col-sm-2 control-label">视频时长(秒)</label>
			    <div class="col-sm-10">
			      <input class="form-control" id="videoTime" name="videoTime" placeholder="精确到秒（正整数）" type="number">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="videoImgUrl" class="col-sm-2 control-label">封面图片地址</label>
			    <div class="col-sm-10">
			      <input id="videoImgUrl" name="videoImgUrl" class="form-control" placeholder="具体的图片url" type="url">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="videoUrl" class="col-sm-2 control-label">视频播放地址</label>
			    <div class="col-sm-10">
			      <input id="videoUrl" name="videoUrl" class="form-control" placeholder="具体的地址url" type="url">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="videoDesc" class="col-sm-2 control-label">备注</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" id="videoDesc" name="videoDesc" rows="3"></textarea>
			    </div>
			  </div>

			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">保存</button>
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

	<script type="text/javascript">

		$(function(){
			$('#infoForm').validate({
				rules: {
					title:{
						required: true
					},
					speakerId:{
						required: true,
						min:1
					},
					courseId:{
						required:true,
						min:1
					},
					time:{
						required:true,
						min:1
					},
					imageUrl:{
						required:true
					},
					videoUrl:{
						required:true
					},
					detail:{
						required:true
					}
				},
				messages:{
					title:'请填写视频标题',
					speakerId:'请选择视频主讲人',
					courseId:'请选择所属课程',
					time:'请填写视频时长(秒)',
					imageUrl:'请填写视频封面((网络图片地址))',
					videoUrl:'请填写视频在线播放地址',
					detail:'请填写视频具体介绍信息'
				}
			});
		});

	</script>
  
<div id="modal-background" class=""></div><div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1"><div class="modal-dialog modal-undefined"><div class="modal-content"><div class="modal-header"><button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button"><span aria-hidden="true">×</span></button><h4 id="modal-title" class="modal-title">Modal Title</h4></div><div id="modal-body" class="modal-body"> Modal Message </div><div id="modal-footer" class="modal-footer"></div></div></div></div><div id="modal-background" class=""></div></body></html>