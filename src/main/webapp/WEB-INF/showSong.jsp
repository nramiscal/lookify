<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<style>
		*{
			font-family: sans-serif;
		}
		
		#container {
			width: 1000px;
			margin: 0px auto;
		}
		
		span{
			font-weight: normal;
		}
		
		</style>
		<title>Song Details</title>
	</head>
	<body>
		<div id="container">
		<h3>Title: <span><c:out value="${song.title}"/></span></h3>
		<h3>Artist: <span><c:out value="${song.artist}"/></span></h3>
		<h3>Rating: <span><c:out value="${song.rating}"/></span></h3>
		
		
		<a href="delete/${song.id}">Delete</a><br>
		<a href="/dashboard">Back</a>
		</div>
	</body>
</html>