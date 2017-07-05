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
                <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
                <?php } ?>
                <div class="row">                   
                    <div id="content" class="col-sm-9">
                        <h2><?php echo $text_my_account; ?></h2>
                        <ul class="list-unstyled">
                            <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                            <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                            <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>                            
                        </ul>
                        <?php if ($credit_cards) { ?>
                        <h2><?php echo $text_credit_card; ?></h2>
                        <ul class="list-unstyled">
                            <?php foreach ($credit_cards as $credit_card) { ?>
                            <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
                            <?php } ?>
                        </ul>
                        <?php } ?>
                        <h2><?php echo $text_my_orders; ?></h2>
                        <ul class="list-unstyled">
                            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>   
                            <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                        </ul>
                        <h2><?php echo $text_my_newsletter; ?></h2>
                        <ul class="list-unstyled">
                            <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                        </ul>                        
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