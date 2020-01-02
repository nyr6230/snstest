<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

	<input type="button" value="버튼">
	
	<div class="ac1" style="cursor:pointer;">■ Message ■</div>
	
	
	<div id="view1" style="display:none; border:1px solid black; background-color: gray;">
		<div class="ac2" style="cursor:pointer; border:1px solid black; background-color: white;">X</div>
		내용 대화 내용 내용<br>내용내용 내용 내용 <br>내용</div>
	
	
	<script>
	$(document).ready(function(){
		
	   $("div[class='ac1']").click(function(){
	   $("div[id='view1']").fadeIn(0);
	   });
	   
	 $("div[class='ac2']").click(function(){
	   $("div[id='view1']").fadeOut(0);
	   });
	 
	});
	</script>

</body>
</html>