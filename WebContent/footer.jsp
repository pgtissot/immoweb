<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<footer>
	<div class="container-fluid mediumfont">
		<div class="row">
			<div class="col-lg-3 text-center">
				<a class="btn btn-primary hfbutton" role="button" href="cgv.jsp"><i class="fas fa-receipt"></i> CGV</a>
			</div>
			<div class="col-lg-3 text-center">
				<button type="button" class="btn btn-primary hfbutton" data-toggle="modal" data-target="#contactSiteModal">
					<i class="far fa-envelope"></i> CONTACT</button>
			</div>
			<div class="col-lg-3 text-center">
				<a class="btn btn-primary hfbutton" role="button" href="moderation.jsp"><i class="fab fa-twitter"></i>
					TWITTER</a>
			</div>
			<div class="col-lg-3 text-center">
				<a class="btn btn-primary hfbutton" role="button" href="#"><i class="fab fa-facebook-f"></i>
					FACEBOOK</a>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 text-center copyright mediumfont">
				<i class="far fa-copyright"> 2019 Le Meilleur site du monde.</i>
			</div>
		</div>
	</div>
</footer>

<!-- MODAL DE CONTACT DU SITE -->
<%@ include file="contact-site-modal.html" %>