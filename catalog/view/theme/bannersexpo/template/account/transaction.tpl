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

                        <p><?php echo $text_total; ?> <b><?php echo $total; ?></b>.</p>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $column_date_added; ?></td>
                                        <td class="text-left"><?php echo $column_description; ?></td>
                                        <td class="text-right"><?php echo $column_amount; ?></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if ($transactions) { ?>
                                    <?php foreach ($transactions  as $transaction) { ?>
                                    <tr>
                                        <td class="text-left"><?php echo $transaction['date_added']; ?></td>
                                        <td class="text-left"><?php echo $transaction['description']; ?></td>
                                        <td class="text-right"><?php echo $transaction['amount']; ?></td>
                                    </tr>
                                    <?php } ?>
                                    <?php } else { ?>
                                    <tr>
                                        <td class="text-center" colspan="5"><?php echo $text_empty; ?></td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                        </div>
                        <div class="buttons clearfix">
                            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                        </div>
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