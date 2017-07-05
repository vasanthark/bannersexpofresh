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
              <div class="row">
      <?php if ($returns) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right"><?php echo $column_return_id; ?></td>
              <td class="text-left"><?php echo $column_status; ?></td>
              <td class="text-left"><?php echo $column_date_added; ?></td>
              <td class="text-right"><?php echo $column_order_id; ?></td>
              <td class="text-left"><?php echo $column_customer; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($returns as $return) { ?>
            <tr>
              <td class="text-right">#<?php echo $return['return_id']; ?></td>
              <td class="text-left"><?php echo $return['status']; ?></td>
              <td class="text-left"><?php echo $return['date_added']; ?></td>
              <td class="text-right"><?php echo $return['order_id']; ?></td>
              <td class="text-left"><?php echo $return['name']; ?></td>
              <td class="text-right"><a href="<?php echo $return['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
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
