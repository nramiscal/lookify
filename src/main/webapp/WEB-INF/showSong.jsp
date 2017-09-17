<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Title: <c:out value="${song.title}"/></h3>
<h3>Artist: <c:out value="${song.artist}"/></h3>
<h3>Rating: <c:out value="${song.rating}"/></h3>

<a href="/dashboard">Dashboard</a>
<a href="delete/${song.id}">Delete</a>