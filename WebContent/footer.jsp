<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<%@ page import="java.time.LocalDate"%>

<footer>
	<div class="container-fluid mediumfont">
		<div class="row">
			<div class="col-lg-4 text-center my-auto">
				<a class="btn btn-primary hfbutton" role="button" href="cgv.jsp"><i class="fas fa-receipt"></i> CGV</a>
			</div>
			<div class="col-lg-4 text-center copyright mediumfont">
				<i class="far fa-copyright"> <%=LocalDate.now().getYear() %> GemIImmo INC.</i>
			</div>
			<div class="col-lg-4 text-center my-auto">
				<button type="button" class="btn btn-primary hfbutton" data-toggle="modal" data-target="#contactSiteModal">
					<i class="far fa-envelope"></i> CONTACT</button>
			</div>
		</div>
	</div>
</footer>

<!-- MODAL DE CONTACT DU SITE -->
<%@ include file="contact-site-modal.html" %>