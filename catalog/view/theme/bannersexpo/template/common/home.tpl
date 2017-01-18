<?php echo $header; 

$height_feet = array("13");
$height_inch = array("14");
$width_feet  = array("15");
$width_inch  = array("16");
$double_side  = array("17");
$material_type  = array("19");
?>
<div class="slider">
    <img src="image/slider.jpg" alt="Home Slide">
    <div class="slider-content">      
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 col-sm-7 col-xs-12 pull-right ">
                    <div class="your-order" id="producthome">
                        <h1>Start your order</h1>
                        <div class="your-order-cont">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group ">
                                    <select class="selectpicker">
                                        <option>Vinyl banner</option>                                       
                                    </select>
                                </div>
                                <div id="product_options">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                            <label>Height</label>
                                            <div class="height">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet1">
                                                        <?php
                                                        // Height Feet
                                                        foreach ($options as $option) 
                                                        { 
                                                        if (in_array($option['option_id'], $height_feet))
                                                        {
                                                        $hf_optionid = $option['product_option_id'];  

                                                        $option['value'] = ($option['value']=="")?1:$option['value'];
                                                        ?>
                                                        <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">
                                                            <label>Feet</label>
                                                            <input type="text" class="form-control numberentry"  placeholder="0" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>">
                                                        </div>
                                                        <?php 
                                                        } 
                                                        } 
                                                        ?>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet2">
                                                        <?php
                                                        // Height Inch
                                                        foreach ($options as $option) 
                                                        { 
                                                        if (in_array($option['option_id'], $height_inch))
                                                        {

                                                        $hi_optionid = $option['product_option_id'];   
                                                        $option['value'] = ($option['value']=="")?0:$option['value'];
                                                        ?>
                                                        <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">
                                                            <label>Inch</label>
                                                            <input type="text" class="form-control control2 numberentry" placeholder="0" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>">
                                                        </div>
                                                        <?php 
                                                        } 
                                                        } 
                                                        ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                            <label>Width</label>
                                            <div class="height">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet1">                                                   
                                                        <?php
                                                        // Width Feet
                                                        foreach ($options as $option) 
                                                        { 
                                                        if (in_array($option['option_id'], $width_feet))
                                                        {
                                                        $wf_optionid = $option['product_option_id'];
                                                        $option['value'] = ($option['value']=="")?1:$option['value'];
                                                        ?>
                                                        <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">
                                                            <label>Feet</label>
                                                            <input type="text" class="form-control control2 numberentry" placeholder="0" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>">
                                                        </div>
                                                        <?php 
                                                        } 
                                                        } 
                                                        ?>
                                                    </div> 
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet2">
                                                        <?php
                                                        // Width Inch
                                                        foreach ($options as $option) 
                                                        { 
                                                        if (in_array($option['option_id'], $width_inch))
                                                        {
                                                        $wi_optionid = $option['product_option_id']; 
                                                        $option['value'] = ($option['value']=="")?0:$option['value'];
                                                        ?>
                                                        <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">
                                                            <label>Inch</label>
                                                            <input type="text" class="form-control control2 numberentry" placeholder="0" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>">
                                                        </div>
                                                        <?php 
                                                        } 
                                                        } 
                                                        ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php
                                    // Two side banner
                                    foreach ($options as $option) 
                                    { 
                                    if (in_array($option['option_id'], $double_side))
                                    { ?>
                                    <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <input class="subject-list1" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">
                                        <?php } ?> 
                                        <?php echo $option['name']; ?><br>
                                    </div>
                                    <?php 
                                    } 
                                    } 
                                    ?>
                                </div>  
                                <?php     
                                // material type
                                foreach ($options as $option) 
                                { 
                                if (in_array($option['option_id'], $material_type))
                                {
                                ?>  
                                <div class="form-group">                                
                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice( <?php echo $product_id; ?> )">
                                        <option value=""> <?php echo $option['name']; ?> </option>
                                        <?php foreach ($option['product_option_value'] as $option_value) 
                                        { ?>
                                        <?php 
                                        if ($option_value['priceonly']) { 
                                        $additnal_price = $option_value['priceonly'];
                                        }else{
                                        $additnal_price = '0';
                                        }   
                                        ?>
                                        <option rel="<?php echo $additnal_price;?>" value="<?php echo $option_value['product_option_value_id']; ?>">
                                            <?php echo $option_value['name']; ?>
                                            <?php if ($option_value['price']) { ?>
                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                        </option>
                                        <?php 
                                        } ?>
                                    </select>                                   
                                </div>
                                <?php 
                                }
                                }
                                ?>  
                                <div class="form-group ">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">                                               
                                            Qty <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control control2 numberentry"/>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 feet2">
                                            <div class="form-group ">
                                                <div class="price">
                                                    <?php 
                                                    if ($price) 
                                                    { 
                                                    if (!$special) {  ?>
                                                    <span class="price1" id="pricediv">Price: <?php echo $price; ?></span>  
                                                    <?php } else { ?>
                                                    <span style="text-decoration: line-through;"><?php echo $price; ?></span>
                                                    <span class="price1"><?php echo $special; ?></span>
                                                    <?php
                                                    }
                                                    }?>                 
                                                </div>
                                            </div>
                                        </div>                                      
                                    </div>
                                </div>   
                                <?php                                 
                                $price_per_feet_option = array("22");  
                                foreach ($options as $option) 
                                { 
                                if (in_array($option['option_id'], $price_per_feet_option))
                                {  ?>
                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"  value="<?php echo  $feetprice_only;?>">
                                <?php
                                }
                                } 
                                ?>
                                <div class="form-group ">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">                                          
                                            <input type="hidden" name="pwidth" id="pwidth" value="<?php echo  $wf_optionid ;?>">
                                            <input type="hidden" name="pheight" id="pheight" value="<?php echo  $hf_optionid;?>">    
                                            <input type="hidden" name="pfeetprice" id="pfeetprice" value="<?php echo  $feetprice_only;?>"> 
                                            <input type="hidden" name="calculated_feetprice" id="calculated_feetprice" value="">
                                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                                            <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-file1">Quick Order</button>
                                        </div>
                                    </div>
                                </div>  

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="body-cont">
    <?php echo $content_bottom; ?>
    <div class="body-cont2">
        <div class="panel with-nav-tabs panel">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="active"> <a href="#tab1default" data-toggle="tab">Banners Expo.com </a></li>
                    <li><a href="#tab2default" data-toggle="tab"> Why Banners Expo </a></li>
                    <li><a href="#tab3default" data-toggle="tab"> Technical Specifications </a></li>
                </ul>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab1default">
                        <?php echo $welcome_txt_info; ?>
                    </div>
                    <div class="tab-pane fade" id="tab2default">
                        <div class="container"><?php echo $why_banner_expo;?></div>
                    </div>
                    <div class="tab-pane fade" id="tab3default">
                        <div class="container"><?php echo $tec_banner_expo;?></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="body-cont3">
        <div class="container">
            <div class="row">
                <?php if(!empty($reviews)){ ?>
                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                    <div class="customer-review">
                        <h3>Loved by our Customers -Reviews</h3>
                        <p>Our customers have rated us <?php echo $avg_rate;?> out of 5 based on <?php echo $totalreviews;?> reviews and counting! 
                            See what some of our customers have to say:</p>
                        <div class="star_rating"><?php echo $avg_rate;?></div>

                        <p><span> <?php echo $avg_rate;?>  /  5 </span></p>
                    </div>
                    <div class="scroll-cont">
                        <div class="owl-carousel">
                            <?php foreach ($reviews as $review) { ?>
                            <div class="popular-cont-txt"> <span><?php echo $review['author']; ?></span>
                                <p><?php echo $review['text']; ?></p>
                                <div class="rating">
                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                    <?php if ($review['rating'] < $i) { ?>
                                    <div class="fa fa-stack sliderate"><i class="fa fa-star-o fa-stack-1x" style='color: #fbb00;'></i></div>
                                    <?php } else { ?>
                                    <div class="fa fa-stack sliderate"><i class="fa fa-star fa-stack-1x" style='color: #ffbb00;'></i><i class="fa fa-star-o fa-stack-1x" style='color: #E69500;'></i></div>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <?php } ?>
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                    <?php echo $youtube_banner_expo;?>
                </div>
            </div>
        </div>
    </div>   
</div>
<?php echo $column_left; ?>
<script type="text/javascript">
    $(function () {

        $(".numberentry").keypress(function (e) {
            e = e || event;
            if (e.ctrlKey || e.altKey || e.metaKey)
                return;
            var chr = getChar(e);
            if (chr == null)
                return;
            if (chr < '0' || chr > '9') {
                return false;
            }
        });

        $('.star_rating').rating();
        var pid = "<?php echo $product_id;?>";

        addtoprice(pid);

        $('#producthome input[type=\'text\']').bind('keyup', function (e) {
            $.ajax({
                url: 'index.php?route=product/product/calculate&product_id=' + pid,
                type: 'post',
                data: $('.form-group input[type=\'text\'] , .form-group input[type=\'hidden\'], .form-group input[type=\'radio\']:checked, .form-group input[type=\'checkbox\']:checked, .form-group select'),
                dataType: 'json',
                success: function (json) {
                    if (json['success']) {
                        $('#pricediv').html("Price: " + json['price']);
                        $('#calculated_feetprice').val(json['calculated_feetprice']);
                    }
                }
            });
        });

        $('input').on('ifChecked', function (event) {
            addtoprice(pid);
        });

        $('input').on('ifUnchecked', function (event) {
            addtoprice(pid);
        });

        $('#button-cart').on('click', function () {
            $.ajax({
                url: 'index.php?route=checkout/cart/step1',
                type: 'post',
                data: $('#producthome input[type=\'text\'], #producthome input[type=\'hidden\'], #producthome input[type=\'radio\']:checked, #producthome input[type=\'checkbox\']:checked, #producthome select, #producthome textarea'),
                dataType: 'json',
                beforeSend: function () {
                    $('#button-cart').button('loading');
                },
                complete: function () {
                    $('#button-cart').button('reset');
                },
                success: function (json) {
                    $('.alert, .text-danger').remove();
                    $('.form-group').removeClass('has-error');

                    if (json['error']) {
                        if (json['error']['option']) {
                            for (i in json['error']['option']) {
                                var element = $('#input-option' + i.replace('_', '-'));

                                if (element.parent().hasClass('input-group')) {
                                    //element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                    element.parent().after('<div class="text-danger"></div>');
                                } else {
                                    //element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                    element.after('<div class="text-danger"></div>');
                                }
                            }
                        }

                        // Highlight any found errors
                        $('.text-danger').parent().addClass('has-error');
                    }

                    if (json['success']) {
                        //  $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                        // $('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

                        //  $('html, body').animate({scrollTop: 0}, 'slow');

                        //  $('#carttotal').html(json['carttotal_disp']);
                        // $('#carttotalamt').html(json['carttotalamt_disp']);

                        // $('#cart > ul').load('index.php?route=common/cart/info ul li');

                        $(location).attr('href', json['redirect']);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

    });

    $.fn.rating = function () {
        var val = 0, size = 0, stars = 5;
        return this.each(function (i, e) {
            val = parseFloat($(e).text());
            size = ($(e).width() / stars);
            $(e).html($('<p/>').animate({
                width: val * size
            }, 1000));
        });
    };

    function addtoprice(pid)
    {
        $.ajax({
            url: 'index.php?route=product/product/calculate&product_id=' + pid,
            type: 'post',
            data: $('.form-group input[type=\'text\'] , .form-group input[type=\'hidden\'], .form-group input[type=\'radio\']:checked, .form-group input[type=\'checkbox\']:checked, .form-group select'),
            dataType: 'json',
            success: function (json) {
                if (json['success']) {
                    $('#pricediv').html("Price: " + json['price']);
                    $('#calculated_feetprice').val(json['calculated_feetprice']);
                }
            }
        });
    }
    
    function getChar(event) {
        if (event.which == null) {
            if (event.keyCode < 32)
                return null;
            return String.fromCharCode(event.keyCode) // IE
        }

        if (event.which != 0 && event.charCode != 0) {
            if (event.which < 32)
                return null;
            return String.fromCharCode(event.which)
        }

        return null;
    }
</script>
<?php echo $footer; ?>