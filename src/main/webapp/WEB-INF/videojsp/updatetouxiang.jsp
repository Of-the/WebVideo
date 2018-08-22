<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" 
          uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- base href="http://localhost:8080/video/" -->
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    
            
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <link rel="stylesheet" href="./static/z/base.css">
    <link rel="stylesheet" href="./static/z/profile.css">
    <link rel="stylesheet" href="./static/z/jquery.css">
    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
</head>

<body class="w100">
    



<header>
	<div class="container top_bar clearfix">
		<img  src="./static/z/logo.png" alt="智游">
		<div id="tele">
			<span>4006-371-555</span>
			<span>0371-88888598</span>
		</div>
	</div>
	<menu>
		<div class="container clearfix">
			<ul class="clearfix f_left">
				<li class="navbar-link" ><a href="forget.do?id=${user.userId}">首页</a></li>
				<li class="navbar-link">
				<a href="forget.do?id=${email.userEmail}">个人中心</a></li>
			</ul>			
			<div id="user_bar">						
						<img id="avatar" src="${user.userImgurl}"   width="35px" height="35px" alt="" "="">
				<a href="qiantai.do" class="navbar-link">退出</a>
			</div>
		</div>
	</menu>
</header>

    <main>
        <div class="container">
            <h2>我的资料</h2>
            <div id="profile_tab">
                <ul class="profile_tab_header f_left clearfix">
                    <a href="updateziliao.do?id=${user.userEmail}" class="navbar-link">更改资料   |</a>
                    <a href="updatetouxiang.do?id=${user.userEmail}" class="navbar-link">更改头像  |</a>
                    <a href="mima.do?id=${user.userEmail}" class="navbar-link">密码安全</a>
                </ul>
                </ul>
                <div class="proflle_tab_body">
                    <div class="proflle_tab_workplace clearfix">
                        <div class="profile_avatar_area">
                           <img src="${user.userImgurl}" width="35px" height="35px" id="avatar"  alt="">		  
 
                            <p style="text-align: center;">当前头像</p>
                        </div>
                        <div class="profile_ifo_area">
                            <form action="committouxiang.do">
                                <!-- hidden crop params -->
                              <!--   <input id="x1" name="x1" type="hidden">
                                <input id="y1" name="y1" type="hidden">
                                <input id="x2" name="x2" type="hidden">
                                <input id="y2" name="y2" type="hidden">
 -->
                                <p>第一步：请选择图像文件</p>
                                <div>
                                <input type="file" id="myFile" > 
                               <!--  <input name="image_file" id="image_file" onchange="fileSelectHandler()" type="test"></div>
 -->
                                <div class="error"></div>

                                <div class="step2">
                                    <p>第二步：请确定,然后按上传</p>
                                    <input   value="上传" type="submit">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    


<footer>
	<div class="container">
		<ul>
			<li><img src="" alt="" id="foot_logo"></li>
			<li>版权所有：智游3G教育　　　©&nbsp;www.zhiyou100.com</li>
			<li><img src="" alt="" id="wxgzh"></li>
		</ul>
	</div>
</footer>
<script>
var fileObj = "";
var imgData = "";
$("#myFile").change(function () {
    // 构造一个文件渲染对象
    var reader = new FileReader();
    // 得到文件列表数组
    fileObj = $(this)[0].files[0];
    // 拿到文件数据
    reader.readAsDataURL(fileObj);

    reader.onload = function() {
        // 获取文件信息
        imgData = reader.result;
        // 显示图片
        $("#showImg").attr("src", imgData);
        $("#showImg").show();
    }
});
</script>

<script src="./static/z/jquery-1.js"></script>
<script src="./static/z/gVerify.js"></script>
<script src="./static/z/index.js"></script>

<script src="./static/z/jquery.js"></script>
<script src="./static/z/Jcrop_upload.js"></script>
</body></html>