<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="POST" action="${pageContext.request.contextPath}/savefile" enctype="multipart/form-data">
		File to upload: <input type="file" name="file">
 
	<img src="${pageContext.request.contextPath }/static/images/shiki.jpg" alt=""  title="logo"/>
	<img src="${pageContext.request.contextPath }/static/images/logo.png" alt=""  title="logo"/>
 		<input type="text" name="name"/>
 		Absolute Path is:<%= getServletContext().getRealPath("/") %> 
 		<img src="<%=getServletContext().getRealPath("/")%>/static/images/logo.png" alt=""  title="logo"/>
 		<input type="submit" value="Upload"> Press here to upload the file!		
	</form>
	${msg}	
</body>
</html>