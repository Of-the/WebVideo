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
<link rel="icon" href="http://localhost:8080/Voids/static/z/favicon.png" type="image/png">
    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
</head>

<body class="w100" style="padding-top: 0px;">
<header>
	<div class="container">
		<span>欢迎来到视频学习管理系统！</span>
			<div id="regBlock" style="float:right">
				<a href="">
				<img src="./static/z/we.png">登录</a> 
				<a href="judgeuser.do" >
				<img src="./static/z/we.png">注册</a>
			</div>
		<a onclick="addFavorite2()">
		<img src="" draggable="false">加入收藏</a>
		
		<a target="_blank" draggable="false">后台管理</a>
		<!-- <a class="color_e4"><img  draggable="false"> 0371-88888598　　4006-371-555</a> -->

	</div>
</header>
<div class="banner">
    <img alt="" src="" style="height:454px;" >
</div>

    <!--面包屑导航-->
   
        <c:forEach items="${courses}" var="i">
        <!--面包屑导航-->
        <div class="container mian-nav" id="navDiv">公开课 / ${i.courseTitle}</div>		
        <input id="" value="" type="hidden">
        <div class="classify">
            <div class="container" id="dataContainer">
            <div class="section"><div class="classifyName">
            <p class="title title-first">${i.courseTitle}</p></div>
            <div class="kcIntro"><p class="int">
            <span>课程介绍：</span>
            ${i.courseDesc}           
              </p></div>
              <ul>
         <c:forEach items="${videos}" var="j">
                        <c:if test="${i.courseId==j.courseId}">
                            <li class="section-main" onclick="">
                                <a href="webVideo.do?id=${j.videoId}">
                                    <div class="thum" style="background-image: url(${j.videoImgUrl})"></div>
                                    <p>${j.videoTitle}</p>
                                    <div class="classify-v-info">
                                    <span class="count" title="观看次数">
                					<img src="" alt="">${j.videoPlayNum}</span>
                                        <span class="duration" title="视频时长">
                                        <img src="" alt="">${j.videoTime}</span>
                                    </div>
                                </a>
                            </li>
                        </c:if>
                    </c:forEach>
                    </ul>
         </div>
        </div>
    </div>
</c:forEach>         
<!--页脚-->
<footer>
	<ul>
		<li>
			<img  alt="" draggable="false">
		</li>
		<li class="mt25">
			<h3>各校区地址</h3>
			<ul>
				<li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层</li>
				<li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路</li>
				<li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼</li>
				<li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层</li>
				<li>西安分校<br>中国-西安莲湖区　联系人：梁老师 13201570801</li>
			</ul>
		</li>
		<li class="mt25">
			<h3>联系我们</h3>
			<ul id="foo_icon">
				<li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
				<li>e-mail:zy@zhiyou100.com</li>
				<li>电话:4006-371-555 0371-88888598</li>
				<li class="erwei">
					<br>
					<div>
						<img class="weixin" src="" alt="" draggable="false">
						<img class="weibo" src="" alt="" draggable="false">
					</div>
				</li>
			</ul>
		</li>
	</ul>
	<div class="record">智游教育 © 豫ICP备17000832号-1 　河南智游臻龙教育科技有限公司</div>
</footer>

	<script src="./static/z/jquery-1.js"></script>
	<script src="./static/z/gVerify.js"></script>
	<script src="./static/z/index.js"></script>	
</div></body></html>