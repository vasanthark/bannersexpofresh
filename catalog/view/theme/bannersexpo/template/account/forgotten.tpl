<?php echo $header; ?>
<div class="body-outer-cont">
    <div class="container">
        <div class="row">
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
</div>
<div class="body-cont">
    <div class="container">
        <div class="row">
            <?php echo $content_breadcrumbs; ?>  
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
            <?php } ?>                
                    <div id="content" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <p><?php echo $text_email; ?></p>
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <fieldset>
                                <legend><?php echo $text_your_email; ?></legend>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                                    <div class="col-sm-4">
                                        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                                    </div>
                                </div>
                            </fieldset>
                            <div class="buttons clearfix">     
                                <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                                <div class="pull-right">
                                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>