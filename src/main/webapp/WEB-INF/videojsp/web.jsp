<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
 

<!-- base href="http://localhost:8080/video/" -->
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">

<meta name="renderer" content="webkit">
<meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">

<link rel="stylesheet" href="./static/z/base.css">
<link rel="stylesheet" href="./static/z/css.css">
<link rel="icon" href="./static/z/favicon.png" type="image/png">
<body>
    <div class="sy1">
    <a href="qiantai.do"><img src="./static/z/logo.png"></a>
    </div>
    <div class="xz1">
    <a onclick="xz()" href="#">
    <!-- <img src="./static/videoimg/xz.png"> -->
    </a><br><br><br>
    </div>
	<div class="wrapper">
		
		<div class="left">
		<p align="center">
				<video id="videoPlayer"width="640" height="480"

controls="controls" autoplay="autoplay" src="${video.videoUrl}"  
class="video-js vjs-default-skin" controls="controls" poster="static/videoimg/12.jpg" data-setup="{}">
				</video>
				</p>
			</div>
	</div>
	<script src="/static/js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="/static/js/vedio.js"></script>
	<script type="text/javascript">
		function xz() {
			alert("请点击视频右下角进行下载");
		}	
	</script>
</body>
</html>