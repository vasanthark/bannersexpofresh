<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <!-- <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button> -->
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-dashboard"></i> <?php echo $text_vqdetails; ?></h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td><?php echo $text_file; ?></td>
                <td><?php echo $text_status; ?></td>
                <td><?php echo $text_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach ($vqmods as $vqmods_key => $vqmods_value) {
              ?>
                <tr>
                  <td><b><?php echo $vqmods_key; ?></b></td>
                  <td>                    
                    <?php 
                      if($vqmods_value) {
                    ?>
                      <span class="btn btn-sm btn-success"><?php echo $text_active; ?></span>
                    <?php
                      } else {
                    ?>
                      <span class="btn btn-sm btn-danger"><?php echo $text_inactive; ?></span>
                    <?php 
                      }
                    ?>
                  </td>
                  <td>
                    <span class="btn btn-sm btn-danger purge-btn" data-vqmod="<?php echo $vqmods_key; ?>"><?php echo $text_purge; ?></span>
                  </td>
                </tr>
              <?php
                }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-dashboard"></i> <?php echo $text_allmodules; ?></h3>
      </div>
      <div class="panel-body">
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $text_vqmod; ?></td>
                <td class="text-left"><?php echo $text_status; ?></td>
                <td class="text-left"><?php echo $text_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach ($vxml as $vxml_value) {
              ?>
                  <tr>
                    <td><?php echo $vxml_value['id']; ?></td>
                    <td>                    
                      <?php
                        if($vxml_value['extension'])
                        {
                      ?>
                        <span class="btn btn-sm btn-success"><?php echo $text_active; ?></span>
                      <?php
                        } else {
                      ?>  
                      <span class="btn btn-sm btn-danger"><?php echo $text_inactive; ?></span>
                      <?php
                        }
                      ?>
                    </td>
                    <td class="text-left">
                      <input type="checkbox" <?php echo $vxml_value['extension'] ? 'checked' : ''; ?>
                             data-toggle = "toggle"
                             data-size = "mini"
                             data-onstyle = "success"
                             data-offstyle = "danger"
                             class = "togglecontrol"
                             data-file = "<?php echo $vxml_value['file']; ?>"
                             data-on = "<?php echo $text_vqmodon; ?>"
                             data-off = "<?php echo $text_vqmodoff; ?>" >
                    </td>
                  </tr>              
              <?php
                }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>


  </div>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>

<script type="text/javascript">
  $(document).on('change','.togglecontrol', function(ev){
    var fileName = $(this).data('file');
    $.ajax({
      url: '<?php echo $ed_controller_url; ?>',
      type: 'POST',
      data: {fileName : fileName},
      success: function(data) {
        window.location.reload();
      }
    });
  });

    $(document).ready(function(){
        $('.purge-btn').on('click', function (ev) {
           var cacheName = $(this).data('vqmod'); alert(cacheName);
            $.ajax({
                url: '<?php echo $ed_purge_controller_url; ?>',
                type: 'POST',
                data: {cacheName : cacheName},
                success: function(data) {
                    window.location.reload();
                }
            });
        });
    });


</script>

<?php echo $footer; ?>