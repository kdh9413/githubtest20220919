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
	var json = JSON.parse('${poseresult}');
	//canvas 작업
	var mycanvas = document.getElementById("mycanvas");
	var mycontext = mycanvas.getContext("2d");
	
	var colors = ["black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black", "black"];
	//var bodyinforms = ["코", "목", "오어깨", "오팔꿈치", "오손목", "왼어깨", "왼팔꿈치", "왼손목"];
	var myimage = new Image();
	myimage.src = "http://localhost:8082/naverai/${param.image }";
		if(myimage.width > mycanvas.width){
			mycanvas.width = myimage.width;
		}
		if(myimage.height > mycanvas.height){
			mycanvas.height = myimage.height;
		}
	myimage.onload = function(){
		mycontext.drawImage(myimage, 0, 0, myimage.width, myimage.height);
		
		for(var j = 0; j<json.predictions.length; j++){//사람수만큼
			
	
			for(var i = 0; i < json.predictions[j].length; i++){//8개의 신체부위만큼
				if(json.predictions[j][i] != null){
				var x = json.predictions[j][i].x * myimage.width;
				var y = json.predictions[j][i].y * myimage.height;
				mycontext.fillStyle = "black";
				mycontext.fillText("o", x, y);
				mycontext.fillRect(x, y, 5, 5);
			
				}//if
			}//inner for
		}//outer for
	}//onload

});
</script>
</head>
<body>
<div id="result"></div>
<img src="http://localhost:8082/naverai/${param.image }">
<canvas id="mycanvas" width=100 height=100 style="border:2px solid green">

</canvas>
</body>
</html>