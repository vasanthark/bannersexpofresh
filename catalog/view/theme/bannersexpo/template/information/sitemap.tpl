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
            <div class="sitemap">
                <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
                    <ul>
                        <li><a href="<?php echo $home;?>"><span>Home</span></a></li>
                        <li><a href="<?php echo $vinyl_banner;?>"><span>Vinyl banner</span></a></li>
                        <li><a href="<?php echo $mesh_banner;?>"><span>Mesh banner</span></a></li>
                        <li><a href="<?php echo $displays;?>"><span>Displays</span></a>
                             <?php if (!empty($disp_products)) { ?>
                            <ul><?php 
                                foreach ($disp_products as $dinfo) { ?>                                               
                                <li><a href="<?php echo $dinfo['href']; ?>"><?php echo $dinfo['name']; ?></a> </li>  
                                <?php } ?>                                            
                            </ul>
                            <?php } ?>
                        </li>
                        <li><a href="<?php echo $yard_signs;?>"><span>Yard signs</span></a></li>
                        <li><a href="<?php echo $rigid_signs;?>"><span>Rigid signs</span></a>
                            <?php if (!empty($rs_products)) { ?>
                            <ul><?php 
                                foreach ($rs_products as $rinfo) { ?>                                               
                                <li><a href="<?php echo $rinfo['href']; ?>"><?php echo $rinfo['name']; ?></a> </li>  
                                <?php } ?>                                            
                            </ul>
                            <?php } ?>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <ul>
                        <li> <a href="<?php echo $banner_stands;?>"><span>Banner stands</span></a>
                            <?php if (!empty($bs_products)) { ?>
                            <ul><?php 
                                foreach ($bs_products as $binfo) { ?>                                
                                <li><a href="<?php echo $binfo['href']; ?>"><?php echo $binfo['name']; ?></a> </li>  
                                <?php }?> 
                            </ul>
                            <?php } ?>
                        </li>                       
                    </ul>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-3 col-xs-12">
                    <ul>
                        <li><a href="<?php echo $wall_decals; ?>"><span>Wall decals</span></a></li>
                        <li><a href="<?php echo $window_wraps; ?>"><span>Window wraps</span></a></li>
                        <li><a href="<?php echo $magnetic_signs; ?>"><span>Magnetic Signs</span></a></li>
                        <li><a href="<?php echo $paper_posters; ?>"><span>Paper Posters</span></a></li>
                        <li><a href="<?php echo $canvas_printing; ?>"><span>Canvas printing</span></a></li>
                        <li><a href="<?php echo $backdrops; ?>"><span>Backdrops </span></a></li>
                        <li><a href="<?php echo $window_decals; ?>"><span>Window decals</span></a></li>
                        <li><a href="<?php echo $static_cling; ?>"><span>Static Cling</span></a></li>
                        <li><a href="<?php echo $about_us;?>"><span>About us</span></a></li>
                        <li><a href="<?php echo $blog;?>"><span>Blog </span></a></li>
                        <li><a href="<?php echo $faq;?>"><span>Faq</span></a></li>
                        <li><a href="<?php echo $delivery_info;?>"><span>Delivery informatiopn</span></a></li>
                        <li><a href="<?php echo $privacy_policy;?>"><span>Privacy policy</span></a></li>
                        <li><a href="<?php echo $terms_conditions;?>"><span>Terms & condition</span> </a></li>
                        <li><a href="<?php echo $contact;?>"><span>Contact us</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>