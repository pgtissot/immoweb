<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>Modération d'annonces</title>
	<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css" />
	<link rel="stylesheet" href="fontawesome/css/all.css" />
	<link rel="stylesheet" href="css/styles.css" />
	<script src="jquery/jquery-3.4.1.js"></script>
	<script src="bootstrap-4.3.1/js/bootstrap.bundle.js"></script>
	<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
	<script src="typeahead/bootstrap3-typeahead.js"></script>
	<script src="js/codes.js"></script>
</head>

<body>

	<!-- HEADER -->
	<%@ include file="header.jsp" %>


	<!-- NAVIGATION -->

	<!-- DROP DOWNS -->
	<section class="shadow">
		<div class="container-fluid" id="searchheader">
			<div class="row">
				<div class="col-lg-10 my-auto bigfont">Annonces à traiter</div>
				<div class="col-lg-2 text-center">
					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle" type="button" id="moderationSort"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Trier
						</button>
						<div class="dropdown-menu" aria-labelledby="moderationSort">
							<a class="dropdown-item" href="">Date / plus récents</a>
							<a class="dropdown-item" href="">Date / plus anciennes</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ANNONCES  -->
	<section class="shadow">
		<div class="container-fluid">
			<section class="row">
				<div class="col-lg-12 sectiontitle">
					<div class="row">
						<div class="col-lg-9 text-center my-auto">
							<div class="row">
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Type de bien / Surface</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Ville</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Prix</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Date de dépôt</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 text-center my">
						</div>
					</div>
				</div>
			</section>
			<section class="row border">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-9 text-center my-auto">
							<div class="row">
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Maison 150m²</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Paris 15e</div>
								</div>
								<div class="col-lg-3 text-center my-auto" data-type="price">
									<div class="text-center">1500000 €</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">29/02/2019</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 text-center my-auto" id="submit">
							<input class="btn btn-info adShow" data-toggle="collapse" href="#adModeration1"
								type="submit" value="Montrer">
						</div>
					</div>
					<div class="row collapse" id="adModeration1">
						<div class="col-lg-10 offset-lg-1">
							<section>
								<div class="row annoncedetail">
									<div class="col-lg-7">
										<div class="row">
											<div class="col-lg-1 my-auto"><a href=""><i
														class="fas fa-chevron-left"></i></a>
											</div>
											<div class="col-lg-10"><img src="images/diapo1.jpg" class="img-fluid">
											</div>
											<div class="col-lg-1 my-auto"><a href=""><i
														class="fas fa-chevron-right"></i></a>
											</div>
										</div>
									</div>
									<div class="col-lg-5 text-center my-auto">
										<div class="row">
											<div class="col-lg-12 text-center">
												<div data-type="detail-realestate">Maison 10 pièces</div>
												<div>370 m²</div>
												<div>Paris 2eme (75002)</div>
												<div data-type="detail-price">1736000 €</div>
												<div>Postée le 29/02/2019</a></div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div><a href=""><i class="far fa-heart"></i> Favoris</a></div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<section>
								<div class="row">
									<div class="col-lg-12 text-center sectiontitle">
										Description
									</div>
									<div class="col-lg-12 text-justify">
										<div>Blah.</div>
										<div>Contacter Mr GERARD agent commercial.</div>
									</div>
								</div>
							</section>

							<!-- OPTIONS -->
							<section>
								<div class="row">
									<div class="col-lg-12 text-center sectiontitle">
										Options
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" data-option="optionsHouse">
										<div class="row">
											<div class="col-lg-4 ok">
												<i class="far fa-bell"></i> Alarme <i class="fas fa-check"></i>
											</div>
											<div class="col-lg-4 nok">
												<i class="fas fa-wine-bottle"></i> Cave <i class="fas fa-times"></i>
											</div>
											<div class="col-lg-4 ok">
												<i class="fas fa-swimming-pool"></i> Piscine <i
													class="fas fa-check"></i>
											</div>
										</div>
									</div>
								</div>
							</section>

							<!-- ENERGETIQUE  -->
							<section>
								<div class="row">
									<div class="col-lg-12 text-center sectiontitle">
										Diagnostic énergétique
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" data-option="optionsEnergy">
										<div class="row">
											<div class="col-lg-6 energy-d">
												<i class="far fa-lightbulb"></i> Consommation énergétique :
												D</i>
											</div>
											<div class="col-lg-6 gas-d">
												<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
												D</i>
											</div>
										</div>
									</div>
								</div>
							</section>

							<!-- VALIDATION / REFUS -->
							<section class="shadow">
								<form action="" method="POST">
									<div class="row">
										<div class="col-lg-4 offset-lg-4 text-center my-auto">
											<input class="btn btn-info" type="submit" value="Valider">
											<input class="btn btn-info" type="submit" value="Refuser">
											<div class="form-group text-center my-auto adRefus">
												<label for="refus">Raison du refus :</label>
												<textarea class="form-control" id="refus" rows="3"></textarea>
											</div>
										</div>
									</div>
									<input type="hidden" data-adid="1">
								</form>
							</section>
						</div>
					</div>
				</div>
			</section>

			<section class="row border">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-9 text-center my-auto">
							<div class="row">
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Maison 150m²</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Paris 15e</div>
								</div>
								<div class="col-lg-3 text-center my-auto" data-type="price">
									<div class="text-center">1500000 €</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">29/02/2019</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 text-center my-auto" id="submit">
							<input class="btn btn-info adShow" data-toggle="collapse" href="#adModeration1"
								type="submit" value="Montrer">
						</div>
					</div>
					<div class="row collapse" id="adModeration2">
						<div class="col-lg-10 offset-lg-1">
							<section>
								<div class="row annoncedetail">
									<div class="col-lg-7">
										<div class="row">
											<div class="col-lg-1 my-auto"><a href=""><i
														class="fas fa-chevron-left"></i></a>
											</div>
											<div class="col-lg-10"><img src="images/diapo1.jpg" class="img-fluid">
											</div>
											<div class="col-lg-1 my-auto"><a href=""><i
														class="fas fa-chevron-right"></i></a>
											</div>
										</div>
									</div>
									<div class="col-lg-5 text-center my-auto">
										<div class="row">
											<div class="col-lg-12 text-center">
												<div data-type="detail-realestate">Maison 10 pièces</div>
												<div>370 m²</div>
												<div>Paris 2eme (75002)</div>
												<div data-type="detail-price">1736000 €</div>
												<div>Postée le 29/02/2019</a></div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div><a href=""><i class="far fa-heart"></i> Favoris</a></div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<section>
								<div class="row">
									<div class="col-lg-12 text-center sectiontitle">
										Description
									</div>
									<div class="col-lg-12 text-justify">
										<div>Blah.</div>
										<div>Contacter Mr GERARD agent commercial.</div>
									</div>
								</div>
							</section>

							<!-- OPTIONS -->
							<section>
								<div class="row">
									<div class="col-lg-12 text-center sectiontitle">
										Options
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" data-option="optionsHouse">
										<div class="row">
											<div class="col-lg-4 ok">
												<i class="far fa-bell"></i> Alarme <i class="fas fa-check"></i>
											</div>
											<div class="col-lg-4 nok">
												<i class="fas fa-wine-bottle"></i> Cave <i class="fas fa-times"></i>
											</div>
											<div class="col-lg-4 ok">
												<i class="fas fa-swimming-pool"></i> Piscine <i
													class="fas fa-check"></i>
											</div>
										</div>
									</div>
								</div>
							</section>

							<!-- ENERGETIQUE  -->
							<section>
								<div class="row">
									<div class="col-lg-12 text-center sectiontitle">
										Diagnostic énergétique
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12" data-option="optionsEnergy">
										<div class="row">
											<div class="col-lg-6 energy-d">
												<i class="far fa-lightbulb"></i> Consommation énergétique :
												D</i>
											</div>
											<div class="col-lg-6 gas-d">
												<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
												D</i>
											</div>
										</div>
									</div>
								</div>
							</section>

							<!-- VALIDATION / REFUS -->
							<section class="shadow">
								<form action="" method="POST">
									<div class="row">
										<div class="col-lg-4 offset-lg-4 text-center my-auto">
											<input class="btn btn-info" type="submit" value="Valider">
											<input class="btn btn-info" type="submit" value="Refuser">
											<div class="form-group text-center my-auto adRefus">
												<label for="refus">Raison du refus :</label>
												<textarea class="form-control" id="refus" rows="3"></textarea>
											</div>
										</div>
									</div>
									<input type="hidden" data-adid="2">
								</form>
							</section>
						</div>
					</div>
				</div>
			</section>

		</div>
	</section>


	<!-- FOOTER -->
	<%@ include file="footer.jsp" %>
	
</body>

</html>