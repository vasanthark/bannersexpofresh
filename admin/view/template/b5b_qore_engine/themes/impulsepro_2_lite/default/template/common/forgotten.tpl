<?php echo $header; ?>
<div>
	<a class="hiddenanchor" id="signup"></a>
	<a class="hiddenanchor" id="signin"></a>

	<div class="login_logo">
		<img width="180" src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/images/logo.png">
	</div>
	<div class="login_notifications">
		<?php if ($error_warning) { ?>
			<div role="alert" class="alert alert-danger alert-dismissible fade in">
				<button aria-label="Close" data-dismiss="alert" class="close" type="button"><span aria-hidden="true">×</span>
				</button>
				<?php echo $error_warning; ?>
			</div>
		<?php } ?>
	</div>
	<div class="login_wrapper">
		<div class="animate form login_form">
			<section class="login_content">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
					<div class="login_heading">
						<h1>
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<span><?php echo $heading_title; ?></span>
						</h1>
					</div>
					<div class="login_field">
						<label for="input-email"><i class="fa fa-envelope"></i> <?php echo $entry_email; ?></label>
						<input type="email" id="input-email" class="form-control" name="email" placeholder="<?php echo $entry_email; ?>" required="" value="<?php echo $email; ?>" />
					</div>
					<div class="login_buttons">
						<a class="reset_pass" href="<?php echo $cancel; ?>"><?php echo $b5b_qore_engine['language']['button_password_remembered']; ?></a>
						<button type="submit" class="btn btn-success btn-lg btn-block submit"><i class="fa fa-refresh"></i> <?php echo $button_reset; ?></button>
					</div>
				</form>
			</section>
		</div>
	</div>
</div>
<?php echo $footer; ?>