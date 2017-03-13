<?php 

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

// size
foreach ($options as $option) 
{ 
if (in_array($option['option_id'], $size))
{ 

?>  
<div class="form-group">                                
    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker productsize">
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
// material type
foreach ($options as $option) 
{ 
if (in_array($option['option_id'], $material_type))
{
$pmat_optionid = $option['product_option_id'];
?>  
<div class="form-group">                                
    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker material_type" onchange="addtoprice(<?php echo $product_id; ?> )">      
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
        <a href="<?php echo $siteurl;?>techspecification/<?php echo $pdf_name;?>" class="tech colorfancybox">See Color Chart</a> 
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
}?>

<?php
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
?> 
<?php

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
                <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="quote-quantity" class="form-control numberentry" />                                   
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
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                    
                <?php 
                if ($price) 
                { 
                if (!$special) {  ?>
                <p class="price1" id="pricediv">Price: <?php echo $price; ?></p>  
                <?php } else { ?>
                <p style="text-decoration: line-through;"><?php echo $price; ?></p>
                <p class="price1"><?php echo $special; ?></span>
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
<div class="form-group">
    <div class="row">     
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
                <input type="hidden" name="product_id" id="org_prod_id" value="<?php echo $product_id; ?>" />   
                <input type="hidden" name="product_url" id="product_url" value="<?php echo $product_url; ?>" />   
                <input type="hidden" name="process_type" id="process_type" value="<?php echo $direct_checkout; ?>" /> 
                 <button type="button" id="button-cart" data-loading-text="Loading.." class="btn btn-default btn-file1">Quick Order</button>
            </div> 
    </div>
</div>
