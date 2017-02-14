<?php echo $header; 
$dispaly_category_id = '59';
?>
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
        <?php if ($products) { 
             $i = 1; ?>
        <?php foreach ($products as $product) { ?>  
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
              <div class="thumbnail-cont">
                <div class="product-thumbnails">             
                   <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>        
                </div>
                <div class="product-thumbnails-txt product-list-txt">
                    <span><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>

                  <div class="row">
                    <form name="feature-product-form"  action="<?php echo $product['action']; ?>" method="post" enctype="multipart/form-data">
                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12"> 
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
            <?php
                if($i%4==0){
                ?>
                <div class="clearfix"></div>
                <?php }
                $i++;
                } ?>  
                <?php if ($category_id != $dispaly_category_id) { ?>
                    <div class="col-sm-12 text-right"><?php echo $pagination; ?></div>                  
                <?php } ?>
            <?php } ?>
            <?php if ($category_id == $dispaly_category_id) { ?>
            <?php foreach ($categories as $category) { ?>  
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
              <div class="thumbnail-cont">
                <div class="product-thumbnails">             
                   <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>"/></a>        
                </div>
                <div class="product-thumbnails-txt product-list-txt">
                    <span><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></span>

                  <div class="row">
                    <form name="feature-product-form"  action="<?php echo $category['action']; ?>" method="post" enctype="multipart/form-data">

                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                            <div  class="order-btn"><a href="<?php echo $category['href']; ?>" ><img src="catalog/view/theme/bannersexpo/images/featured-cart.png" alt="Order now"> Order now</a></div>
                        </div>                    
                        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12"> 
                                                      
                        </div>
                    </form>                                
                  </div>

                </div>


              </div>
                </div>
            <?php
                if($i%4==0){
                ?>
                <div class="clearfix"></div>
                <?php }
                $i++;
                } ?>  
            <div class="col-sm-12 text-right"><?php echo $pagination; ?></div>                  
            <?php } ?>        
            <?php if (!$categories && !$products) { ?>
            <div class="row">
                <div class="text-center"><?php echo $text_empty; ?></div>               
            </div>
            <?php } ?>        
        
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="about-expo">          
          <?php echo $description; ?>          
        </div>
      </div>
    </div>
  </div>  
    <?php echo $content_bottom; ?>
</div>

<script type="text/javascript"><!--
     $(document).ready(function () {
        $('form .order-btn').on({
            click: function (event) {
                event.preventDefault();
                $(this).closest('form').submit();
            }
        });
    });
//--></script>
<?php echo $footer; ?>
