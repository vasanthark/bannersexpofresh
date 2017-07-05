<?php
	if($b5b_qore_engine_route){
		$current_section = explode('/', $b5b_qore_engine_route);
	}
	$menu_active = '';
?>

<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<div class="sidebar-logo">
					<?php foreach ($menus as $key => $menu) { ?>
						<a href="<?php echo $menu['href']; ?>">
							<img class="img-responsive" src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/images/logo.png">
						</a>
					<?php 
						break;
						}
					?>
				</div>
				<ul class="nav side-menu">
					<?php foreach ($menus as $key => $menu) { ?>
						<?php
							$current_menu = explode('-', $menu['id']);
							if(($current_section[0] == $current_menu[1]) || (($current_section[1] == 'dashboard') && ($key == 0))){
								$menu_active = 'active_2';
							}
						?>
						<li id="<?php echo $menu['id']; ?>" class="<?php echo $menu_active; ?>">
							<?php if ($menu['href']) { ?>
								<a href="<?php echo $menu['href']; ?>">
									<i class="fa <?php echo $menu['icon']; ?>"></i> 
									<?php echo $menu['name']; ?> 
								</a>
							<?php } else { ?>
								<a class="parent">
									<i class="fa <?php echo $menu['icon']; ?>"></i> 
									<?php echo $menu['name']; ?> 
									<span class="fa fa-chevron-down"></span>
								</a>
							<?php } ?>
							<?php if ($menu['children']) { ?>
								<ul class="nav child_menu">
									<?php foreach ($menu['children'] as $children_1) { ?>
										<li>
										<?php if ($children_1['href']) { ?>
											<a href="<?php echo $children_1['href']; ?>"><?php echo $children_1['name']; ?></a>
										<?php } else { ?>
											<a class="parent">
												<?php echo $children_1['name']; ?>
												<span class="fa fa-chevron-down"></span>
											</a>
										<?php } ?>
										<?php if ($children_1['children']) { ?>
											<ul class="nav child_menu">
												<?php foreach ($children_1['children'] as $children_2) { ?>
													<li>
														<?php if ($children_2['href']) { ?>
															<a href="<?php echo $children_2['href']; ?>"><?php echo $children_2['name']; ?></a>
														<?php } else { ?>
															<a class="parent">
																<?php echo $children_2['name']; ?>
																<span class="fa fa-chevron-down"></span>
															</a>
														<?php } ?>
														<?php if ($children_2['children']) { ?>
															<ul class="nav child_menu">
																<?php foreach ($children_2['children'] as $children_3) { ?>
																	<li>
																		<a href="<?php echo $children_3['href']; ?>"><?php echo $children_3['name']; ?></a>
																	</li>
																	<?php } ?>
															</ul>
														<?php } ?>
													</li>
												<?php } ?>
											</ul>
										<?php } ?>
										</li>
									<?php } ?>
								</ul>
							<?php } ?>
						</li>
						<?php $menu_active = ''; // resets it ?>
					<?php } ?>
				</ul>
				<div id="stats" class="hidden-xs hidden-sm" data-entry-1-label="<?php echo $text_complete_status; ?>" data-entry-1-value="<?php echo $complete_status; ?>" data-entry-2-label="<?php echo $text_processing_status; ?>" data-entry-2-value="<?php echo $processing_status; ?>" data-entry-3-label="<?php echo $text_other_status; ?>" data-entry-3-value="<?php echo $other_status; ?>">
					<h3><?php echo $b5b_qore_engine['language']['text_order']; ?></h3>
					<canvas id="stats-canvas" height="140" width="140"></canvas>
				</div>
			</div>
		</div>
		<!-- /sidebar menu -->
	</div>
</div>

	<!-- page content -->
	<div class="right_col" role="main">