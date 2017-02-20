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
      <div class="body-cont1 body-cont1-product">  
                    <?php if ($products) { ?>

                    <div class="row">
                        <?php foreach ($products as $product) { ?>       
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                            <div class="thumbnail-cont">
                                <div class="product-thumbnails"> <a href="<?php echo $product['action']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
                                <div class="product-thumbnails-txt product-list-txt"> <span><a href="<?php echo $product['action']; ?>"><?php echo $product['name']; ?></a></span>
                                    <div class="row">    
                                        <form name="feature-product-form"  action="<?php echo $product['action']; ?>" method="post" enctype="multipart/form-data">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 ">
                                                <?php 
                                                $options = $product['options'];
                                                if ($options){                        
                                                ?> 
                                               <select class="selectpicker" name="feature_size_option">
                                                    <option>What Size?</option>
                                                    <?php foreach ($options['product_option_value'] as $option_value) 
                                                    { ?>
                                                    <option value="<?php echo $option_value['product_option_value_id']; ?>">
                                                        <?php echo $option_value['name']; ?>
                                                    </option>
                                                    <?php 
                                                    } ?>
                                                </select>
                                                <?php                      
                                                } ?> 
                                            </div>                 
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <div  class="order-btn"><a href="javascript:void(0);" ><img src="catalog/view/theme/bannersexpo/images/featured-cart.png" alt="Order now"> Order now</a></div>
                                            </div> 
                                        </form>
                                    </div>
                                </div>    
                            </div>
                        </div>    
                        <?php } ?>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 text-right"><?php echo $pagination; ?></div>
                        <div class="col-sm-12 text-right"><?php echo $results; ?></div>
                    </div>
                    <?php } else { ?>
                    
                    <p><?php echo $text_empty; ?></p>
                    
                    <?php } ?>
                  
       </div>
     </div>
    </div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function () {
        url = 'index.php?route=product/search';

        var search = $('#content input[name=\'search\']').prop('value');

        if (search) {
            url += '&search=' + encodeURIComponent(search);
        }

        var category_id = $('#content select[name=\'category_id\']').prop('value');

        if (category_id > 0) {
            url += '&category_id=' + encodeURIComponent(category_id);
        }

        var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

        if (sub_category) {
            url += '&sub_category=true';
        }

        var filter_description = $('#content input[name=\'description\']:checked').prop('value');

        if (filter_description) {
            url += '&description=true';
        }

        location = url;
    });

    $('#content input[name=\'search\']').bind('keydown', function (e) {
        if (e.keyCode == 13) {
            $('#button-search').trigger('click');
        }
    });

    $('select[name=\'category_id\']').on('change', function () {
        if (this.value == '0') {
            $('input[name=\'sub_category\']').prop('disabled', true);
        } else {
            $('input[name=\'sub_category\']').prop('disabled', false);
        }
    });
    
    $('form .order-btn').on({
        click: function (event) {
            event.preventDefault();
            $(this).closest('form').submit();
        }
    });

    $('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>