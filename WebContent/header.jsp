<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<header>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 my-auto text-center">
				<a class="btn btn-primary hfbutton" role="button" href="index.jsp">LOGO</a>
			</div>
			<div class="col-lg-3 my-auto text-center">
				<div class="row">
					<div class="col-lg-12 text-center">2035 annonces de vente</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center">4434 annonces de location</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center">6477 biens</div>
				</div>
			</div>
			<div class="col-lg-6 my-auto" id="notlogged">
				<div class="row">
					<div class="col-lg-6 text-center my-auto">
						<i class="fas fa-envelope-open-text"></i> Dépôt d'annonce réservé aux utilisateurs inscrits.
					</div>
					<div class="col-lg-6 text-center my-auto">
						<button type="button" class="btn btn-primary hfbutton" data-toggle="modal"
							data-target="#loginModal">
							<i class="fas fa-sign-in-alt"></i> Connexion</a>
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-6 my-auto" id="logged">
				<div class="col-lg-4 text-center">
					<a class="btn btn-primary hfbutton" role="button" id="logo" href="depot.html">
						<i class="fas fa-envelope-open-text"></i> Dépôt d'Annonce</a>
				</div>
				<div class="col-lg-4 text-center">
					<a class="btn btn-primary hfbutton" role="button" id="login" href="jsp">
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