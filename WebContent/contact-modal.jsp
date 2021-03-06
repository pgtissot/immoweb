<div class="modal fade" id="contactAdvertiserModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<section class="shadow">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-12 closeX">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true"><i class="far fa-window-close"></i></span>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 text-center sectiontitle">
							<i class="far fa-envelope"></i>
							Contacter le vendeur : <c:out value="${ad.advertiser.username}" />
						</div>
					</div>
					<form action="" method="POST" class="was-validated" id="contactAdvertiser">
						<div class="row form-group">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg text-left">
										<label>Email* :</label>
									</div>
								</div>
								<div class="row">
									<div class="col-lg">
										<input class="form-control" type="email" name="username" id="username" required>
										<div class="valid-feedback">Valide.</div>
										<div class="invalid-feedback">Le format de
											l'email est invalide.</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg text-left">
										<label>Message* :</label>
									</div>
								</div>
								<div class="row">
									<div class="col-lg">
										<textarea class="form-control" aria-label="message" rows="10"
											aria-describedby="message" required></textarea>
										<div class="valid-feedback">Valide.</div>
										<div class="invalid-feedback">Le message est
											vide.</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-info" value="Envoyer">
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
</div>