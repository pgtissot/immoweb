<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 my-auto logo">
				<a href="home"><img src="images/logo.svg.png" class="img-fluid"></a>
			</div>
			<div class="col-lg-3 my-auto text-center">
				<div class="row">
					<div class="col-lg-12 text-center" id="SaleCount"></div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center" id="RentCount"></div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center" id="RealEstateCount"></div>
				</div>
			</div>
			<c:if test="${sessionScope.username eq null}">
				<div class="col-lg-6 my-auto" id="notlogged">
					<div class="row">
						<div class="col-lg-6 text-center my-auto">
							<i class="fas fa-envelope-open-text"></i> Dépôt réservé aux
							inscrits.
						</div>
						<div class="col-lg-6 text-center my-auto">
							<button type="button" class="btn btn-primary hfbutton"
								data-toggle="modal" data-target="#loginModal">
								<i class="fas fa-sign-in-alt"></i> Connexion
							</button>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${sessionScope.username ne null}">
				<div class="col-lg-6 my-auto" id="logged">
					<div class="col-lg-4 text-center">
						<a class="btn btn-primary hfbutton" role="button" id="logo"
							href="depot"> <i class="fas fa-envelope-open-text"></i>
							Dépôt d'Annonce
						</a>
					</div>
					<div class="col-lg-4 text-center">
						<a class="btn btn-primary hfbutton" role="button" id="compte"
							href="compte"> <i class="far fa-user"></i> Mon Compte
						</a>
					</div>
					<div class="col-lg-4 text-center">
						<a class="btn btn-primary hfbutton" role="button" id="login"
							href="logout"> <i class="fas fa-sign-out-alt"></i> Déconnexion
						</a>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</header>

<!-- MODAL DE CONNEXION -->
<%@ include file="login-modal.html"%>