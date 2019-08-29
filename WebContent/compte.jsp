<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap"
	rel="stylesheet">
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

	<%@ include file="header.jsp"%>


	<!-- NAV -->
	<div id="container">
		<c:set value="${requestScope.user}" var="user" />
		<!-- CONTENT -->
		<div id="welcome">
			<section class="shadow">
				<div class="container-fluid" id="searchheader">
					<div class="row">

						<div class="col-lg-12 my-auto bigfont text-center">
							Bonjour
							<c:out value="${user.firstName}" />
							, voici ta page personnelle!
						</div>
					</div>
				</div>
			</section>
		</div>

		<section class="shadow">


			<div class="row">
				<div class="col-lg-12">
					<div class="row" id="personnel">
						<div class="col-lg-12">
							<h2>Personnel</h2>
						</div>
					</div>
					<div class="row" id="showData">
						<div class="col-lg-12">
							<div>
								<header>Ton profil</header>
								<section>
									<div class="col-lg-12 form-group">

										<div class="row">
											<div class="col-lg-1">
												<span> <c:out value="${user.title}" />
												</span>
											</div>
											<div class="col-lg-2">
												<span> <c:out value="${user.lastName}" />
												</span>
											</div>
											<div class="col-lg-2">
												<span> <c:out value="${user.firstName}" />
												</span>
											</div>
											<div class="col-lg-3">
												<span> <c:out value="${user.username}" />
												</span>
											</div>
											<div class="col-lg-2">
												<span><c:out value="${user.phone}" /></span>
											</div>
											<div class="col-lg-2 text-right">
												<button type="button" class="btn btn-info"
													data-toggle="modal" data-target="#dataModal">
													Modification mot de passe</button>
											</div>

										</div>

									</div>
								</section>
							</div>

						</div>
					</div>

				</div>
			</div>
	</div>
	</section>
	<!-- DROP DOWNS -->




	<section class="shadow">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-8">
						<h2>Favoris</h2>
					</div>
					<div class="col-lg-4">
						<div class="dropdown text-right">
							<button class="btn btn-info dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">Trier</button>
							<div class="dropdown-menu" aria-labelledby="searchSort">
								<a class="dropdown-item" href="#">Prix / croissant</a> <a
									class="dropdown-item" href="#">Prix / décroissant</a> <a
									class="dropdown-item" href="#">Surface / croissant</a> <a
									class="dropdown-item" href="#">Surface / décroissant</a>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					
					<c:forEach items="${requestScope.listFavs}" var="fav">
						<c:set value="${fav.ad}" var="ad" />
						<div class="col-lg-4 text-center">
							<article>
								<form method="POST" action="detail" id="${ad.id}">
									<a role="button" href="#" id="${ad.id}">
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="row">
													<div class="col-lg-12 text-center">
														<img src="images/diapo1.jpg" class="img-fluid">
													</div>
												</div>
												<div class="row" data-type="caption">
													<div class="col-lg-6 align-left my-auto"
														data-type="realestate">
														<div>
															<c:out value="${ad.transactionTypeToFrench()}" />
														</div>
														<div>
															<c:out value="${ad.realEstate.toFrench()}" />
															<div></div>
															<c:out value="${ad.realEstate.area}" />
															m²
														</div>
														<div>
															<c:out value="${ad.realEstate.city.name}" />
														</div>
													</div>
													<div class="col-lg-6 my-auto" data-type="price">
														<div>
															<c:out value="${ad.realEstate.price}" />
															&euro;
														</div>
													</div>
												</div>
											</div>
										</div>
									</a> <input type="hidden" id="advertisementId"
										name="advertisementId" value="<c:out value="${ad.id}" />">
								</form>
							</article>

						</div>
					</c:forEach>





				</div>
			</div>
	</section>
	</div>
	<!-- FOOTER -->
	<%@ include file="dataModify-modal.html"%>
	<%@ include file="footer.jsp"%>
</body>

</html>