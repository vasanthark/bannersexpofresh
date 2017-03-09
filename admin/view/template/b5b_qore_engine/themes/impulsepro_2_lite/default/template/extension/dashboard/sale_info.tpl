<div class="tile tile_stats_count">
	<span class="count_top">
		<i class="fa fa-credit-card"></i> 
		<?php echo $heading_title; ?>
	</span>
	<div class="count">
		<?php echo $total; ?>
	</div>
	<span class="count_bottom">
		<span class="pull-right">
			<a href="<?php echo $sale; ?>"><?php echo $text_view; ?></a>
		</span>
		<?php if ($percentage >= 0) { ?>
			<i class="green"><?php echo $percentage; ?>%</i> 
			<i class="fa fa-caret-up green"></i>
		<?php } elseif ($percentage < 0) { ?>
			<i class="red"><?php echo $percentage; ?>%</i> 
			<i class="fa fa-caret-up red"></i>
		<?php } ?>
	</span>
</div>