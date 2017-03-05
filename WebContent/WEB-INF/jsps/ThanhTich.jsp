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
<title><spring:message code="messages.record"></spring:message></title>
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
	
	<div class="clear"></div>
	</div>
	<div class="wrp-menu">
		<ul class="nav-bar myul">
			<li><a href="${pageContext.request.contextPath }/index" ><spring:message code="messages.home"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath }/QuanLyTaiKhoan?page=1" ><spring:message code="messages.usermanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath }/QuanLyNhanVien?page=1" ><spring:message code="messages.staffmanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/QuanLyPhongBan?page=1" ><spring:message code="messages.departmanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/ThanhTich?page=1" class="active"><spring:message code="messages.record"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath}/QuanLyThanhTich?page=1" ><spring:message code="messages.recordmanagement"></spring:message></a></li>
		</ul>
	</div>
	<div class="clear"></div>
	
	<div class="section group">
  <h2>User List</h2>
           
  <table class="table table-striped table-bordered table-hover section group">
    <thead>
      <tr>
        <th><spring:message code="messages.staffid"></spring:message></th>
        <th><spring:message code="messages.staffname"></spring:message></th>
        <th><spring:message code="messages.staffgender"></spring:message></th>        
        <th><spring:message code="messages.staffdepart"></spring:message></th>
        <th><spring:message code="messages.staffphoto"></spring:message></th>
        <th></th>
      </tr>
    </thead>
    <script>
           var d = new Date();
           var weekday = new Array(7);
           weekday[0] = "sun";
           weekday[1] = "mon";
           weekday[2] = "tue";
           weekday[3] = "wed";
           weekday[4] = "thur";
           weekday[5] = "fri";           

           var n = weekday[d.getDay()];           
           document.getElementById(n).setAttribute("class", "success");
           </script>   
    <tbody>
     <c:forEach var="staff" items="${requestScope.staffList }">    
      <tr>
     
      <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.staffId}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.staffName}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.gender}</a></td>       
    	<td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.depart.name}</a></td>
    	<td style="background-image: url(${staff.photo});background-size: 50px 40px;background-repeat: no-repeat;
}"></td>
		<td><a style="color:red" data-toggle="modal" data-target="#${staff.staffId}">X</a>
		<!-- Modal -->
<div id="${staff.staffId }" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Ky Luat ${staff.staffId}</h4>
      </div>
      <form action="${pageContext.request.contextPath}/KyLuat">
      <div class="modal-body">
        <textarea cols="80" rows="5" name="note"></textarea>
      </div>
      <div class="modal-footer">
      <input type="hidden" name="manv" value="${staff.staffName}"/>
        <input type="submit" value="OK">
      </div>
      </form>
    </div>
      </div>
</div>
			<!-- end modal -->
		<a style="color:green" data-toggle="modal" data-target="#${staff.staffId}1">&#10004</a>
		<!-- Modal -->
<div id="${staff.staffId }1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Khen Thuong ${staff.staffName}</h4>
      </div>
      
      <form action="${pageContext.request.contextPath}/KhenThuong">
      <div class="modal-body">
        <textarea cols="80" rows="5" name="note"></textarea>
      </div>
      <div class="modal-footer">
      <input type="hidden" name="manv" value="${staff.staffId }"/>
        <input type="submit" value="OK">
      </div>
      </form>
      
    </div>
      </div>
</div>
			<!-- end modal -->
		</td>
      </tr>
      
      </c:forEach>
    </tbody>
  </table>
  <ul class="pagination">
	<c:forEach var="pageIndex" begin="1" end="${totalPage}" step="1">
    	<li><a href="${pageContext.request.contextPath}/ThanhTich?page=${pageIndex}" class="active">${pageIndex}</a></li>
    </c:forEach>
  </ul>
</div>

<script>
	function getUserDetail(){
		document.getElementById("submitUserDetail").click();
		}
	
</script>
	
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