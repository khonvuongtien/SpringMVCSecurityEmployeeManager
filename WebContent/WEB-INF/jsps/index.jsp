<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>    
<%@taglib uri="http://www.springframework.org/security/tags" prefix="ss"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/script.js"></script>
<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script>
<title><spring:message code="messages.home"></spring:message></title>
</head>
<body>

<a href="?language=en"><img src="${pageContext.request.contextPath}/static/images/en.png" width="20px" height="15px"/></a>
<a href="?language=vi"><img src="${pageContext.request.contextPath}/static/images/vn.png" width="20px" height="15px"/></a>


<div class="wrap"> 
	<div class="header">
		<div class="logo">
			<a href="index.html"><img src="${pageContext.request.contextPath }/static/images/logo.png" alt=""  title="logo"/></a>
		</div>
	<ul class="nav">
		<ss:authorize access="isAuthenticated()">
	<li><a href="${pageContext.request.contextPath}/logout"><spring:message code="messages.logout"></spring:message></a></li>
	</ss:authorize>
	</ul>
	
	<div class="clear"></div>
	</div>
	<div class="wrp-menu">
		<ul class="nav-bar myul">
			<li><a href="${pageContext.request.contextPath }/index" class="active"><spring:message code="messages.home"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath }/QuanLyTaiKhoan?page=1"><spring:message code="messages.usermanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath }/QuanLyNhanVien?page=1" ><spring:message code="messages.staffmanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/QuanLyPhongBan?page=1" ><spring:message code="messages.departmanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/ThanhTich?page=1"><spring:message code="messages.record"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/QuanLyThanhTich?page=1" ><spring:message code="messages.recordmanagement"></spring:message></a></li>
		</ul>
	</div>
	<div class="clear"></div>
</div>
<div class="content-bg">
<div class="wrap">
	<div class="content">
		<h2>TOP <span>10</span></h2>
	</div>
	<div class="clear"></div>
	<c:forEach var="staff1" items="${requestScope.list1}">
		<div class="grid_1_of_4 images_1_of_4">
			<div style="background-image: url(${staff1.photo});background-size: 180px 150px;background-repeat: no-repeat;width:150px;height:150px" ></div>
			<h3><spring:message code="messages.staffid"></spring:message>: ${ staff1.staffId }</h3>
			<p><spring:message code="messages.staffname"></spring:message>: ${ staff1.staffName }</p>
			<p><spring:message code="messages.staffgender"></spring:message>: ${ staff1.gender }</p>
			<p><spring:message code="messages.staffdepart"></spring:message>: ${staff1.depart.name }</p>
		</div>
	</c:forEach>
	<div class="section group">
	
	<c:forEach var="staff2" items="${requestScope.list2 }"> 
		<div class="grid_1_of_4 images_1_of_4">
			<div style="background-image: url(${staff2.photo});background-size: 180px 150px;background-repeat: no-repeat;width:150px;height:150px" ></div>
			<h3><spring:message code="messages.staffid"></spring:message>: ${ staff2.staffId} </h3>
			<p><spring:message code="messages.staffname"></spring:message>: ${staff2.staffName}</p>
			<p><spring:message code="messages.staffgender"></spring:message>: ${staff2.gender }</p>
			<p><spring:message code="messages.staffdepart"></spring:message>: ${staff2.depart.name }</p>
		</div>
	</c:forEach>	
	
	</div>
	<div class="btm1">
		<div class="section group">
		<c:forEach var="staff3" items="${requestScope.list3 }">
		<div class="grid_1_of_4 images_1_of_4">
			<div style="background-image: url(${staff3.photo});background-size: 180px 150px;background-repeat: no-repeat;width:150px;height:150px" ></div>
			<h3><spring:message code="messages.staffid"></spring:message>: ${ staff3.staffId }</h3>
			<p><spring:message code="messages.staffname"></spring:message>: ${staff3.staffName }</p>
			<p><spring:message code="messages.staffgender"></spring:message>: ${staff3.gender }</p>
			<p><spring:message code="messages.staffdepart"></spring:message>: ${staff3.depart.name }</p>
		</div>
		</c:forEach>
		
	</div>
	</div>
  </div>
</div>
<div class="ftr-bg">
<div class="wrap">
<!-- 
	<div class="section group">
		<div class="grid_1_of_3 images_1_of_3">
			<a href="index.html"><img src="images/logo.png" alt="" /></a>
			<div class="footer">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
			</div>
		</div>
		<div class="grid_1_of_3 images_1_of_3">
		  <h2>Search keywords</h2>
		  <div class="footer">
			  <ul class="f-nav">
			  	<li><a href="">Lorem</a></li>
			  	<li><a href="">ipsum</a></li>
			  	<li><a href="">dolor</a></li>
			  	<li><a href="">Lorem</a></li>
			  	<li><a href="">ipsum</a></li>
			  	<li><a href="">Lorem</a></li>
			  	<li><a href="">Lorem</a></li>
			  	<li><a href="">dolor</a></li>
			  	<li><a href="">Lorem</a></li>
			  	<li><a href="">ipsum</a></li>
			  	<li><a href="">Lorem</a></li>
			  	<li><a href="">ipsum</a></li>
			  	<li><a href="">dolor</a></li>	
			</ul>
		</div>
		</div>
	<div class="grid_1_of_3 images_1_of_3">
			<h2>Popular posts</h2>
			<div class="footer">
						<div class="f-img">
							<a href="details.html"><img src="images/pic6.jpg" alt="" /></a>
						</div>
						<div class="f-para">
							<p><a href="details.html">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</a></p>
						</div>
			<div class="clear"></div>
			<div class="footer">
				<div class="f-img">
					<a href="details.html"><img src="images/pic8.jpg" alt="" /></a>
				</div>
				<div class="f-para">
					<p><a href="details.html">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</a></p>
				</div>
				<div class="clear"></div>					
			</div>
			</div>
		</div>
	</div>     
	-->    
</div>
</div>
<div class="footer1">
		<p class="w3-link">© All Rights Reserved </p>
	</div>
</body>
</html>