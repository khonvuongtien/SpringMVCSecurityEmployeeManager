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
<title><spring:message code="messages.recordmanagement"></spring:message></title>
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
	<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
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
			<li><a href="${pageContext.request.contextPath }/QuanLyTaiKhoan?page=1" ><spring:message code="messages.usermanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath }/QuanLyNhanVien?page=1" ><spring:message code="messages.staffmanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/QuanLyPhongBan?page=1" ><spring:message code="messages.departmanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/ThanhTich?page=1"><spring:message code="messages.record"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/QuanLyThanhTich?page=1" class="active"><spring:message code="messages.recordmanagement"></spring:message></a></li>
		</ul>
	</div>
	<div class="clear"></div>
	
	<div class="section group">
  <h2>User List</h2>
  <span>Depart Name:</span>
  <form action="${pageContext.request.contextPath }/LocThanhTich">
    <select name="departName" >
    <c:forEach var="depart" items="${departs}">
    	<option>${depart.name }</option>    	
    	</c:forEach>
    </select>
    <select name="year" >
    <c:forEach var="year" items="${years}">
    	<option>${year}</option>    	
    	</c:forEach>
    </select>
    <input type="hidden" name="page" value="1"/>
    <input type="submit" id="filterSubmit" value="filter"/>
    </form>          
    <script>
    
		function filterRecord(){
			document.getElementById("filterSubmit").click();
		/*	
			var departName = document.getElementById("departName").value;
			//alert(departName+" "+document.getElementById("filterURL").value);
				var xhttp = new XMLHttpRequest();
				 xhttp.onreadystatechange=function() {
					    if (this.readyState == 4 && this.status == 200) {
					    alert(this.responseText);
					    }
					  };
				xhttp.open("GET", +document.getElementById("filterURL").value, true);
				xhttp.send();
			*/
				
				
			}
		
    </script>
  <table class="table table-striped table-bordered table-hover section group">
    <thead>
      <tr>
       <th><spring:message code="messages.staffid"></spring:message></th>
        <th><spring:message code="messages.staffname"></spring:message></th>
        <th><spring:message code="messages.staffgender"></spring:message></th>
       <th><spring:message code="messages.staffdepart"></spring:message></th>
       <th><spring:message code="messages.recordtype"></spring:message></th>
       <th><spring:message code="messages.recordreason"></spring:message></th>
       <th><spring:message code="messages.recorddate"></spring:message></th>       
      </tr>
    </thead>
    <tbody>
    <c:forEach var="record" items="${requestScope.recordList }">    
      <tr>
     
      <td><a href="${pageContext.request.contextPath}/ThongTinThanhTich?name=${record.id}" style="text-decoration:none">${record.staff.staffId }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinThanhTich?name=${record.id}" style="text-decoration:none">${record.staff.staffName }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinThanhTich?name=${record.id}" style="text-decoration:none">${record.staff.gender }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinThanhTich?name=${record.id}" style="text-decoration:none">${record.staff.depart.name}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinThanhTich?name=${record.id}" style="text-decoration:none">${record.type }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinThanhTich?name=${record.id}" style="text-decoration:none">${record.reason }</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinThanhTich?name=${record.id}" style="text-decoration:none">${record.date }</a></td>
		<td><a href="${pageContext.request.contextPath}/XoaThanhTich?manv=${record.id}" style="color:red">X</a></td>
      </tr>
      
      </c:forEach>
    </tbody>
  </table>
  <ul class="pagination">
	<c:forEach var="pageIndex" begin="1" end="${totalPage}" step="1">
    	<li><a href="${pageContext.request.contextPath}/QuanLyThanhTich?page=${pageIndex}" class="active">${pageIndex}</a></li>
    </c:forEach>
  </ul>
</div>


<div class="section group">
		<sf:form action="${pageContext.request.contextPath }/CapNhatThanhTich" method="get" modelAttribute="record">
  <div class="form-group">
  <sf:hidden path="id"/>
    <label for="departid"><spring:message code="messages.staffid"></spring:message>:</label>
    <sf:input type="text" class="form-control" id="departid" onkeyup="checkChange(this)" path="staff.StaffId" readonly="true"/><br>
  </div>
  <div class="form-group">
    <label for="departname"><spring:message code="messages.staffname"></spring:message>:</label>
    <sf:input type="text" class="form-control" path="staff.StaffName" id="departname" readonly="true"/><br>
  </div>
  <div class="form-group">
    <label for="departname"><spring:message code="messages.recordtype"></spring:message></label>
    <label><sf:radiobutton value="1" path="type" id="departname" />Khen Thuong</label>
    <label><sf:radiobutton value="0" path="type" id="departname" />Ky Luat</label><br>
  </div>
  <div class="form-group">
    <label for="departname"><spring:message code="messages.recordreason"></spring:message></label>
    <sf:input type="text" class="form-control" path="reason" id="departname" onkeyup="checkChange(this)"/><br>
  </div>
  <div class="form-group">
    <label for="departname"><spring:message code="messages.recorddate"></spring:message></label>
    <sf:input type="text" class="form-control" path="date" id="departname" onkeyup="checkChange(this)"/><br>
  </div>
  
  <button type="submit" id="updateBtn" name="action" value="update" class="btn btn-default">Update</button>
</sf:form>
	</div>	
</div><br/>



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