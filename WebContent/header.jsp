<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@ page import="com.edu.realestate.services.AdvertisementServiceImpl"%>
<%@ page import="com.edu.realestate.model.Advertisement"%>
<%@ page import="java.util.Map"%>

<jsp:useBean id="adService" class="com.edu.realestate.services.AdvertisementServiceImpl" />

<% Map<String,Long> dbData = adService.getAdvertisementsData(); %>

<header>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 my-auto logo">
				<a href="home"><img src="images/logo.svg.png" class="img-fluid"></a>
			</div>
			<div class="col-lg-3 my-auto text-center">
 				<div class="row">
					<div class="col-lg-12 text-center"><%= dbData.get("Sale") %> annonces de vente</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center"><%= dbData.get("Rent") %> annonces de location</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center"><%= dbData.get("RealEstate") %> biens</div>
				</div>
			</div>
			<div class="col-lg-6 my-auto" id="notlogged">
				<div class="row">
					<div class="col-lg-6 text-center my-auto">
						<i class="fas fa-envelope-open-text"></i> Dépôt réservé aux inscrits.
					</div>
					<div class="col-lg-6 text-center my-auto">
						<button type="button" class="btn btn-primary hfbutton" data-toggle="modal"
							data-target="#loginModal">
							<i class="fas fa-sign-in-alt"></i> Connexion
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-6 my-auto" id="logged">
				<div class="col-lg-4 text-center">
					<a class="btn btn-primary hfbutton" role="button" id="logo" href="depot.jsp">
						<i class="fas fa-envelope-open-text"></i> Dépôt d'Annonce</a>
				</div>
				<div class="col-lg-4 text-center">
					<a class="btn btn-primary hfbutton" role="button" id="login" href="compte.jsp">
						<i class="far fa-user"></i> Mon Compte</a>
				</div>
				<div class="col-lg-4 text-center">
					<a class="btn btn-primary hfbutton" role="button" id="login" href="">
						<i class="fas fa-sign-out-alt"></i> Déconnexion</a>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- MODAL DE CONNEXION -->
<%@ include file="login-modal.html" %>