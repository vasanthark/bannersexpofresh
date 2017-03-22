<?php echo $header; 

$height_feet = array("13");
$height_inch = array("14");
$width_feet  = array("15");
$width_inch  = array("16");
$double_side  = array("17");
$material_type  = array("19");
$feet_price  = array("22");

$grommets_type  = array("24");
$grommets_qty   = array("25");
$grommets_per_price  = array("46");
$grommets_placements = array("26");
$grommets_placement_other = array("27");

$finishing = array("28");

$strcut_extra_vinyl = array("29");
$finishing_hems    = array("30");
$finishing_pockets = array("31");

$custom_finishing_top  = array("32");
$custom_finishing_lft  = array("33");
$custom_finishing_btm  = array("34");
$custom_finishing_rght = array("35");

$additional_finishing = array("36");

$nylon_webbing = array("37");
$reinforced_hem = array("38");
$reinforced_webbing = array("39");
$velcro = array("40");

$upload_artwork = array("41");
$let_us_design  = array("42");
$let_us_design_prc  = array("43");

$proofing = array("44");
$proofing_email = array("45");

$lamination  = array("47");
$metalsteaks = array("48");

$auto_calc = array("67");

$hqty = 1;
$calculated_feetprice = "0";
$height_feet_value = 1;
$width_feet_value = 1 ;
$pmat_type_val = "";
$pdoubleside_val = "";

$plamination_val = "";
$pmetalsteaks_val = "";

if($home_postdata){

    $hqty = isset($home_postdata['quantity'])?$home_postdata['quantity']:1;
    $calculated_feetprice = isset($home_postdata['calculated_feetprice'])?$home_postdata['calculated_feetprice']:0; 
    
    if(isset($home_postdata['pwidth'])){
    
        $w_fid  = $home_postdata['pwidth'];
        $width_feet_value = isset($home_postdata['option'][$w_fid])?$home_postdata['option'][$w_fid]:1;

        $w_iid  = $home_postdata['pwidthinch'];
        $width_inch_value = isset($home_postdata['option'][$w_iid])?$home_postdata['option'][$w_iid]:0; 

        $h_fid = $home_postdata['pheight'];
        $height_feet_value = isset($home_postdata['option'][$h_fid])?$home_postdata['option'][$h_fid]:1;

        $h_iid  = $home_postdata['pheightinch'];
        $height_inch_value = isset($home_postdata['option'][$h_iid])?$home_postdata['option'][$h_iid]:0;
    }
    
    /* material type */    
    if(isset($home_postdata['pmat_type']) && $home_postdata['pmat_type']!=""){    
        $pmat_type_id  = $home_postdata['pmat_type'];
        $pmat_type_val = $home_postdata['option'][$pmat_type_id];
    }
    
    /* Double side */
    if(isset($home_postdata['pdoubleside']) && $home_postdata['pdoubleside']!=""){
        $pdoubleside_id  = $home_postdata['pdoubleside'];
        $pdoubleside_val = isset($home_postdata['option'][$pdoubleside_id])?$home_postdata['option'][$pdoubleside_id]:"";
    }
    
    /* lamination */
    if(isset($home_postdata['plamination']) && $home_postdata['plamination']!=""){
        $plamination_id  = $home_postdata['plamination'];
        $plamination_val = isset($home_postdata['option'][$plamination_id])?$home_postdata['option'][$plamination_id]:"";
    }
    
    /* Metal Steaks */
    if(isset($home_postdata['pmetalsteaks']) && $home_postdata['pmetalsteaks']!=""){
        $pmetalsteaks_id  = $home_postdata['pmetalsteaks'];
        $pmetalsteaks_val = isset($home_postdata['option'][$pmetalsteaks_id])?$home_postdata['option'][$pmetalsteaks_id]:"";
    }
}  

$pmat_optionid = "";
$hf_optionid = "";
$hi_optionid = "";
$wf_optionid = "";
$wi_optionid = "";
$pdoubleside_optionid = "";
?>
<div class="body-outer-cont">
    <div class="container">
        <div class="row">
            <h1>Please Proceed With the Form Given Below</h1>
        </div>
    </div>
