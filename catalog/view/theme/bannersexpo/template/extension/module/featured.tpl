<div class="container">
    <div class="row">
        <div class="body-cont1">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="body-heading">
                    <h2>Our featured product</h2>
                </div>
            </div>
            <?php 
        
            foreach ($products as $product) { ?>
             <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
            <form name="feature-product-form"  action="<?php echo $product['action']; ?>" method="post" enctype="multipart/form-data">               
                    <div class="thumbnail-cont">
                        <div class="product-thumbnails"> 
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>            
                        </div>
                        <div class="product-thumbnails-txt">
                            <p><strong><a href="<?php echo $product['href']; ?>"><?php echo $product['model']; ?></a></strong></p>
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 home-qty ">
                                    <input type="text" class="form-control" name="quantity" placeholder="Qty">
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <div  class="order-btn">                                      
                                        <a href="javascript:void(0);" class="order-btn"><img src="catalog/view/theme/bannersexpo/images/featured-cart.png" alt="Order now"> Order now</a>
                                    </div>
                                </div>                               
                            </div>
                        </div>
                    </div>
                
            </form>   
            </div>
            <?php } ?>
             <?php foreach ($categories as $catinfo) { ?>
             <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
            <form name="feature-product-form"  action="<?php echo $catinfo['action']; ?>" method="post" enctype="multipart/form-data">               
                    <div class="thumbnail-cont">
                        <div class="product-thumbnails"> 
                        <a href="<?php echo $catinfo['action']; ?>"><img src="<?php echo $catinfo['thumb']; ?>" alt="<?php echo $catinfo['name']; ?>" title="<?php echo $catinfo['name']; ?>"/></a>            
                        </div>
                        <div class="product-thumbnails-txt">
                            <p><strong><a href="<?php echo $catinfo['action']; ?>"><?php echo $catinfo['name']; ?></a></strong></p>
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 home-qty ">
                                    <input type="text" class="form-control" name="quantity" placeholder="Qty">
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <div  class="order-btn">                                      
                                        <a href="javascript:void(0);" class="order-btn"><img src="catalog/view/theme/bannersexpo/images/featured-cart.png" alt="Order now"> Order now</a>
                                    </div>
                                </div>                               
                            </div>
                        </div>
                    </div>
                
            </form>   
            </div>
            <?php } ?>
            
        </div>
    </div>
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