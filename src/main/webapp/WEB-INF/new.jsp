<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style>
		
		* {
			font-family: sans-serif;
		}
		
		#container {
			width: 1000px;
			margin: 0px auto;
		}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add Song</title>
	</head>
	
	<body>
		<div id="container">
		<form:form method="POST" action="/new" modelAttribute="song">
			<form:hidden path="id"/>
		    <form:label path="title">Title
		    <form:errors path="title"/>
		    <form:input path="title"/></form:label><br>
		    
		    <form:label path="artist">Artist
		    <form:errors path="artist"/>
		    <form:input path="artist"/></form:label><br>
		    
		    <form:label path="rating">Rating
		    <form:errors path="rating"/>
		    <form:input type="number" path="rating"/></form:label><br>
		    
		    <input type="submit" value="Add Song"/>
		</form:form>
		<br>
		<a href="/dashboard">Back</a>
		
		</div>
	</body>
</html>