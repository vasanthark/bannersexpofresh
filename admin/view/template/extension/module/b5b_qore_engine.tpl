<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $b5b_qore_engine['language']['button_done']; ?>" class="btn btn-success"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $b5b_qore_engine['language']['heading_title']; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>


    <div class="col-md-12 profile_details">
    	<div class="well profile_view clearfix">
    		<div class="col-sm-12">
    			<div class="right col-sm-3 text-center">
    				<img class="img-circle img-responsive" alt="" src="view/template/b5b_qore_engine/assets/images/thumb.jpg">
    			</div>
    			<div class="left col-sm-9">
    				<br />
    				<p><?php echo $b5b_qore_engine['language']['text_qoreengine_desc']; ?></p>
    				<br />
    				<a href="https://base5builder.com/index.php?route=marketing/landing/qore_engine&click_source=qore_engine_theme_list_impulsepro_v2" class="btn btn-info" target="blank" type="button">
    					<i class="fa fa-envelope"> </i> <?php echo $b5b_qore_engine['language']['button_newsletter_signup']; ?>
    				</a>
    			</div>
    		</div>
    	</div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $b5b_qore_engine['language']['text_edit']; ?></h3>
      </div>
      <div class="panel-body">
      	<?php
      		foreach($theme_info as $info){
      			?>
		      	<div class="col-md-12 profile_details" data-theme-name="<?php echo $info['cleanname']; ?>">
		      		<div class="well profile_view clearfix">
		      			<div class="col-sm-12">
		      				<h4 class="brief">
		      					<?php if($info['status']){ ?>
		      						<i><?php echo $b5b_qore_engine['language']['entry_status']; ?>: <b class="text-success"><?php echo $b5b_qore_engine['language']['text_enabled']; ?></b></i>
		      					<?php }else{ ?>
		      						<i><?php echo $b5b_qore_engine['language']['entry_status']; ?>: <b class="text-danger"><?php echo $b5b_qore_engine['language']['text_disabled']; ?></b></i>
		      					<?php } ?>
		      				</h4>
		      				<div class="right col-sm-4 col-sm-push-8 text-center">
		      					<img class="img-circle img-responsive" alt="" src="<?php echo  $info['thumb']; ?>">
		      				</div>
		      				<div class="left col-sm-8 col-sm-pull-4">
		      					<h2><?php echo $info['name']; ?></h2>
		      					<p><?php echo $info['description']; ?></p>
		      					<hr />
		      					<table class="table theme-property">
		      						<tr>
		      							<td class="theme-property-title">
		      								<i class="fa fa-info-circle"></i>
		      								<?php echo $b5b_qore_engine['language']['text_version']; ?>:
		      							</td>
		      							<td class="theme-property-value">
		      								<?php echo $info['version']; ?>
		      							</td>
		      						</tr>
		      						<tr>
		      							<td class="theme-property-title">
		      								<i class="fa fa-user"></i>
		      								<?php echo $b5b_qore_engine['language']['text_creator']; ?>:
		      							</td>
		      							<td class="theme-property-value">
		      								<?php echo  $info['developer']; ?>
		      							</td>
		      						</tr>
		      						<tr>
		      							<td class="theme-property-title">
		      								<i class="fa fa-link"></i> <?php echo $b5b_qore_engine['language']['text_website']; ?>:
		      							</td>
		      							<td class="theme-property-value">
		      								<a href="<?php echo $info['website']; ?>" target="blank">
		      									<?php echo  $info['website']; ?>
		      								</a>
		      							</td>
		      						</tr>
		      					</table>
		      				</div>
		      			</div>
		      			<div class="col-xs-12 bottom">
		      				<div class="col-xs-12 col-sm-6 emphasis">
		      					<?php if(!$info['status']){ ?>
			      					<a href="#" class="btn btn-primary enable-theme" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Enabling Theme...">
			      						<i class="fa fa-check"> </i> <?php echo $b5b_qore_engine['language']['text_enable']; ?>
			      					</a>
		      					<?php } ?>
		      				</div>
		      			</div>
		      		</div>
		      	</div>
      			<?php
      		}
      	?>

      	<div class="col-md-12 profile_details" data-theme-name="default_opencart_theme">
      		<div class="well profile_view clearfix">
      			<div class="col-sm-12">
      				<h4 class="brief">
      					<?php if($active_theme == 'default_opencart_theme'){ ?>
      						<i><?php echo $b5b_qore_engine['language']['entry_status']; ?>: <b class="text-success"><?php echo $b5b_qore_engine['language']['text_enabled']; ?></b></i>
      					<?php }else{ ?>
      						<i><?php echo $b5b_qore_engine['language']['entry_status']; ?>: <b class="text-danger"><?php echo $b5b_qore_engine['language']['text_disabled']; ?></b></i>
      					<?php } ?>
      				</h4>
      				<div class="right col-sm-4 col-sm-push-8 text-center">
      					<img class="img-circle img-responsive" alt="" src="view/template/b5b_qore_engine/themes/default_opencart_theme/thumb.jpg">
      				</div>
      				<div class="left col-sm-8 col-sm-pull-4">
      					<h2><?php echo $b5b_qore_engine['language']['text_default_theme']; ?></h2>
      					<p><?php echo $b5b_qore_engine['language']['text_default_theme_desc']; ?></p>
      					<hr />
      					<table class="table theme-property">
      						<tr>
      							<td class="theme-property-title">
      								<i class="fa fa-info-circle"></i>
      								<?php echo $b5b_qore_engine['language']['text_version']; ?>:
      							</td>
      							<td class="theme-property-value">
      								<?php echo VERSION; ?>
      							</td>
      						</tr>
      						<tr>
      							<td class="theme-property-title">
      								<i class="fa fa-user"></i>
      								<?php echo $b5b_qore_engine['language']['text_creator']; ?>:
      							</td>
      							<td class="theme-property-value">
      								<?php echo $b5b_qore_engine['language']['text_default_theme_creator']; ?>
      							</td>
      						</tr>
      						<tr>
      							<td class="theme-property-title">
      								<i class="fa fa-link"></i> <?php echo $b5b_qore_engine['language']['text_website']; ?>:
      							</td>
      							<td class="theme-property-value">
      								<a href="<?php echo $b5b_qore_engine['language']['text_default_theme_website']; ?>" target="blank">
      									<?php echo $b5b_qore_engine['language']['text_default_theme_website']; ?>
      								</a>
      							</td>
      						</tr>
      					</table>
      				</div>
      			</div>
      			<div class="col-xs-12 bottom">
      				<div class="col-xs-12 col-sm-6 emphasis">
      				<?php if($active_theme != 'default_opencart_theme'){ ?>
      					<a href="#" class="btn btn-primary enable-theme" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Enabling Theme...">
      						<i class="fa fa-check"> </i> <?php echo $b5b_qore_engine['language']['text_enable']; ?>
      					</a>
      				<?php } ?>
      				</div>
      			</div>
      		</div>
      	</div>

      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 