	<?php
		if ($logged) { ?>
					</div>
					<!-- /page content -->
				</div>
			</div>
			<!-- footer content -->
			<footer>
				<div class="">
					<?php echo $b5b_qore_engine['language']['text_theme_version']; ?>
					<br />
					<?php echo $text_version; ?>
					<br />
					<?php echo $b5b_qore_engine['language']['text_created_by']; ?>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
	<?php } ?>

	<!-- Custom Theme Scripts -->
	<script src="view/template/b5b_qore_engine/themes/<?php echo $b5b_qore_engine_active_theme_path; ?>/js/custom.js"></script>
	</body>
</html>