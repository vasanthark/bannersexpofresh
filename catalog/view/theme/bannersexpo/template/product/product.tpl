<?php echo $header; 

$finishing_option  = array("28");

$height_feet = array("13");
$height_inch = array("14");
$width_feet  = array("15");
$width_inch  = array("16");
$double_side = array("17");
$material_type  = array("19");
$lamination  = array("47");
$metal_steaks = array("48");

$size = array("11");
$rounded_corners = array("49");
$material_thickness = array("50");

$thickness = array("51");
$printing_sides = array("52");
$wire_stakes = array("53");


$grommets_placements = array("26");

$cutting = array("54");
$wrapping = array("55");

$printing_material = array("56");
$light = array("57");
$colour = array("58");

$colour_code = array("60");
$lamination_options = array("61");
$directional = array("62");

$upload_your_artwork = array("41");

$pmat_optionid = "";
$hf_optionid = "";
$hi_optionid = "";
$wf_optionid = "";
$wi_optionid = "";

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
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <div class="row">
                    <?php echo $content_breadcrumbs; ?>   
                </div>
            </div>          
            <?php if($rating){ ?>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <div class="reviews1"><span><?php echo $rating;?>/5</span> </div>
                <div class="reviews "> <span class="rating" data-default-rating="<?php echo $rating;?>" disabled></span>  
                  <p><?php echo $reviews; ?></p>
                </div>
           </div>   
            <?php }?>
            <div class="detail-page">
                <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                    <?php if ($images) { ?>
                    <div class="pro-details">
                        <div id="carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <?php foreach ($images as $key => $image) { ?>
                                <div class="item <?php echo ( $key=='0')?'active':'';?>" data-thumb="<?php echo $key;?>">
                                    <img src="image/<?php echo $image['popup'];?>" alt="<?php echo $heading_title; ?>"> 
                                </div>                               
                                <?php } ?>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                            <?php if (count($images)>1) { ?>
                            <div id="thumbcarousel" class="carousel slide" data-interval="false">
                                <div class="carousel-inner">
                                    <?php $flag = 0; $i=1; $status = 1; ?>
                                    <?php foreach ($images as $key => $image) { 

                                    if($i == 1){ ?>
                                    <div class="item <?php echo ($flag==0)?  'active': ''; $flag = 1; ?>">
                                        <?php $status = 2; } ?>                                                                                                                    
                                        <div data-target="#carousel" data-slide-to="<?php echo $key;?>" class="thumb">
                                            <img src="image/<?php echo $image['popup'];?>" alt="<?php echo $heading_title; ?>">
                                        </div>
                                        <?php if($i == 4){ ?>
                                    </div>
                                    <?php 
                                    $status = 1;
                                    $i = 0;                                             
                                    } 
                                    $i++;
                                    } ?>
                                    <?php echo ($status=='2')? '</div>' : '';?>                
                                </div>
                            </div>

                            <!-- /carousel-inner --> 
                            <?php if (count($images)>4) { ?>
                            <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a> 
                            <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next"> 
                                <span class="glyphicon glyphicon-chevron-right"></span> 
                            </a> 
                        <?php } ?>  
                        <?php } ?>  
                    </div>
                <?php } ?>  
               <!-- <div class="preview-tab">
                    <div class="image-preview"> <span>Uploaded image Preview </span> </div>
                    <img src="image/catalog/preview-img.jpg" alt="">
                </div> -->
            </div>
            <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
                <div class="order-type" id="producthome">
                    <div id="quote_msg"></div>
                    <h2> <img src="image/cart-det.png" alt=""> Start your order</h2>
                    <form method="post" id="prod_page_calc" name="prod_page_calc" action="">
                    <?php
                        // size
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $size))
                        { 

                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker productsize" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
                                     <?php foreach ($option['product_option_value'] as $option_value) 
                                            { 
                                                $feature_select = "";
                                                if($feature_size_option!="" && $feature_size_option==$option_value['product_option_value_id'])
                                                $feature_select = "selected = 'selected'";
                                            ?>                                           
                                            <option <?php echo $feature_select;?> value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php echo $option_value['name']; ?>                                                
                                            </option>
                                            <?php 
                                            } ?>
                                </select>                                   
                            </div>
                        <?php 
                        }
                        } ?>
                        <div class="row size-fields">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                <label>Height</label>
                                <div class="height">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet1">
                                            <div class="form-group">
                                                <label>Feet</label>
                                                <input class="form-control numberentry" placeholder="0" name="quote_hf" value="1" id="input_quote_hf" type="text">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet2">
                                            <div class="form-group">
                                                <label>Inch</label>
                                                <input class="form-control control2 numberentry" placeholder="0" name="quote_hi" value="0" id="input_quote_hi" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                <label>Width</label>
                                <div class="height">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet1">                                                   
                                            <div class="form-group">
                                                <label>Feet</label>
                                                <input class="form-control control2 numberentry" placeholder="0" name="quote_wf" value="1" id="input_quote_wf" type="text">
                                            </div>
                                        </div> 
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet2">
                                            <div class="form-group">
                                                <label>Inch</label>
                                                <input class="form-control control2 numberentry" placeholder="0" name="quote_wi" value="0" id="input_quote_wi" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php                      
                        // material type
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $material_type))
                        {
                            $pmat_optionid = $option['product_option_id'];
                        ?>  
                        <div class="form-group">                                
                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">                                
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
                        }?> 
                        <?php
                        // Check Height & Width Feet optoins available
                        foreach ($options as $optionchk) 
                        { 
                        if (in_array($optionchk['option_id'], $height_feet))
                        { ?>
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
                        } 
                        } 
                        ?>            
                       <?php
                        
                        // Color Code
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $colour_code))
                        { 
                         
                        ?> 
                        <div class="row">
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12"> 
                            <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>"> 
                             <label>Select Color</label>   
                             <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />                                                                
                            </div>
                           </div>    
                           <?php if($pdf_name){ ?>
                           <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">                               
                               <a  href="<?php echo $siteurl;?>techspecification/<?php echo $pdf_name;?>" class="tech colorfancybox">See Color Chart</a> 
                           </div>
                        </div>
                           <?php }?>
                        <?php 
                        }
                        }
                      
                        // Cutting
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $cutting))
                        { 
                         
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
                                     <?php foreach ($option['product_option_value'] as $option_value) 
                                            { 
                                                $feature_select = "";
                                                if($feature_size_option!="" && $feature_size_option==$option_value['product_option_value_id'])
                                                $feature_select = "selected = 'selected'";
                                            ?>                                           
                                            <option <?php echo $feature_select;?> value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php echo $option_value['name']; ?>                                               
                                            </option>
                                            <?php 
                                            } ?>
                                </select>                                   
                            </div>
                        <?php 
                        }
                        }
                      
                        // Rounded corners
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $rounded_corners))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
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
                    
                         // Material thickness
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $material_thickness))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
                                     <?php foreach ($option['product_option_value'] as $option_value) 
                                            { ?>                                           
                                            <option  value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php echo $option_value['name']; ?>                                               
                                            </option>
                                            <?php 
                                            } ?>
                                </select>                                   
                            </div>
                        <?php 
                        }
                        }
                      
                        // Thickness
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $thickness))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
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
                      
                        // printing sides
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $printing_sides))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
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
                      
                        // wire stakes
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $wire_stakes))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
                                     <?php foreach ($option['product_option_value'] as $option_value) 
                                            { ?>                                           
                                            <option rel="<?php echo $additnal_price;?>" value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php echo $option_value['name']; ?>                                               
                                            </option>
                                            <?php 
                                            } ?>
                                </select>                                   
                            </div>
                        <?php 
                        }
                        }

                        // Wrapping
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $wrapping))
                        { 
                         
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
                                     <?php foreach ($option['product_option_value'] as $option_value) 
                                            { 
                                                $feature_select = "";
                                                if($feature_size_option!="" && $feature_size_option==$option_value['product_option_value_id'])
                                                $feature_select = "selected = 'selected'";
                                            ?>                                           
                                            <option <?php echo $feature_select;?> rel="<?php echo $additnal_price;?>" value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php echo $option_value['name']; ?>                                                
                                            </option>
                                            <?php 
                                            } ?>
                                </select>                                   
                            </div>
                        <?php 
                        }
                        }

                        // colour
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $colour))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
                                     <?php foreach ($option['product_option_value'] as $option_value) 
                                            { ?>                                            
                                            <option rel="<?php echo $additnal_price;?>" value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php echo $option_value['name']; ?>                                                
                                            </option>
                                            <?php 
                                            } ?>
                                </select>                                   
                            </div>
                        <?php 
                        }
                        }

                        // Lights
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $light))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
                                     <?php foreach ($option['product_option_value'] as $option_value) 
                                            { ?>                                           
                                            <option rel="<?php echo $additnal_price;?>" value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php echo $option_value['name']; ?>                                                
                                            </option>
                                            <?php 
                                            } ?>
                                </select>                                   
                            </div>
                        <?php 
                        }
                        }

                        // Printing material
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $printing_material))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker printing_material" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
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

                        // For yard product only - Finishing options
                        if($yard_p){

                            foreach ($options as $option) 
                            { 
                            if (in_array($option['option_id'], $finishing_option))
                            {                       
                            ?>  
                                <div class="form-group">                                
                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker printing_material" onchange="addtoprice(<?php echo $product_id; ?> )">
                                        <option value="">Select <?php echo $option['name']; ?> </option>    
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
                        }

                        // Lamination options
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $lamination_options))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker printing_material" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
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
                        
                        // Directional
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $directional))
                        {                       
                        ?>  
                            <div class="form-group">                                
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker printing_material" onchange="addtoprice(<?php echo $product_id; ?> )">
                                    <option value="">Select <?php echo $option['name']; ?> </option>    
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

                        if($direct_checkout=="0")
                        {
                            // Grommets
                            foreach ($options as $option) 
                            { 
                            if (in_array($option['option_id'], $grommets_placements))
                            {                       
                            ?>  
                                <div class="form-group">                                
                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                        <option value=""><?php echo $option['name']; ?> </option>    
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
                        }

                        $plamination_optionid = "";
                        
                        // Lamination
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $lamination))
                        { 
                            $plamination_optionid = $option['product_option_id'];
                        ?>
                        <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <input class="subject-list1" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">
                            <?php } ?> 
                            <?php echo $option['name']; ?><br>
                        </div>
                        <?php 
                        } 
                        } ?>
                        
                        <?php
                        $pmetalsteaks_optionid = "";
                        // Metal Steaks
                        foreach ($options as $option) 
                        { 
                        if (in_array($option['option_id'], $metal_steaks))
                        { 
                            $pmetalsteaks_optionid = $option['product_option_id'];
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
                       ?>
                        <div> 
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"> 
                                   <div class="form-group">     
                                        <label>Qty</label>
                                        <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="quote-quantity" class="form-control" />                                   
                                   </div> 
                                </div>
                            <?php
                            if($direct_checkout=="0")
                            {
                              // Upload Art work
                                foreach ($options as $option) 
                                { 
                                    if (in_array($option['option_id'], $upload_your_artwork))
                                    {                       
                                    ?> 
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" id="art_work">  
                                            <div class="form-group">
                                            <label>Upload File</label>
                                              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-fileup"><i class="fa fa-upload"></i> Upload Your Art Work</button>
                                              <span id="file_name_disp"></span>
                                             <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />                                                               
                                            </div>  
                                        </div>   
                                    <?php
                                    }
                                }
                            }else{
                                ?>    
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 feet2"> 
                                    <div class="form-group" id="prod-price-qty">                                                                         
                                                    <?php 
                                                    if ($price) 
                                                    { 
                                                    if (!$special) {  ?>
                                                    <p class="price_prod_detail" id="pricediv">Price: <?php echo $price; ?></p>  
                                                    <?php } else { ?>
                                                    <p style="text-decoration: line-through;"><?php echo $price; ?></p>
                                                    <p class="price_prod_detail"><?php echo $special; ?></span>
                                                    <?php
                                                    }
                                                    }?>     
                                             
                                    </div>
                                </div> 
                                <?php
                                    }
                                ?>                          
                            </div>                          
                        </div>  
                       <?php
                        if($direct_checkout=="0")
                       { ?>
                        <div class="form-group" id="prod-price-qty">
                            <div class="row">
                                <div  class="">
                                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">                                    
                                        <?php 
                                        if ($price) 
                                        { 
                                        if (!$special) {  ?>
                                        <p class="price_prod_detail" id="pricediv">Price: <?php echo $price; ?></p>  
                                        <?php } else { ?>
                                        <p style="text-decoration: line-through;"><?php echo $price; ?></p>
                                        <p class="price_prod_detail"><?php echo $special; ?></span>
                                        <?php
                                        }
                                        }?>      
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                       <?php }?>     
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
                        
                        <div class="quote-fields">                            
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">  
                                    <div class="form-group">                                  
                                         <input type="text" name="username" placeholder="Name" value="" id="input-uname" class="form-control" />  
                                    </div>                               
                                </div>
                            </div>                            
                            <div class="row">                               
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">  
                                    <div class="form-group">                                  
                                        <input type="text" name="userphone" placeholder="Phone" value="" id="input-uphone" class="form-control" />  
                                    </div>   
                                </div> 
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"> 
                                    <div class="form-group">     
                                        <input type="text" name="useremail" placeholder="Email" value="" id="input-uemail" class="form-control" />  
                                    </div>
                                </div> 
                            </div>
                            <?php 
                            if($special_p){
                            ?>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">  
                                    <div class="form-group">                                  
                                         <textarea name="usercomment" id="input-ucomment" placeholder="Your Comments" class="form-control" /></textarea>
                                    </div>                               
                                </div>
                            </div>  
                            <?php }?>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="start-order">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " id="start_order"> 
                                        <input type="hidden" name="pwidth" id="pwidth" value="<?php echo  $wf_optionid ;?>">
                                        <input type="hidden" name="pwidthinch" id="pwidthinch" value="<?php echo  $wi_optionid ;?>">
                                        <input type="hidden" name="pheight" id="pheight" value="<?php echo  $hf_optionid;?>">    
                                        <input type="hidden" name="pheightinch" id="pheightinch" value="<?php echo  $hi_optionid;?>">    
                                        <input type="hidden" name="pmat_type" id="pmat_type"  value="<?php echo $pmat_optionid;?>">
                                        <input type="hidden" name="pdoubleside" id="pdoubleside"  value="<?php echo $pdoubleside_optionid;?>">
                                        <input type="hidden" name="plamination" id="plamination"  value="<?php echo $plamination_optionid;?>">
                                        <input type="hidden" name="pmetalsteaks" id="pmetalsteaks"  value="<?php echo $pmetalsteaks_optionid;?>">                                    
                                        <input type="hidden" name="pfeetprice" id="pfeetprice" value="<?php echo  $feetprice_only;?>"> 
                                        <input type="hidden" name="calculated_feetprice" id="calculated_feetprice" value="">
                                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />   
                                        <input type="hidden" name="process_type" id="process_type" value="<?php echo $direct_checkout; ?>" />  
                                        <a href="javascript:void(0);" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="add-cart">
                                            <img src="image/catalog/start-order.png" alt="Add cart"> Start your order
                                        </a>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " id="request_order"> 
                                        <a href="javascript:void(0);" id="request-quote" data-loading-text="<?php echo $text_loading; ?>" class="add-cart">
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Get A Quote
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="detail-body2">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                    <div class="detail-content">
                        <div class="panel with-nav-tabs panel">
                            <div class="panel-heading">
                                <ul class="nav nav-tabs">                                                
                                    <li class="active"> <a href="#tab1default" data-toggle="tab"><?php echo $tab_description; ?> </a></li>
                                    <?php if ($attribute_groups) { ?>
                                    <li><a href="#tab2default" data-toggle="tab"> <?php echo $tab_attribute; ?> </a></li>
                                    <?php } ?>
                                    <?php if ($review_status) { ?>
                                    <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                                    <?php } ?>
                                </ul>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="tab1default">
                                        <?php echo $description; ?>
                                    </div>
                                    <div class="tab-pane fade" id="tab2default"> <table class="table table-bordered table-color">
                                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                                            <thead>
                                                <tr>
                                                    <td class="text-color"  colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                                <tr>
                                                    <td><?php echo $attribute['name']; ?></td>
                                                    <td><?php echo $attribute['text']; ?></td>
                                                </tr>
                                                <?php } ?>
                                            </tbody>
                                            <?php } ?>
                                        </table> </div>
                                    <?php if ($review_status) { ?>
                                    <div class="tab-pane fade" id="tab-review">                                       
                                        <div class="client-review">                                                     
                                            <a class="review-button text-right" id="review-form" href="javascript:void(0);">
                                                Write a review
                                            </a>  
                                            <form class="form-horizontal" id="form-review">
                                              
                                                <h2><?php echo $text_write; ?></h2>
                                                
                                                <?php if ($review_guest) { ?>
                                                <div class="form-group required">
                                                    <div class="col-sm-6">
                                                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <div class="col-sm-6">
                                                        <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                                        <div class="help-block"><?php echo $text_note; ?></div>
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <div class="col-sm-6">
                                                        <label class="control-label"><?php echo $entry_rating; ?></label>
                                                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                                        <input type="radio" name="rating" value="1" />
                                                        &nbsp;
                                                        <input type="radio" name="rating" value="2" />
                                                        &nbsp;
                                                        <input type="radio" name="rating" value="3" />
                                                        &nbsp;
                                                        <input type="radio" name="rating" value="4" />
                                                        &nbsp;
                                                        <input type="radio" name="rating" value="5" />
                                                        &nbsp;<?php echo $entry_good; ?></div>
                                                </div>
                                                <?php echo $captcha; ?>
                                                <div class="buttons clearfix">                                                
                                                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">Submit</button>                                                
                                                </div>
                                                <?php } else { ?>
                                                <?php echo $text_login; ?>
                                                <?php } ?>
                                                  <div id="rate_message"></div>
                                            </form>
                                        </div>
                                         <div id="review"></div>
                                    </div>
                                    <?php } ?>                          
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="ask-que">
                        <h4>Ask Your question</h4>
                        <form name="ask_question" id="ask_question">
                            <div id="ask_message"></div>
                        <div class="ask-inner-part">
                            <div class="form-group">
                                <input type="text" name="uname" class="form-control" placeholder="Your Name">
                            </div>
                            <div class="form-group">
                                <input type="email" name="uemail" class="form-control" placeholder="Email Address">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control message" name="ucomment" rows="5" placeholder="what do you want to know ?"></textarea>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <button type="button" id="send_question" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default">Send question</button>
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
<script type="text/javascript">
    var ratings = document.getElementsByClassName('rating');
    if(ratings.length>0){    
        for (var i = 0; i < ratings.length; i++) {
            var r = new SimpleStarRating(ratings[i]);

            ratings[i].addEventListener('rate', function(e) {
                console.log('Rating: ' + e.detail);
            });
        }
    }

    $(function () {
       // $("#art_work").hide();
        $("#request_order").hide();
        $(".size-fields").hide();
        $(".quote-fields").hide();
        
        $('#plightbox').on('click', function() {
                $('#plightbox').hide();
        });

        $('.colorfancybox').fancybox();
        
        /* For direct request quote form fields display*/
        var special_flag = '<?php echo $special_p;?>'
        
        if(special_flag==1){
            $("#start_order").hide();
            $("#prod-price-qty").hide();            

           // $("#art_work").show();
            $(".quote-fields").show();  
            $(".size-fields").show();
            $("#request_order").show();
        }
        
        $('.printing_material').on('change', function(e) {
            var option_text = e.target.options[e.target.selectedIndex].text;
                    
            if(option_text=="None" || option_text=="Select Printing material")
            {  
               // $("#art_work").hide();
            }else {
               // $("#art_work").show();
            }
                
        });
        
        $('.productsize').on('change', function(e) {
            var option_text = e.target.options[e.target.selectedIndex].text;
            var option_val = $('.productsize').val();
            
            customsize_disp(option_text);
            
            if(special_flag==1)
            {
                hide_show();
            }    
        });   
        
        var sel_option_val = $.trim($('.productsize').find("option:selected").text()); 
        
        if(sel_option_val=="Custom Size")
        customsize_disp(sel_option_val);        
        
        function customsize_disp(option_text){
            if(option_text=="Custom Size")
            {  
                $("#start_order").hide();
                $("#prod-price-qty").hide();                
            
                $(".quote-fields").show();
                $(".size-fields").show();
                $("#request_order").show();
            }else {
                $("#start_order").show();
                $("#prod-price-qty").show();                
             
                $(".quote-fields").hide();
                $(".size-fields").hide();
                $("#request_order").hide();
            }
        }
        
        /* Get a quote */
        $('#request-quote').on('click', function() {
            $.ajax({
                    url: 'index.php?route=product/product/getaquote&product_id=<?php echo $product_id; ?>',
                    type: 'post',
                    dataType: 'json',
                    data: $('.form-group input[type=\'text\'] , .form-group input[type=\'hidden\'], .form-group input[type=\'radio\']:checked, .form-group input[type=\'checkbox\']:checked, .form-group select,.form-group textarea'),
                    beforeSend: function() {
                            $('#request-quote').button('loading');
                    },
                    complete: function() {
                            $('#request-quote').button('reset');
                    },
                    success: function(json) {
                        $('.alert, .text-danger').remove();
                        $('.form-group').removeClass('has-error');

                        if (json['error']) {
                            if (json['error']['option']) {
                                for (i in json['error']['option']) {
                                    var element = $('#input-option' + i.replace('_', '-'));                                   
                                    element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                }
                            }
                            
                            if (json['error']['quote_hf']) {                             
                              $('#input_quote_hf').after('<div class="text-danger"></div>');
                            }
                            
                            if (json['error']['quote_hi']) {                             
                              $('#input_quote_hi').after('<div class="text-danger"></div>');
                            }
                            
                            if (json['error']['quote_wf']) {                             
                              $('#input_quote_wf').after('<div class="text-danger"></div>');
                            }
                            
                            if (json['error']['quote_wi']) {                             
                              $('#input_quote_wi').after('<div class="text-danger"></div>');
                            }
                            
                            if (json['error']['username']) {
                                $('#input-uname').after('<div class="text-danger"></div>');
                            }
                            
                            if (json['error']['uemail']) {
                                $('#input-uemail').after('<div class="text-danger"></div>');
                            }
                            
                            if (json['error']['uphone']) {
                                $('#input-uphone').after('<div class="text-danger"></div>');
                            }
                            
                            if (json['error']['ucomment']) {
                                $('#input-ucomment').after('<div class="text-danger"></div>');
                            }
                            
                            if (json['error']['quantity']) {                             
                              $('#quote-quantity').after('<div class="text-danger"></div>');
                            }
                            
                            // Highlight any found errors
                            $('.text-danger').parent().addClass('has-error');
                        }

                        if (json['success']) {   
                                
                                $("#start_order").show();
                                $("#prod-price-qty").show();

                               // $("#art_work").hide();
                                $(".quote-fields").hide();
                                $(".size-fields").hide();
                                $("#request_order").hide();
                                
                                if(special_flag==1)
                                {
                                 hide_show();
                                }
                                
                                $('#quote_msg').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                                $( '#prod_page_calc' ).each(function(){
                                    this.reset();
                                });
                                
                                $('.selectpicker').selectpicker('refresh');
                                return false;

                        }
                    }
            });
        });
        
        function hide_show(){
            
            $("#start_order").hide();
            $("#prod-price-qty").hide();

          //  $("#art_work").show();
            $(".quote-fields").show();  
            $(".size-fields").show();
            $("#request_order").show();
           
        }
        
        /* Upload Art work */
        $('button[id^=\'button-upload\']').on('click', function() {
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
    
        /* Ask your question */
        $('#send_question').on('click', function() {
                $.ajax({
                        url: 'index.php?route=product/product/askyourquestion&product_id=<?php echo $product_id; ?>',
                        type: 'post',
                        dataType: 'json',
                        data: $("#ask_question").serialize(),
                        beforeSend: function() {
                                $('#send_question').button('loading');
                        },
                        complete: function() {
                                $('#send_question').button('reset');
                        },
                        success: function(json) {
                    
                                $('.alert-success, .alert-danger').remove();

                                if (json['error']) {
                                        $('#ask_message').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                                }

                                if (json['success']) {
                                        $('#ask_message').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                                        $('input[name=\'uname\']').val('');
                                        $('input[name=\'uemail\']').val('');
                                        $('textarea[name=\'ucomment\']').val('');
                                }
                        }
                });
        });
    
        $("#form-review").hide();

        $('#review-form').on('click', function () {
             $("#form-review").toggle();
        });
    
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
        
        var process_type = $("#process_type").val();
        
        if(process_type==1)
          var process_url = 'index.php?route=common/quickorder/step1';
        else
          var process_url = 'index.php?route=checkout/cart/add';   
       
            $.ajax({
                url: process_url,
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
                                      element.after('<div class="text-danger"></div>');
                                    else
                                      element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');  
                                }
                            }
                        }

                        // Highlight any found errors
                        $('.text-danger').parent().addClass('has-error');
                    }

                    if (json['success']) {   
                        if(process_type==1){
                            $("#prod_page_calc").attr("action", json['redirect']);
                            $("form#prod_page_calc").submit();
                            return false;
                        }else{                       
                            window.location.href = json['redirect'];
                            return false;
                        } 
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
        
        $('#review').delegate('.pagination a', 'click', function(e) {
            e.preventDefault();

            $('#review').fadeOut('slow');

            $('#review').load(this.href);

            $('#review').fadeIn('slow');
        });

        $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

        $('#button-review').on('click', function() {
                $.ajax({
                        url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
                        type: 'post',
                        dataType: 'json',
                        data: $("#form-review").serialize(),
                        beforeSend: function() {
                                $('#button-review').button('loading');
                        },
                        complete: function() {
                                $('#button-review').button('reset');
                        },
                        success: function(json) {
                                $('.alert-success, .alert-danger').remove();

                                if (json['error']) {
                                        $('#rate_message').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                                }

                                if (json['success']) {
                                        $('#rate_message').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                                        $('input[name=\'name\']').val('');
                                        $('textarea[name=\'text\']').val('');
                                        $('input[name=\'rating\']:checked').prop('checked', false);
                                }
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
