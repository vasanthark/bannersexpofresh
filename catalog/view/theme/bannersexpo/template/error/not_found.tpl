<?php echo $header; ?>
<div class="body-cont">
    <div class="container">
        <div class="row">
            <div class="error-page">
                 <?php if($text_error){ ?>
                <h1><?php echo $heading_title; ?></h1>
                <p><?php echo $text_error; ?></p>
                <?php }else{ ?>
                <h1>Sorry... That page seems to be missing.</h1>
                <h2>404</h2>
                <h3>Below are some popular links that might help</h3>
                <?php } ?>
            </div>
            <?php if($text_error == ''){ ?>
            <div class="sitemap site-map1">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <ul>
                        <li><a href="<?php echo $home;?>"><span>Home</span></a></li>
                        <li><a href="<?php echo $vinyl_banner;?>"><span>Vinyl banner</span></a></li>
                        <li><a href="<?php echo $mesh_banner;?>"><span>Mesh banner</span></a></li>
                        <li><a href="<?php echo $displays;?>"><span>Displays</span></a>
                        <li><a href="<?php echo $yard_signs;?>"><span>Yard signs</span></a></li>
                        <li><a href="<?php echo $rigid_signs;?>"><span>Rigid signs</span></a>
                        <li><a href="<?php echo $banner_stands;?>"><span>Banner stands</span></a>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <ul>                       
                        <li><a href="<?php echo $wall_decals; ?>"><span>Wall decals</span></a></li>
                        <li><a href="<?php echo $window_wraps; ?>"><span>Window wraps</span></a></li>
                        <li><a href="<?php echo $magnetic_signs; ?>"><span>Magnetic Signs</span></a></li>
                        <li><a href="<?php echo $paper_posters; ?>"><span>Paper Posters</span></a></li>
                        <li><a href="<?php echo $canvas_printing; ?>"><span>Canvas printing</span></a></li>
                        <li><a href="<?php echo $backdrops; ?>"><span>Backdrops </span></a></li>
                        <li><a href="<?php echo $window_decals; ?>"><span>Window decals</span></a></li>
                        <li><a href="<?php echo $static_cling; ?>"><span>Static Cling</span></a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <ul>
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
             <?php } ?>
        </div>
    </div>
</div>
<?php echo $footer; ?>
