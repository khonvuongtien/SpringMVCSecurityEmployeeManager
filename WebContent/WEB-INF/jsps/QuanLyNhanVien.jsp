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
<title><spring:message code="messages.staffmanagement"></spring:message></title>
</head>
<body>
<a href="${pageContext.request.contextPath }/QuanLyNhanVien?page=1&language=en"><img src="${pageContext.request.contextPath}/static/images/en.png" width="20px" height="15px"/></a>
<a href="${pageContext.request.contextPath }/QuanLyNhanVien?page=1&language=vi"><img src="${pageContext.request.contextPath}/static/images/vn.png" width="20px" height="15px"/></a>

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
			<li><a href="${pageContext.request.contextPath }/QuanLyTaiKhoan?page=1"><spring:message code="messages.usermanagement"></spring:message></a></li>
			<li><a href="${pageContext.request.contextPath }/QuanLyNhanVien?page=1" class="active"><spring:message code="messages.staffmanagement"></spring:message></a></li>
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
        <th><spring:message code="messages.staffid"></spring:message></th>
        <th><spring:message code="messages.staffname"></spring:message></th>
        <th><spring:message code="messages.staffgender"></spring:message></th>
        <th><spring:message code="messages.staffbirthday"></spring:message></th>
        <th><spring:message code="messages.staffemail"></spring:message></th>
        <th><spring:message code="messages.staffphone"></spring:message></th>
        <th><spring:message code="messages.staffsalary"></spring:message></th>
        <th><spring:message code="messages.staffnote"></spring:message></th>        
        <th><spring:message code="messages.staffdepart"></spring:message></th>
        <th><spring:message code="messages.staffphoto"></spring:message></th>                
      </tr>
    </thead>
    <tbody>
    <c:forEach var="staff" items="${requestScope.staffList }">    
      <tr>
     
      <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.staffId}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.staffName}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.gender}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.birthday}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.email}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.phone}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.salary}</a></td>
        <td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.notes}</a></td>
    	<td><a href="${pageContext.request.contextPath}/ThongTinNhanVien?name=${staff.staffId}" style="text-decoration:none">${staff.depart.name}</a></td>
    	<td style="background-image: url(${staff.photo});background-size: 50px 40px;background-repeat: no-repeat;"></td>
		<td><a href="${pageContext.request.contextPath}/XoaNhanVien?manv=${staff.staffId}" style="color:red">X</a></td>
      </tr>
      
      </c:forEach>
    </tbody>
  </table>
  <ul class="pagination">
	<c:forEach var="pageIndex" begin="1" end="${totalPage}" step="1">
    	<li><a href="${pageContext.request.contextPath}/QuanLyNhanVien?page=${pageIndex}" class="active">${pageIndex}</a></li>
    </c:forEach>
  </ul>
</div>


<div class="section group">
		<sf:form action="${pageContext.request.contextPath }/TaoNhanVien" method="post" modelAttribute="staff" enctype="multipart/form-data">
  <div class="form-group">
    <label for="username"><spring:message code="messages.staffid"></spring:message>:</label>
    <sf:input type="text" class="form-control" id="id" onkeyup="checkChange(this)" path="StaffId"/><br><sf:errors path="StaffId" cssStyle="color:red"></sf:errors>
  </div>
  <div class="form-group">
    <label for="name"><spring:message code="messages.staffname"></spring:message>:</label>
    <div><sf:input class="form-control" type="text" id="name" onkeyup="checkChange(this)" path="StaffName"/></div>
    <br><sf:errors path="StaffName" cssStyle="color:red"></sf:errors>
  </div>
  <div class="form-group">
    <label><spring:message code="messages.staffgender"></spring:message>:</label><br/>
    <label><sf:radiobutton id="true"  onclick="checkChange(this)" path="Gender" value="M"/>Male</label>
      <label><sf:radiobutton id="false"  onclick="checkChange(this)"  path="Gender" value="F"/>Female</label><br>
    <br><sf:errors path="Gender" cssStyle="color:red"></sf:errors>
  </div>
 <div class="form-group">
    <label for="bd"><spring:message code="messages.staffbirthday"></spring:message>:</label>
    <div><sf:input class="form-control" type="text" id="bd" onkeyup="checkChange(this)" path="Birthday"/></div>
    <br><sf:errors path="Birthday" cssStyle="color:red"></sf:errors>
  </div>
  
  <div class="form-group">
    <label for="email"><spring:message code="messages.staffemail"></spring:message>:</label>
    <div><sf:input class="form-control" type="text" id="email" onkeyup="checkChange(this)" path="Email"/></div>
    <br><sf:errors path="Email" cssStyle="color:red"></sf:errors>
  </div>
  
  <div class="form-group">
    <label for="phone"><spring:message code="messages.staffphone"></spring:message>:</label>
    <div><sf:input class="form-control" type="text" id="phone" onkeyup="checkChange(this)" path="Phone"/></div>
    <br><sf:errors path="Phone" cssStyle="color:red"></sf:errors>
  </div>
  
  <div class="form-group">
    <label for="salary"><spring:message code="messages.staffsalary"></spring:message>:</label>
    <div><sf:input class="form-control" type="text" id="salary" onkeyup="checkChange(this)" path="Salary"/></div>
    <br><sf:errors path="Salary" cssStyle="color:red"></sf:errors>
  </div>
  
  
  <div class="form-group">
    <label for="depart"><spring:message code="messages.staffdepart"></spring:message>:</label>
    <sf:select type="text" class="form-control" path="depart.departId" id="depart" itemLabel="name" itemValue="DepartId" items="${departs}" onkeyup="checkChange(this)"/><br><sf:errors path="depart.name" cssStyle="color:red"></sf:errors>
    
  </div>
  <div class="form-group">
    <label for="photo"><spring:message code="messages.staffphoto"></spring:message>:</label>
    <input type="button" value="upload" id="btnUpload" onclick="activateUpload()"><br>
    <input type="file" style="display:none" id="upload" name="image" onchange="readURL(this)"/>
    <sf:input path="Photo" id="photo" class="form-control" />    
    <img id="imgPreview" width="250" height="200"/>
    <sf:errors path="Photo" cssStyle="color:red"></sf:errors>
  </div>
  
  <button type="submit" class="btn btn-default" name="action" value="create">Create</button>
  <button type="submit" id="updateBtn" style="display:none" name="action" value="update" class="btn btn-default">Update</button>
