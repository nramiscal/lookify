<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		table {
		    font-family: arial, sans-serif;
		    border-collapse: collapse;
		    width: 100%;
		}
		
		td, th {
		    border: 1px solid #dddddd;
		    text-align: left;
		    padding: 8px;
		}
		 
		tr:nth-child(even) {
		    background-color: #dddddd;
		}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search Results</title>
	</head>
	<body>
		<div id="container">
			<h2>Songs by artist: ${artist}</h2>
			
			<form method="post" action="/search">
				<input type="text" name="artist"></input>
				<input type="submit" value="New Search"></input>
			</form>
			<br>
			<table>
			  <tr>
			    <th>Title</th>
			    <th>Rating</th>
				<th>Action</th>
			  </tr>
			<c:forEach items="${songs}" var="song" varStatus="loop">
			<tr>    
			    <td><a href="/${song.id}">${song.title}</a></td>
			    <td><c:out value="${song.rating}"/></td>
			    <td><a href="/delete/${song.id}">Delete</a></td>
			</tr>
			</c:forEach>
			</table>
			<br>
			<a href="/dashboard">Dashboard</a>
		</div>
	</body>
</html>