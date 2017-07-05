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
                        <?php echo $text_message; ?>
                        <div class="buttons">
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
<script>       
<?php
if(isset($gaTracking)) {
    if($gaTracking) {                
        echo "ga('require', 'ecommerce', 'ecommerce.js');" . "\n";
        echo $gaTracking;
        echo "ga('ecommerce:send');" . "\n";
    }
}
?>   
</script>
<?php echo $footer; ?>