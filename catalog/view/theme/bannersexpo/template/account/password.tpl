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
                <div class="row">
                    <div id="content" class="col-sm-9">   
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <fieldset>
                                <legend><?php echo $text_password; ?></legend>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                                    <div class="col-sm-4">
                                        <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                                        <?php if ($error_password) { ?>
                                        <div class="text-danger"><?php echo $error_password; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                                    <div class="col-sm-4">
                                        <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                                        <?php if ($error_confirm) { ?>
                                        <div class="text-danger"><?php echo $error_confirm; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="buttons clearfix">
                                <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a></div>
                                <div class="pull-right">
                                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                                </div>
                            </div>
                        </form>
                    </div>
                     <div id="content" class="col-sm-3">
                        <?php echo $column_right; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>