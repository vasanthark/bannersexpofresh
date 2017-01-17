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
            
  <div class="col-lg-12 col-md-12 col-sm-12 xol-xs-12">
                <div class="row">                   
                    <div id="content" class="col-sm-9"> 
                <?php if ($orders) { ?>
                <div class="table-responsive">
                  <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <td class="text-right"><?php echo $column_order_id; ?></td>
                        <td class="text-left"><?php echo $column_customer; ?></td>
                        <td class="text-right"><?php echo $column_product; ?></td>
                        <td class="text-left"><?php echo $column_status; ?></td>
                        <td class="text-right"><?php echo $column_total; ?></td>
                        <td class="text-left"><?php echo $column_date_added; ?></td>
                        <td></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($orders as $order) { ?>
                      <tr>
                        <td class="text-right">#<?php echo $order['order_id']; ?></td>
                        <td class="text-left"><?php echo $order['name']; ?></td>
                        <td class="text-right"><?php echo $order['products']; ?></td>
                        <td class="text-left"><?php echo $order['status']; ?></td>
                        <td class="text-right"><?php echo $order['total']; ?></td>
                        <td class="text-left"><?php echo $order['date_added']; ?></td>
                        <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                  </table>
                </div>
                <div class="row">
                  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
                <?php } else { ?>
                <p><?php echo $text_empty; ?></p>
                <?php } ?>
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
      
<?php echo $footer; ?>
