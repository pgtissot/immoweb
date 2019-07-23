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
	<header>
		<%@ include file="header.jsp"%>
	</header>

	<!-- NAV -->
	<div id="container">

		<!-- CONTENT -->
		<div id="welcome">
			<section class="shadow">
				<div class="container-fluid" id="searchheader">
					<div class="row">
						<div class="col-lg-12 my-auto bigfont text-center">Bonjour
							[PRENOM], voici ta page personnelle!</div>
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
												<span>Mme/M</span>
											</div>
											<div class="col-lg-2">
												<span>Ton nom</span>
											</div>
											<div class="col-lg-2">
												<span>Ton prenom:</span>
											</div>
											<div class="col-lg-3">
												<span>Email@youremail.com</label>
											</div>
											<div class="col-lg-2">
												<span>123456789</span>
											</div>
											<div class="col-lg-2 text-rigth">
												<Button id="modDataButton" class="btn btn-primary">
													Modify</button>
											</div>

										</div>

									</div>
								</section>
							</div>

						</div>
					</div>
					<div class="row" id="modData">
						<div class="col-lg-12">

							<header>
								Modification donneés <span class="float-right"><i
									class="far fa-window-close"></i></span>
							</header>

							<div class="col-lg-4 offset-lg-4">
								<section class="shadow">
									<form name="modificationData" action="#" method="POST"
										class="was-validated">
										<div class="col-lg-12">
											<div class="entete text-center sectiontitle">
												<i class="far fa-edit"></i> Formulaire de modification de
												données
											</div>
										</div>

										<div class="row text-rigth">
											<div class="col-lg-12  form-group">
												<label>Genre:</label> <select class="form-control"
													name="genre" required>
													<option value=""></option>
													<option value="M">Monsieur</option>
													<option value="Mme">Madame</option>
													<option value="JSP">Indécis</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12  form-group">
												<label>Nom:</label> <input class="form-control" type="text"
													name="nom" id="nom" placeholder="Nom" required>
												<div class="valid-feedback">Valide.</div>
												<div class="invalid-feedback">Veuillez remplir ce
													champ.</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12  form-group">
												<label>Prenom:</label> <input class="form-control"
													type="text" name="prenom" id="prenom" placeholder="Prenom"
													required>
												<div class="valid-feedback">Valide.</div>
												<div class="invalid-feedback">Veuillez remplir ce
													champ.</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 form-group">
												<label>Email:</label> <input class="form-control"
													type="email" name="username" id="user" placeholder="Email"
													required>
												<div class="valid-feedback">Valide.</div>
												<div class="invalid-feedback">Veuillez remplir ce
													champ.</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12  form-group">
												<label>Téléphone:</label> <input class="form-control"
													type="tel" name="phone" id="phone"
													pattern="^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$"
													placeholder="Téléphone">
												<div class="valid-feedback">Valide.</div>


											</div>
										</div>

										<div class="row">
											<div class="col-lg-12 form-group">
												<label>Ancienne Password:</label> <input
													class="form-control" type="password" name="password"
													placeholder="Password" required minlength="5">
												<div class="valid-feedback">Valide.</div>
												<div class="invalid-feedback">Au moins 8 caractères
													dont une lettre majuscule, une minuscule et un chiffre.</div>
											</div>
										</div>

										<div class="row">
											<div class="col-lg-12 form-group">
												<label>Nouvelle password:</label> <input
													class="form-control" type="password" name="password"
													placeholder="Password" required minlength="5">
												<div class="valid-feedback">Valide.</div>
												<div class="invalid-feedback">Au moins 8 caractères
													dont une lettre majuscule, une minuscule et un chiffre.</div>
											</div>
										</div>

										<div class="row">
											<div class="col-lg-12 form-group">
												<label>Retapez la nouvelle password:</label> <input
													class="form-control" type="password" name="password"
													placeholder="Password" required minlength="5">
												<div class="valid-feedback">Valide.</div>
												<div class="invalid-feedback">Au moins 8 caractères
													dont une lettre majuscule, une minuscule et un chiffre.</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 form-group">
												<label class=" ml-2">Montrer les password:</label><i
													class="mpass fas fa-eye float-right mr-2 mt-1"> </i>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 form-group">
												<input class="btn btn-primary col-lg-6 offset-lg-3 mt-1"
													type="submit" value="Enregistre">
											</div>

										</div>


									</form>
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
								aria-haspopup="true" aria-expanded="false">Trier
								favoris par</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="#">Prix / croissant</a> <a
									class="dropdown-item" href="#">Prix / décroissant</a> <a
									class="dropdown-item" href="#">Surface / croissant</a> <a
									class="dropdown-item" href="#">Surface / décroissant</a>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4 text-center">
						<article>
							<div class="row">
								<div class="col-lg-12 text-center">
									<a href="detail.jsp">
										<div class="row">
											<div class="col-lg-12 text-center">
												<img src="images/diapo3.jpg" class="img-fluid">
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="row">
													<div class="col-lg-4 text-center my-auto"
														data-type="realestate">
														<div class="text-center">Maison 250m²</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="city">
														<div class="text-center">Perpignan</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="price">
														<div class="text-center">3500000 €</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-lg-4 text-center">
						<article>
							<div class="row">
								<div class="col-lg-12 text-center">
									<a href="detail.jsp">
										<div class="row">
											<div class="col-lg-12 text-center">
												<img src="images/diapo4.jpg" class="img-fluid">
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="row">
													<div class="col-lg-4 text-center my-auto"
														data-type="realestate">
														<div class="text-center">Appartement 75m²</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="city">
														<div class="text-center">Toulouse</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="price">
														<div class="text-center">200000 €</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-lg-4 text-center">
						<article>
							<div class="row">
								<div class="col-lg-12 text-center">
									<a href="detail.jsp">
										<div class="row">
											<div class="col-lg-12 text-center">
												<img src="images/diapo3.jpg" class="img-fluid">
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="row">
													<div class="col-lg-4 text-center my-auto"
														data-type="realestate">
														<div class="text-center">Maison 250m²</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="city">
														<div class="text-center">Perpignan</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="price">
														<div class="text-center">3500000 €</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</article>
					</div>
				</div>



			</div>
		</div>


	</section>
	</div>
	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>
</body>

</html>