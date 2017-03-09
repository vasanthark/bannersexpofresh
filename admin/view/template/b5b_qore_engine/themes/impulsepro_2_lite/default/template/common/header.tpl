<?php
	$current_section = '';
	if($b5b_qore_engine_route){
		$current_section = explode('/', $b5b_qore_engine_route);
	}

	$is_homepage = FALSE;

	if(($current_section) && ($current_section[0] == 'common') && ($current_section[1] == 'dashboard')){
		$is_homepage = TRUE;
	}
?>
<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/images/favicon.ico" rel="icon" />

	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>" />

	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	
	<!-- Google Font - Raleway -->
	<link href="http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet" type="text/css">

	<!-- Bootstrap -->
	<link href="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- NProgress -->
	<link href="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/nprogress/nprogress.css" rel="stylesheet">
	<!-- Animate.css -->
	<link href="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/animate.css/animate.min.css" rel="stylesheet">

	<?php if (!$logged) { ?>
    <!-- JQVMap -->
    <link href="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/jqvmap/jqvmap.min.css" rel="stylesheet"/>
	<?php } ?>
	<!-- Custom Theme Style -->
	<link href="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/css/custom.css" rel="stylesheet">

	<!-- Datetime Picker -->
	<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />

	<!-- OpenCart Added Styles -->
	<?php foreach ($styles as $style) { ?>
		<link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>

	<!-- jQuery -->
	<script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/fastclick/fastclick.js"></script>
	<!-- NProgress -->
	<script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/nprogress/nprogress.js"></script>

    <!-- Datetime Picker -->
	<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
	<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

	<?php if(($logged) && ($is_homepage)){ ?>

    <!-- Flot -->
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/Flot/jquery.flot.js"></script>
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/Flot/jquery.flot.pie.js"></script>
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/Flot/jquery.flot.time.js"></script>
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/Flot/jquery.flot.stack.js"></script>
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/Flot/jquery.flot.resize.js"></script>

    <!-- Flot plugins -->
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/flot.orderbars/jquery.flot.orderBars.js"></script>
    <script type="text/javascript" src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/flot.tooltips/jquery.flot.tooltip.min.js"></script>

    <!-- JQVMap -->
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/jqvmap/maps/jquery.vmap.world.js"></script>
    <?php } ?>

    <?php if ($logged) { ?>
    <!-- Chart.js -->
    <script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/plugins/Chart.js/Chart.min.js"></script>
    <?php } ?>

	<!-- Custom Theme Scripts -->
	<script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/js/impulsepro_script.js"></script>

	<!-- OpenCart Added Scripts -->
	<?php foreach ($scripts as $script) { ?>
		<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>
</head>
<?php
if (!$logged) {
	?>
	<body class="login">
	<?php
}else{

	if(!$is_homepage){
		$class = 'not-homepage';
	}else{
		$class = 'homepage';
	}

	?>
	<body class="nav-md <?php echo $class; ?>">
		<div class="container body">
			<div class="main_container">

				<!-- top navigation -->
				<div class="top_nav">
					<div class="nav_menu">
						<nav>
							<div class="nav toggle">
								<a id="menu_toggle"><i class="fa fa-bars"></i></a>
							</div>

							<ul class="nav navbar-nav navbar-right">
								<li>
									<a href="<?php echo $logout; ?>">
										<span class="hidden-xs">
											<?php echo $text_logout; ?>
										</span>
										&nbsp;&nbsp;<i class="fa fa-sign-out"></i>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										<?php if ($image) { ?>
											<img src="<?php echo $image; ?>" alt="<?php echo $firstname; ?> <?php echo $lastname; ?>" title="<?php echo $username; ?>">
										<?php } else { ?>
											<i class="fa fa-opencart"></i>
										<?php } ?>
										<span class="hidden-xs"><?php echo $firstname; ?> <?php echo $lastname; ?></span>
										<span class=" fa fa-angle-down"></span>
									</a>
									<ul class="dropdown-menu dropdown-usermenu pull-right">
										<li class="dropdown-header"><h3><?php echo $text_store; ?> <i class="fa fa-shopping-cart"></i> </h3></li>
										<?php foreach ($stores as $store) { ?>
										<li><a href="<?php echo $store['href']; ?>" target="blank"><?php echo $store['name']; ?></a></li>
										<?php } ?>
										<li role="separator" class="divider"></li>										
									</ul>
								</li>
								<li role="presentation" class="dropdown">
									<a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
										<i class="fa fa-bell"></i>
										<?php if($alerts > 0) { ?>
											<span class="badge bg-green"><?php echo $alerts; ?></span>
										<?php } ?>
									</a>
									<ul id="menu1"  class="dropdown-menu dropdown-orders pull-right">
										<li class="dropdown-header"><h3><?php echo $text_order; ?> <i class="fa fa-list-alt"></i> </h3></li>
										<li>
											<a href="<?php echo $processing_status; ?>">
												<span class="badge bg-orange pull-right"><?php echo $processing_status_total; ?></span>
												<span><?php echo $text_processing_status; ?></span>
											</a>
										</li>
										<li>
											<a href="<?php echo $complete_status; ?>">
												<span class="badge bg-green pull-right"><?php echo $complete_status_total; ?></span>
												<span><?php echo $text_complete_status; ?></span>
											</a>
										</li>
										<li>
											<a href="<?php echo $return; ?>">
												<span class="badge bg-red pull-right"><?php echo $return_total; ?></span>
												<span><?php echo $text_return; ?></span>
											</a>
										</li>
										<li role="separator" class="divider"></li>
										<li class="dropdown-header"><h3><?php echo $text_customer; ?> <i class="fa fa-user"></i> </h3></li>
										<li>
											<a href="<?php echo $online; ?>">
												<span class="badge bg-green pull-right"><?php echo $online_total; ?></span>
												<span><?php echo $text_online; ?></span>
											</a>
										</li>
										<li>
											<a href="<?php echo $customer_approval; ?>">
												<span class="badge bg-red pull-right"><?php echo $customer_total; ?></span>
												<span><?php echo $text_approval; ?></span>
											</a>
										</li>
										<li role="separator" class="divider"></li>
										<li class="dropdown-header"><h3><?php echo $text_product; ?> <i class="fa fa-cube"></i> </h3></li>
										<li>
											<a href="<?php echo $product; ?>">
												<span class="badge bg-red pull-right"><?php echo $product_total; ?></span>
												<span><?php echo $text_stock; ?></span>
											</a>
										</li>
										<li>
											<a href="<?php echo $review; ?>">
												<span class="badge bg-red pull-right"><?php echo $review_total; ?></span>
												<span><?php echo $text_review; ?></span>
											</a>
										</li>
										<li role="separator" class="divider"></li>
										<li class="dropdown-header"><h3><?php echo $text_affiliate; ?> <i class="fa fa-users"></i> </h3></li>
										<li>
											<a href="<?php echo $affiliate_approval; ?>">
												<span class="badge bg-red pull-right"><?php echo $affiliate_total; ?></span>
												<span><?php echo $text_approval; ?></span>
											</a>
										</li>
									</ul>
								</li>
								<li class="unclickable">
									<?php echo $user_group; ?>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- /top navigation -->
	<?php
}
?>