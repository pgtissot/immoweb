<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css">
	<link rel="stylesheet" href="fontawesome/css/all.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<script src="jquery/jquery-3.4.1.js"></script>
	<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
	<script src="js/codes.js"></script>
	<title>Mon Compte</title>
	</head>
	
	
	<body> 
		<!-- ENTETE HEADER -->
		<header>
		<%@ include file="header.jsp" %>
		</header>
		
		<!-- NAV -->
		<div id="container">
		
		<!-- CONTENT -->
		<section>
	
			<div> 
				<h2>Favoris </h2>
			</div>
			
			<div> 
				<h2>Personnel </h2>
			</div>
		</section>	
	</div>
		<!-- FOOTER -->
	<%@ include file="footer.jsp" %>
	</body>

	</html>