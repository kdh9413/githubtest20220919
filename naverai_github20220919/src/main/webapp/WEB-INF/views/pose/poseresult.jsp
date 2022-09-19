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
	var output = "코(확률)" + json.predictions[0][0].score * 100 + "%" + "<br>";
	output += "코(x좌표)" + json.predictions[0][0].x + "<br>";
	output += "코(y좌표)" + json.predictions[0][0].y + "<br>";
	
	$("#result").html(output);
	
	//canvas 작업
	var mycanvas = document.getElementById("mycanvas");
	var mycontext = mycanvas.getContext("2d");
	
	var colors = ["red", "blue", "green", "purple", "pink", "navy", "lime"];
	var bodyinforms = ["코", "목", "오어깨", "오팔꿈치", "오손목", "왼어깨", "왼팔꿈치", "왼손목"];
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
		
	
		/*
		var x = json.predictions[0][0].x * myimage.width;
		var y = json.predictions[0][0].y * myimage.height;
		mycontext.fillStyle = "blue";
		mycontext.fillText("코", x, y);
		mycontext.fillRect(x,y,5,5);
		*/
		
		
		for(var i = 0; i < bodyinforms.length; i++){
			var x = json.predictions[0][i].x * myimage.width;
			var y = json.predictions[0][i].y * myimage.height;
			mycontext.fillStyle = colors[i];
			mycontext.fillText(bodyinforms[i], x, y);
			mycontext.fillRect(x, y, 5, 5);
		
	//양손목그리기
	if(bodyinforms[i].indexOf("왼손목")>=0){
		var leftx = json.predictions[0][i].x * myimage.width;
		var lefty = json.predictions[0][i].y * myimage.height;
	}
	if(bodyinforms[i].indexOf("오손목")>=0){
		var rightx = json.predictions[0][i].x * myimage.width;
		var righty = json.predictions[0][i].y * myimage.height;
	}
	mycontext.beginPath();
	mycontext.moveTo(leftx, lefty);//시작점
	mycontext.lineTo(rightx, righty);//종료점까지 선
	mycontext.closePath();
	mycontext.strokeStyle = "red";
	mycontext.lineWidth = 5;
	
	mycontext.stroke();
		}//for
	}//onload

});
</script>
</head>
<body>
<div id="result"></div>
<img src="http://localhost:8082/naverai/${param.image }">
<canvas id="mycanvas" width=500 height=500 style="border:2px solid green">

</canvas>
</body>
</html>