</sf:form>
	</div>	
</div><br/>


<script>
if(document.getElementById("photo").value!=""){document.getElementById("imgPreview").src=document.getElementById("photo").value;}
function activateUpload(){
	document.getElementById("upload").click();
}
function readURL(input) {
	var path=input.value;
	var fileName = path.match(/[^\/\\]+$/);
			document.getElementById("photo").value=fileName;
	       if (input.files && input.files[0]) {
	            var reader = new FileReader();

	            reader.onload = function (e) {
	                $('#imgPreview')
	                    .attr('src', e.target.result)
	                    .width(250)
	                    .height(200);
	            };
	            reader.readAsDataURL(input.files[0]);
	        }
			
			
	    }

//check change on form
var id=document.getElementById("id").value;
var name=document.getElementById("name").value;
var bd=document.getElementById("bd").value;
var email=document.getElementById("email").value;
var phone=document.getElementById("phone").value;
var salary=document.getElementById("salary").value;
var depart=document.getElementById("depart").value;
var photo=document.getElementById("photo").value;

var btnId="";

if(document.getElementById("true").checked){btnId = document.getElementById("true").id;}else{btnId = document.getElementById("false").id;}
	
	function readyToCheckChange(obj){
		if(obj.id == document.getElementById("username").id){
			if(username==""){
			username = obj.value;
			//alert("saved "+username+" with "+obj.value);
			}
			
			}else if(obj.id == document.getElementById("pwd").id){
				if(password==""){
					password = obj.value;
					//alert("saved "+password+" with "+obj.value);
					}
				
				}else if (obj.id == document.getElementById("fullname").id){
					if(fullname==""){fullname = obj.value;
					//alert("saved "+fullname+" with "+obj.value);
					}
					
					}
		}
	function checkChange(obj){
		/*alert("username: "+document.getElementById("username").value +" + "+username);
		alert("password: "+document.getElementById("pwd").value +" + "+password);
		alert("fullname: "+document.getElementById("fullname").value +" + "+fullname);*/
		if(id!=""){
				if(document.getElementById("id")==id){
					if(document.getElementById("name")==name){
						if(document.getElementById("bd")==bd){
							if(document.getElementById("email")==email){
								if(document.getElementById("phone")==phone){
									if(document.getElementById("salary")==salary){
										
										if(document.getElementById("depart")==depart){
											if(document.getElementById("photo")==photo){
												if(document.getElementById(btnId).checked){
													document.getElementById("updateBtn").style.display="none";
													}else{document.getElementById("updateBtn").style.display="inline";}
												}else{document.getElementById("updateBtn").style.display="inline";}
											}else{document.getElementById("updateBtn").style.display="inline";}
										
										}else{document.getElementById("updateBtn").style.display="inline";}

									}else{document.getElementById("updateBtn").style.display="inline";}
								}else{
									document.getElementById("updateBtn").style.display="inline";		
									}
							}else{
								document.getElementById("updateBtn").style.display="inline";
								}
						}else{
							document.getElementById("updateBtn").style.display="inline";
							}
					}else{
						document.getElementById("updateBtn").style.display="inline";
						}
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