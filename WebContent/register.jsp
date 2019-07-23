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


	<div id="container">
		<!-- ENTETE HEADER -->
		<%@ include file="header.jsp" %>

		<!-- CONTENT -->
		<div>
			<div class="col-lg-4 offset-lg-4">
				<section class="shadow">
					<div class="col-lg-12">
						<div class="entete text-center sectiontitle"><i class="far fa-edit"></i> Formulaire de crÃ©ation de compte</div>
					</div>
					<!-- form registration -->
					<form name="register" method="POST" action="#">
						<div class="padding">
							<div class="row  form-group justify-content-center">
								<div class="col-lg-3">
									<div class="form-check form-check-inline">

										<input class="form-check-input" type="radio" name="genre" value="Mme">
										<label class="form-check-label">Madame</label>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="genre" value="M">
										<label class="form-check-label">Monsieur</label>
									</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-lg-6">
									<div class="row">
										<div class="col-lg">
											<label>Nom*</label>
										</div>
									</div>
									<div class="row">
										<div class="col-lg">
											<input class="form-control" type="text" name="nom" id="nom"
												placeholder="Nom" required>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="row">
										<div class="col-lg">
											<label>PrÃ©nom*</label>
										</div>
									</div>
									<div class="row">
										<div class="col-lg">
											<input class="form-control" type="text" name="prenom" id="prenom"
												placeholder="Prenom" required>
										</div>
									</div>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-lg-6">
									<div class="row">
										<div class="col-lg">
											<label>Email*</label>
										</div>
									</div>
									<div class="row">
										<div class="col-lg">
											<input class="form-control" type="email" name="username" id="user"
												placeholder="Email" required>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="row">
										<div class="col-lg">
											<label>Password*</label>
										</div>
									</div>
									<div class="row">
										<div class="col-lg">
											<input class="form-control" type="password" name="password" id="psd"
												placeholder="Password (min 5 caractÃ¨res)" required minlength="5">
										</div>
									</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-lg-12 ">
									<div class="row">
										<div class="col-lg">
											<label>TÃ©lÃ©phone</label>
										</div>
									</div>
									<div class="row">
										<div class="col-lg">
											<input class="form-control" type="tel" name="phone" id="phone"
												pattern="^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$"
												placeholder="TÃ©lÃ©phone">
										</div>
									</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-lg-12">
									<label>Choisissez le type de compte que vous souhaitez </label>
									<select class="form-control" name="user_type" id="user_type">
									</select>

									<span id="hidemoderator">
										<label> Nom de moderateur: </label>
										<input class="form-control" type="text" name="name" id="name">
									</span>
								</div>
							</div>
							<div class="row form-group ">
								<div class="col-lg-12">
									<div class="form-check form-check-inline">
										<input type="checkbox" class="form-check-input" name="accord" value="true"
											required>
										<span>J'accepte les <a target="_blank" href="cgv.html"> conditions </a> </span>
									</div>
								</div>
							</div>
							<div class="row form-group justify-content-center">
								<div class="col-lg-12">
									<input class="btn btn-primary col-lg-12" type="submit" value="Enregistrer">
								</div>
							</div>
							<div class="row  form-group justify-content-center">
								<span>
									Tu as deja un compte?<a href="login.html"> Log in!</a>
								</span>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
		<!-- FOOTER -->
		<footer>

		<%@ include file="footer.jsp" %>

		</footer>
	</div>
</body>


</html>