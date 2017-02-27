<div class="footer-cont">
    <div class="footer-row1">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="footer-part1"> <span>Related Keywords</span>
                        <?php if (!empty($footer_keywords)) {  ?>
                        <ul>
                            <?php foreach ($footer_keywords as $res) {
                                    echo '<li>' . $res . '</li>';
                                    }     ?>  
                        </ul>
                        <?php   }else{ ?> 
                        <ul>
                            <li>Snaps open Display</li>
                            <li>Tropica Display Sign Stand</li>
                            <li>Flexigen Grand Display Sign Stand</li>
                            <li>Flexigen Deluxe Display Sign Stand</li>
                            <li>Orbiflex Display Sign Stand</li>
                            <li>Zappix Display Sign Stand</li>
                            <li>Liquix Display Sign Stand</li>
                            <li>Bytrex Display Sign Stand</li>
                            <li>Retractable / Roll Up Banner Stands</li>
                            <li>X Banner Stands</li>
                            <li>Bamboo Banner Stands</li>
                            <li>Flexible A-frame</li>
                            <li>Backdrop Stands</li>
                            <li>Promotional Banner Stands</li>                           
                        </ul>
                        <?php }?>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="footer-part1"> <span>Products</span>
                        <ul>
                            <li><a href="<?php echo $product[1]; ?>">Vinyl banner</a> </li>
                            <li><a href="<?php echo $product[2]; ?>">Mesh banners</a> </li>               
                            <li><a href="<?php echo $product[3]; ?>">Yard signs</a> </li>               
                            <li><a href="<?php echo $product[4]; ?>">Wall decals</a></li>
                            <li><a href="<?php echo $product[5]; ?>"> Window wraps</a></li>                               
                            <li><a href="<?php echo $product[6]; ?>">Paper Posters</a></li>
                            <li><a href="<?php echo $product[7]; ?>">Canvas printing</a></li>
                            <li><a href="<?php echo $product[8]; ?>">Backdrops </a></li>
                            <li><a href="<?php echo $product[9]; ?>">Window decals</a></li>
                            <li><a href="<?php echo $product[10]; ?>">Static Cling</a></li>                                       
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="footer-part1"> <span>Main  LINKS</span>
                        <ul>
                            <li><a href="<?php echo $about_us; ?>">About us</a></li>
                            <li><a href="<?php echo $blog; ?>"> Blog</a></li>
                            <li><a href="<?php echo $faq; ?>"> FAQs</a></li>
                            <li><a href="<?php echo $delivery_info; ?>"> Delivery Information</a></li>
                            <li><a href="<?php echo $privacy_policy; ?>"> Privacy Policy</a></li>
                            <li><a href="<?php echo $terms_conditions; ?>"> Terms & Conditions </a></li>
                            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                            <li><a href="<?php echo $sitemap; ?>">Site Map </a></li>
                        </ul>
                    </div>
                    <div class="footer-part1 footer2 "> <span>Contact DETAILS</span>
                        <ul>
                            <li><?php echo $store_name;?></li>
                            <li> <?php echo $store_address; ?></li>                           
                            <li> Phone: <?php echo $telephone; ?> </li>
                            <li>Email : <a href="mailto:<?php echo $store_email;?>"> <?php echo $store_email;?> </a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="footer-part2"> <span>payment methods</span> <img src="image/paypal.png" alt="Payment methods"><br>
                        <span>Get in touch</span>                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-row2">
        <div class="container">
            <div class="row">
                <div class="copyright">
                    <p><?php echo $powered;?></p>                    
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>