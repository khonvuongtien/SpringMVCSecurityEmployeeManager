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
<title><spring:message code="messages.usermanagement"></spring:message></title>
</head>
<body>
<a href="?page=1&language=en"><img src="${pageContext.request.contextPath}/static/images/en.png" width="20px" height="15px"/></a>
<a href="?page=1&language=vi"><img src="${pageContext.request.contextPath}/static/images/vn.png" width="20px" height="15px"/></a>
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
	<!-- 
	<div class="search">
    	<form>
    		<input type="text" value="">
    		<input type="submit" value="">
    	</form>
	</div>
	 -->
	<div class="clear"></div>
	</div>
	<div class="wrp-menu">
		<ul class="nav-bar myul">
			<li><a href="${pageContext.request.contextPath }/index" ><spring:message code="messages.home"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath }/QuanLyTaiKhoan?page=1" class="active"><spring:message code="messages.usermanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath }/QuanLyNhanVien?page=1" ><spring:message code="messages.staffmanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/QuanLyPhongBan?page=1" ><spring:message code="messages.departmanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/ThanhTich?page=1"><spring:message code="messages.record"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/QuanLyThanhTich?page=1" ><spring:message code="messages.recordmanagement"></spring:message></a></li>
		</ul>
	</div>
	<div class="clear"></div>
	
	<div class="section group">
  <h2>User List</h2>
              
  <table class="table table-striped table-bordered table-hover section group">
    <thead>
      <tr>
        <th>Username</th>
        <th>Password</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Enable</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${requestScope.userList }">    
      <tr>
     
      <td><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan?name=${user.username}" style="text-decoration:none">${user.username }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan?name=${user.username}" style="text-decoration:none">${user.password }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan?name=${user.username}" style="text-decoration:none">${user.fullname }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan?name=${user.username}" style="text-decoration:none">${user.email }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan?name=${user.username}" style="text-decoration:none">${user.role }</a></td>
    	<td><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan?name=${user.username}" style="text-decoration:none">${user.enabled }</a></td>
      </tr>
      
      </c:forEach>
    </tbody>
  </table>
  <ul class="pagination">
	<c:forEach var="pageIndex" begin="1" end="${totalPage}" step="1">
    	<li><a href="${pageContext.request.contextPath}/QuanLyTaiKhoan?page=${pageIndex}" class="active">${pageIndex}</a></li>
    </c:forEach>
  </ul>
</div>

<script>
	function getUserDetail(){
		document.getElementById("submitUserDetail").click();
		}
	
</script>
	<div class="section group">
		<sf:form action="${pageContext.request.contextPath }/TaoTaiKhoan" method="get" modelAttribute="user">
  <div class="form-group">
    <label for="username">Username:</label>
    <sf:input type="text" class="form-control" id="username" onkeyup="checkChange(this)" path="username"/><br><sf:errors path="username" cssStyle="color:red"></sf:errors>
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <div><sf:input class="form-control" type="password" id="pwd" onkeyup="checkChange(this)" path="password"/><img style="float:right;" onmousedown="changeToText()" onmouseup="changeToPassword()" width="2%" height="2%" src="${pageContext.request.contextPath}/static/images/viewpass.png"/></div>
    <br><sf:errors path="password" cssStyle="color:red"></sf:errors>
  </div>
  <div class="form-group">
    <label for="fullname">Fullname:</label>
    <sf:input type="text" class="form-control" path="fullname" id="fullname" onkeyup="checkChange(this)"/><br><sf:errors path="fullname" cssStyle="color:red"></sf:errors>
  </div>
  <div class="form-group">
    <label for="email">Email:</label>
    <sf:input type="text" class="form-control" path="email" id="email" onkeyup="checkChange(this)"/><br><sf:errors path="email" cssStyle="color:red"></sf:errors>
  </div>
  <div class="form-group">
      <label><sf:radiobutton id="true"  onclick="checkChange(this)" path="enabled" value="true"/>Enabled</label>
      <label><sf:radiobutton id="false"  onclick="checkChange(this)"  path="enabled" value="false"/>Disabled</label><br>
      <sf:errors path="enabled" cssStyle="color:red"></sf:errors>
    </div>
  <div class="form-group">
  <label for="role">Select Authorities:</label>
  <sf:select class="form-control" id="role" path="role"  items="${authorities}"/><br><sf:errors path="role" cssStyle="color:red"></sf:errors>
</div>
  <button type="submit" class="btn btn-default" name="action" value="create">Create</button>
  <button type="submit" id="updateBtn" style="display:none" name="action" value="update" class="btn btn-default">Update</button>
</sf:form>
	</div>	
</div><br/>
<script>
var username=document.getElementById("username").value;
var password=document.getElementById("pwd").value;
var fullname=document.getElementById("fullname").value;
var email=document.getElementById("email").value;

var btnId="";

if(document.getElementById("true").checked){btnId = document.getElementById("true").id;}else{btnId = document.getElementById("false").id;}
	function changeToText(){
		var val = document.getElementById("pwd").value;
		document.getElementById("pwd").type="text";
		document.getElementById("pwd").value = val;		
		}
	function changeToPassword(){
		var val = document.getElementById("pwd").value;
		document.getElementById("pwd").type="password";
		document.getElementById("pwd").value = val;
		}
	
	function checkChange(obj){
		/*alert("username: "+document.getElementById("username").value +" + "+username);
		alert("password: "+document.getElementById("pwd").value +" + "+password);
		alert("fullname: "+document.getElementById("fullname").value +" + "+fullname);*/
		if(username!=""){
			if(document.getElementById("username").value == username){
				//alert("username the same");
				if(document.getElementById("pwd").value==password){
					//alert("password the same");
					if(document.getElementById("fullname").value==fullname){
						
						//alert("fullname the same");
						if(document.getElementById("email").value == email){
							//alert("email the same");
						//if(obj.id == btnId)
						if(document.getElementById(btnId).checked)
							{
							//alert("btn the same");
							document.getElementById("updateBtn").style.display="none";
							}else{document.getElementById("updateBtn").style.display="inline";}
						}else{document.getElementById("updateBtn").style.display="inline";}
						}else{document.getElementById("updateBtn").style.display="inline";}
				}else{document.getElementById("updateBtn").style.display="inline";}
				}else{document.getElementById("updateBtn").style.display="inline";}
		}
		
		}

</script>
<div class="ftr-bg">
<div class="wrap">
	<!-- 
		<div class="section group">
		<div class="grid_1_of_3 images_1_of_3">
			<a href="index.html"><img src="${pageContext.request.contextPath }/static/images/logo.png" alt="" /></a>
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
							<a href="details.html"><img src="${pageContext.request.contextPath }/static/images/pic6.jpg" alt="" /></a>
						</div>
						<div class="f-para">
							<p><a href="details.html">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</a></p>
						</div>
			<div class="clear"></div>
			<div class="footer">
				<div class="f-img">
					<a href="details.html"><img src="${pageContext.request.contextPath }/static/images/pic8.jpg" alt="" /></a>
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
		<p class="w3-link">© All Rights Reserved | Design by&nbsp; <a href="http://w3layouts.com/"> W3Layouts</a></p>
	</div>
</body>
</html>