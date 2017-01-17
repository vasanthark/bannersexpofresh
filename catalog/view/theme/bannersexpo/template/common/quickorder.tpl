<?php echo $header; 

$height_feet = array("13");
$height_inch = array("14");
$width_feet  = array("15");
$width_inch  = array("16");
$double_side  = array("17");
$material_type  = array("19");

$grommets_type  = array("24");
$grommets_qty   = array("25");
$grommets_per_price  = array("46");
$grommets_placements = array("26");

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
            <div class="inner-pages" data-sticky_parent>
                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                    <div class="form-left">
                        <div class="row">

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h4><img src="image/one.png"  alt=""> Select Your Product, Size & Quantity</h4>
                            </div>                         

                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                <label>Height</label>
                                <div class="height">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
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
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
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

                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 ">
                                <label>Width</label>
                                <div class="height">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">                                                   
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
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
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

                            <?php     
                            // Material type
                            foreach ($options as $option) 
                            { 
                            if (in_array($option['option_id'], $material_type))
                            {
                            ?>  
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group <?php echo ($option['required'] ? ' required' : ''); ?>">                                   
                                    <label><?php echo $option['name']; ?> </label>
                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice( < ?php echo $product_id; ? > )">
                                        <option value="">---Select One---</option>
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
                            </div>
                            <?php 
                            }
                            }
                            ?>  


                            <div class="col-xs-12 col-sm-12 col-md-7 col-lg-6 double-side">
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

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h5> Grommets <span>  (every 2 feet recommended) </span></h5>
                            </div>
                            
                            <?php     
                            // grommets_type
                            foreach ($options as $option) 
                            { 
                            if (in_array($option['option_id'], $grommets_type))
                            {
                            ?>  
                            <div class="col-xs-9 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label> Grommets Types</label>
                                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="selectpicker" onchange="addtoprice( < ?php echo $product_id; ? > )">
                                        <option value="">---Select One---</option>
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
                            </div>
                            <?php 
                            } 
                            } 
                            ?>  
                            
                            <div class="col-xs-3 col-sm-6 col-md-6 col-lg-6">
                                <div class="qty-filed qty-filed3">
                                    <label> QTY </label>
                                    <input type="text" class="form-control">
                                </div>
                                (per grommet price $ 1.50)
                            </div>


                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <h5> Placements  </h5>
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                    <input type="radio" name="iCheck">
                                    All Sides </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                    <input type="radio" name="iCheck">
                                    All 4 Corners Only </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                    <input type="radio" name="iCheck">
                                    Top & Bottom </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                    <input type="radio" name="iCheck">
                                    Top Only </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                    <input type="radio" name="iCheck">
                                    Left & Right sides </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                    <input type="radio" name="iCheck">
                                    No Grommets </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                    <input type="radio" name="iCheck">
                                    Bottom Only </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                    <input type="radio" name="iCheck">
                                    Others </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 notes-field">
                                    <textarea rows="4" class="form-control form-notes" placeholder="Notes"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <h5> Finishing <span> </span></h5>
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <input type="radio" name="iCheck2">
                                    Straight Cut  </div>
                                <div class="col-xs-12 col-sm-5 col-md-6 col-lg-4">
                                    <input type="radio" name="iCheck2">
                                    Straight Cut with Extra Vinyl  </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-3">
                                    <select class="selectpicker ">
                                        <option>1</option>
                                        <option>2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="checkbox">
                                    Wind slits  </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-2 col-sm-1 col-md-1 col-lg-1 chek-field">
                                    <input type="radio" name="iCheck2">
                                </div>
                                <div class="col-xs-10 col-sm-11 col-md-11 col-lg-11">
                                    <div class="inner-from-group">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3"> Hems  </div>
                                                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                                    <select class="selectpicker ">
                                                        <option>----Select One----</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3"> Pockets  </div>
                                                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                                    <select class="selectpicker ">
                                                        <option>----Select One----</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="radio">
                                    Custom Finish On Each Side  </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-11 col-md-11 col-lg-11 col-xs-offset-1">
                                    <div class="inner-from-group">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"> Top </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <select class="selectpicker ">
                                                        <option> -Select-</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"> Left </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <select class="selectpicker ">
                                                        <option> -Select-</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"> Bottom </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <select class="selectpicker ">
                                                        <option> -Select-</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"> Right </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                                    <select class="selectpicker ">
                                                        <option> -Select-</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <h5>Additions</h5>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-7">
                                    <label> Select additional services you require</label>
                                    <select class="selectpicker">
                                        <option>----Select One----</option>
                                    </select>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2">
                                    <div class="qty-field">
                                        <label> QTY </label>
                                        <input  type="text" class="form-control" >
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 ">
                                    <div class="color-field">
                                        <select class="selectpicker">
                                            <option>White</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h5> Velcro Placements<span class="badge">1</span> </h5>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="iCheck">
                                All Sides </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="iCheck">
                                All 4 Corners Only </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="iCheck">
                                Top & Bottom </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="iCheck">
                                Top Only </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="iCheck">
                                Left & Right sides </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="iCheck">
                                No Grommets </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="iCheck">
                                Bottom Only </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <input type="radio" name="iCheck">
                                Others </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h5> Artwork</h5>
                            </div>
                            <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5"> <span class="btn btn-default btn-file"> <i class="fa fa-upload"></i> Upload Your Artwork
                                    <input type="file">
                                </span> </div>
                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 text-center ortxt"> Or </div>
                            <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5"> <span class="btn btn-default start-designbtn"> Let Us Design For You </span>
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-label">
                                        <label> Please provide some information about your idea like color, text etc </label>
                                        <textarea rows="4" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <h5> Proofing</h5>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <input  type="radio" value="" name="iCheck">
                                No Proof </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <input  type="radio" value="" name="iCheck">
                                Press Ready proofs by email
                                <input  class="form-control2" type="text" placeholder="Enter Your email address">
                            </div>
                        </div>

                    </div>
                    <button class="btn btn-proceed">Proceed to checkout</button>
                </div>
                <div id="sidebar" class="col-lg-3 col-md-3 col-sm-6 col-xs-12" data-sticky_column>
                    <div class="right-field">
                        <table   style="width:100%; border:0px; cellspacing:0px; cellpadding:0px;">
                            <tr>
                                <td>Printing price</td>
                                <td style=" text-align:right;">$20.00</td>
                            </tr>
                            <tr>
                                <td>Grommets</td>
                                <td style=" text-align:right;">$20.00</td>
                            </tr>
                            <tr>
                                <td>Printing price</td>
                                <td style=" text-align:right;">$20.00</td>
                            </tr>
                            <tr  style="border-bottom:#ffffff solid 1px;">
                                <td>Printing price</td>
                                <td style=" text-align:right;">$20.00</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style=" text-align:right;">Total Price</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align:right; font-size:28px;">$125.00</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
<?php echo $footer; ?>