</div>
<div class="body-cont">
    <div class="container">
        <div class="row">
            <div class="body-container-fluid inner-pages"><!--Main Content-->        
                <div class="container" id="producthome">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-left">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <h4><img src="image/catalog/one.png"  alt="Step"> Select The Banner Size & Quantity</h4>
                                    </div>
                                    <?php
                                        // Height Feet
                                        foreach ($options as $option){ 
                                            if (in_array($option['option_id'], $height_feet)){ ?>
                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                                <label> Dimensions <br/>
                                                    Height x Width</label>
                                            </div>
                                        <?php 
                                            } 
                                        } 
                                        ?>
                                        
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-9">
                                        <?php
                                        // Height Feet
                                        foreach ($options as $option){ 
                                            if (in_array($option['option_id'], $height_feet)){
                                            $hf_optionid = $option['product_option_id'];  
                                            
                                            $option['value'] = $height_feet_value;
                                            ?>
                                            <div class="form-group width-filed <?php echo ($option['required'] ? ' required' : ''); ?>">          
                                                <div class="">
                                                    <label> H'(feet)</label>
                                                    <input type="text" class="form-control numberentry"  placeholder="0" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>">                                             
                                                </div>
                                            </div>
                                            <?php 
                                            } 
                                        } 
                                       
                                        // Height Inch
                                        foreach ($options as $option){ 
                                            if (in_array($option['option_id'], $height_inch)){  
                                            $hi_optionid = $option['product_option_id'];  
                                            $option['value'] = (isset($height_inch_value) && $height_inch_value!="")?$height_inch_value:0;
                                            ?>
                                            <div class="form-group width-filed <?php echo ($option['required'] ? ' required' : ''); ?>">          
                                                <div class="">
                                                    <label> H'(Inch)</label>
                                                    <input type="text" class="form-control numberentry"  placeholder="0" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>">                                             
                                                </div>
                                            </div>
                                            <?php 
                                            } 
                                        } 
                                    
                                        // Width Feet
                                        foreach ($options as $option){ 
                                            if (in_array($option['option_id'], $width_feet)){
                                            $wf_optionid = $option['product_option_id']; 
                                           
                                            $option['value'] = $width_feet_value;
                                            ?>
                                            <div class="form-group width-filed <?php echo ($option['required'] ? ' required' : ''); ?>">          
                                                <div class="">
                                                    <label> W'(feet)</label>
                                                    <input type="text" class="form-control numberentry"  placeholder="0" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>">                                             
                                                </div>
                                            </div>
                                            <?php 
                                            } 
                                        } 
                                       
                                        // Width Inch
                                        foreach ($options as $option){ 
                                            if (in_array($option['option_id'], $width_inch)){
                                            $wi_optionid = $option['product_option_id'];
                                            $option['value'] = (isset($width_inch_value) && $width_inch_value!="")?$width_inch_value:0;
                                            ?>
                                            <div class="form-group width-filed w-inch <?php echo ($option['required'] ? ' required' : ''); ?>">          
                                                <div class="">
                                                    <label> W'(Inch)</label>
                                                    <input type="text" class="form-control numberentry"  placeholder="0" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" id="input-option<?php echo $option['product_option_id']; ?>">                                             
                                                </div>
                                            </div>
                                            <?php 
                                            } 
                                        } 
                                        
                                        // Price per feet
                                        foreach ($options as $option){
                                            if (in_array($option['option_id'], $feet_price))
                                            {                                               
                                            ?> 
                                            <input type="hidden" value="<?php echo $option['value']; ?>"  name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>">                                                                                       
                                            <?php 
                                            }
                                        }
                                        ?>
                                    </div>
                                    
                                    <?php     
                                    // Material type                                   
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $material_type)){
                                              $pmat_optionid = $option['product_option_id'];
                                        ?>  
                                        <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>"">
                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                                <label> <?php echo $option['name']; ?></label>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-9">
                                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker material_type">                                                  
                                                    <?php foreach ($option['product_option_value'] as $option_value) 
                                                    { ?>
                                                    <?php 
                                                    if ($option_value['priceonly']) { 
                                                    $additnal_price = $option_value['priceonly'];
                                                    }else{
                                                    $additnal_price = '0';
                                                    }   
                                                    ?>
                                                    <option rel="<?php echo $additnal_price;?>" <?php if($pmat_type_val==$option['product_option_id']){ echo 'selected="selected"'; }?> value="<?php echo $option_value['product_option_value_id']; ?>">
                                                        <?php echo $option_value['name']; ?>                                                       
                                                    </option>
                                                    <?php 
                                                    } ?>
                                                </select>  
                                            </div>
                                        </div>
                                        <?php 
                                        }
                                    }
                                    ?> 
                                    
                                    <?php
                                    // Two side banner
                                    
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $double_side)){ 
                                         $pdoubleside_optionid = $option['product_option_id'];
                                        ?>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-12 twosidebanner">
                                            <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">                                               
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <input <?php if($pdoubleside_val!=""){ echo "checked";} ?> data-id="<?php echo $option['name']; ?>" class="subject-list1" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php } ?> 
                                                <label> <?php echo $option['name']; ?></label>                                               
                                                <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <?php 
                                        } 
                                    }?> 
                                    
                                    <?php
                                    // Lamination                                    
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $lamination)){ 
                                        ?>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-12 twosidebanner">
                                            <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">                                               
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <input <?php if($plamination_val!=""){ echo "checked";} ?> data-id="<?php echo $option['name']; ?>" class="subject-list1" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php } ?> 
                                                <label> <?php echo $option['name']; ?></label>                                               
                                                <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <?php 
                                        } 
                                    }?> 
                                    
                                    <?php
                                    // Metal steaks                                    
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $metalsteaks)){ 
                                        ?>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-12 twosidebanner">
                                            <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">                                               
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <input <?php if($pmetalsteaks_val!=""){ echo "checked";} ?> data-id="<?php echo $option['name']; ?>" class="subject-list1" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php } ?> 
                                                <label> <?php echo $option['name']; ?></label>                                               
                                                <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <?php 
                                        } 
                                    }?> 
                                    
                                    <?php
                                    // Grommets per price                                   
                                    foreach ($options as $option){
                                        if (in_array($option['option_id'], $grommets_per_price)){ 
                                        $grommte_price = $option['value'];
                                        ?> 
                                         <input type="hidden" value="<?php echo $option['value']; ?>" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>">
                                         <input type="hidden" name="pgroometprice" id="pgroometprice" value="<?php echo $option['product_option_id']; ?>">    
                                        <?php 
                                        }
                                    }?>
                                       
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                       <h5> Grommets <span> (every 2 feet recommended)</span></h5>
                                   </div>   
                                    
                                    <div class="form-group">
                                    <?php                                      
                                    // Grommets Type
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $grommets_type)){
                                        ?>                                         
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                            <label>Grommets Types</label>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">                                                                   
                                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?>)">
                                                <option value="">---Select One---</option>
                                          <?php foreach ($option['product_option_value'] as $option_value){ ?>
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
                                    
                                    // Grommets Qty
                                    foreach ($options as $option) {      
                                        if (in_array($option['option_id'], $grommets_qty)){
                                        ?>
                                            <div class="col-xs-2 col-sm-6 col-md-6 col-lg-1 mobile-qty">
                                                <label> Qty </label>
                                            </div>
                                            <div class="col-xs-4 col-sm-6 col-md-6 col-lg-2 mobile-qty">
                                                <div class="qty-filed qty-filed3">                                              
                                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control grmtqty numberentry" value="" />                                               
                                                </div>
                                            </div>
                                            <input type="hidden" name="pgroometqty" id="pgroometqty" value="<?php echo $option['product_option_id']; ?>">   
                                        <?php 
                                        } //end of second if
                                    //end of loop
                                    } ?>
                                     </div>
                                    
                                    <?php
                                    // Auto calculation of grommets Qty                                    
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $auto_calc)){ 
                                         $autocalc_optionid = $option['product_option_id'];
                                        ?>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-12 twosidebanner">
                                            <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">                                               
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <input class="auto-calc-check" data-id="<?php echo $option['name']; ?>" data-name="<?php echo $option['product_option_id']; ?>" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>">
                                                <?php } ?> 
                                                <label> <?php echo $option['name']; ?> </label> <span> ( per grommet price $<?php echo $grommte_price; ?> )</span>                                                                                              
                                            </div>
                                        </div>
                                        <?php 
                                        } 
                                    }?> 
                                    
                                    <?php                                    
                                    // Placement
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $grommets_placements)){
                                        ?>   
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <h5> Placements </h5>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="red_text" style="display:none;">
                                                <p style="color:red;">The selected grommet position in on the 4 corners, please change grommet quantity or choose other positions!</p>
                                            </div>
                                            <?php 
                                            $opl = 1;
                                            foreach ($option['product_option_value'] as $option_value){ 
                                            
                                                if (trim(strtolower($option_value['name']))=="custom") {
                                                    $placement_class = ' placement_other';
                                                    ?>
                                                     <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                                        <input data-id="<?php echo $option_value['name']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($opl==1){ echo 'checked=""'; } ?> type="radio" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker <?php echo $placement_class;?>">
                                                        <?php echo $option_value['name']; ?>
                                                        ( Fill the grommet Qty above!! )
                                                    </div>
                                                    <?php
                                                }else{
                                                    $placement_class = ' placement_not_other';
                                                    ?>
                                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                        <input data-id="<?php echo $option_value['name']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>" <?php if($opl==1){ echo 'checked=""'; } ?> type="radio" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker <?php echo $placement_class;?>">
                                                        <?php echo $option_value['name']; ?>
                                                    </div>
                                                    <?php
                                                } 
                                                $opl++;
                                            } 
                                            
                                            // Grommets placement other
                                            foreach ($options as $option) {      
                                                if (in_array($option['option_id'], $grommets_placement_other)){
                                                ?>                                                    
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 notes-field" id="placementother"> 
                                                        <textarea rows="5" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control form-notes" placeholder="Please enter your custom grommet requirements." ></textarea>
                                                    </div>
                                                <?php
                                                }
                                            } ?>  
                                    </div>
                                        <?php 
                                        }
                                    }
                                 
                                    // Finishing
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $finishing)){
                                        ?>   
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <h5> Finishing </h5>
                                            </div>
                                            <?php foreach ($option['product_option_value'] as $option_value){ ?>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                                    <input value="<?php echo $option_value['product_option_value_id']; ?>" data-id="<?php echo $option_value['name']; ?>" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker finishing">
                                                    <?php echo $option_value['name']; ?>
                                                </div>
                                            <?php 
                                            } ?>  
                                        </div>
                                        <?php 
                                        }
                                    }

                                    // Straight cut with extra vinyl
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $strcut_extra_vinyl)){
                                        ?>
                                        <div id="finishingoptions1">
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">                                           
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 text-center">  Extra Vinyl Size(inch): </div>
                                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                                <div class="qty-filed qty-filed3">
                                                                    <input class="form-control" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="0" id="input-option<?php echo $option['product_option_id']; ?>" min="1" max=""/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>                                           
                                                </div>
                                            </div> 
                                        </div>    
                                        <?php  
                                        }
                                    }
                                    ?>
                                    
                                    <div id="finishingoptions2">
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="inner-from-group">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <?php     
                                                            // finishing_hems
                                                            foreach ($options as $option){ 
                                                                if (in_array($option['option_id'], $finishing_hems)){
                                                                ?>  
                                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 text-center"> Hemmings </div>
                                                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                                                        <option value="">---Select One---</option>
                                                                        <?php foreach ($option['product_option_value'] as $option_value){ 
                                                                        ?>
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
                                                        </div>
                                                        <div class="form-group">
                                                            <?php     
                                                            // finishing_pockets
                                                            foreach ($options as $option){ 
                                                                if (in_array($option['option_id'], $finishing_pockets)){
                                                                ?>  
                                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 text-center"> Pole Pockets </div>
                                                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                                                        <option value="">---Select One---</option>
                                                                        <?php foreach ($option['product_option_value'] as $option_value){ 
                                                                        ?>
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
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="finishingoptions3">
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="inner-from-group">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <?php     
                                                            // custom_finishing_top
                                                            foreach ($options as $option){ 
                                                            if (in_array($option['option_id'], $custom_finishing_top)){
                                                            ?>  
                                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"> Top </div>
                                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                                                        <option value="">-Select-</option>
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
                                                            
                                                            // custom_finishing_lft
                                                            foreach ($options as $option){ 
                                                            if (in_array($option['option_id'], $custom_finishing_lft)){
                                                            ?>  
                                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"> Left </div>
                                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                                                        <option value="">-Select-</option>
                                                                        <?php foreach ($option['product_option_value'] as $option_value){ 
                                                                         ?>
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
                                                        </div>                                                  
                                                        <div class="form-group">
                                                            <?php     
                                                            // custom_finishing_btm
                                                            foreach ($options as $option){ 
                                                                if (in_array($option['option_id'], $custom_finishing_btm)){
                                                                ?>  
                                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"> Bottom </div>
                                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                                                        <option value="">-Select-</option>
                                                                        <?php foreach ($option['product_option_value'] as $option_value){ ?>
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
                                                            
                                                            // custom_finishing_rght
                                                            foreach ($options as $option){ 
                                                                if (in_array($option['option_id'], $custom_finishing_rght))
                                                                {
                                                                ?>  
                                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"> Right </div>
                                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice(<?php echo $product_id; ?> )">
                                                                        <option value="">-Select-</option>
                                                                        <?php foreach ($option['product_option_value'] as $option_value){ 
                                                                        ?>
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
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-left form-right">
                                <div class="row">
                                    <?php     
                                    // additional_finishing
                                    foreach ($options as $optionParent){ 
                                        if (in_array($optionParent['option_id'], $additional_finishing)){ ?>
                                        <div class="">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <h5> Additional finishing</h5>
                                            </div>
                                            <?php
                                            $k=1;
                                            foreach ($optionParent['product_option_value'] as $option_value){                                              
                                            ?>
                                            <?php  if($k%2==1){ ?>
                                            <div class="form-group">
                                            <?php }?> 
                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <input value="<?php echo $option_value['product_option_value_id']; ?>" data-id="<?php echo $option_value['name']; ?>" type="radio" name="option[<?php echo $optionParent['product_option_id']; ?>]" id="input-option<?php echo $optionParent['product_option_id']; ?>" class="selectpicker additional_finishing">
                                                    <?php echo $option_value['name']; ?>  
                                                </div>  
                                                <?php 
                                                if($option_value['name']=="Nylon Webbing"){ 
                                                $dropdown_values = $nylon_webbing;
                                                }else if($option_value['name']=="Reinforced Hem"){
                                                $dropdown_values = $reinforced_hem;
                                                }else if($option_value['name']=="Reinforced Webbing"){
                                                $dropdown_values = $reinforced_webbing;
                                                }else if($option_value['name']=="Velcro"){
                                                $dropdown_values = $velcro;
                                                }    

                                                // Dropdown values
                                                foreach ($options as $option){ 
                                                    if (in_array($option['option_id'], $dropdown_values))
                                                    {
                                                    ?>
                                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                            <select disabled="" data-id="<?php echo $option_value['name']; ?>" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker add_finish_dropvalue" onchange="addtoprice(<?php echo $product_id; ?> )">
                                                            <option value="">-</option>
                                                      <?php foreach ($option['product_option_value'] as $option_value1){ 
                                                                if ($option_value['priceonly']) { 
                                                                $additnal_price = $option_value1['priceonly'];
                                                                }else{
                                                                $additnal_price = '0';
                                                                }   
                                                    ?>
                                                            <option rel="<?php echo $additnal_price;?>" value="<?php echo $option_value1['product_option_value_id']; ?>">
                                                                <?php echo $option_value1['name']; ?>                                                              
                                                            </option>
                                                            <?php 
                                                            } ?>
                                                        </select>  
                                                    </div> 
                                                <?php }
                                                }?> 
                                        <?php  if($k%2==0){ ?>
                                            </div>  
                                         <?php }
                                            $k++;
                                            } ?>
                                        </div>
                                        <?php 
                                            }
                                        } ?>                                     
                               
                                    <?php 
                                    // Upload your file
                                    foreach ($options as $option) {  
                                         if ($option['type'] == 'file') { ?>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <h5> Artwork</h5>
                                            </div>                                         
                                            <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">                                            
                                                <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-file"><i class="fa fa-upload"></i> Upload Your Artwork</button>
                                                <span id="file_name_disp">                                                    
                                                    <?php if (!empty($postDataRequest['optionimgvalue']) ) 
                                                    { echo $postDataRequest['optionimgvalue']; } 
                                                    ?>
                                                </span>
                                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 text-center ortxt"> Or </div>
                                            <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5"> 
                                                <span class="btn btn-default start-designbtn" id="let-us-design"> Let Us Design For You </span> 
                                                <input type="hidden" value="0" id="let_us_design_value" name="let_us_design_value">
                                            </div>
                                        </div>
                                    <?php }
                                    }

                                    // let us design prc
                                    foreach ($options as $option){
                                        if (in_array($option['option_id'], $let_us_design_prc))
                                        { 
                                            $let_us_perm_pr = $option['value'];
                                        ?> 
                                        <input type="hidden" value="<?php echo $option['value']; ?>" id="let_us_perm_prc"  name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>">                                           
                                        <input type="hidden" value="<?php echo $option['value']; ?>" data-id="<?php echo $option['value']; ?>" id="let_us_prc" name="let_us_prc">
                                        <?php 
                                        }
                                    }

                                    // let us check
                                    foreach ($options as $option){
                                        if (in_array($option['option_id'], $let_us_design))
                                        {
                                        ?>   
                                        <div class="form-group" id="let-us-design-content" style="display:none;">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
                                                <label> Please provide some information about your idea like color, text etc </label>   <b>(<?php echo "+$".$let_us_perm_pr;?>)</b>                                          
                                                <textarea rows="5" name="option[<?php echo $option['product_option_id']; ?>]" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control notes2" ></textarea>
                                            </div>
                                        </div>
                                    <?php }
                                    }

                                    // Proofing
                                    foreach ($options as $option){ 
                                        if (in_array($option['option_id'], $proofing)){
                                        ?>  
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <h5> Proofing</h5>
                                            </div>
                                            <?php 
                                            $profk=1;
                                            foreach ($option['product_option_value'] as $option_value){ ?>                                           
                                            <?php if($profk==1){ ?>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <?php }else{ ?>
                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-5">
                                            <?php }?>
                                                <input data-id='<?php echo $profk;?>' value="<?php echo $option_value['product_option_value_id']; ?>" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker proof_option">
                                                <?php echo $option_value['name']; ?> 
                                            </div>
                                            <?php
                                            $profk++;
                                            }
                                                
                                            // proofing email
                                            foreach ($options as $option){ 
                                                if (in_array($option['option_id'], $proofing_email)){
                                                ?>
                                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-7" id="proof_email">
                                                    <input class="form-control" type="text" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" placeholder="Enter your email"/>
                                                </div>
                                                <?php 
                                                break;
                                                }
                                            }                                       
                                            ?>
                                        </div>
                                        <?php 
                                        }
                                    }                                       
                                    ?>
                                    
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
<div class="form-group">
                                            <label> Qty </label>
                                            <input class="form-control" type="text" name="quantity" value="<?php echo $hqty;?>" id="input-quantity" min="1" max="<?php echo $postDataRequest['quantity']; ?>"  onchange="addtoprice(this, <?php echo $product_id;?>)"/>
 </div>
                                        </div>
                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 feet2">
                                            <div class="">
                                                <div class="price">
                                                    <?php 
                                                    if ($price){ 
                                                        if (!$special) {  ?>
                                                        <span class="price1 badge" id="pricediv">Price: <?php echo $price; ?></span>  
                                                        <?php } else { ?>
                                                        <span style="text-decoration: line-through;"><?php echo $price; ?></span>
                                                        <span class="price1 badge"><?php echo $special; ?></span>
                                                        <?php
                                                        }
                                                    }?>                 
                                                </div>
                                            </div>
                                        </div>       
                                   

                                    <div class="form-group">
                                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 ">                                           
                                            <div class="quick-order">                                
                                                <input type="hidden" name="pwidth" id="pwidth" value="<?php echo  $wf_optionid ;?>">
                                                <input type="hidden" name="pwidthinch" id="pwidthinch" value="<?php echo  $wi_optionid ;?>">
                                                <input type="hidden" name="pheight" id="pheight" value="<?php echo  $hf_optionid;?>">    
                                                <input type="hidden" name="pheightinch" id="pheightinch" value="<?php echo  $hi_optionid;?>">    
                                                <input type="hidden" name="pmat_type" id="pmat_type"  value="<?php echo $pmat_optionid;?>">
                                                <input type="hidden" name="pmat_type_value" id="pmat_type_value"  value="">
                                                <input type="hidden" name="grommet_pos_value" id="grommet_pos_value"  value="">    
                                                <input type="hidden" name="auto_calc" id="auto_calc" value="<?php echo $autocalc_optionid;?>" />
                                                <input type="hidden" name="pdoubleside" id="pdoubleside"  value="<?php echo $pdoubleside_optionid;?>">
                                                <input type="hidden" name="pfeetprice" id="pfeetprice" value="<?php echo  $feetprice_only;?>"> 
                                                <input type="hidden" name="calculated_feetprice" id="calculated_feetprice" value="<?php echo $calculated_feetprice;?>">
                                                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                                                <input type="hidden" name="proof_id" value="" />
                                                <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary home-addtocart">Quick Order</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/Main Content--> 
            </div>
        </div>
    </div>
</div>    
    <script type="text/javascript">
    $(function () {
    
        var pid = "<?php echo $product_id;?>";
        var pmat_type_val = "<?php echo $pmat_type_val;?>";
        
        if(pmat_type_val!="")
        {    
            var mtype_text   = $.trim($('.material_type').find("option:selected").text());  
            $('#pmat_type_value').val(mtype_text);
            $('.material_type').selectpicker('val', pmat_type_val);     
            $('.material_type').selectpicker('refresh');
        }
         
        if ( $('#let-us-design-content').is(':hidden') ) {           
            $("#let_us_prc").val("0");
            $("#let_us_perm_prc").val("0");
        }
        
        /* Get material type price */
        var mtype_text   = $.trim($('.material_type').find("option:selected").text());  
        setfeetprice(mtype_text,pid);
        
        $(document).on('change', '.material_type', function() {  
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
        
        var pval = $('input.placement_not_other').data("id");
        $('#grommet_pos_value').val(pval);
        if(pval=="All Side"){
         // $(".grmtqty").prop('disabled', true);
          calcualte_qty(pid,pval);  
          $(this).selectpicker('refresh');       
        }
       
        // addtoprice(pid);       

        $('#producthome input[type=\'text\']').bind('keyup', function (e) {  
        
            var selected1 = $('input.placement_not_other:checked');
            var selected2 = $('input.placement_other:checked');
            
            if ($(".auto-calc-check").is(":checked")) {                
                if (selected1.length > 0) {
                    pval = selected1.data("id");
                    $('#grommet_pos_value').val(pval);
                    calcualte_qty(pid,pval);  
                }else if(selected2.length > 0) {
                    $(".grmtqty").val('4');
                    $(this).selectpicker('refresh');
                    addtoprice(pid);  
                }                           
            }else{
                if (selected1.length > 0) {
                    pval = selected1.data("id");
                    if(pval=="All Side"){
                        $('#grommet_pos_value').val(pval);
                        calcualte_qty(pid,pval); 
                    }
                }else if(selected1.length > 0) {
                    $(".grmtqty").val('4');
                    $(this).selectpicker('refresh');                    
                }else{                 
                    addtoprice(pid);
                }
            }  
        });
        
        // Auto calcualtion grommet Qty  
        $(document).on('ifChecked', 'input.auto-calc-check', function(event) {
            $(".grmtqty").prop('disabled', true);
            groomet_auto_cal_qty(pid)
            $(this).selectpicker('refresh');   
        });

        $(document).on('ifUnchecked', 'input.auto-calc-check', function(event) {
           $(".grmtqty").prop('disabled', false);  
           var selected1 = $('input.placement_not_other:checked');
           var selected2 = $('input.placement_other:checked');
           if (selected1.length > 0) {
                pval = selected1.data("id");
            }else if(selected2.length > 0) {
                pval = selected2.data("id");
            }    
           set_groomet_qty(pid,pval);
           $(this).selectpicker('refresh');              
        });
        
        function groomet_auto_cal_qty(pid){
            var selected1 = $('input.placement_not_other:checked');
            var selected2 = $('input.placement_other:checked');
            if (selected1.length > 0) {
                pval = selected1.data("id");
                $('#grommet_pos_value').val(pval);
                calcualte_qty(pid,pval);  
            }else if(selected2.length > 0) {
                $(".grmtqty").val('4');
                $(this).selectpicker('refresh');
                addtoprice(pid);  
            }     
        }
                        
        // Two side banner , Lamination , Metal steaks  
        $('input.subject-list1').on('ifChecked', function (event) { 
            addtoprice(pid);
        });

        $('input.subject-list1').on('ifUnchecked', function (event) {  
           addtoprice(pid);          
        });
        
        // Custom Placement grommet Qty counts
        
        $('#placementother').hide();
        
        $('input.placement_other').on('ifChecked', function (event) { 
           $("#red_text").hide();
           $(".grmtqty").prop('disabled', false);
           $(".grmtqty").val('4');
           $(this).selectpicker('refresh');
           addtoprice(pid);       
           $('#placementother').show();           
        });

        $('input.placement_other').on('ifUnchecked', function (event) {  
         //  $(".grmtqty").prop('disabled', true);
           $("#red_text").hide();
           $(this).selectpicker('refresh');
           addtoprice(pid);  
           $('#placementother').hide();          
        });
        
        // Other Placements grommet Qty counts
        $('input.placement_not_other').on('ifChecked', function (event) {  
            if ($(".auto-calc-check").is(":checked")) {
                 $(".grmtqty").prop('disabled', true);
            }else{
                 $(".grmtqty").prop('disabled', false);
            }
            var pval = $(this).data("id");   
            set_groomet_qty(pid,pval);
            $(this).selectpicker('refresh');                  
        });
        
        function set_groomet_qty(pid,pval){     
            $("#red_text").hide();
            $('#grommet_pos_value').val(pval);
            if(pval=="All 4 corners only" ){
                $(".grmtqty").val('4');
                $("#red_text").show();
                addtoprice(pid);  
            }else if(pval=="No Grommets"){
                $(".grmtqty").prop('disabled', true);
                $(".grmtqty").val('0');  
                addtoprice(pid);  
            }else if ($(".auto-calc-check").is(":checked")) {
               calcualte_qty(pid,pval);   
            }else{ 
                if(pval=="All Side"){  
                  calcualte_qty(pid,pval);  
                }else if(pval=="Bottom Only" || pval=="Top Only"){
                  $(".grmtqty").val('2');  
                  addtoprice(pid); 
                }else{
                  $(".grmtqty").val('4');  
                  addtoprice(pid); 
                }
            }   
        }
        
        // Finishing        
        $('#finishingoptions1').hide();
	$('#finishingoptions2').hide();
	$('#finishingoptions3').hide();
        
        $('input.finishing').on('ifChecked', function (event) {            
            var finishingval = $(this).data("id");
            if(finishingval=="Straight Cut with Extra Vinyl"){                
                $('#finishingoptions1').show();
		$('#finishingoptions2').hide();
		$('#finishingoptions3').hide();
            }else if(finishingval=="Hems & Pockets"){
                $('#finishingoptions1').hide();
		$('#finishingoptions2').show();
		$('#finishingoptions3').hide();
            }else if(finishingval=="Custom finishing on Each Side"){ 
                $('#finishingoptions1').hide();
		$('#finishingoptions2').hide();
		$('#finishingoptions3').show();
            }else{
                $('#finishingoptions1').hide();
		$('#finishingoptions2').hide();
		$('#finishingoptions3').hide();
            }
        }); 
        
        // Additional finishing
        $('input.additional_finishing').on('ifChecked', function (event) {  
           var parent_val = $(this).data("id");
           
           $(".add_finish_dropvalue").each(function() {        
                var drop_val = $(this).data("id");
               
                if (parent_val == drop_val) {
                   $(this).removeAttr('disabled');
                   $(this).selectpicker('refresh');
                } else {
                   $(this).attr('disabled',true);
                   $(this).selectpicker('refresh');
                }
                   
                $('.add_finish_dropvalue').selectpicker('val', "");     
                $('.add_finish_dropvalue').selectpicker('refresh');
            });
            
           addtoprice(pid);            
       }); 
       
       // Let us design  
       $('#let-us-design').on('click', function() {
            $("#let-us-design-content").toggle();
            var let_uspriceval = $("#let_us_prc").data("id");          
            if ( $('#let-us-design-content').is(':hidden') ) {           
                $("#let_us_prc").val("0");
                $("#let_us_design_value").val("0");
            }else{               
                $("#let_us_prc").val(let_uspriceval);
                $("#let_us_perm_prc").val(let_uspriceval);
                $("#let_us_design_value").val("1");
            }
            
            addtoprice(pid); 
	});
        
       // Proof Email
        $('#proof_email').hide();
        
        $('input.proof_option').on('ifChecked', function (event) {            
            var proofval = $(this).data("id");
            if(proofval==2){
                $('#proof_email').show();  
                $('#proof_id').val('2');
            }else{
                $('#proof_email').hide();
            }
        });
 
        $('#button-cart').on('click', function () {
            $.ajax({                
                url: 'index.php?route=checkout/cart/add',
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
                    
                        $(location).attr('href', json['redirect']);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
            
        });
    
        // Upload art work                
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
                                                        $("#file_name_disp").html("<i class='fa fa-file-image-o' ></i> "+json['filename']);
                                                        alert(json['success']);
                                                        $(node).parent().find('input').attr('value', json['code']);
                                                }
                                        },
                                        error: function(xhr, ajaxOptions, thrownError) {
                                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                        }
                                });
                        }
                }, 500);
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

    });  

    function addtoprice(pid)
    {
        $.ajax({
            url: 'index.php?route=product/product/calculate&product_id=' + pid,
            type: 'post',
            data: $('input[type=\'text\'] , input[type=\'hidden\'], input[type=\'radio\']:checked, input[type=\'checkbox\']:checked, select'),
            dataType: 'json',
            success: function (json) {
                if (json['success']) {
                    $('#pricediv').html("Price: " + json['price']);
                    $('#calculated_feetprice').val(json['calculated_feetprice']);
                }
            }
        });
    }
    
    function calcualte_qty(pid,pval)
    {
        $.ajax({
            url: 'index.php?route=product/product/qtycalculate&product_id=' + pid,
            type: 'post',
            data: $('input[type=\'text\'] , input[type=\'hidden\'], input[type=\'radio\']:checked, input[type=\'checkbox\']:checked, select'),
            dataType: 'json',
            async : 'false',
            success: function (json) {
                if (json['success']) {
                    $(".grmtqty").val(json['grmtqty']);
                    addtoprice(pid);
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