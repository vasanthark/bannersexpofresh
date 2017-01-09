<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-review" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><i class="fa fa-comments"></i> Edit Review</h1>
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Review Info</h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-review" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-author">Name</label>
                        <div class="col-sm-10">
                            <?php echo $firstname; ?>
                        </div>
                    </div>   
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-author">Email</label>
                        <div class="col-sm-10">
                            <?php echo $email; ?>
                        </div>
                    </div> 
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-author">Website</label>
                        <div class="col-sm-10">
                            <?php echo $website; ?>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-text">Comments</label>
                        <div class="col-sm-10">
                            <?php echo $comments; ?>           
                        </div>
                    </div>         
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="status" id="input-status" class="form-control">
                                <?php if ($status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-date-added">Commented On</label>
                        <div class="col-sm-3">
                            <?php echo $date_added; ?>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
  $('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    //--></script>
<style>
    .fa-comments {
        color:#00BFFF;
    }
    .dev-name a{
        color: #CFCFCF;
    }
    .dev-name {
        position: absolute;
        margin-top: 3px;
        margin-left: 200px;
        font-size: 12px;
    }
</style>
<?php echo $footer; ?>