<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	//음악재생 바로 시작
	document.getElementById("myaudio").play();
});
</script>
</head>
<body>
<h3>${csrresult }</h3>
<audio id="myaudio" src="/naverai/${param.image }" controls></audio>
</body>
</html>