<?php echo $header; 

$height_feet = array("13");
$height_inch = array("14");
$width_feet  = array("15");
$width_inch  = array("16");
$double_side  = array("17");
$material_type  = array("19");
$material_type_prices = array("63");
?>
<div class="fullslider">
   <?php echo $content_top; ?>
    <div class="slider-form">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 col-sm-7 col-xs-12 pull-right ">
                    <div class="your-order" id="producthome">
                        <h1>Start your order</h1>
                        <form method="post" id="home_page_calc" name="home_page_calc">
                        <div class="your-order-cont">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group ">
                                    <select name="home_cat" class="selectpicker" id="home-product-calc" data-live-search="true">
                                        <option value="50">Vinyl Banner</option>
                                        <option value="51">Mesh Banners</option>
                                        <option value="<?php echo $displays;?>">Displays</option>
                                        <option value="<?php echo $yard_signs;?>" >Yard Signs</option>
                                        <?php if (!empty($rs_products)) { ?>
                                        <optgroup label="Rigid Signs">
                                            <?php foreach ($rs_products as $rinfo) { 
                                                if($rinfo['name']=="Coroplast")
                                                $ovalue = $rinfo['href'];
                                                else
                                                $ovalue = $rinfo['product_id'];
                                            ?>
                                            <option value="<?php echo $ovalue;?>"><?php echo $rinfo['name']; ?></option>
                                            <?php } ?>
                                        </optgroup>
                                        <option value="<?php echo $banner_stands;?>" >Banner stands</option>   
                                        <option value="<?php echo $wall_decals;?>" >Wall Decals</option>
                                        <option value="57" >Window Wraps</option>
                                        <option value="58" >Magnetic Signs</option>
                                        <option value="59" >Paper Posters</option>
                                        <option value="60" >Canvas printing</option>
                                        <option value="61" >Backdrops</option>
                                        <option value="62" >Window decals</option>
                                        <option value="63" >Static Cling</option>
                                        <?php } ?>  
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
                                    $pdoubleside_optionid = "";
                                    // Two side banner
                                    foreach ($options as $option) 
                                    { 
                                    if (in_array($option['option_id'], $double_side))
                                    { 
                                        $pdoubleside_optionid = $option['product_option_id'];
                                    ?>
                                    <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">
                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <input class="subject-list1" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">
                                        <?php } ?> 
                                        <?php echo $option['name']; ?><br>
                                    </div>
                                    <?php 
                                    } 
                                    }
                                    
                                    $pmat_optionid = "";
                                    // Material type
                                    foreach ($options as $option) 
                                    { 
                                    if (in_array($option['option_id'], $material_type))
                                    {
                                        $pmat_optionid = $option['product_option_id'];
                                    ?>  
                                    <div class="form-group">                                
                                        <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker material_type">                                        
                                            <?php foreach ($option['product_option_value'] as $option_value) 
                                            { ?>                                            
                                            <option value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php echo $option_value['name']; ?>                                               
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
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12"  id="save_price">                                                 
                                            </div>       
                                        </div>
                                    </div>
                                     <div class="form-group ">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 feet2">
                                                <div class="form-group ">
                                                    <div class="home-price">
                                                        <?php 
                                                        if ($price) 
                                                        { ?>                                                        
                                                            <span class="price1 home-price1" id="pricediv">Price: <?php echo $price; ?></span>  
                                                        <?php
                                                        }?>                 
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                     <div class="form-group ">
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
                                        <input type="hidden" name="pwidth" id="pwidth" value="<?php echo  $wf_optionid ;?>">
                                        <input type="hidden" name="pwidthinch" id="pwidthinch" value="<?php echo  $wi_optionid ;?>">
                                        <input type="hidden" name="pheight" id="pheight" value="<?php echo  $hf_optionid;?>">    
                                        <input type="hidden" name="pheightinch" id="pheightinch" value="<?php echo  $hi_optionid;?>">    
                                        <input type="hidden" name="pmat_type" id="pmat_type"  value="<?php echo $pmat_optionid;?>">
                                        <input type="hidden" name="pmat_type_value" id="pmat_type_value"  value="">
                                        <input type="hidden" name="pdoubleside" id="pdoubleside"  value="<?php echo $pdoubleside_optionid;?>">
                                        <input type="hidden" name="pfeetprice" id="pfeetprice" value="0"> 
                                        <input type="hidden" name="calculated_feetprice" id="calculated_feetprice" value="">
                                        <input type="hidden" name="product_id" id="org_prod_id" value="<?php echo $product_id; ?>" />
                                        <input type="hidden" name="process_type" id="process_type" value="1" /> 
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">   
                                                <button type="button" id="button-cart" data-loading-text="Loading.." class="btn btn-default btn-file1">Quick Order</button>
                                            </div>
                                        </div>
                                    </div> 
                                    
                               </div>                                    
                            </div>
                        </div>
                        </form>    
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
                   <!-- <li><a href="#tab3default" data-toggle="tab"> Technical Specifications </a></li> -->
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
                      <!--  <div class="star_rating"><?php echo $avg_rate;?></div> -->
                      <span class="rating avgrate" data-default-rating="<?php echo $avg_rate;?>" disabled></span>

                        <p><span> <?php echo $avg_rate;?>  /  5 </span>
                        </p>
                    </div>
                    <div class="scroll-cont">
                        <div class="owl-carousel">
                            <?php foreach ($reviews as $review) { ?>
                            <div class="popular-cont-txt"> <span><?php echo $review['author']; ?></span>
                                <p><?php echo $review['text']; ?></p>
                                <div class="rating homerate">
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
<!-- Modal -->
<div class="modal fade" id="myModal21" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h1>Free</h1>
            <h3>shipping</h3>
            <p class="blue-color">On All Orders<span> Over $199!</span></p>
            <p class="different-color">Get<span> Valuable Discount</span></p>
            <p class="single-color"> For Banners Over 10 Quantity</p>
            <p class="single-color"> (Vinyl, Mesh) & Backdrops Over 3</p>
            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 col-lg-offset-1 col-sm-offset-1 col-md-offset-1">
            <div class="input-group input-group-email">
                <input type="text" class="form-control" id="email1" name="email1" placeholder="Enter your email address..."/>
                <span class="input-group-btn">
                    <button class="btn btn-default sign-btn enter-subscribe1" type="button"><i class="fa fa-envelope"></i></button>
                </span> 
            </div>
            </div>
            <p class="buttons"><a href="<?php echo $pvinyl_banner;?>" class="btn btn-popup">Vinyl Banner</a> <a href="<?php echo $pmesh_banner;?>" class="btn btn-popup1">Mesh Banner</a> <a href="<?php echo $pbackdrops;?>" class="btn btn-popup2"> Backdrops</a></p>
          </div>
        </div>
    </div>
</div> 
<?php echo $column_left; ?>
<script type="text/javascript">
    $(function () {
        new AdvancedNewsletter({
        container_id: '#myModal2',
            input_id: 'input[name=email1]',
            submit_id: '.enter-subscribe1'
        });
$('#myModal2').modal('show');
        if(localStorage.getItem('popState') != 'shown'){
            $('#myModal2').modal('show');
            localStorage.setItem('popState','shown')
        }
        
       var ratings = document.getElementsByClassName('rating');

        for (var i = 0; i < ratings.length; i++) {
            var r = new SimpleStarRating(ratings[i]);

            ratings[i].addEventListener('rate', function(e) {
                console.log('Rating: ' + e.detail);
            });
        }
        
       // $('.star_rating').rating();   
        
        var pid = $("#org_prod_id").val();
        
        /* Get material type price */
        var mtype_text   = $.trim($('.material_type').find("option:selected").text()); 
        $('#pmat_type_value').val(mtype_text);
        setfeetprice(mtype_text,pid);
        
        
        $(document).on('change', '.material_type', function() { 
            var pid = $("#org_prod_id").val();
            var mtype_text  = $.trim($(this).find("option:selected").text());
            $('#pmat_type_value').val(mtype_text);
            setfeetprice(mtype_text,pid);
            addtoprice(pid);            
            return false;
        });  
        
        function setfeetprice(mtype_text,pid)
        {              
            $.ajax({
               url : 'index.php?route=common/home/mtoptions',
               type: 'post',
               data: 'product_id='+pid,    
               dataType: "JSON",
               async: false,
               success: function (jsonStr) {  
                   if(jsonStr!="FAIL"){                       
                    $.each(jsonStr, function (index, value) {  
                        if(index==mtype_text)
                        { 
                            $('#pfeetprice').val(value);
                            return false;
                        }    
                    });
                  }
               }
           });  
           
        }
        
        addtoprice(pid);
        
        $('#home-product-calc').on('change', function(e) {
           
            var option_text   = $(this).find("option:selected").text();
            var option_value  = $(this).find("option:selected").val();

            if(option_text=="Displays" || option_text=="Banner stands" || option_text=="Coroplast" || option_text=="Yard Signs" || option_text=="Wall Decals")
            {
               window.location.href = option_value;
            } 
            
            $.ajax({
                url : 'index.php?route=common/home/viewoptions&product_id=' + option_value,
                type: 'post',
                data: 'product_id='+option_value,      
                async: false,
                success: function (response) {                       

                    if(response!="FAIL")
                    $('#product_options').html(response);   
                
                    $('.material_type').selectpicker("refresh");              
                    $('.selectpicker').selectpicker('refresh');
                    
                    var mtype_text  = $.trim($('.material_type').find("option:selected").text());
                    if(mtype_text!=""){
                        $('#pmat_type_value').val(mtype_text);
                        setfeetprice(mtype_text,option_value);
                    }
                                         
                    $('input').iCheck({
                        checkboxClass: 'icheckbox_square-red',
                        radioClass: 'iradio_square-red'
                    });                    
                }
            });  
            
            addtoprice(option_value);
            
            $('.home-product-calc').selectpicker("refresh");
        });
        
        /* Size select */     
        $(document).on('change', '.productsize', function() { 
            var pid = $("#org_prod_id").val();
            var option_text = $(this).find("option:selected").text();        
           
            if($.trim(option_text)=="Custom Size")
            {  
              var produrl = $("#product_url").val();             
              window.location.href = produrl;
            }
            
            addtoprice(pid);
        });   
        
        /* Upload Art work */
        $(document).on('click', 'button[id^=\'button-upload\']', function() { 
                var node = this;

                $('#form-upload').remove();

                $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

                $('#form-upload input[name=\'file\']').trigger('click');

                if (typeof timer != 'undefined') {
                     clearInterval(timer);
                }

                timer = setInterval(function() {
                        if ($('#form-upload input[name=\'file\']').val() != '') {
                                clearInterval(timer);

                                $.ajax({
                                        url: 'index.php?route=tool/upload',
                                        type: 'post',
                                        dataType: 'json',
                                        data: new FormData($('#form-upload')[0]),
                                        cache: false,
                                        contentType: false,
                                        processData: false,
                                        beforeSend: function() {
                                                $(node).button('loading');
                                        },
                                        complete: function() {
                                                $(node).button('reset');
                                        },
                                        success: function(json) {
                                                $('.text-danger').remove();

                                                if (json['error']) {
                                                        $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                                                }

                                                if (json['success']) {
                                                     $("#file_name_disp").html("<i class='fa fa-file-image-o' ></i> " + json['filename']);
                                                        alert(json['success']);
                                                        $(node).parent().find('input').val(json['code']);
                                                }
                                        },
                                        error: function(xhr, ajaxOptions, thrownError) {
                                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                        }
                                });
                        }
                }, 500);
        });
        
        $(document).on('keypress','.numberentry',function( e ) { 
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
       
        $(document).on('keyup','#producthome input[type=\'text\']',function( e ) { 
            var prodid = $("#org_prod_id").val();
            addtoprice(prodid);
        });

        $(document).on('ifChecked', 'input' ,function (event) {
            var pid = $("#org_prod_id").val();
            addtoprice(pid);
        });
        
        $(document).on('ifUnchecked', 'input' ,function (event) {
            var pid = $("#org_prod_id").val();
            addtoprice(pid);
        });

        $(document).on('click','#button-cart',function( e ) { 
        
        var process_type = $("#process_type").val();
        
        if(process_type==1)
          var process_url = 'index.php?route=common/quickorder/step1';
        else
          var process_url = 'index.php?route=checkout/cart/add';  
            
            $.ajax({
                url : process_url,
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
                                    if(process_type==1)
                                      element.parent().after('<div class="text-danger"></div>');
                                    else
                                      element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                } else {
                                    //element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                    if(process_type==1)
                                      element.parent().after('<div class="text-danger"></div>');
                                    else
                                      element.parent().after('<div class="text-danger"></div>');  
                                }
                                
                            }
                        }

                        // Highlight any found errors
                        $('.text-danger').parent().addClass('has-error');
                    }

                    if (json['success']) {     
                    
                        $("#home_page_calc").attr("action", json['redirect']);
                        $("form#home_page_calc").submit();
                        return false;
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
        $('#save_price').hide();
        var pid = $("#org_prod_id").val();
        $.ajax({
            url: 'index.php?route=product/product/calculate&product_id=' + pid,
            type: 'post',
            data: $('.form-group input[type=\'text\'] , .form-group input[type=\'hidden\'], .form-group input[type=\'radio\']:checked, .form-group input[type=\'checkbox\']:checked, .form-group select'),
            dataType: 'json',
            success: function (json) {
                if (json['success']) {
                    if(json['org_price']!=""){
                        $('#save_price').show();
                        $('#pricediv').html("Price: <span class='orgprice'>"+json['org_price']+"</span>&nbsp;&nbsp;" + json['price']);
                        var saveprc = json['org_price_without_currency']-json['price_without_currency'];                  
                        $('#save_price').html("<span>Save</span> $"+saveprc.toFixed(2)+"!!")
                    }else{
                        $('#pricediv').html("Price: " + json['price']);
                    }
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