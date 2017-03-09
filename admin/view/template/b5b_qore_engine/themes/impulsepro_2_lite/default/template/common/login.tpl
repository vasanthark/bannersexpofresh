<?php echo $header; ?>
<div>
	<a class="hiddenanchor" id="signup"></a>
	<a class="hiddenanchor" id="signin"></a>

	<div class="login_logo">
		<img width="180" src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/images/logo.png">
	</div>
	<div class="login_notifications">
		<?php if ($success) { ?>
			<div role="alert" class="alert alert-success alert-dismissible fade in">
				<button aria-label="Close" data-dismiss="alert" class="close" type="button"><span aria-hidden="true">×</span>
				</button>
				<?php echo $success; ?>
			</div>
		<?php } ?>
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
							<i class="fa fa-lock" aria-hidden="true"></i>
							<span><?php echo $text_login; ?></span>
						</h1>
					</div>
					<div class="login_field">
						<label for="input-username"><i class="fa fa-user"></i> <?php echo $entry_username; ?></label>
						<input type="text" id="input-username" class="form-control" name="username" placeholder="<?php echo $entry_username; ?>" required="" value="<?php echo $username; ?>" />
					</div>
					<div class="login_field">
						<label for="input-password"><i class="fa fa-lock"></i> <?php echo $entry_password; ?></label>
						<input type="password" id="input-password" class="form-control" name="password" placeholder="<?php echo $entry_password; ?>" required="" value="<?php echo $password; ?>" />
					</div>
					<div class="login_buttons">

						<?php if ($forgotten) { ?>
							<a class="reset_pass" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
						<?php } ?>

						<button type="submit" class="btn btn-success btn-lg btn-block submit"><i class="fa fa-key"></i> <?php echo $button_login; ?></button>

						<?php if ($redirect) { ?>
							<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
						<?php } ?>
					</div>
				</form>
			</section>
		</div>
	</div>
</div>
<?php echo $footer; ?>